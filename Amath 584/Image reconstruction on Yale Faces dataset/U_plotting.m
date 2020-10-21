file = matfile('U.mat');
Data = file.U;


figure(1)
subplot(3,3,1), imagesc(reshape(Data(:,1),192,168)); colormap gray, set(gca,'Xtick',[0.01],'Ytick',[0.01]);
subplot(3,3,2), imagesc(reshape(Data(:,2),192,168)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(3,3,3), imagesc(reshape(Data(:,3),192,168)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(3,3,4), imagesc(reshape(Data(:,4),192,168)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(3,3,5), imagesc(reshape(Data(:,5),192,168)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(3,3,6), imagesc(reshape(Data(:,6),192,168)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(3,3,7), imagesc(reshape(Data(:,7),192,168)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(3,3,8), imagesc(reshape(Data(:,8),192,168)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);
subplot(3,3,9), imagesc(reshape(Data(:,9),192,168)); colormap gray, set(gca,'Xtick',[],'Ytick',[]);

