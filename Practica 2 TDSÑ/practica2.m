
% Práctica 2: Muestreo de señales en tiempo continuo



%% Muestreo de sinusoides

% Apartado 1.1

% Datos
Frecuencias=[200 850 1850 3800]; A=1;
Tv=10e-3;
Fs=8000; Ts=1/Fs;

% Rejilla temporal para el muestreo
t=0:Ts:Tv;

% Cálculo y dibujo de las sinusoides
n=1;
for F0=Frecuencias
    subplot(2,2,n)
    plot(t,A*cos(2*pi*F0*t))
    title(['cos(2\pi' num2str(F0,4) 't)']), xlabel('t'), grid
    n=n+1;
end
subplot,pause

% Apartado 1.2

% Datos
Frecuencias=[200 850 1850 5800]; A=1;
Tv=10e-3;
Fs=6000; Ts=1/Fs;

% Rejilla temporal para el muestreo
t=0:Ts:Tv;

% Cálculo y dibujo de las sinusoides
n=1;
for F0=Frecuencias
    subplot(2,2,n)
    plot(t,A*cos(2*pi*F0*t))
    title(['cos(2\pi' num2str(F0,4) 't)']), xlabel('t'), grid
    n=n+1;
end
subplot, pause
% Apartado 1.3

% Datos
Frecuencias=[200 850 1850 5800]; A=1;
Tv=10e-3;
Fs=6000; Ts=1/Fs;

% Rejilla temporal para el muestreo
t=0:Ts:Tv;

% Cálculo y dibujo de las sinusoides
n=1;
for F0=Frecuencias
    subplot(2,2,n)
    plot(t,A*sin(2*pi*F0*t))
    title(['sin(2\pi' num2str(F0,4) 't)']), xlabel('t'), grid
    n=n+1;
end
subplot

%% 2 Interpolación

% Apartado 2
load tds
p = audioplayer(int16(tds), 24000);
play(p);
pause

% Apartado 2.1. Expansión
L = 3;
tdsL = zeros(L*length(tds),1);
tdsL(1:L:length(tdsL)) = tds;
stem(3750:3780,tdsL(3750:3780))
p = audioplayer(int16(tdsL),24000);
play(p),pause

% Apartado 2.2. Filtro Interpolador
%Diseño
n = -100:100;
h = L*sin(pi/L*n)./(pi*n);
h(isnan(h))=1;
plot(n,h),title('Respuesta impulsiva'),xlabel('n'),ylabel('h(n)')
pause
stem(n,h),axis([-21 21 -0.3 1.1])

%Filtrado
tdsLi = filter(h,1,tdsL)
p = audioplayer(int16(tdsLi),24000);
play(p),pause

% Visualización
n=3750:3779;
N=100;
plot(n,tdsLi(n+N),'b')
hold
stem(n,tdsLi(n+N),'g')
stem(n,tdsL(n),'r')
hold
grid, xlabel('n')
legend('tds(t)','tdsLi(n)','tdsL','Location','NorthWest')

%% 3 Diezmado
clear
% Apartado 3.1. Señal de entrada

% Datos
F0=1e3;
T1=-1; T2=1;

% Datos derivados
Ts=1/(12*F0);
t=T1:Ts:T2;

% Cálculo y dibujo de la señal de entrada para los índices [-30, 30]
x=(sin(2*pi*F0*t)./(pi*t)).^2;stem(t,x)
x(isnan(x))=4*F0^2;
n=round(t/Ts);
stem(-30:30,x( (n>=-30) & (n<=30))), title('(sin(2*\piF_0nT_s)/\pinT_s)^2'), xlabel('n'), grid
axis([-30.5 30.5 -0.05*4*F0^2 1.05*4*F0^2])
pause

% Apartado 3.2. Sistema Diezmador

%Diseño del filtro
%Diseño
M = 2;
n = -100:100;
h = M*sin(pi/M*n)./(pi*n);
h(isnan(h))=1;
plot(n,h),title('Respuesta impulsiva'),xlabel('n'),ylabel('h(n)')
pause
stem(n,h),axis([-21 21 -0.3 1.1])

%filtrado
tdsLi = filter(h,1,tdsL)

%compresión
M=2;
xc = xf(1:M:length(xf));
stem(-20:20,xf)
%dibujo de  la salida del filtro y del compresor




%% 4 Estudio del expansor y del compresor en el dominio de la frecuencia

% Apartado 4.1 Cálculo de X(w)
[X w]=freqz(x,1,'whole');
plot(w,abs(X)), title('|X(\omega)|'), xlabel('\omega'), grid
axis tight
pause

% Apartado 4.2 Espectro de la señal expandida


% Apartado 4.3 Espectro de la señal comprimida 



