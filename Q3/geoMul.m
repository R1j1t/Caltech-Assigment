function [N,R]= geoMul(L,lambda)

% Geometric multiplicity = nullity = dim (X-lambda*I)-rank(A)

N = length(L) - rank((L-lambda .*eye(size(L))));
end
