function [R1,R2] = zerosring(coefs)
a = max(abs(coefs(2:end)));
a_ = max(abs(coefs(1:end-1)));

R1 = abs(coefs(end))/(a_+abs(coefs(end)));
R2 = 1+a/abs(coefs(1));

phi = 0:pi/100:2*pi;
x1 = R1*cos(phi);
y1 = R1*sin(phi);
x2 = R2*cos(phi);
y2 = R2*sin(phi);

patch([x1,x2],[y1,y2],'r','LineStyle','none');
