OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
h q[6];
cp(pi/2) q[6],q[5];
cp(pi/4) q[6],q[4];
cp(pi/8) q[6],q[3];
cp(pi/16) q[6],q[2];
cp(pi/32) q[6],q[1];
cp(pi/64) q[6],q[0];
h q[5];
cp(pi/2) q[5],q[4];
cp(pi/4) q[5],q[3];
cp(pi/8) q[5],q[2];
cp(pi/16) q[5],q[1];
cp(pi/32) q[5],q[0];
h q[4];
cp(pi/2) q[4],q[3];
cp(pi/4) q[4],q[2];
cp(pi/8) q[4],q[1];
cp(pi/16) q[4],q[0];
h q[3];
cp(pi/2) q[3],q[2];
cp(pi/4) q[3],q[1];
cp(pi/8) q[3],q[0];
h q[2];
cp(pi/2) q[2],q[1];
cp(pi/4) q[2],q[0];
h q[1];
cp(pi/2) q[1],q[0];
h q[0];
swap q[0],q[6];
swap q[1],q[5];
swap q[2],q[4];
