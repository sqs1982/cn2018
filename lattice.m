function lattice=gzwl(N,K)
N=input('输入节点总数N：');
K=input('输入每个节点邻居数K：');
angle=0:2*pi/N:2*pi-2*pi/N;
x=100*sin(angle);
y=100*cos(angle);
plot(x,y,'ro','MarkerEdgeColor','g','MarkerFaceColor','r','markersize',8);
hold on;
A=zeros(N);
for i=1:N
    for j=i+1:i+K/2
        jj=j;
        if j>N
            jj=mod(j,N);
        end
        A(i,jj)=1;
        A(jj,i)=1;
    end
end
for i=1:N
    for j=i+1:N
        if A(i,j)~=0;
            plot([x(i),x(j)],[y(i),y(j)],'linewidth',1.2);
            hold on;
        end
    end
end
axis equal;
hold off;
end