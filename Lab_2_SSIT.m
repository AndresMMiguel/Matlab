%% Práctica 2 Andrés Moreno Miguel
clc,clear,close all

% Ej 2.1
ref= 0:0.02:5;
s=zeros(1,length(ref));
s(1:find(ref==1))=ref(1:find(ref==1));
figure(1),plot(ref,s),grid

% Señal s invertida
s_inv=flipud(s.')
figure(2),plot(ref,s_inv),grid

% Ej 2.2
% function [y,refy]= desplaza(x,refx,T);
% realiza un desplazamiento
% if(T>=0)
%     refa= [refx(end)+0.02:0.02:refx(end)+T];
%     refy=[refx refa];
%     y=[zeros(1,length(refa)) x];
% elseif(T<0)
%     refa=[refx(1)+round(T/0.02)*0.02:0.02:refx(1)-0.02];
%     refy=[refa refx];
%     y=[x zeros(1,length(refa))];
% end
% return

% Ej 2.3
load aaa.mat
figure(3),plot(t,y),grid
sound(y,8192)

% Ej 2.4
y_inv= flipud(y);
figure(4),plot(t,y_inv),grid
sound(y_inv,8192)

% Ej 2.5
t_comp50=t./2;
figure(5),plot(t_comp50,y),grid
sound(y,8192*2)

% Ej 2.6
t_exp20= t./0.8;
figure(6),plot(t_exp20,y),grid
sound(y,8192*0.8)

% Ej 2.7
ref= 0:250;
s=zeros(1,length(ref));
s(1:101)=1;
figure(7),plot(ref,s),grid
% Ej 2.8