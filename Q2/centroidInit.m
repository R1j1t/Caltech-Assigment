function centroids = centroidInit (L,K)

centroids = zeros(K, size(L, 2));

random_indicies = randperm(size(L,1));    %random permutation of trials index
centroids = L(random_indicies(1:K),:);      %from random_indicies slecting K indicies

end
