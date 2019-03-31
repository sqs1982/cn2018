function [Nodes]=ws_net(N,K,p)
if K>floor(N/2)
    disp('输入的K值不合法')
    return;
end
%angle=0:2*pi/N:2*pi-2*pi/N;  %%生成最近邻耦合网络的各节点坐标,确定每个点的角度
%x=100*sin(angle);
%y=100*cos(angle);
%plot(x,y,'ro','MarkerEdgeColor','g','MarkerFaceColor','r','markersize',8);
%hold on; 
 
Nodes=zeros(N);
for i=1:N
    for j=i+1:i+K
        jj=j;
        if j>N
            jj=mod(j,N);%N比较大
        end
      Nodes(i,jj)=1; Nodes(jj,i)=1;     %%生成最近邻耦合网络的邻接矩阵
    end
end
 
for i=1:N
    for j=i+1:i+K
        jj=j;
        if j>N
            jj=mod(j,N);
        end
        p1=rand(1,1);
        if p1<p              %% 生成的随机数小于p，则边进行随机化重连,否则，边不进行重连
            Nodes(i,jj)=0;Nodes(jj,i)=0;  %重连策略：先断开原来的边，再在未连的边中随机选择另一个节点，与原节点连接。
            Nodes(i,i)=inf; a=find(Nodes(i,:)==0);%顶点之间不通时,用inf表示(MATLAB中,inf 表示无穷);find(A(i,:)==0)表示寻找矩阵A中第i行0元素的位置
            rand_data=randint(1,1,[1,length(a)]);%产生一行一列处于1和length(a)之间的随机整数
            jjj=a(rand_data);%确定0元素的位置
            Nodes(i,jjj)=1;Nodes(jjj,i)=1;%实现重连
            Nodes(i,i)=0;
        end
    end
end
 %以下内容为画图
%for i=1:N 
%    for j=i+1:N
%        if A(i,j)~=0
%            plot([x(i),x(j)],[y(i),y(j)],'linewidth',1.2); 
 %           hold on;          %% 画出WS小世界网络图
%        end
%    end
%end
%axis equal;%坐标轴的长度单位设成相等
%hold on    %hold off
%以上内容为画图 
%[C,aver_C]=Clustering_Coefficient(A);
%[DeD,aver_DeD]=Degree_Distribution(A);
%[D,aver_D]=Aver_Path_Length(A);   
 %disp(['该随机图的平均路径长度为：',num2str(aver_D)]);  %%输出该网络的特征参数
 %disp(['该随机图的聚类系数为：',num2str(aver_C)]);
 %disp(['该随机图的平均度为：',num2str(aver_DeD)]); 

