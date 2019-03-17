% Datos
R=1;
C=1;
% close all
RC=1e-1;
VC=0;
VG=7;
T=5;
A=3;
B=3;
Tmax = max(5*T,2*RC);

t=0:0.01:Tmax;
[vinput,t] = inputs4(T,A);
% [vinput,t] = inputs3(A,B);
% vinput = sin(2*pi.*t./T);
% vinput=VG*ones(size(t));

vc=VC*ones(size(t));


p=tf('p');

H1=p/(p+(1/RC));
v01=lsim(H1,vc,t);


H=1/(1+RC*p);
v0input=lsim(H,vinput,t);

v=v0input+v01;

plot(t,v)
hold on
plot(t,v0input,'r')
plot(t,v01,'g')
xlabel('t(s)')
ylabel('V (V)')