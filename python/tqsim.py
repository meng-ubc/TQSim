import re
import os
import sys
import numpy as np
import math

from benchmark_list import benchmarks
from benchmark_setup import setup

def loadGates(filename):
    f = open(filename)
    lines = f.readlines()
    
    gate_arities = []
    
    qubits = 0

    for line in lines:

        inst = re.split('\s+', line)[0][0:2]
        
        if (inst == 'qr'):
            if (line[8] == ']'):
                qubits = int(line[7])
            else:
                qubits = int(line[7:9])
        elif (inst == 'cx'):
            gate_arities.append(2)
        elif (inst[0] == 'u'):
            gate_arities.append(1)

    f.close()
        
    return gate_arities, qubits

def firstCricNoisy(gate_arities, min_gates, single_error_rate, two_error_rate):
    gates = len(gate_arities) >> 1
    gates = min(gates, min_gates)

    overall_error_rate = 1.0

    for i in range(gates):
        if (gate_arities[i] == 1):
            overall_error_rate *= (1 - single_error_rate)
        else:
            overall_error_rate *= (1 - two_error_rate)

    return (gates, 1 - overall_error_rate)

    
def minFirstShot(p, N):
    z = 2.576 # 95% - 1.960; 99% - 2.576; 99.5% - 2.807; 99.9% - 3.291
    e = 0.04

    shots = z ** 2 * p * (1 - p) / e ** 2 

    shots = shots / (1 + shots / N)

    return int(shots)

def remainingGates(total_gates, min_gates, max_subcircs):
    gates = []

    while(total_gates > 0 and len(gates) < max_subcircs - 1):
        gates.append(min(total_gates, min_gates))
        total_gates -= min_gates

    if total_gates > 0:
        topup = (int)(total_gates / len(gates))

        total_gates -= len(gates) * topup

        for i in range(len(gates)):
            gates[i] += topup
        
        gates[0] += total_gates

    return gates

def totalShots(shots):
    total_shots = 1

    for shot in shots:
        total_shots *= shot

    return total_shots

def arrToStr(arr):
    string = str(arr[0])
    
    for i in range(1, len(arr)):
        string += '-' + str(arr[i])
        
    return string

def appendCMD(command, new_cmd, args):
    command += ' ' + new_cmd + ' '
    
    if args != 'null':
        command += args
        
    return command

def minIndex(shots):
    
    values = []
    for i in range(len(shots)):
        total = 1
        for j in range(len(shots)):
            if i != j:
                total *= shots[j]
        values.append(total)
        
    return np.argmin(values)

def adjustShots(shots, total_shots):
    while(totalShots(shots) < total_shots):
        shots[minIndex(shots)] += 1
    return shots
    
        
if __name__ == '__main__':
    
    benchmark_class = str(sys.argv[1])
    benchmark_index = int(sys.argv[2])
    
    filename = 'benchmark_circuits/' + benchmark_class + '/' + benchmarks[benchmark_class][benchmark_index] + '.txt'

    gate_arities, qubits = loadGates(filename)

    subcirc_gates = []

    first_gates, overall_error_rate = firstCricNoisy(gate_arities, setup['min_gates'], setup['single_error_rate'], setup['two_error_rate'])

    subcirc_gates.append(first_gates)

    shots = [minFirstShot(overall_error_rate, setup['total_shots'])]

    remaining_shots = setup['total_shots'] / shots[0]
    
    max_subcircs = min(setup['max_subcircs'], int(math.log(remaining_shots, 2)) + 1)
    
    subcirc_gates += remainingGates(len(gate_arities) - subcirc_gates[0], setup['min_gates'], max_subcircs)

    for i in range(len(subcirc_gates) - 1):
        shots.append(min(int(remaining_shots ** (1 / (len(subcirc_gates) - 1))), shots[0]))

    index = 1

    while (totalShots(shots) < setup['total_shots']):
        shots[index] += 1
        
        if (totalShots(shots) >= setup['total_shots']):
            shots[index] -= 1
            adjustShots(shots, setup['total_shots'])
            break
            
        index += 1
        
        if (index == len(shots)):
            if (shots[0] <= shots[1]):
                index = 0
            else:
                index = 1
    
    # program
    command = './out/tqsim-cpu'
    # provide circuit
    command = appendCMD(command, '-c', filename)
    # provide shots
    command = appendCMD(command, '-s', arrToStr(shots))
    command = appendCMD(command, '-l', arrToStr(subcirc_gates))
    
  
    command = appendCMD(command, '-t', 'null')
    
    # print(command)
    # print(totalShots(shots))
    
    os.system(command)