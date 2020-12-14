train = load("mnist_train.csv");
train_label = train(:,1);
train_data = train(:,2:785);

test = load("mnist_test.csv");
test_label = test(:,1);
test_data = test(:,2:785);

A = train_data.';
B = zeros(10,60000);
for i=1:60000
    if train_label(i) == 0
        B(10,i) = 1;
    else
        B(train_label(i),i) = 1;
    end
end

A_test = test_data.';



save('A.mat','A');
save('B.mat','B');
save('A_test.mat','A_test');
save("test_label.mat",'test_label');
save('train_label.mat','train_label');
