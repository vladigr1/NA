function y=Check_Diagonal_Dominanace(A)
%Check_Diagonal_Dominanace of rows
[m,n] = size(A);
if m ~= n
    error("not squared matrix");
end
for i = 1:m 
    if abs(A(i,i)) < sum(abs(A(i,:))) - abs(A(i,i))
        y=0;
        return
    end
end
y=1;