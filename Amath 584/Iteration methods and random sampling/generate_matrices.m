m=10;
random = rand(m, m);

%by uncommenting one of the arguments from below, we start from a matrix
%that is symmetric/non-symmetric
A = triu(random,1) + tril(random');
B = random;

save('symmetric.mat','A');
save('nonsymmetric.mat','B');
