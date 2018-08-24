function k=mod1(x,y)
k1=mod(x,y);%ว๓ำเสý
b=find(k1==0);
if ~isempty(b)
k=k1;
k(b)=y;
else
    k=k1;
end
