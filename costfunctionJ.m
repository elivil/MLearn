function J = costfunctionJ(X,y,theta)

m=size(X,1);
pred=X*theta;
sqrerr=(pred-y).^2;

J = 1/(2*m) * sum(sqrerr);