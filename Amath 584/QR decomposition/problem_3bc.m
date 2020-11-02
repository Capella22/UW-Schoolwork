%A=randn(12, 11);
%A = [A, A(:,1)];
%disp(det(A))
%disp(cond(A))

A=randn(12, 11);
x = -6:0.5:6;
y = -6:0.5:6;
for i = 1:25
    eps = 10.^(x(i));
    y(i) = 0;
    for j = 1:10000
        temp = [A, eps.*rand(12,1)+A(:,1)];
        y(i) = y(i) + cond(temp);
    end
    y(i) = y(i)/10000;
end
plot(x,y,'b')
xlabel({'eps = 10^x'})
ylabel({'cond(A)'})