function [centroids,count] = computeCentroid(L,clusterring,K)

[m,n] = size(L);
sum = zeros(K,n);       %will hold the sum of indicies for diff. cluster
count = zeros(K,1);     %Will hold the number of trials assigned to a cluster

for i =1:m
    cluster_assig = clusterring(i);
    sum(cluster_assig,:) = sum(cluster_assig,:) +  L(i,:);
    count(cluster_assig) = count(cluster_assig) +1;
end


centroids = (1./count).*sum;

end

