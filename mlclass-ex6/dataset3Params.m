function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 0.01;
sigma = 0.01;
min_err = 1e10;
count=1;
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

while C<=30
	sigma = 0.01;
	while sigma<=30
		fprintf('C = %f\t sigma = %f\t count = %d\n', C, sigma, count);
		model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
		predictions=svmPredict(model,Xval);
		pred_err = mean(double(predictions ~= yval));
		if pred_err<min_err
			min_err=pred_err;
			optC = C;
			optsigma = sigma;
		end
		count = count+1;
		sigma = sigma*3;
	end
	C = C*3;
end

fprintf('Opt C = %f\t optsigma = %f\n', optC, optsigma);
fprintf('minerror = %f\n', min_err);


C = optC;
sigma = optsigma;


% =========================================================================

end
