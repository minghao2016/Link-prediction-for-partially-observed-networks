function [tp,fp,auc]=evaluationV1(ATrue,A,prH,V)

n=size(A,1);

num=n^2-sum(sum(V));

ATrueL=zeros(1,num);
prL=zeros(1,num);
k=1;
for i=1:n
    for j=1:n
        if (V(i,j)==0)
            ATrueL(k)=ATrue(i,j);
            prL(k)=prH(i,j);
            k=k+1;
        end

    end

end

L=1000;

[prL,idx] = sort(-prL);
ATrueL = ATrueL(idx);

tp = cumsum(ATrueL);
fp = cumsum(~ATrueL);

% roc

largeroc = zeros(1,fp(end)+1);
largeroc(fp+1)=tp/tp(end);
roc = interp1([0:(1/fp(end)):1] , largeroc , [0:(1/(L-1)):1]);

tp=roc;
fp=(1/L):(1/L):1;
auc=mean(tp);
