clc, clear 
% Problema 1
N_pH = input('Introduzca el n�mero de repeticiones: ')
posicion=1;
VaM = 1:N_pH;
for i=1:N_pH
Va = input('Introduzca el volumen de �cido en litros: ')
% Vb = input('Introduzca el volumen de b�sico en litros: ')
% Ca = input('Introduzca el concentraci�n de �cido en mol/L: ')
% Cb = input('Introduzca el concentraci�n de b�sico en mol/L: ')
VaM(posicion)= Va;
posicion= posicion+1;
end


%% Dudas de Laura
temperatura = [1,2,3,4,5];
temperatura(1)
temperatura(2)
presion=[5,4,3,2,1];
plot(temperatura, presion),grid,xlabel("temperatura(K)"),ylabel("presion (hPa)")
N = input('N�mero de repeticiones: ')
for i= 1:N
    temperatura(2)= input ('Introducir temperatura: ')
    presion(i) = input('Introducir presi�n: ')
end
plot(temperatura,presion),grid,xlabel("temperatura(K)"),ylabel("presion (hPa)")
