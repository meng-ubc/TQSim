from tqsim import get_command
import subprocess
from tqdm import tqdm
import json

def main():
    classes = ['adder', 'bv', 'mul', 'qaoa', 'qft', 'qpe', 'qsc', 'qv']
    max_qubits = 15

    results = {}

    for class_name in tqdm(classes):
        results[class_name] = {
            'speedup': [],
            'fidelity_difference': []
        }
        
        for index in tqdm(range(6), leave=False):

            command, nqubits = get_command(class_name, index)
            
            if nqubits > max_qubits:
                break # skip all the rest benchmarks in this class since they will be too slow

            output = subprocess.check_output(command, shell=True)

            # Decode bytes to string
            output_str = output.decode("utf-8")

            # Split the output into lines and get the last three
            lines = output_str.strip().split("\n")[-3:]

            speedup = float(lines[-3])

            fidelity_difference = abs(float(lines[-2]) - float(lines[-1]))
            
            results[class_name]['speedup'].append(speedup)
            results[class_name]['fidelity_difference'].append(fidelity_difference)
    
    with open('results.json', 'w') as f:
        json.dump(results, f, indent=4)
            
    
if __name__ == '__main__':
    main()