function [L, Lsym, Lrw, W] = Lmatrix_selfTuning(X,K)

[W,D] = weights_st(X,K);

L=D-W;
Lsym = (D^(-0.5))*L*(D^(-0.5));
Lrw = (D^(-1))*L;
end


            