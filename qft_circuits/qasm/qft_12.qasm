OPENQASM 2.0;
include "qelib1.inc";
qreg q[12];
h q[11];
cp(pi/2) q[11],q[10];
cp(pi/4) q[11],q[9];
cp(pi/8) q[11],q[8];
cp(pi/16) q[11],q[7];
cp(pi/32) q[11],q[6];
cp(pi/64) q[11],q[5];
cp(pi/128) q[11],q[4];
cp(pi/256) q[11],q[3];
cp(pi/512) q[11],q[2];
cp(pi/1024) q[11],q[1];
cp(pi/2048) q[11],q[0];
h q[10];
cp(pi/2) q[10],q[9];
cp(pi/4) q[10],q[8];
cp(pi/8) q[10],q[7];
cp(pi/16) q[10],q[6];
cp(pi/32) q[10],q[5];
cp(pi/64) q[10],q[4];
cp(pi/128) q[10],q[3];
cp(pi/256) q[10],q[2];
cp(pi/512) q[10],q[1];
cp(pi/1024) q[10],q[0];
h q[9];
cp(pi/2) q[9],q[8];
cp(pi/4) q[9],q[7];
cp(pi/8) q[9],q[6];
cp(pi/16) q[9],q[5];
cp(pi/32) q[9],q[4];
cp(pi/64) q[9],q[3];
cp(pi/128) q[9],q[2];
cp(pi/256) q[9],q[1];
cp(pi/512) q[9],q[0];
h q[8];
cp(pi/2) q[8],q[7];
cp(pi/4) q[8],q[6];
cp(pi/8) q[8],q[5];
cp(pi/16) q[8],q[4];
cp(pi/32) q[8],q[3];
cp(pi/64) q[8],q[2];
cp(pi/128) q[8],q[1];
cp(pi/256) q[8],q[0];
h q[7];
cp(pi/2) q[7],q[6];
cp(pi/4) q[7],q[5];
cp(pi/8) q[7],q[4];
cp(pi/16) q[7],q[3];
cp(pi/32) q[7],q[2];
cp(pi/64) q[7],q[1];
cp(pi/128) q[7],q[0];
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
swap q[0],q[11];
swap q[1],q[10];
swap q[2],q[9];
swap q[3],q[8];
swap q[4],q[7];
swap q[5],q[6];
