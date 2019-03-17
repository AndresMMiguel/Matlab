function [x,t]=inputs3(A,B)

Tmax=30;
t=0:0.01:Tmax;
x=A*(t<=5)+B*((t>5)&(t<=10));