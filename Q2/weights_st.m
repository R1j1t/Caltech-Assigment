% WEIGHTS_ST Returns self-tuning weights associated with a collection of 
% data points, using K nearest neighbors
%
% W = WEIGHTS_ST(data,K) takes a n*d matrix of n data points of dimension d
% and an integer K>1, and returns the n*n matrix of self-tuning weights
% associated with them.

function [W,D] = weights_st(data,K)

dist_type = 'euclidean';    % Distance for weights

N = size(data,1);
W=zeros(N,N); 
D=zeros(N);


[IDX,DX] = knnsearch(data,data,'K',K,'Distance',dist_type,'IncludeTies',true);

for i=1:N
    for j=1:length(IDX{i})
        l = IDX{i}(j);
        W(i,l) = exp(-DX{i}(j)^2/(DX{i}(K)*DX{j}(K)));
    end
end

% Take care of 0/0 cases and symmetrize, just in case
W(isnan(W)) = 1;
W = (W+W')/2;

for i=1:N
    D(i,i)=sum(W(i,:));
end

end
