function [t,x,u] =HeatEquation_lines(L,t_f,a,f,phi_0,phi_L,Nx,Nt)
%0<=x<=L
h = L/Nx;
k = t_f/Nt;

if k >= h^2/2/a^2
   error('Time step is Large');
end

x = 0:h:L;
t=0:k:t_f;
Nx = length(x);
Nt = length(t);

u = zeros(Nx-2,Nt-2);
A=zeros(Nx-2,Nx-2);


for i=1:Nx-3
    A(i,i+1) = 1;
    A(i,i) = -2;
    A(i+1,i) = 1;
end
A(end,end) = -2;
A = a^2/h^2*A;
%euler method solving u' = Au + f
u(:,1) = f(x(2:end-1))';
for m=1:Nt-1
    %g is f from lexture
    g = [phi_0(t(m));zeros(Nx-4,1);phi_L((t(m)))];
    u(:,m+1) = u(:,m) + k*(A*u(:,m) + g); 
end