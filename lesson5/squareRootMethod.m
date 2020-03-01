function x = squareRootMethod(A,b)
% yi = bi - sum(k = 1: i-1, L(i,k) * yi)
[m,n] = size(A);
L = squareRoot(A);
y = zeros(n,1);
for  i=1:n
    y(i) = (b(i) - sum(L(i,1:i-1).*y(1:i-1)))/L(i,i);   %may need a 'e
end
    y