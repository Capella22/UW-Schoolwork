format long

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


disp(size(A))
disp(size(B))

A = A.'; %A has dimension 60000*784
B = B.'; %B has dimension 60000*10

%1st solver using pseudo-inverse
x1 = pinv(A)*B; 
% getting result in test data
b1 = A_test.'*x1; [p,q1] = max(b1, [], 2); q1 = mod(q1,10);
%accuracy in test data
disp(nnz(~(q1-test_label))/10000)
% colormaps
%pcolor(reshape(sum(x1,2),28,28))
pcolor(reshape(x1(:,1),28,28))
set(gca,'ColorScale','log')
colorbar


%2nd solver using backslash
x2 = A\B;
% getting result in test data
b2 = A_test.'*x2; [p,q2] = max(b2, [], 2); q2 = mod(q2,10);
%accuracy in test data
disp(nnz(~(q2-test_label))/10000)

%3rd solver using lasso
%lambda = 1e-2;
%[x3, stats] = lasso(A, B, 'Lambda', lambda);
%4th solver using lasso
%[x4, stats] = lasso(A, B, 'Lambda', lambda, 'Alpha', 0.8);
%5th solver using robustfit
%x5 = robustfit(A, B(:,1));
%6th solver using ridge
%x6 = ridge(A, B, 0.5, 0);

