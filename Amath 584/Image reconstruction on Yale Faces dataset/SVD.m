file = matfile('cropped data.mat');
Data = file.Datamtx;
disp(size(Data))

[U,S,V] = svd(double(Data), 'econ');
disp(size(U));
disp(size(S));
disp(size(V));
save('U.mat','U'); % U has size 32256*2414 
save('S.mat','S'); % S has size 2414*2414 
save('V.mat','V'); % V has size 2414*2414 
