function [p] =  simplest(a)
%x=i;

x=5;
x = horzcat(5,x);
p=ones(10);
y=ones(1,10);
p(2,2:4) = x;
y = p(2,1:10); 

for i = 1:10
	p(1,i) = p(1,i)+1;
end
