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

A = A(1:100,:);
B = B(1:100,:);

%solver using different factors for L1-penalty
lambda = [1e-3 1e-2 1e-1];
accuracy = zeros(3);
for j = 1:3
    cvx_begin;
    variable x(784,10)
    minimize (norm(A*x-B,2)+lambda(j)*norm(x,1))
    cvx_end;
    
    subplot(3,1,j), pcolor(reshape(sum(x,2),28,28))
    set(gca,'ColorScale','log')
    colorbar
    
    % getting result in test data
    b = A_test.'*x; [p,q] = max(b, [], 2); q = mod(q,10);
    disp(nnz(~(q-test_label))/10000)
    accuracy(j) = nnz(~(q-test_label))/10000;
end

disp(accuracy)