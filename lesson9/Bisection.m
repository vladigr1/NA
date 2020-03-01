function [x,n] = Bisection(f,a,b,eps,N,varargin)
%Cantor algorithem
%check 
if(f(a,varargin{:})*f(b,varargin{:}) > 0)
    error('No solution in the Interval!');
end
%pre-set
x_left = a;
x_right = b;
x= (a + b)/2;
n=1;

%iteration
while (n<N) && (abs(f(x,varargin{:})) > eps) 
    if f(x,varargin{:}) * f(x_left,varargin{:}) < 0
       x_right = x; 
    else
       x_left = x;
    end
    x = (x_left + x_right )/2;
    n= n+1;
end
n = n-1;    %we add +1 in the end before checking