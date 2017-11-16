load('./data2.mat')

K=10;        % instructed in the question

[L, Lsym, Lrw, W] = Lmatrix_selfTuning(X3,K);
[eig_vect,eig_val] = eig(L);

%To find the geometric multiplicity we use the following loop
%(L-lambda*I) => L as lambda =0

k_eigenVectors = geoMul(L,0);

fprintf('number of k eigenVectors \n');
fprintf('%1d \n',k_eigenVectors);

%[GM_Lsym] = geoMul(L,0);
%[GM_Lrm] = geoMul(L,0);

fprintf ('Press enter to continue\n\n')
pause

%Matrix L has 6 blocks (for l=0.0056)
Number_of_clusters = 6;

%considering the 'k' eigen vectors for clustering
eig_vect(:,1:k_eigenVectors);

init_centroid = centroidInit(L,Number_of_clusters);

[centroid, clustering,count] = KmeansAlgo(eig_vect,init_centroid,100);


fprintf('Final # of cluster\n');
fprintf('%f \n',size(centroid,1))
fprintf('Press enter to continue \n\n')
pause
fprintf('\ndistribituaion of data across the clusters is.... \n')
histogram(clustering)
xlabel('cluster number');
ylabel('Number of points');


sort(count)








