function [centroids,clustering,count] = KmeansAlgo(X,intial_centroids,iterations)

if ~exist('iterations','var') || isempty(iterations)
    iterations = 15;
end

m = size(X,1);                  %trials in the dataset
K = size(intial_centroids,1);  %number of clusters
centroids = intial_centroids;   %intial_centroid to start
clustering = zeros(m,1);        %holds the cluster assignments made


for i=1:iterations
    clustering = assigCentroid(X,centroids);
    
    [centroids,count] = computeCentroid(X,clustering,K);
    centroids=centroids(~any(isnan(centroids),2),:);
end
   

end


