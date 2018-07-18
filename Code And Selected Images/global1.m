%Index = 1;

for Index=1:1:10

try

	Img = imread(strcat(int2str(Index),'.JPG'));

catch

	Img = imread(strcat(int2str(Index),'.png'));

end


try

Img = rgb2gray(Img);

catch


end
%imshow(Img);

originalImg=Img;

Sum = 0;
Sum = double(Sum);

[dimx dimy] = size(Img);

TotalPixel = dimx*dimy;

Sum = sum(sum(Img));

Threshold = Sum/TotalPixel;

for i=1:1:dimx

	for j=1:1:dimy
	
		if Img(i,j) > Threshold
		Img(i,j) = 255;
		else
		Img(i,j) = 0;
		end
	
	
	end

end
%}
figure(Index),subplot(1,2,1); imshow(originalImg);
figure(Index),subplot(1,2,2); imshow(Img); 



end