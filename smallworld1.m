function [Nodes]=smallworld1(N,m,p) %N������ڵ��� m����ı���/2  p:�ϼ�������,%ԭʼ����[Nodes,Cii]=smallworld1(N,m,p)
N=100;m=6;p=0.4;
Nodes=sparse([]);   %ȫ��Ϊ0

for i=1:N      
        k1=[i:i+m,i-m:i-1];%�ڵ�i�������ڵ�m���ڵ㣬
        kk=mod1(k1,N);%ȡ��
        Nodes(i,kk)=1;   %������2m���ڵ�ͽڵ�i֮������Ӹ�ֵ����������Լ���ϵ��k1=[i+1:i+m,i-m:i-1];
end

for i=1:N
    k=i+1:i+m;
    j1=mod1(k,N);
    for j=j1
        r=rand(1);
        if r<=p
             unconnect=find(Nodes(i,:)==0);%�ҵ�û�кͽڵ�i���ӵĽڵ�λ�ã�����nodes��i�е�ֵ��0�Ƚϣ����Ϊ0 ��find����0��λ��
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



 