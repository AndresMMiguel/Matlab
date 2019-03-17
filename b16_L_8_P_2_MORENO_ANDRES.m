%% Andrés Moreno Miguel Práctica 2 SSIT

%a
FS= 44100;
%b
FS*length(data)*1000 %4.7 milisegundos
%c
tiempo_total=length(data)/FS*1000
%d
% La variable X=5

%e
sound(cancion_Lab8_diezmada,fs/X) %donde X=5
%f
FS_diezmada=44100/5;
%g
sound(cancion_Lab8_parcheada,fs)
%h
FS= 44100; 
