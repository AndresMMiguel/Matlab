syms x a b
a = (((a^2+b^2)/(a^2-b^2))-((a+b)/(a-b)))*((a+b)/(a*b));
e1 = x+(1/x);
e2 = x-(1/x);
e3 = x-1;
e = e1/e2*e3;
simplify(e)
pretty(e)