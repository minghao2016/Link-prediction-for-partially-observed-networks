clear

load('adj_interaction.mat');
load('K_interaction_int.mat');
m=2;
load('samp2.dat');
samp=samp2;

ATrue=adj_interaction;
W=K_interaction_int;

n=size(ATrue,1);
A=zeros(n);

V=samp2;
V=triu(V,1);
V=V+V';
A=V.*ATrue;
W=min(1,W);
W=W.^10;

lam=10^5;
f=coordBlockDV(A,W,lam,V);
f=max(f,f');
[tpS,fpS,aucS]=evaluationUn(ATrue,A,f,V);

g=coordBlockDV(A,W,lam,zeros(n)+1);
g=max(g,g');
[tpU,fpU,aucU]=evaluationUn(ATrue,A,g,V);
fileName=['resultMUnD' num2str(m)];
save(fileName,'tpS','fpS','aucS','tpU','fpU','aucU');

