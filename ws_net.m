function [Nodes]=ws_net(N,K,p)
%%% ����N���ڵ㣬ÿ���ڵ���2K���ھӽڵ��������������ͼͨ���������������WSС������·
%% A �D�D�D�D�D�D��������������ڽӾ���
%disp('�ó�������WSС������·��');%
%N=input('�������������������нڵ������N��');
%K=input('��������������������ÿ���ڵ���ھӽڵ�ĸ�����һ��K��');
%p=input('����������������ĸ���p:');
if K>floor(N/2)
    disp('�����Kֵ���Ϸ�')
    return;
end
%angle=0:2*pi/N:2*pi-2*pi/N;  %%����������������ĸ��ڵ�����,ȷ��ÿ����ĽǶ�
%x=100*sin(angle);
%y=100*cos(angle);
%plot(x,y,'ro','MarkerEdgeColor','g','MarkerFaceColor','r','markersize',8);
%hold on; 
 
Nodes=zeros(N);
for i=1:N
    for j=i+1:i+K
        jj=j;
        if j>N
            jj=mod(j,N);%N�Ƚϴ�
        end
      Nodes(i,jj)=1; Nodes(jj,i)=1;     %%������������������ڽӾ���
    end
end
 
for i=1:N
    for j=i+1:i+K
        jj=j;
        if j>N
            jj=mod(j,N);
        end
        p1=rand(1,1);
        if p1<p              %% ���ɵ������С��p����߽������������,���򣬱߲���������
            Nodes(i,jj)=0;Nodes(jj,i)=0;  %�������ԣ��ȶϿ�ԭ���ıߣ�����δ���ı������ѡ����һ���ڵ㣬��ԭ�ڵ����ӡ�
            Nodes(i,i)=inf; a=find(Nodes(i,:)==0);%����֮�䲻ͨʱ,��inf��ʾ(MATLAB��,inf ��ʾ����);find(A(i,:)==0)��ʾѰ�Ҿ���A�е�i��0Ԫ�ص�λ��
            rand_data=randint(1,1,[1,length(a)]);%����һ��һ�д���1��length(a)֮����������
            jjj=a(rand_data);%ȷ��0Ԫ�ص�λ��
            Nodes(i,jjj)=1;Nodes(jjj,i)=1;%ʵ������
            Nodes(i,i)=0;
        end
    end
end
 %��������Ϊ��ͼ
%for i=1:N 
%    for j=i+1:N
%        if A(i,j)~=0
%            plot([x(i),x(j)],[y(i),y(j)],'linewidth',1.2); 
 %           hold on;          %% ����WSС��������ͼ
%        end
%    end
%end
%axis equal;%������ĳ��ȵ�λ������
%hold on    %hold off
%��������Ϊ��ͼ 
%[C,aver_C]=Clustering_Coefficient(A);
%[DeD,aver_DeD]=Degree_Distribution(A);
%[D,aver_D]=Aver_Path_Length(A);   
 %disp(['�����ͼ��ƽ��·������Ϊ��',num2str(aver_D)]);  %%������������������
 %disp(['�����ͼ�ľ���ϵ��Ϊ��',num2str(aver_C)]);
 %disp(['�����ͼ��ƽ����Ϊ��',num2str(aver_DeD)]); 

