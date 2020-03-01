function y = Gauss_pdf(x,m,sigma)

y=1/sqrt(2*pi)/sigma*exp(-(x-m).^2/2/sigma^2);