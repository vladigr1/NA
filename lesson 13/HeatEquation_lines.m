function [t,x,U]=HeatEquation_lines(L,t_f,a,f,phi_0,phi_L,Nx,Nt)
%[t,x,U]=HeatEquation_lines(1,2,1,@f2,@phi_zero,@phi_zero,30,4000);
%plot(x,U(:,1001))
%hold on; plot(x,exp(-pi^2*0.5)*sin(pi*x))
h=L/Nx;
k=t_f/Nt;

if k<h^2/2/a^2
    x=0:h:L;
    t=0:k:t_f;
    Nx=length(x);
    Nt=length(t);
    u=zeros(Nx-2,Nt);
    A=zeros(Nx-2,Nx-2);
    for i=1:Nx-3
        A(i,i+1)=1;
        A(i,i)=-2;
        A(i+1,i)=1;
    end
    A(end,end)=-2;
    A=a^2/h^2*A;
    u(:,1)=f(x(2:end-1))';
    
    for m=1:Nt-1
        g=[phi_0(t(m));zeros(Nx-4,1);phi_L(t(m))];
        u(:,m+1)=u(:,m)+k*(A*u(:,m)+g);
    end
    U=zeros(length(x),Nt);
    U(1,:)=phi_0(t);
    for i=2:length(x)-1
        U(i,:)=u(i-1,:);
    end
    U(:,length(x))=phi_L(t);
 
else
    error('Time step is large')
end

