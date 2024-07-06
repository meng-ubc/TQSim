import numpy as np
from qiskit import QuantumCircuit, Aer, transpile, assemble
from qiskit.quantum_info import Statevector


def load_qasm(filename):
    with open(filename, 'r') as file:
        qasm = file.read()
    return QuantumCircuit.from_qasm_str(qasm)


def distinct_amplitudes(statevector, tolerance=1e-3):
    unique_amps = []
    for amp in statevector:
        if not any(np.isclose(amp, unique_amp, rtol=tolerance) for unique_amp in unique_amps):
            unique_amps.append(amp)
    return len(unique_amps) / len(statevector)


def main():
    # Load the QASM file
    qasm_file = "../benchmark_circuits/qsc/qsc_2_4.txt"
    circuit = load_qasm(qasm_file)

    # Initialize the backend and prepare for simulation
    backend = Aer.get_backend('statevector_simulator')

    # Iterate through the circuit and simulate the state after each gate
    for i, _ in enumerate(circuit.data):
        # Create a sub-circuit with the first i+1 gates of the original circuit
        sub_circuit = QuantumCircuit(circuit.num_qubits)
        sub_circuit.data = circuit.data[:i+1]

        # Execute the sub-circuit using the statevector simulator
        transpiled_circuit = transpile(sub_circuit, backend)
        qobj = assemble(transpiled_circuit)
        result = backend.run(qobj).result()
        statevector = result.get_statevector()

        # Compute and print the number of distinct amplitudes after gate i
        unique_amps = distinct_amplitudes(statevector)
        print(
            f"{i + 1:3d}: Ratio: {unique_amps}")


if __name__ == "__main__":
    main()
