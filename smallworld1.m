function [Nodes]=smallworld1(N,m,p) %N：网络节点数 m：点的边数/2  p:断键重连率,%原始函数[Nodes,Cii]=smallworld1(N,m,p)
N=100;m=6;p=0.4;
Nodes=sparse([]);   %全部为0

for i=1:N      
        k1=[i:i+m,i-m:i-1];%节点i左右相邻的m个节点，
        kk=mod1(k1,N);%取余
        Nodes(i,kk)=1;   %对相邻2m个节点和节点i之间的连接赋值，如果不和自己联系，k1=[i+1:i+m,i-m:i-1];
end

for i=1:N
    k=i+1:i+m;
    j1=mod1(k,N);
    for j=j1
        r=rand(1);
        if r<=p
             unconnect=find(Nodes(i,:)==0);%找到没有和节点i连接的节点位置，矩阵nodes第i行的值与0比较，如果为0 ，find返回0的位置
            r1=ceil((length(unconnect))*rand(1));
            Nodes(i,unconnect(r1))=1;
            Nodes(unconnect(r1),i)=1;
            Nodes(i,j)=0;Nodes(j,i)=0;
        end 
    end
end
for m1=1:N
    Nodes(m1,m1)=0;
end
   
for j=1:N
    Cii(j)=length(find(Nodes(j,:)==1));
end

for i=1:N 
   for j=i+1:N
       if Nodes(i,j)~=0
           plot([x(i),x(j)],[y(i),y(j)],'linewidth',1.2); 
            hold on;      
        end
    end
end
