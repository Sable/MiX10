function [ x ] = parfor1( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
 i = 0;
d=0; a = ones(1,4);
parfor i = 1:4
   d = i*2;
   a(i) = d;
end

x=d;
disp (a);
disp(i);

end

