function clustering = assigCentroid (L,centroids)

n=size(L,1);                        %Setting the trials
K = size(centroids,1);              %defining # of clusters

clustering = zeros(size(L,1), 1);   %defining the matric to hold the index

dist= zeros(K,1);                   %dummy variable to hold the distance between 
                                    % each index and clusters
                                    



for i = 1:n
    for j =1:K
        dist(j) = norm(L(i,:)- centroids(j,:))^2;
    end
    [dummy,ind] = min(dist);    
    clustering(i,1) = ind;
end


end
