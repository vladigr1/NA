function [t,x,u] =WaveEquation(L,t_f,a,f,F,phi_0,phi_L,N,f_der2,mode)
%0<=x<=L
h = L/N;
k = h/a;
x = 0:h:L;
t=0:k:t_f;

Nx = length(x);


switch mode
    case 1
        Nt = length(t)+1;
        u = zeros(Nx,Nt+1);
        Nt0=2;
    case 2
        Nt = length(t);
        u = zeros(Nx,Nt);
        Nt0=1;
end

u(1,Nt0) = phi_0(0);
u(Nx,Nt0) = phi_L(0);
u(2:Nx-1,Nt0) = f(x(2:Nx-1));

switch mode
    case 1
        u(:,1) = u(:,Nt0) + k*F(x)';
    case 2
        u(:,Nt0+1) = u(:,Nt0) +k*F(x)' + h^2/2*f_der2(x)';
end

for j=3:Nt
    u(1,j) = phi_0(t(j-1));
    u(Nx,j) = phi_L(t(j-1));
    for i=2:Nx-1
       u(i,j) = u(i-1,j-1) + u(i+1,j-1) - u(i,j-2);
    end
end

if mode ==1
    u = u(:,2:Nt);
end