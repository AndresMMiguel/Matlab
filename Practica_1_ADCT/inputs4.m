function [x,t]=inputs4(T,A)

N=10;

t=[];
x=[];
for i=1:N
    ttrozo=((i-1)*T+0.01):0.01:(i*T);
    ind=0:(i-1);
    xind=1./(A.^ind);
    val=sum(xind);
    t=[t ttrozo];
    x=[x val*ones(size(ttrozo))];
end