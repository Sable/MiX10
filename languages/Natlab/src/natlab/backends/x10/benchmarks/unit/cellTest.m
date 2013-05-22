function [x] =  cellTest(a)
myNum = [1, 2, 3];
num1 = [4,5];
myCell = {'unun', myNum*100,num1, 'dos', 100};
C = {myNum, 100*myNum};
%     myCell, a};
x = C{1,1}
%x = y(1,2);
z=0;
parfor i = 1:10
	z=z+1;
end
end