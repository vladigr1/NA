function [x,y] = RK4(f,a,b,y0,N,varargin)
% euler method 
h = (b-a)/N;
x= a:h:b;
y = zeros(1,N+1);
y(1) = y0;
for m=1:N
    k1 = f(x(m),y(m),varargin{:});
    k2 = f(x(m) + h/2 ,y(m)+ h/2*k1,varargin{:});
    k3 = f(x(m) + h/2 ,y(m)+ h/2*k2,varargin{:});
    k4 = f(x(m) + h ,y(m)+ h*k3,varargin{:});
    y(m+1) = y(m) + h/6*(k1+2*k2 + 2*k3 +k4);
end
