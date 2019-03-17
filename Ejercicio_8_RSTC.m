%% Made by Andres Moreno, enjoy!
N = input('¿Cuántas personas van a hacer el ejercicio? ');
for i = 1:N
    fprintf('\n')
    C = input('Introducir el valor de C = ');
    B = input('Introducir el valor de B = ');
    R = input('Introducir el valor de R = ');
    s= (B*8e3)/((C-R)*1e6);
    Pregunta1= ((C-R)*1e3)*(0.5-s)/8;
    Pregunta2= (Pregunta1*8e3)/(R*1e6);
    Pregunta3= C/4;
    Pregunta4= (0.5*(C-Pregunta3)*1e3)/8;
    fprintf('\n')
    fprintf('Pregunta 1: %6.2f (kB) \n', Pregunta1)
    fprintf('Pregunta 2: %6.2f (segundos)\n', Pregunta2)
    fprintf('Pregunta 3: %6.2f (Mbps)\n', Pregunta3)
    fprintf('Pregunta 4: %6.2f (kB)\n ', Pregunta4)
    fprintf('\n')
end
if (N==1)
    fprintf('Enhorabuena por el 10!! ')
else
fprintf ('Enhorabuena por los %d dieces!! ',N)
end