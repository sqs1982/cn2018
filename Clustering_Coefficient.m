function  aver_C=Clustering_Coefficient(A)
%% ������ͼ�и��ڵ�ľ���ϵ������������ľ���ϵ��
%% ����㷨�����ÿ���ڵ�ľ���ϵ������ĳ�ڵ�������ھӣ���Щ�ھӽڵ㹹��һ����ͼ
%% ��A�г������ͼ���ڽӾ��󣬼�����ͼ�ı������ٸ��ݾ���ϵ���Ķ��壬��������ýڵ�ľ���ϵ��
%A�D�D�D�D�D�D�D�D����ͼ���ڽӾ���
%C�D�D�D�D�D�D�D�D����ͼ���ڵ�ľ���ϵ��
%aver�D�D�D�D�D�D�D��������ͼ�ľ���ϵ��
N=5000;
K=22;
p=0.7;
Nodes=ws_net(N,K,p);
M=size(Nodes,2);
C=zeros(1,M);
for i=1:M
    aa=find(Nodes(i,:)==1);  %Ѱ����ͼ���ھӽڵ�
    if isempty(aa)
        disp(['�ڵ�',int2str(i),'Ϊ�����ڵ㣬�����ϵ����ֵΪ0']);
        C(i)=0;
    else       
        m=length(aa); 
        if m==1
            disp(['�ڵ�',int2str(i),'ֻ��һ���ھӽڵ㣬�����ϵ����ֵΪ0']);
            C(i)=0;
        else
           B=Nodes(aa,aa);          % ��ȡ��ͼ���ڽӾ���
           C(i)=length(find(B==1))/(m*(m-1));
        end
    end
end
aver_C=mean(C);