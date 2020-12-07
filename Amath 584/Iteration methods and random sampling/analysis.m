file1 = matfile('U.mat');
U = file1.U;

file2 = matfile('S.mat');
S = file2.S;

file3 = matfile('V.mat');
V = file3.V;

figure(1)

for k = 1:20
    [U_k,S_k,V_k]=randomized_sampling(100*k);
    semilogy(diag(S_k),'r','Linewidth',[2])
    hold on
end
semilogy(diag(S),'b','Linewidth',[2])

figure(2)
[U_1000,S_1000,V_1000]=randomized_sampling(1000);
semilogy(diag(S(1:1000,1:1000)),'b','Linewidth',[2])
hold on
semilogy(diag(S_1000),'r','Linewidth',[2])


