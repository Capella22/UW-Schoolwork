file1 = matfile('U.mat');
U = file1.U;

file2 = matfile('S.mat');
S = file2.S;

file3 = matfile('V.mat');
V = file3.V;

figure(2)
semilogy(diag(S),'Linewidth',[2])

file4 = matfile('cropped data.mat');
ImgData = file4.Datamtx;


modes = 500;
Reconstructed = U(:,1:modes) * S(1:modes,1:modes) * transpose(V(:,1:modes));
figure(3)
subplot(2,2,1), imagesc(reshape(ImgData(:,1),192,168)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(2,2,2), imagesc(reshape(Reconstructed(:,1),192,168)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(2,2,3), imagesc(reshape(ImgData(:,50),192,168)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(2,2,4), imagesc(reshape(Reconstructed(:,50),192,168)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
