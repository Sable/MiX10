function [x,n] = bubble(A)
n=length(A);
% making (n-1) passes
for j=1:1:n-1
    % comparing each number with the next and swapping
    for i=1:1:n-1
    if A(i)>A(i+1);
        % temp is a variable where the numbers are kept
        % temporarily for the switch
        temp=A(i);
        A(i)=A(i+1);
        A(i+1)=temp;
    end
    end
    x=A;
end