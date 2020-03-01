function [x,y] = Euler(f,a,b,y0,N,varargin)
% euler method 
h = (b-a)/N;
x= a:h:b;
y = zeros(1,N+1);
y(1) = y0;
for m=1:N
    y(m+1) = y(m) + h* f(x(m),y(m),varargin{:});
end
