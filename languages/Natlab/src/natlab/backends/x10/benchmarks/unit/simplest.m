function [x,y] =  simplest(p)
%x=i;
x=3;
p=ones(10);
for i = (1:10)
x=p(:,i);
x=x+3;
end
y=p;
end
