function [x,y] =  simplest(a)
%x=i;
x=a;
p=ones(10);
for i = (1:10)
x=p(:,i);
x=x+3;
end
y=p;
end
