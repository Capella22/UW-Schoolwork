%A = randi(200,[5,5]);

%A = randi(1000,[6,4]);
%A = [A, A(:,1), A(:,2)];

%A = randi(200,[7,5]);

%A = randi(200,[5,7]);

A = randi(1000,[10,6]);
A = [A, A(:,1), A(:,2)];

disp(A)
disp(cond(A))

[Q,R]=qr(A);
disp(Q)
disp(R)
disp(Q*R)

[Q,R]=m_Gram_Schmidt(A);
disp(Q)
disp(R)
disp(Q*R)

[Q,R]=qrfactor(A);
disp(Q)
disp(R)
disp(Q*R)