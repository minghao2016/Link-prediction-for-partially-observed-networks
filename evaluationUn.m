function [tp,fp,auc]=evaluationUn(ATrue,A,prH,V)

n=size(A,1);
[r, c] = find(V == 0);
ATrueL = ATrue(r, c);
prL = prH(r, c);

L=1000;

[prL,idx] = sort(-prL);
ATrueL       = ATrueL(idx);

tp = cumsum(ATrueL);
fp = cumsum(~ATrueL);

% roc

largeroc = zeros(1,fp(end)+1);
largeroc(fp+1)=tp/tp(end);
roc = interp1([0:(1/fp(end)):1] , largeroc , [0:(1/(L-1)):1]);

tp=roc;
fp=(1/L):(1/L):1;
auc=mean(tp);

