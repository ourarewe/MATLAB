x = double(reshape(train_x',28,28,60000))/255;
x = x(:,:,1);
I=imshow(x);
y = double(train_y');
y = y(:,1);
