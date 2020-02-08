S=zeros(1,100);
C=S;
t=S;
for k = 1:100
    tic
    [C(k), S(k)]=insertion(rand(1,2000));
    t(k)=toc;
end
mean(C)
mean(S)
mean(t)