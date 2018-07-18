%Index = 7;
for Index=1:1:10

AcceptedDifference = 10;



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
%-----------------------------------masking

mask = [0,1,0;1,-4,1;0,1,0];
DoubleDerivative=imfilter(Img,mask,'conv');
DoubleDerivative = abs(DoubleDerivative);


%-----------------------------------end
Sum = 0;
Count = 0;

for i=1:1:dx
	for j=1:1:dy
	
		if DoubleDerivative(i,j) > AcceptedDifference
		
		Sum   = double(Sum) + double(Img(i,j));
		Count = double(Count) + 1;
		
		end
	
	end
end

originalImg = Img;

GlobalThreshold = Sum/Count;

%-----------------------------------------Now Threshholding
for i=1:1:dx

	for j=1:1:dy
	
		if Img(i,j) > GlobalThreshold
		Img(i,j) = 255;
		else
		Img(i,j) = 0;
		end
	
	
	end

end

figure(Index),subplot(1,2,1); imshow(originalImg);
figure(Index),subplot(1,2,2); imshow(Img); 
end