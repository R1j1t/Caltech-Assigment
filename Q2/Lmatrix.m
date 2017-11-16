function [L, Lsym, Lrw, W] = Lmatrix(X,l)

if l<0
    fprintf('l should be greater than zero');
    return
end

n=size(X,1);
W=zeros(n);
D=zeros(n);

for i= 1:n
    
    for j=1:n
        
        if i<j
            dist = norm(X(i,:)-X(j,:));
            wij = exp(-(dist^2)/(l^2));
            W(i,j)=wij;
            W(j,i)=wij;
            
        elseif i==j
            dist = norm(X(i,:)-X(j,:));
            W(i,j) = exp(-(dist^2)/(l^2));
        
        end
    end
end


for i=1:n
    D(i,i)=sum(W(i,:));
end

L=D-W;
Lsym = (D^(-0.5))*L*(D^(-0.5));
Lrw = (D^(-1))*L;
end


            