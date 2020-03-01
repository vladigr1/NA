function [t,x,u] =HeatEquation(L,t_f,a,sigma,f,phi_0,phi_L,N)
%0<=x<=L
h = L/N;
mu =sigma*a^2;
k = mu*h^2;
x = 0:h:L;
t=0:k:t_f;

Nx = length(x);
Nt = length(t);

u = zeros(Nx,Nt);
u(1,1) = phi_0(0);
u(Nx,1) = phi_L(0);
u(2:Nx-1,1) = f(x(2:Nx-1));

for j=2:Nt
    u(1,j) = phi_0(j);
    u(Nx,j) = phi_L(t(j));
    for i=2:Nx-1
       u(i,j) = mu * u(i-1,j-1) + (1-2*mu)*u(i,j-1) + mu*u(i+1,j-1);
    end
end