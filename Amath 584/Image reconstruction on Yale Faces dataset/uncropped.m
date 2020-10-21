clear all; close all; clc

Directory = 'yalefaces_uncropped\yalefaces';
Imagelist = dir(fullfile(Directory, '*'));

Datamtx = [];

for j = 3 : numel(Imagelist)
        Imagefile = fullfile(Directory, Imagelist(j).name);
        Image = imread(Imagefile);
        %disp(size(Image))
        Reshaped = reshape(Image, 243*320, 1); %reshape each image into a column vector
        Datamtx = [Datamtx Reshaped];
end
%disp(size(Datamtx))

[U,S,V] = svd(double(Datamtx), 'econ');

figure(1)
semilogy(diag(S),'Linewidth',[2])

modes = 20;
Reconstructed = U(:,1:modes) * S(1:modes,1:modes) * transpose(V(:,1:modes));

figure(2)
subplot(2,2,1), imagesc(reshape(Datamtx(:,1),243,320)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(2,2,2), imagesc(reshape(Reconstructed(:,1),243,320)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(2,2,3), imagesc(reshape(Datamtx(:,50),243,320)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(2,2,4), imagesc(reshape(Reconstructed(:,50),243,320)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);

modes = 100;
Reconstructed = U(:,1:modes) * S(1:modes,1:modes) * transpose(V(:,1:modes));

figure(3)
subplot(2,2,1), imagesc(reshape(Datamtx(:,1),243,320)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(2,2,2), imagesc(reshape(Reconstructed(:,1),243,320)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(2,2,3), imagesc(reshape(Datamtx(:,50),243,320)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(2,2,4), imagesc(reshape(Reconstructed(:,50),243,320)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);

modes = 5;
Reconstructed = U(:,1:modes) * S(1:modes,1:modes) * transpose(V(:,1:modes));

figure(4)
subplot(2,2,1), imagesc(reshape(Datamtx(:,1),243,320)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(2,2,2), imagesc(reshape(Reconstructed(:,1),243,320)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(2,2,3), imagesc(reshape(Datamtx(:,50),243,320)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(2,2,4), imagesc(reshape(Reconstructed(:,50),243,320)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);

