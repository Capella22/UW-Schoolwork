function [Q,R] = m_Gram_Schmidt(X)

[m,n] = size(X);
Q = zeros(m,n);
R = zeros(n,n);
for i=1:n
    q = zeros(m,1);
    for j = 1:i-1
        R(j,i) = ctranspose(Q(:,j))*X(:,i);
        q = q + R(j,i)*Q(:,j);
    end
    R(i,i) = norm(X(:,i) - q);
    Q(:,i) = (X(:,i) - q) / R(i,i);
end