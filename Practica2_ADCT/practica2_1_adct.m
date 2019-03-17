%Respuestas a señales senoidales a diferentes frecuencias
clear all
w1=input('pulsación w1 (ej. 0, 1, 2, 3) = ');
w=[0:0.001:10]';
sigma_inf=-0.2;
sigma_0=0;
H_jw=((1i*w-sigma_0).^2+4)./(1+1i*w)./((1i*w-sigma_inf).^2+1);
mod_H=abs(H_jw);
arg_H=angle((1i*w-sigma_0).^2+4)-angle(1+1i*w)-angle((1i*w-sigma_inf).^2+1);
figure(1)
plot(w,mod_H)
grid
figure(2)
plot(w,arg_H)
grid
%salida temporal senoidal 
t=[0:0.001:50];
x_t=cos(w1*t);
y_t=mod_H(round(w1/0.001)+1)*cos(w1*t+arg_H(round(w1/0.001)+1));
figure(3)
plot(t,x_t,t,y_t)
grid
figure(1)
ylabel('Amplitud de H(jw)')
xlabel('pulsación w')
figure(2)
ylabel('arg(H(jw))')
xlabel('pulsación w')
figure(3)
ylabel('respustas temporales x(t) en azul, y(t) en verde')
xlabel('tiempo t')