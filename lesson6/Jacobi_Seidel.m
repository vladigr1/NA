function [x,i] = Jacobi_Seidel(A,b,x0,epsilon,N,method)
% must behave:
%1 B+CA = I
%det(I-B) ~= 0 -> better r(B) = max|lambda(B)|< 1
%Jacobi:
%B = -D^-1(L+U) Lower Upper
%C = D^-1 Diagnal
%Seidel:
%B = -(D+L)^-1U Lower Upper
%C = (D+L)^-1
D = diag(diag(A));
L = tril(A)-D;
U = triu(A)-D;

switch method
    case 1
        C = inv(D);
        B = -C*(L+U);
    case 2
        C = inv(D + L);
        B = -C*U;
end
e
%check if valiable method
if SRtest(B)~=1
    error("Spectral radius >= 1");
end

Cb = C * b;
i=0;
x=x0;
while norm(A*x - b)>= epsilon && i<N
    x=B*x + Cb;
    i=i+1;
end
norm(A*x - b)
    