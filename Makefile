output: main.o noiseTreeSimulator.o baselineSimulator.o util.o 
	g++-11 -o out/tqsim-cpu -O2 -I ./../qulacs/include -L ./../qulacs/lib out/main.o out/noiseTreeSimulator.o out/util.o out/baselineSimulator.o -lvqcsim_static -lcppsim_static -lcsim_static -fopenmp

main.o: src/main.cpp
	g++-11 -o out/main.o -c src/main.cpp -O2 -I ./../qulacs/include -L ./../qulacs/lib -lvqcsim_static -lcppsim_static -lcsim_static -fopenmp

noiseTreeSimulator.o: src/noiseTreeSimulator.cpp src/noiseTreeSimulator.hpp
	g++-11 -o out/noiseTreeSimulator.o -c src/noiseTreeSimulator.cpp -O2 -I ./../qulacs/include -L ./../qulacs/lib -lvqcsim_static -lcppsim_static -lcsim_static -fopenmp

baselineSimulator.o: src/baselineSimulator.cpp src/baselineSimulator.hpp
	g++-11 -o out/baselineSimulator.o -c src/baselineSimulator.cpp -O2 -I ./../qulacs/include -L ./../qulacs/lib -lvqcsim_static -lcppsim_static -lcsim_static -fopenmp

util.o: src/util.cpp src/util.hpp
	g++-11 -o out/util.o -c src/util.cpp -O2 -I ./../qulacs/include -L ./../qulacs/lib -lvqcsim_static -lcppsim_static -lcsim_static -fopenmp

clean:
	rm out/*.o out/tqsim-cpu