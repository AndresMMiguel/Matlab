%repuesta temporal al escalón u(t)
clear all
sigma_inf=input('parte real del polo (ej. -0.5, -0.1, +0.01)= ');
sigma_0=0;
%respuesta temporal
t=[0:0.001:50];
y0_t=(sigma_0^2+4)/(sigma_inf^2+1);
y1_t=-((1+sigma_0)^2+4)/((1+sigma_inf)^2+1)*exp(-t);
y2_t=exp(sigma_inf*t).*real(((sigma_inf-sigma_0+1i)^2+4)/(sigma_inf+1i)/(sigma_inf+1+1i)/1i*exp(1i*t));
y_t=y0_t+y1_t+y2_t;
figure(1)
plot(t,y_t)
grid
figure(1)
ylabel('respusta temporal y(t) al escalon')
xlabel('tiempo t')