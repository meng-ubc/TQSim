// #include <cppsim/state.hpp>
// #include <cppsim/gate_factory.hpp>
#include <cppsim/circuit.hpp>

#include "noiseTreeSimulator.hpp"
#include "baselineSimulator.hpp"
#include "util.hpp"

#include <time.h>
#include <iostream>
#include <fstream>

// stats calculation
#include <algorithm>
#include <numeric>

#include <iostream>
#include <fstream>

int main(int argc, char **argv)
{
    QuantumCircuit *circuit = NULL;
    std::vector<int> shots;
    std::vector<int> lengths;

    int total_shots = 1;

    // Getting the filename of the testing circuit, abort if not given
    if (cmdOptionExists(argv, argv + argc, "-c"))
    {
        char *circuit_str = getCmdOption(argv, argv + argc, "-c");

        circuit = readCircuit(circuit_str);

        printf("Running tests with circuit: %s\n", circuit_str);
    }
    else
    {
        printf("circuits not given, abort!\n\n");
        return 0;
    }

    // Getting the shots required for the test, abort if not provided
    if (cmdOptionExists(argv, argv + argc, "-s"))
    {
        char *shots_str = getCmdOption(argv, argv + argc, "-s");

        char delim[] = "-";

        char *ptr = strtok(shots_str, delim);

        while (ptr != NULL)
        {
            int temp = std::stoi(ptr);

            shots.push_back(temp);
            total_shots *= temp;
            // printf("%d\n", temp);

            ptr = strtok(NULL, delim);
        }
    }
    else
    {
        printf("shots not given, abort!\n\n");
        return 0;
    }

    // Getting the lengths of the subcircuits, abort if not provided
    if (cmdOptionExists(argv, argv + argc, "-l"))
    {
        char *lengths_str = getCmdOption(argv, argv + argc, "-l");

        char delim[] = "-";

        char *ptr = strtok(lengths_str, delim);

        while (ptr != NULL)
        {
            int temp = std::stoi(ptr);

            lengths.push_back(temp);
            // printf("%d\n", temp);
            ptr = strtok(NULL, delim);
        }
    }
    else
    {
        printf("subcirc lengths not given, abort!\n\n");
        return 0;
    }

    double damping_ratio;

    // get the damping error values
    if (cmdOptionExists(argv, argv + argc, "-d"))
    {
        char *ptr = getCmdOption(argv, argv + argc, "-d");
        damping_ratio = std::atof(ptr);
    }
    else
    {
        printf("damping ratio is not given, abort!\n\n");
        return 0;
    }

    double gate_ratio;

    if (cmdOptionExists(argv, argv + argc, "-g"))
    {
        char *ptr = getCmdOption(argv, argv + argc, "-g");
        gate_ratio = std::atof(ptr);
    }
    else
    {
        printf("gate ratio is not given, abort!\n\n");
        return 0;
    }

    double probs[2];

    if (cmdOptionExists(argv, argv + argc, "-p"))
    {
        // Do stuff
        char *probabilities = getCmdOption(argv, argv + argc, "-p");

        char delim[] = "/";

        char *ptr = strtok(probabilities, delim);

        int index = 0;

        while (ptr != NULL && index < 2)
        {
            probs[index++] = std::atof(ptr);

            ptr = strtok(NULL, delim);
        }
    }
    else
    {
        probs[0] = 0.001;
        probs[1] = 0.0115;
    }

    // initialize both baseline and tree_sim noisy simulators
    // std::cout << damping_ratio << std::endl;
    // std::cout << probs[0] << std::endl;
    // std::cout << probs[1] << std::endl;

    NoiseTreeSimulator tqsim(circuit, probs[0], probs[1], damping_ratio, gate_ratio, shots, lengths);
    BaselineSimulator baseline_simulator(circuit, probs[0], probs[1], damping_ratio, gate_ratio);

    // Run the speed up test
    if (cmdOptionExists(argv, argv + argc, "-speedup"))
    {
        printf("Doing speedup test\n");

        // Running basesline simulation
        auto start = std::chrono::high_resolution_clock::now();

        baseline_simulator.execute(total_shots);

        auto elapsed = std::chrono::high_resolution_clock::now() - start;

        long long baseline_time = std::chrono::duration_cast<std::chrono::microseconds>(elapsed).count();

        // Running TQSim
        start = std::chrono::high_resolution_clock::now();

        tqsim.execute();

        elapsed = std::chrono::high_resolution_clock::now() - start;

        long long tqsim_time = std::chrono::duration_cast<std::chrono::microseconds>(elapsed).count();

        // Print the results
        printf("Baselie Simulation time: %lld(ms), Tree Simulation time: %lld(ms)\n", baseline_time / 1000, tqsim_time / 1000);
        printf("Speedups: %.4f\n\n", baseline_time / (double)tqsim_time);
    }

    // Run the speed up test
    if (cmdOptionExists(argv, argv + argc, "-accuracy"))
    {
        printf("Doing accuracy test\n");

        // Getting the BR1
        auto start = std::chrono::high_resolution_clock::now();

        std::vector<UINT> br1 = baseline_simulator.execute(total_shots);

        auto elapsed = std::chrono::high_resolution_clock::now() - start;

        long long baseline_time = std::chrono::duration_cast<std::chrono::microseconds>(elapsed).count();

        // Getting the TR
        start = std::chrono::high_resolution_clock::now();

        std::vector<UINT> tr = tqsim.execute();

        elapsed = std::chrono::high_resolution_clock::now() - start;

        long long tqsim_time = std::chrono::duration_cast<std::chrono::microseconds>(elapsed).count();

        // Print the results
        printf("Baselie Simulation time: %lld(ms), Tree Simulation time: %lld(ms)\n", baseline_time / 1000, tqsim_time / 1000);
        printf("Speedups: %.4f\n\n", baseline_time / (double)tqsim_time);

        // Getting the BR2
        std::vector<UINT> br2 = baseline_simulator.execute(total_shots);

        // Calculate the Testing statistics
        double reference_fidelity = stateFidelity(br1, br2, circuit->qubit_count);
        double fidelity = (stateFidelity(br1, tr, circuit->qubit_count) +
                           stateFidelity(br2, tr, circuit->qubit_count)) /
                          2;
        printf("Reference_fidelity: %.4f, fidelity: %.4f\n\n", reference_fidelity, fidelity);

        printf("Saving simulation results\n");

        std::string out_filename = "results/";
        std::string baseline_filename_suffix1 = "br1.txt";
        std::string baseline_filename_suffix2 = "br2.txt";
        std::string tree_filename_suffix = "tr.txt";

        std::ofstream myfile(out_filename + baseline_filename_suffix1);
        if (myfile.is_open())
        {
            for (int i = 0; i < br1.size(); i++)
            {
                myfile << br1[i];
                myfile << "\n";
            }
            myfile.close();
        }

        std::ofstream myfile1(out_filename + baseline_filename_suffix2);
        if (myfile1.is_open())
        {
            for (int i = 0; i < br2.size(); i++)
            {
                myfile1 << br2[i];
                myfile1 << "\n";
            }
            myfile1.close();
        }

        std::ofstream myfile2(out_filename + tree_filename_suffix);
        if (myfile2.is_open())
        {
            for (int i = 0; i < tr.size(); i++)
            {
                myfile2 << tr[i];
                myfile2 << "\n";
            }
            myfile2.close();
        }
    }

    // Run the result validation test, the metric used in this test is chi-loss
    if (cmdOptionExists(argv, argv + argc, "-r"))
    {
        double cur_chi_val = 0;
        double cur_fidelity_val = 0;
        std::vector<double> chi_vals;
        std::vector<double> fidelity_vals;

        int n = 100;

        if (cmdOptionExists(argv, argv + argc, "-b"))
        {
            printf("Doing chi-loss test (baseline)\n");
            for (int i = 0; i < n; i++)
            {
                std::vector<UINT> result1 = baseline_simulator.execute(total_shots);
                std::vector<UINT> result2 = baseline_simulator.execute(total_shots);
                cur_chi_val = chiLoss(result1, result2, circuit->qubit_count);
                cur_fidelity_val = stateFidelity(result1, result2, circuit->qubit_count);
                chi_vals.push_back(cur_chi_val);
                fidelity_vals.push_back(cur_fidelity_val);

                printf("%d, chi-loss-b: %.2f, state-fidelity-b: %.4f\n", i, cur_chi_val, cur_fidelity_val);
            }
        }
        else
        {
            printf("Doing chi-loss test\n");
            for (int i = 0; i < n; i++)
            {
                std::vector<UINT> result1 = baseline_simulator.execute(total_shots);
                std::vector<UINT> result2 = tqsim.execute();

                cur_chi_val = chiLoss(result1, result2, circuit->qubit_count);
                cur_fidelity_val = stateFidelity(result1, result2, circuit->qubit_count);
                chi_vals.push_back(cur_chi_val);
                fidelity_vals.push_back(cur_fidelity_val);

                // printf("%d, chi-loss: %.2f, state-fidelity: %.4f\n", i, cur_chi_val, cur_fidelity_val);
            }
        }

        printf("Chi-loss stats:\n");
        printStats(chi_vals);
        printf("Fidelity stats:\n");
        printStats(fidelity_vals);
    }

    // free the resources allocated
    delete circuit;
    return 0;
}
