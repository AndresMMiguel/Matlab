%repuesta temporal a una sinusoide con ruido: filtrado
clear all
ruido=input('nivel de ruido (ej. 0, 0.5, 1, 5)= ');
sigma_inf=-0.3;
sigma_0=0;
%Respuesta frecuencial en amplitud
w=[0:0.001:10]';
H_jw=((1i*w-sigma_0).^2+4)./(1+1i*w)./((1i*w-sigma_inf).^2+1);
mod_H=abs(H_jw);
figure(1)
plot(w,mod_H)
grid
%respuesta al impulso
t=[0:0.01:50];
h1_t=((1+sigma_0)^2+4)/((1+sigma_inf)^2+1)*exp(-t);
h2_t=exp(sigma_inf*t).*real(((sigma_inf-sigma_0+1i)^2+4)/(sigma_inf+1+1i)/1i*exp(1i*t));
h_t=h1_t+h2_t;
%señal de entrada + ruido
x_t=cos(t)+ruido*randn(1,length(t));
figure(2)%respuesta al impulso
t=[0:0.01:50];
h1_t=((1+sigma_0)^2+4)/((1+sigma_inf)^2+1)*exp(-t);
h2_t=exp(sigma_inf*t).*real(((sigma_inf-sigma_0+1i)^2+4)/(sigma_inf+1+1i)/1i*exp(1i*t));
h_t=h1_t+h2_t;
plot(t,x_t)
grid
%señal de salida del filtro
y_t=0.01*conv(x_t,h_t);
figure(3)
plot(t,y_t(1:length(t)))
grid

figure(1)
ylabel('Amplitud de H(jw)')
xlabel('pulsación w')
figure(2)
ylabel('entrada x(t)')
xlabel('tiempo t')
figure(3)
ylabel('salida y(t)')
xlabel('tiempo t')