%% Entrega 1 CELT
clc,clear,close all
% Datos
frecuencia= [40 50 60 75 80 100 150 300 500 700 900 1000 2000 4000 5000 8000 10000 15000 20000 25000 35000 50000 75000 100000];
ganancia=[0.13 0.16 0.2 0.25 0.26 0.34 0.52 1.1 2 3.5 5.2 5.8 2.2 0.98 0.75 0.47 0.41 0.3 0.24 0.21 0.12 0.08 0.06 0.05];
gananciadB= 20*log10(ganancia);
fase=[100.8 93.6 108 99.9 100.8 90 91.8 97.2 108 126 145.8 172.8 -115.2 -95.04 -108 -100.8 -100.8 -100.8 -100.8 -90 -95.4 -99 -90 -72];
R1=1e3;   
R2=12e3;
C=47e-9;
gs = tf([-1/(R1*C) 0],[1 2/(R2*C) 1/(R1*R2*C^2)]);
w= 2*pi*frecuencia;

% Gráfica
figure(1)
bode(gs,{0,100000}),grid
figure(2)
subplot(2,1,1)
semilogx(w,gananciadB),grid,title("Medidas Filtro Paso Banda"),xlabel("Frecuencia(rad/s)"),ylabel("Ganancia(dB)"),axis([10 120000 -30 20])
subplot(2,1,2)
semilogx(w,fase),grid,xlabel("Frecuencia(rad/s)"),ylabel("Fase(º)"),axis([10 120000 -150 180])

figure(3)
subplot(2,1,1)
semilogx(frecuencia,gananciadB),grid,title("Medidas Filtro Paso Banda"),xlabel("Frecuencia(Hz)"),ylabel("Ganancia(dB)"),axis([10 120000 -30 20])
subplot(2,1,2)
semilogx(frecuencia,fase),grid,xlabel("Frecuencia(Hz)"),ylabel("Fase(º)"),axis([10 120000 -150 180])

% Cálculo de polos y ceros
ceros= roots(gs.num{1})
polos= roots(gs.den{1})
modulo_polos= abs(polos)
