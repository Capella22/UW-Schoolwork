x = 1:0.5:4;
y = 1:0.5:4;
A = zeros(7,7);
for i = 1:7
    for j = 1:i-1
        A(j,i) = cond(randn(fix(10^x(i)),fix(10^x(j))));
        disp("Done")
    end
end
h = heatmap(x,y,A);
h.YDisplayData = flipud(h.YDisplayData);
h.XLabel = 'm = 10^x';
h.YLabel = 'n = 10^y';



x = 1:0.4:3.4;
A = 1:0.4:3.4;

for i = 1:7
    A(i) = cond(randn(fix(10^x(i)),fix(10^x(i))-1));
end
plot(10.^x,A,'b')
xlabel({'m'})
ylabel({'cond(A)'})