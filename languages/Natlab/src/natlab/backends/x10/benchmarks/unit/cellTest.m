function [x] =  cellTest(a)
m = ones(2,3);
n = [4,5];
myCell = {m, n*100};
x = myCell{1,2};
end