file = matfile('cropped data.mat');
Data = file.Datamtx;
%disp(size(Data))

Data = Data(:,1:2000);

% compute correlation matrix
A = corrcoef(double(Data'));
[V,D] = eigs(A);

%disp(size(A))
m=size(A);
k = 100;
u = rand(m(1),1);
%disp(size(u))
v = u/norm(u);
for i = 1:k
    w = A*v;
    v = w/norm(w);
    lamda = v'*A*v;
end
disp(lamda)
disp(D(1,1))
disp(norm(v-V(:,1)))

