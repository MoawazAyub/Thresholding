% main code depends on padding.m and convolve.m

for Index=1:1:10
%Index = 7;

NHOOD = 3;


AcceptedDifference = 8;





try

	Img = imread(strcat(int2str(Index),'.JPG'));

catch

	Img = imread(strcat(int2str(Index),'.png'));

end


try

Img = rgb2gray(Img);

catch


end




[dx dy] = size(Img);

%figure,imshow(Img);




%--------------------------- this is man 

padFactor = floor(NHOOD/2);

MATRIXB = Img;
MATRIXC = MATRIXB;
for I1 = 1+padFactor : 1 : (dx-padFactor)

	for J1 =1+padFactor : 1 : (dy-padFactor)
	
	convolve2;
	
	
	end

end

MATRIXC = MATRIXC(1+padFactor:end-padFactor,1+padFactor:end-padFactor);
%figure,imshow(MATRIXB);
figure(Index),subplot(1,2,1); imshow(Img);
figure(Index),subplot(1,2,2); imshow(MATRIXC); 

end