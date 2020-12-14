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
x = zeros(784, 10);


%lasso solver for each individual digit and then stacked together

for j = 1:10
    
    [xj, stats] = lasso(A, B(:,j), 'Lambda', lambda);
    x(:,j) = xj;

end


top = [700 500 300 200 100 50 30];

accuracy = zeros(7);

for j = 1:7

sumx = sum(x,2);
[pix,idx] = maxk(sumx,top(j));

new = zeros(1, 784);
new2 = zeros(1, 784);
for i=1:top(j)
    new(1,idx(i)) = pix(i);
end



subplot(7,1,j), imagesc(reshape(new,28,28))
set(gca,'ColorScale','log')
colorbar

x_new = zeros(784,10);

for i=1:top(j)
    x_new(idx(i),:) = x(idx(i),:);
end

% getting result in test data
b = A_test.'*x_new; [p,q] = max(b, [], 2); q = mod(q,10);
accuracy(j) = nnz(~(q-test_label))/10000;

end

disp(accuracy)