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

A_valid = A(55000:60000,:);
B_valid = B(55000:60000,:);

k = 10000;
A = A(1:k,:);
B = B(1:k,:);



lambda = [1e-5 1e-4 1e-3 1e-2 1e-1];
x = zeros(784, 10);
accuracy = zeros(5);

%lasso solver for each individual digit and then stacked together
for i = 1:5
for j = 1:10
    
    [xj, stats] = lasso(A, B(:,j), 'Lambda', lambda(i));
    x(:,j) = xj;

end

subplot(5,1,i), pcolor(reshape(sum(x,2),28,28))
set(gca,'ColorScale','log')
colorbar

% getting result in validation data
b = A_valid*x; [p,q] = max(b, [], 2); q = mod(q,10);
%disp(nnz(~(q-test_label))/10000)
accuracy(i) = nnz(~(q-train_label(55000:60000)))/5000;


end

% getting result in test data
%b = A_test.'*x; [p,q] = max(b, [], 2); q = mod(q,10);
%disp(nnz(~(q-test_label))/10000)
%accuracy(i) = nnz(~(q-test_label))/10000;




disp(accuracy)