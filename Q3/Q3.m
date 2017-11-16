clear all;

load('./data3.mat')

for index=10:11
    K=2^index        % K=6


    %This loop will give us the first instance where we have eigen value = 0
    % and by that we will be able to find the 'k' connected components as in
    % Q1 part (b)

    %{
    for i=1:1000
        [L, Lsym, Lrw, W] = Lmatrix(X1,i*l);
        if (length(find(eig(L) == 0)) > 0)
            l=i*l;
            fprintf('first occurance of l for the eigen value = 0 \n');
            fprintf('%d \n',i*l)
            break
        end
    end
    %}


    [L, Lsym, Lrw, W] = Lmatrix_selfTuning(X,K);
    [eig_vect,eig_val] = eig(Lsym);

    %To find the geometric multiplicity we use the following loop
    %(L-lambda*I) => L as lambda =0

    k_eigenVectors = geoMul(Lsym,0);

    fprintf('number of k eigenVectors \n');
    fprintf('%1d \n',k_eigenVectors);

    fprintf ('Press enter to continue\n\n')
    %pause

    %Provided in the question
    Number_of_clusters = 3;

    %considering the 'k' eigen vectors for clustering
    eig_vect(:,1:k_eigenVectors);

    init_centroid = centroidInit(Lsym,Number_of_clusters);

    [centroid, clustering,count] = KmeansAlgo(eig_vect,init_centroid,44);


    fprintf('Final # of cluster\n');
    fprintf('%f \n',size(centroid,1))
    fprintf('Press enter to continue \n\n')
    %pause
    fprintf('\ndistribituaion of data across the clusters is.... \n')
    histogram(clustering)
    xlabel('cluster number');
    ylabel('Number of points');


    sort(count)
    fprintf('Press enter to continue')
    pause
    
    

end


