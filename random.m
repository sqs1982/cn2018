function [Nodes]=random(N)
N=10;
Nodes=zeros(N);
    for i=1:N
       for j=i+1:N
           p1=rand(1,1);
           if p1>0.8
             Nodes(i,j)=1;
             Nodes(j,i)=1;
           end
       end
    end
  