function w = g(z,f,h,xm,ym,varargin)
%z = Ym+1
w = z - h*f(xm,z,varargin{:})-ym;