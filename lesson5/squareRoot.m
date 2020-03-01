function L = squareRoot(A)
%bad matrix in case 
if ~all(all(A == A')) || ~all(eigs(A)> 0)
    error("bad matrix");
end
[m,n] = size(A);
L = zeros(n,n);

for i=1:n
    L(i,i) = sqrt(A(i,i) - sum(L(i,1:i-1).^2));
    for j=i+1:n
        L(j,i)  = (A(j,i) - sum(L(i,1:i-1).*L(j,1:i-1)))/L(i,i);
    end
end