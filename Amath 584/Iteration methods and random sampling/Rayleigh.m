format long

%file1 = matfile('symmetric.mat');
%A = file1.A;

file2 = matfile('nonsymmetric.mat');
A = file2.B;

disp(size(A))
[V,D] = eigs(A,10);


%rayleigh quotient method
k = 6;
m = 10;
error = zeros(k,1);

% by uncommenting one of the arguments from below, the algorithm converges
% to the corresponding eigenvalue

%u = V(:,1)+0.1*rand(m,1);
%u = V(:,2)+0.1*rand(m,1);
%u = V(:,3)+0.1*rand(m,1);
%u = V(:,4)+0.1*rand(m,1);
%u = V(:,5)+0.1*rand(m,1);
u = V(:,6)+0.1*rand(m,1);
%u = V(:,7)+0.1*rand(m,1);
%u = V(:,8)+0.1*rand(m,1);
%u = V(:,9)+0.1*rand(m,1);
%u = V(:,10)+0.1*rand(m,1);

v = u/norm(u);
lamda = v'*A*v;
for i = 1:k
    w = (v'/(A - lamda*eye(m)))';
    v = w/norm(w);
    lamda = v'*A*v;
    error(i) = abs(D(6,6) - lamda);
end
disp(lamda)
disp(D(6,6))
disp(error)
figure(1)
plot(1:k, error)
figure(2)
disp(size(V))
plot(diag(D),'*');