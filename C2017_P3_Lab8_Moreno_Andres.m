% 1
syms s t

% 2
x(t)= heaviside(t)

% 3
X(s)= laplace(x(t))

%4
H(s)= 9/(s^2+9)

%5
Y(s)= H(s)*X(s)

%6
y(t)=ilaplace(Y(s)), ezplot(y(t),[0 10])

%7
% pretty(y(t)), y(t)=1-cos(3t)

%8
% T=2 s

%9
% Siempre tiene la misma amplitud y los polos condicionan el periodo de la
% señal