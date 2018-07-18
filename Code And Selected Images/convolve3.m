%   expecting I1 and J1 index and MATRIXB and neighbourhood size (NHOOD) AcceptedDifference
NHOOD = uint16(NHOOD);
MF=-0.1;
I2 = 0;
J2 = 0;

I1 = uint16(I1);
I2 = uint16(I2);

S = NHOOD - uint16(NHOOD/2);



I2 = (I1) - S;
J2 = J1 - S;

I2 = uint16(I2);
J2 = uint16(J2);



%M1 = 0;
%M1 = double(M1);
M1 = MATRIXB(I2:(I2+(NHOOD-1)), J2:(J2 + (NHOOD-1)));
M2 = 0;
[M1Sizex M1Sizey] = size(M1);



ThresM1 = uint8(mean(double(M1(:))) + MF*(sqrt(var(double(M1(:))))));



if MATRIXB(I1,J1) >= ThresM1
	MATRIXC(I1,J1) = 255;
else
	MATRIXC(I1,J1) = 0;
	
end
