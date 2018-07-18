%Index = 6;
for Index=1:1:10

BetweenClassVariance = 0;
maxBetweenClassVariance = 0;
Max = 0;
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

pdf = imhist(Img);

pdf = pdf./sum(pdf);

for Cut=1:1:256


Wk = sum(pdf(1:Cut));

Ut = 0;

Uk = 0;

%------------------------------------Calculating Ut
for i=1:1:256

	Ut = Ut + (pdf(i)*i);

end



%------------------------------------------end


%--------------------------------------Calculating Uk


for i=1:1:Cut

	Uk = Uk + (pdf(i)*i);

end





%----------------------------------------end

%------------------------------------------------Calculating ThreshHold

if Wk < 1

	BetweenClassVariance = (((Ut*Wk) - Uk)^2)/(Wk*(1-Wk));
	if(BetweenClassVariance > maxBetweenClassVariance)
		maxBetweenClassVariance = BetweenClassVariance;
		Max = Cut;
	end


end
maxBetweenClassVariance;

end

%----------------------------------Displaying original img and new
Threshold  = Max;
originalImg = Img;

for i=1:1:dx

	for j=1:1:dy
	
		if Img(i,j) > Threshold
		Img(i,j) = 255;
		else
		Img(i,j) = 0;
		end
	
	
	end

end

figure(Index),subplot(1,2,1); imshow(originalImg);
figure(Index),subplot(1,2,2); imshow(Img); 


end

%-------------------------------------end
