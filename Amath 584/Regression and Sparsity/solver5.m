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

subplot(3,1,1), imagesc(reshape(sum(x,2),28,28))
set(gca,'ColorScale','log')
colorbar

top = 200;
sumx = sum(x,2);
[pix,idx] = maxk(sumx,top);

%disp(pix)
%disp(idx)

new = zeros(1, 784);
new2 = zeros(1, 784);
for i=1:top
    new(1,idx(i)) = pix(i);
    new2(1,idx(i)) = 1;
end

subplot(3,1,2), imagesc(reshape(new,28,28))
set(gca,'ColorScale','log')
colorbar

subplot(3,1,3), imagesc(reshape(new2,28,28))
set(gca,'ColorScale','log')
colorbar






% getting result in test data
b = A_test.'*x; [p,q] = max(b, [], 2); q = mod(q,10);
disp(nnz(~(q-test_label))/10000)
accuracy = nnz(~(q-test_label))/10000;




disp(accuracy)