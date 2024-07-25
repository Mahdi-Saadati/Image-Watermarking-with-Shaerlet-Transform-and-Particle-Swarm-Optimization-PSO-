function PSNR_value = PSNR(InputImage,WatermarkingImage)

[rows columns ~] = size(InputImage);

% Calculate mean square error of R, G, B.   
mseRImage = (double(InputImage(:,:,1)) - double(WatermarkingImage(:,:,1))) .^ 2;
mseGImage = (double(InputImage(:,:,2)) - double(WatermarkingImage(:,:,2))) .^ 2;
mseBImage = (double(InputImage(:,:,3)) - double(WatermarkingImage(:,:,3))) .^ 2;

mseR = sum(sum(mseRImage)) / (rows * columns);
mseG = sum(sum(mseGImage)) / (rows * columns);
mseB = sum(sum(mseBImage)) / (rows * columns);
mse = (mseR + mseG + mseB)/3;
PSNR_value = 10 * log10( 255^2 / mse);