function I=integral_num(f,a,b,n,method,varargin)
%all integral method we learn in course
    h = (b-a)/n;
    x= a:h:b;
    switch(method)
        case 1 %left rectangles
            I = h*sum(f(x(1:end-1),varargin{:}));
            
        case 2 %right rectangles
            I = h*sum(f(x(2:end),varargin{:}));
            
        case 3 %middle rectangles
            I = h*sum(f(x(1:end-1) + h/2,varargin{:}));
        case 4 %Trapezoidal Rule
            I = h/2*(f(x(1),varargin{:}) + f(x(end),varargin{:}) + 2*sum(f(x(2:end-1) + h/2,varargin{:})) );
        case 5 %Simpson
            if(mod(n,2) == 1) %n must be even
                error("n isn`t even");
            end
            I = h/3*(f(x(1),varargin{:}) + f(x(end),varargin{:}) + ...
            4*sum(f(x(2:2:end-1),varargin{:})) +2*sum(f(x(3:2:end-2),varargin{:})) );
    end
end