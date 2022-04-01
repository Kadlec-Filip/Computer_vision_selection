function res = gauss(sigma1, sigma2, m, n, theta)
% m- cols; n- rows;
[X, Y] = meshgrid(-(m-1)/2:(m-1)/2,-(n-1)/2:(n-1)/2);
A = 1/(sigma1*sigma2*2*pi);

a = ((cosd(theta)^2) / (2*sigma1^2)) + ((sind(theta)^2) / (2*sigma2^2));
b = -((sind(2*theta)) / (4*sigma1^2)) + ((sind(2*theta)) / (4*sigma2^2));
c = ((sind(theta)^2) / (2*sigma1^2)) + ((cosd(theta)^2) / (2*sigma2^2));

res = A*exp(-(a*(X).^2 + 2*b*(X).*(Y) + c*(Y).^2));
end
