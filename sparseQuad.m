function f = sparseQuad(A,L,lam,V);

n = size(A,1);

A = A';
A = A(:);
V = V';
V = V(:);
E = sparse(1:(n^2),1:(n^2),V);
L = n^2*E+lam*L;
f = pcg(L, n^2*V.*A, [], 1000);
f = vec2mat(f, n);
% for i=1:n
%     for j=1:n
%         for k=1:n
%             for l=1:n
%                 if ((W(i,k)>0)&(W(j,l)>0))
%                     Q((i-1)*n+j, (k-1)*n+l)=W(i,k)*W(j,l);
%                 end
%             end
%         end
%     end
% end
