function [T] = rowNormalise(U)

n=length(U);
T=zeros(size(U));

for i =1:n
    denominator = norm(U(i,:));
    T(i,:) = U(i,:)/denominator;

end
