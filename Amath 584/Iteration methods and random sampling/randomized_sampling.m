function[U,S,V]=randomized_sampling(k)

file = matfile('cropped data.mat');
Data = file.Datamtx;

Data = double(Data);

[m,n] = size(Data);
random = rand(n, k);

Y = Data*random;
[Q,R] = qr(Y,0);
B = Q'*Data;
[U_k,S,V] = svd(B,'econ');
U = Q*U_k;

end


