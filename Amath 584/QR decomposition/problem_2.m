y0 = @(x) x.^9-18*x.^8+144*x.^7-672*x.^6+2016*x.^5-4032*x.^4+5376*x.^3-4608*x.^2+2304*x-512;
x0 = 1.920:0.001:2.080;
plot(x0,y0(x0),'b')
hold on;
y1 = @(x) (x-2).^9;
plot(x1,y1(x1),'r')

%y2 = @(x) abs(9*x./(x-2));
%plot(x1,y2(x1),'g')