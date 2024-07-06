# TQSim

A tree-based reuse-focused noisy quantum circuit simulator.

## Install Qulacs

TQSim is built upon Qulacs. To install Qulacs library, follow the instructions for installing c++ qulacs library: https://github.com/qulacs/qulacs#build-with-gcc

## Compile the code
* Make sure the qulacs library is installed and is in the same folder as TQSim.
* Create two folders: out (for storing the compiled files) and results (for storing the simulation results).
* Run "make" in TQSim folder to compile the code.

## How to use
* Setup the testing parameters, total number of shots, etc., in python/benchmark_setup.py.
* Run following command:
    * python python/tqsim.py $benchmark_class $benchmark_index

The list of benchmark classes are:
* adder - Quantum Adder Circuit
* bv - Bernstein-Vazirani Circuit
* mul - Quantum Multiplier Circuit
* qaoa - Quantum Approximate Optimization Algorithm Circuit
* qft - Quantum Fourier Transform Circuit
* qpe - Quantum Phase Estimation Circuit
* qsc - Quantum Supremacy Circuit
* qv - Quantum Volume Circuit

The benchmark indices ranges from 0 to 5 for all benchmark classes. See python/benchmark_list.py for details for each benchmark circuit.

Sample Commands:
* python python/tqsim.py adder 0
* python python/tqsim.py qsc 5

## Saving Results
When running accuracy tests, three set of results are generated - br1, br2, and tr. The three set of results are stored in the results folder.