clear all;


load('./data2.mat')

l=.01;   %intail guess of l (l=0.0056)
K=0;        % variable to hold the geometric multiplicity

%This loop will give us the first instance where we have eigen value = 0
% and by that we will be able to find the 'k' connected components as in
% Q1 part (b)

for i=1:1000
    [L, Lsym, Lrw, W] = Lmatrix(X1,i*l);
    if (length(find(eig(Lsym) == 0)) > 0)
        %l=i*l;
        fprintf('first occurance of l for the eigen value = 0 \n');
        fprintf('%d \n',i*l)
        break
    end
end
%}


[L, Lsym, Lrw, W] = Lmatrix(X1,l);
[eig_vect,eig_val] = eig(Lsym);

%To find the geometric multiplicity we use the following loop
%(L-lambda*I) => L as lambda =0

K = geoMul(Lsym,0);

fprintf('intial number of k \n');
fprintf('%1d \n',K);

%[GM_Lsym] = geoMul(L,0);
%[GM_Lrm] = geoMul(L,0);

fprintf ('Press enter to continue\n\n')
pause

%Matrix L has 6 blocks (for l=0.0056)
Number_of_clusters = 6;

%considering the 'k' eigen vectors for clustering
U=eig_vect(:,1:K);

%Normalising the row to norm 1
T= rowNormalise(U);


[clustering,centroid] = kmeans(T,Number_of_clusters,'Start','uniform','MaxIter',10000);

%{
init_centroid = centroidInit(T,Number_of_clusters);

if K<7
    [centroid, clustering,count] = KmeansAlgo(T,init_centroid,120);
else
    [centroid, clustering,count] = KmeansAlgo(T,init_centroid,150);
end
%}
fprintf('Final # of cluster\n');
fprintf('%f \n',size(centroid,1))
fprintf('Press enter to continue \n\n')
pause
fprintf('\ndistribituaion of data across the clusters is.... \n')
histogram(clustering)
xlabel('cluster number');
ylabel('Number of points');









