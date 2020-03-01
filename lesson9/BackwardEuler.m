function [x,y] = BackwardEuler(f,a,b,y0,N,delta,eps,varargin)
% euler method 
h = (b-a)/N;
x= a:h:b;
y = zeros(1,N+1);
y(1) = y0;
for m=1:N
    y(m+1) = Bisection(@g,y(m)-delta,y(m)+delta,eps,100,f,h,x(m+1),y(m),varargin{:});
end
