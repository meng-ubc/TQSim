OPENQASM 2.0;
include "qelib1.inc";
qreg q[23];
h q[22];
cp(pi/2) q[22],q[21];
cp(pi/4) q[22],q[20];
cp(pi/8) q[22],q[19];
cp(pi/16) q[22],q[18];
cp(pi/32) q[22],q[17];
cp(pi/64) q[22],q[16];
cp(pi/128) q[22],q[15];
cp(pi/256) q[22],q[14];
cp(pi/512) q[22],q[13];
cp(pi/1024) q[22],q[12];
cp(pi/2048) q[22],q[11];
cp(pi/4096) q[22],q[10];
cp(pi/8192) q[22],q[9];
cp(pi/16384) q[22],q[8];
cp(pi/32768) q[22],q[7];
cp(pi/65536) q[22],q[6];
cp(pi/131072) q[22],q[5];
cp(pi/262144) q[22],q[4];
cp(pi/524288) q[22],q[3];
cp(pi/1048576) q[22],q[2];
cp(pi/2097152) q[22],q[1];
cp(pi/4194304) q[22],q[0];
h q[21];
cp(pi/2) q[21],q[20];
cp(pi/4) q[21],q[19];
cp(pi/8) q[21],q[18];
cp(pi/16) q[21],q[17];
cp(pi/32) q[21],q[16];
cp(pi/64) q[21],q[15];
cp(pi/128) q[21],q[14];
cp(pi/256) q[21],q[13];
cp(pi/512) q[21],q[12];
cp(pi/1024) q[21],q[11];
cp(pi/2048) q[21],q[10];
cp(pi/4096) q[21],q[9];
cp(pi/8192) q[21],q[8];
cp(pi/16384) q[21],q[7];
cp(pi/32768) q[21],q[6];
cp(pi/65536) q[21],q[5];
cp(pi/131072) q[21],q[4];
cp(pi/262144) q[21],q[3];
cp(pi/524288) q[21],q[2];
cp(pi/1048576) q[21],q[1];
cp(pi/2097152) q[21],q[0];
h q[20];
cp(pi/2) q[20],q[19];
cp(pi/4) q[20],q[18];
cp(pi/8) q[20],q[17];
cp(pi/16) q[20],q[16];
cp(pi/32) q[20],q[15];
cp(pi/64) q[20],q[14];
cp(pi/128) q[20],q[13];
cp(pi/256) q[20],q[12];
cp(pi/512) q[20],q[11];
cp(pi/1024) q[20],q[10];
cp(pi/2048) q[20],q[9];
cp(pi/4096) q[20],q[8];
cp(pi/8192) q[20],q[7];
cp(pi/16384) q[20],q[6];
cp(pi/32768) q[20],q[5];
cp(pi/65536) q[20],q[4];
cp(pi/131072) q[20],q[3];
cp(pi/262144) q[20],q[2];
cp(pi/524288) q[20],q[1];
cp(pi/1048576) q[20],q[0];
h q[19];
cp(pi/2) q[19],q[18];
cp(pi/4) q[19],q[17];
cp(pi/8) q[19],q[16];
cp(pi/16) q[19],q[15];
cp(pi/32) q[19],q[14];
cp(pi/64) q[19],q[13];
cp(pi/128) q[19],q[12];
cp(pi/256) q[19],q[11];
cp(pi/512) q[19],q[10];
cp(pi/1024) q[19],q[9];
cp(pi/2048) q[19],q[8];
cp(pi/4096) q[19],q[7];
cp(pi/8192) q[19],q[6];
cp(pi/16384) q[19],q[5];
cp(pi/32768) q[19],q[4];
cp(pi/65536) q[19],q[3];
cp(pi/131072) q[19],q[2];
cp(pi/262144) q[19],q[1];
cp(pi/524288) q[19],q[0];
h q[18];
cp(pi/2) q[18],q[17];
cp(pi/4) q[18],q[16];
cp(pi/8) q[18],q[15];
cp(pi/16) q[18],q[14];
cp(pi/32) q[18],q[13];
cp(pi/64) q[18],q[12];
cp(pi/128) q[18],q[11];
cp(pi/256) q[18],q[10];
cp(pi/512) q[18],q[9];
cp(pi/1024) q[18],q[8];
cp(pi/2048) q[18],q[7];
cp(pi/4096) q[18],q[6];
cp(pi/8192) q[18],q[5];
cp(pi/16384) q[18],q[4];
cp(pi/32768) q[18],q[3];
cp(pi/65536) q[18],q[2];
cp(pi/131072) q[18],q[1];
cp(pi/262144) q[18],q[0];
h q[17];
cp(pi/2) q[17],q[16];
cp(pi/4) q[17],q[15];
cp(pi/8) q[17],q[14];
cp(pi/16) q[17],q[13];
cp(pi/32) q[17],q[12];
cp(pi/64) q[17],q[11];
cp(pi/128) q[17],q[10];
cp(pi/256) q[17],q[9];
cp(pi/512) q[17],q[8];
cp(pi/1024) q[17],q[7];
cp(pi/2048) q[17],q[6];
cp(pi/4096) q[17],q[5];
cp(pi/8192) q[17],q[4];
cp(pi/16384) q[17],q[3];
cp(pi/32768) q[17],q[2];
cp(pi/65536) q[17],q[1];
cp(pi/131072) q[17],q[0];
h q[16];
cp(pi/2) q[16],q[15];
cp(pi/4) q[16],q[14];
cp(pi/8) q[16],q[13];
cp(pi/16) q[16],q[12];
cp(pi/32) q[16],q[11];
cp(pi/64) q[16],q[10];
cp(pi/128) q[16],q[9];
cp(pi/256) q[16],q[8];
cp(pi/512) q[16],q[7];
cp(pi/1024) q[16],q[6];
cp(pi/2048) q[16],q[5];
cp(pi/4096) q[16],q[4];
cp(pi/8192) q[16],q[3];
cp(pi/16384) q[16],q[2];
cp(pi/32768) q[16],q[1];
cp(pi/65536) q[16],q[0];
h q[15];
cp(pi/2) q[15],q[14];
cp(pi/4) q[15],q[13];
cp(pi/8) q[15],q[12];
cp(pi/16) q[15],q[11];
cp(pi/32) q[15],q[10];
cp(pi/64) q[15],q[9];
cp(pi/128) q[15],q[8];
cp(pi/256) q[15],q[7];
cp(pi/512) q[15],q[6];
cp(pi/1024) q[15],q[5];
cp(pi/2048) q[15],q[4];
cp(pi/4096) q[15],q[3];
cp(pi/8192) q[15],q[2];
cp(pi/16384) q[15],q[1];
cp(pi/32768) q[15],q[0];
h q[14];
cp(pi/2) q[14],q[13];
cp(pi/4) q[14],q[12];
cp(pi/8) q[14],q[11];
cp(pi/16) q[14],q[10];
cp(pi/32) q[14],q[9];
cp(pi/64) q[14],q[8];
cp(pi/128) q[14],q[7];
cp(pi/256) q[14],q[6];
cp(pi/512) q[14],q[5];
cp(pi/1024) q[14],q[4];
cp(pi/2048) q[14],q[3];
cp(pi/4096) q[14],q[2];
cp(pi/8192) q[14],q[1];
cp(pi/16384) q[14],q[0];
h q[13];
cp(pi/2) q[13],q[12];
cp(pi/4) q[13],q[11];
cp(pi/8) q[13],q[10];
cp(pi/16) q[13],q[9];
cp(pi/32) q[13],q[8];
cp(pi/64) q[13],q[7];
cp(pi/128) q[13],q[6];
cp(pi/256) q[13],q[5];
cp(pi/512) q[13],q[4];
cp(pi/1024) q[13],q[3];
cp(pi/2048) q[13],q[2];
cp(pi/4096) q[13],q[1];
cp(pi/8192) q[13],q[0];
h q[12];
cp(pi/2) q[12],q[11];
cp(pi/4) q[12],q[10];
cp(pi/8) q[12],q[9];
cp(pi/16) q[12],q[8];
cp(pi/32) q[12],q[7];
cp(pi/64) q[12],q[6];
cp(pi/128) q[12],q[5];
cp(pi/256) q[12],q[4];
cp(pi/512) q[12],q[3];
cp(pi/1024) q[12],q[2];
cp(pi/2048) q[12],q[1];
cp(pi/4096) q[12],q[0];
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
swap q[0],q[22];
swap q[1],q[21];
swap q[2],q[20];
swap q[3],q[19];
swap q[4],q[18];
swap q[5],q[17];
swap q[6],q[16];
swap q[7],q[15];
swap q[8],q[14];
swap q[9],q[13];
swap q[10],q[12];
