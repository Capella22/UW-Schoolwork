clear all; close all; clc

fileA = matfile('A.mat');
A = fileA.A;
fileB = matfile('B.mat');
B = fileB.B;
%fileC = matfile('train_label.mat');
%train_label = fileC.train_label;
fileC = matfile('A_test.mat');
A_test = fileC.A_test;
fileD = matfile('test_label.mat');
test_label = fileD.test_label;
fileE = matfile('train_label.mat');
train_label = fileE.train_label;


disp(size(A))
disp(size(B))

A = A.'; %A has dimension 60000*784
B = B.'; %B has dimension 60000*10


k = 10000;
A = A(1:k,:);
B = B(1:k,:);


lambda = 1e-3;
%x = zeros(784, 1);


%lasso solver for each individual digit and then stacked together

top = [200 100 50 30 20 5 1];
accuracy = zeros(10,7);

for k = 1:10
    
    [x, stats] = lasso(A, B(:,k), 'Lambda', lambda);
    

for j = 1:7

[pix,idx] = maxk(x,top(j));

new = zeros(1, 784);
new2 = zeros(1, 784);
for i=1:top(j)
    new(1,idx(i)) = pix(i);
end


figure(k)
subplot(7,1,j), imagesc(reshape(new,28,28))
set(gca,'ColorScale','log')
colorbar

x_new = zeros(784,1);

for i=1:top(j)
    x_new(idx(i)) = x(idx(i));
end
% getting result in test data
b = A_test.'*x_new; b(b>=0.5) = k; b(b<0.5) = -1; testk = test_label; testk(testk == 0) = 10; testk(testk ~= k) = 0;
%disp(size(b))
%disp(size(testk))
%disp(nnz(~(q-test_label))/10000)
accuracy(k,j) = nnz(~(b-testk))/nnz(testk);

end



end

disp(accuracy)

