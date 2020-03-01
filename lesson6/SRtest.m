function cond = SRtest(B)
%is must behave for Itreation 
cond = all(abs(eigs(B))<1);