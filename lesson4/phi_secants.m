function y = phi_secants(x,f,b)
%build phi function for f which known which is the leagle b
y= (b * f(x) - x* f(b))/(f(x) - f(b));