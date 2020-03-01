function [x,n] = Bisection(f,a,b,eps,N)
%Cantor algorithem
%check 
if(f(a)*f(b) > 0)
    error('No solution in the Interval!');
end
%pre-set
x_left = a;
x_right = b;
x= (a + b)/2;
n=1;

%iteration
while (n<N) && (abs(f(x)) > eps) 
    if f(x) * f(x_left) < 0
       x_right = x; 
    else
       x_left = x;
    end
    x = (x_left + x_right )/2;
    n= n+1;
end
n = n-1;    %we add +1 in the end before checking