function B1 =  simplest(N)
%x=i;

A=zeros(N, N);
for ii=1:N,
    for jj=1:N,
	if ii*jj<N/2,
	   A(N-ii, ii+jj)=1;
	   A(ii, N-ii-jj)=1;
	end;
	if (ii==jj),
	   A(ii, jj)=1;
	end;
    end;
end;

ii = ii>1;

B=A;
zz = ones(4,1);
yy = zz(3);

% Perform actual work.
ii=N/2;
while ii>=1,
      B=B*B;
      ii=ii/2;
end;
% temporarily change B -> B1
B1=B>0;

end
