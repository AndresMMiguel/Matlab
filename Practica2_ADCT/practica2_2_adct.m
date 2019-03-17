%Respuestas frecuencial y temporal
clear all
sigma_inf=input('parte real del polo (ej. -0.5, -0.3, -0.1)= ');
%Respuesta frecuencial
w=[0:0.001:10]';
H_jw=(-w.^2+4)./(1+1i*w)./((1i*w-sigma_inf).^2+1);
mod_H=abs(H_jw);
%arg_H_pi=angle(H_jw);
%arg_H=unwrap(arg_H_pi);
arg_H=angle(-w.^2+4)-angle(1+1i*w)-angle((1i*w-sigma_inf).^2+1);
figure(1)
plot(w,mod_H)
grid
figure(2)
plot(w,arg_H)
grid
%respuesta temporal
t=[0:0.001:50];
h1_t=(1+4)/((1+sigma_inf)^2+1)*exp(-t);
h2_t=exp(sigma_inf*t).*real(((sigma_inf+1i)^2+4)/(sigma_inf+1+1i)/1i*exp(1i*t));
h_t=h1_t+h2_t;
figure(3)
plot(t,h1_t,t,h2_t,t,h_t)
grid
figure(1)
ylabel('Amplitud de H(jw)')
xlabel('pulsación w')
figure(2)
ylabel('arg(H(jw))')
xlabel('pulsación w')
figure(3)
ylabel('respusta temporal h(t) en rojo (suma de azul + verde)')
xlabel('tiempo t')