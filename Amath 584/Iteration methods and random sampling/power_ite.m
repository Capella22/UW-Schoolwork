format long

%file1 = matfile('symmetric.mat');
%A = file1.A;

file2 = matfile('nonsymmetric.mat');
A = file2.B;

[V,D] = eigs(A,10);
%disp(D)

%power iteration method
ground_truth = D(1,1);
k = 8;
error = zeros(k,1);
u = rand(m,1);
v = u/norm(u);
for i = 1:k
    w = A*v;
    v = w/norm(w);
    lamda = v'*A*v;
    error(i) = abs(ground_truth - lamda);
end
disp(ground_truth)
disp(error)
figure(1)
plot(1:k, error)