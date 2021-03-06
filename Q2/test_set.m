clear all;


%load('./data2.mat')
load('ex7data2.mat')

l=0.1;   %intail guess of l (l=0.0056)
K=0;        % variable to hold the geometric multiplicity

%This loop will give us the first instance where we have eigen value = 0
% and by that we will be able to find the 'k' connected components as in
% Q1 part (b)

%{
for i=1:1000
    [L, Lsym, Lrw, W] = Lmatrix(X,i*l);
    if (length(find(eig(L) == 0)) > 0)
        l=i*l;
        fprintf('first occurance of l for the eigen value = 0 \n');
        fprintf('%d \n',i*l)
        break
    end
end
%}


[L, Lsym, Lrw, W] = Lmatrix(X,l);
[eig_vect,eig_val] = eig(Lrw);

%To find the geometric multiplicity we use the following loop
%(L-lambda*I) => L as lambda =0

K = geoMul(Lrw,0);

fprintf('intial number of k \n');
fprintf('%1d \n',K);

%[GM_Lsym] = geoMul(L,0);
%[GM_Lrm] = geoMul(L,0);

fprintf ('Press enter to continue\n\n')
pause

%Matrix L has 6 blocks (for l=0.0056)
Number_of_clusters = 3;

%considering the 'k' eigen vectors for clustering
eig_vect(:,1:K);

init_centroid = centroidInit(Lrw,Number_of_clusters);

if K<7
    [centroid, clustering,count] = KmeansAlgo(eig_vect,init_centroid,170);
else
    [centroid, clustering,count] = KmeansAlgo(eig_vect,init_centroid,100);
end

fprintf('Final # of cluster\n');
fprintf('%f \n',size(centroid,1))
fprintf('Press enter to continue \n\n')
pause
fprintf('\ndistribituaion of data across the clusters is.... \n')
histogram(clustering)
xlabel('cluster number');
ylabel('Number of points');


sort(count)








