function [x,y] = RK2(f,a,b,y0,N,alpha,varargin)
% euler method 
h = (b-a)/N;
x= a:h:b;
y = zeros(1,N+1);
y(1) = y0;
beta= h/2/alpha;
for m=1:N
    k1 = f(x(m),y(m),varargin{:});
    k2 = f(x(m) + beta ,y(m)+ beta*k1,varargin{:});
    y(m+1) = y(m) + h*( (1-alpha)*k1 + alpha*k2);
end
