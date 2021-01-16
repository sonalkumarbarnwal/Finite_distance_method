a = [3 1 2; 2 3 -2 ; 2 1 1];
b = [1; 2; 3;];
x = inv(a)*b;
x1 = a\b;
x2 = mldivide(a,b);
disp(x);
disp(x1);
disp(x2);
disp(inv(a));