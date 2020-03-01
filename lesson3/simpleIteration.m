function [x,i] = simpleIteration(phi,x0, epsilon, N, varargin)
%simple iteration solving by using ph i_s
x(1) = x0;
i = 0;
while ((abs(x(i+1) - phi(x(i+1), varargin{:})) > epsilon) & (i < N) )
    x(i+2)= phi(x(i+1), varargin{:});
    i = i + 1;
end