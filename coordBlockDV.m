function [f,t]=coordBlockDV(A,W,lam,V);

n=size(A,1);

diff=1;

f=rand(n);

sumW=sum(W);
D=diag(sumW);

t=0;

while (diff>1e-4)
    fNew=zeros(n);
    for i=1:n
        Vi=diag(V(i,:));
        b=(n^2*A(i,:)*Vi+2*lam*(W(i,:)*f*W-W(i,i)*f(i,:)*W))';
        Q=n^2*Vi+2*lam*(sumW(i)*D-W(i,i)*W);
        temp=Q\b;
        fNew(i,:)=temp';
    end

    diff=max(max(abs(f-fNew)));
    f=fNew;
    t=t+1;

end
dlmwrite('p_hat.txt',fNew)
