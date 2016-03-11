function W=topoW1(A,samp)

n=size(A,1);

W1=zeros(n);

for i=1:n
    for j=1:n
        W1(i,j)=sum((A(i,:)==1)&(A(j,:)==1));
        total=sum((A(i,:)==1)|(A(j,:)==1));
        if (total>0)
            W1(i,j)=W1(i,j)/total;
        else W1(i,j)=0;
        end
    end
end

W2=zeros(n);
for i=1:n
    for j=1:n
        W2(i,j)=sum((A(:,i)==1)&(A(:,j)==1));
        total=sum((A(:,i)==1)|(A(:,j)==1));
        if (total>0)
            W2(i,j)=W2(i,j)/total;
        else W2(i,j)=0;
        end
    end
end

W=(W1+W2)/2;
