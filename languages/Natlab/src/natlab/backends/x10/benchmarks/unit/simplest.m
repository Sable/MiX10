function [x] =  simplest(a)
%x=i;

x=5;
p=ones(10);


  y=p;

 % p=3:7;
  %!finish
  %!async
  y=p;
 %!end  
 %!end 
 
 %!parfor
 for(i=1:10)
    x=3;
    p(2)= x+3;
    end
 
end
