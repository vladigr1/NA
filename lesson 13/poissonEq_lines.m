function [t,x,u,w] = poissonEq_lines(a,b,c,d,f,phi_1,phi2,psi_1,psi_2,alpha,Ny,Nx)
h = (c-d)/Ny;
A = zeros(2*(Ny-1),2*(Ny-1));
for i =1:Ny-1
    A(2*i-1,2*i) = 1;
end
A(2,1)=2/h^2;
A(2,3)=-1/h^2;
A(end,2*Ny-5) = -1/h^2;
A(end,2*Ny-3) = 2/h^2;
for i=2:Ny-2
    A(2*i,2*i-3) = -1/h^2;
    A(2*i,2*i-1) = 2/h^2;
    A(2*i,2*i+1) = -1/h^2;
end
end