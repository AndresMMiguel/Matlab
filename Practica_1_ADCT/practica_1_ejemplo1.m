% Datos
R=1;  %Ohmios
C=1;  %Faradios
RC=5;
VC=3;
VG=7;
T=3;
w= 2*pi/T;

% Soluciones
p=tf('p');

H1=p/(p+(1/RC));
V01=H1*VC/p;    %Respuesta por las condiciones iniciales

Eg=VG/p;       %Señal de excitación
% Eg=w/(w*w+p*p);
H=1/(1+RC*p);
V0input=H*Eg;

V=V0input+V01;  %Principio de superposición
V=minreal(V)
ceros = zero(V)