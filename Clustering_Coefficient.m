function  aver_C=Clustering_Coefficient(A)
%% 求网络图中各节点的聚类系数及整个网络的聚类系数
%% 求解算法：求解每个节点的聚类系数，找某节点的所有邻居，这些邻居节点构成一个子图
%% 从A中抽出该子图的邻接矩阵，计算子图的边数，再根据聚类系数的定义，即可算出该节点的聚类系数
%A――――――――网络图的邻接矩阵
%C――――――――网络图各节点的聚类系数
%aver―――――――整个网络图的聚类系数
N=5000;
K=22;
p=0.7;
Nodes=ws_net(N,K,p);
M=size(Nodes,2);
C=zeros(1,M);
for i=1:M
    aa=find(Nodes(i,:)==1);  %寻找子图的邻居节点
    if isempty(aa)
        disp(['节点',int2str(i),'为孤立节点，其聚类系数赋值为0']);
        C(i)=0;
    else       
        m=length(aa); 
        if m==1
            disp(['节点',int2str(i),'只有一个邻居节点，其聚类系数赋值为0']);
            C(i)=0;
        else
           B=Nodes(aa,aa);          % 抽取子图的邻接矩阵
           C(i)=length(find(B==1))/(m*(m-1));
        end
    end
end
aver_C=mean(C);