function e=InegralError(u,sol,t,x)
%sol is a matrix of nomeric soultion 
[Nx,Nt] = size(u);
e=0;
for i=1:Nx
    for j=1:Nt
        e = e + (sol(x(i),t(j)) - u(i,j))^2;
    end
end
e = sqrt(e);