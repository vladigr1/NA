function Mp = UBp(coefs)
k = find(coefs<0);

m = k(1)-1;
a = max(abs(coefs(k)));

Mp = 1 + (a/coefs(1))^(1/m);