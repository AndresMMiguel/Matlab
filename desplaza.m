
function [y,refy]= desplaza(x,refx,T);
realiza un desplazamiento
if(T>=0)
    refa= [refx(end)+0.02:0.02:refx(end)+T];
    refy=[refx refa];
    y=[zeros(1,length(refa)) x];
elseif(T<0)
    refa=[refx(1)+round(T/0.02)*0.02:0.02:refx(1)-0.02];
    refy=[refa refx];
    y=[x zeros(1,length(refa))];
end
return