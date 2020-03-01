function [I,N]=integral_num_epsilon(f,a,b,epslion,M,method,varargin)
%all integral method we learn in course
    switch method
        case {1,2}
            N = ceil(M*(b-a)^2/2/epsilon);
        case 3
            N = ceil(sqrt(M*(b-a)^3/24/epsilon));
        case 4
            N = ceil(sqrt(M*(b-a)^3/12/epsilon));
        case 5
             N = ceil((M*(b-a)^5/180/epslion)^(1/4));
             if mod(N,2)
                 N=N+1;
             end
    end
    I = integral_num(f,0,1,N,method,varargin{:});
end