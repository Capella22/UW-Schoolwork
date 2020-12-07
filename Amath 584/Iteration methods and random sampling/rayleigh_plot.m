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
approx = zeros(10,1);

for j = 1:10
    % when the initial guess falls near one specific eigenvector, 
    % the algorithm will finally converge to its corresponding eigenvalue
    u = V(:,j)+0.1*rand(m,1);
    v = u/norm(u);
    lamda = v'*A*v;
    for i = 1:k
    w = (v'/(A - lamda*eye(m)))';
    v = w/norm(w);
    lamda = v'*A*v;
    end
    approx(j) = lamda;
    
    
end
figure(1)
plot(diag(D),'*');
hold on
plot(approx,'+');

