clc, clear 
% Problema 1
N_pH = input('Introduzca el número de repeticiones: ')
posicion=1;
VaM = 1:N_pH;
for i=1:N_pH
Va = input('Introduzca el volumen de ácido en litros: ')
% Vb = input('Introduzca el volumen de básico en litros: ')
% Ca = input('Introduzca el concentración de ácido en mol/L: ')
% Cb = input('Introduzca el concentración de básico en mol/L: ')
VaM(posicion)= Va;
posicion= posicion+1;
end


%% Dudas de Laura
temperatura = [1,2,3,4,5];
temperatura(1)
temperatura(2)
presion=[5,4,3,2,1];
plot(temperatura, presion),grid,xlabel("temperatura(K)"),ylabel("presion (hPa)")
N = input('Número de repeticiones: ')
for i= 1:N
    temperatura(2)= input ('Introducir temperatura: ')
    presion(i) = input('Introducir presión: ')
end
plot(temperatura,presion),grid,xlabel("temperatura(K)"),ylabel("presion (hPa)")
