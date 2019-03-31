function [I,SA,SB,RA,RB,RAB]=main(N,p,qa,qb,a,b,pa,pb,ga,gb)
for K=1:50
N=4000;   %input('网络节点个数N:  ');  % 改变节点数量，比较在不同的度情况下，比较不同网络节点数量的扩散情况
%K=6;     %input('输入m:');
p=0.6;
qa=0.2         ;  %input('接收到A的概率，I变为SA:  '); 改变参数 qa,a以及qb,b,比较在不同的度情况下，比较不同参数情况下， 网络节点扩散情况
a=0.2;    %input('输入转发A的概率');
qb=0.3;    %input('接收到B的概率5，I变为SB:  ');
b=0.1;    %input('输入转发B的概率');
pa=0.2;    %input('接收A信息概率，SB传播B信息结束后成为RAB:  ')pa=0.2,ga=0.3/;pa=0.3/ga=0.4/pa=0.4
pb=0.3;    %input('接收B信息概率，SA传播A信息结束后成为RAB:  ');
ga=0.3;     %input('接收到SA信息后，RB成为RAB:  ');
gb=0.1;   %input('接收到SB信息后，RA成为RAB:  ');
% [Nodes]=smallworld1(N,m,p) 
%p=0.5
tt=1000;  %实验重复次数
kk=30;%扩散过程时间
ra=0;
rb=0;
j=0;
I=zeros(tt,kk);   %tt行，kk列的全零矩阵,
SA=zeros(tt,kk);
SB=zeros(tt,kk);
RA=zeros(tt,kk);
RB=zeros(tt,kk);
RAB=zeros(tt,kk);
[Nodes]=ws_net(N,K,p);
for ii=1:tt
 [B]=paperinitial2(N);   
r=0;
s=0;
z=[];  %可能需要修改
v=[];
for i=1:N             
   if  B(1,i)==2  %找出初始的节点中为扩散A信息的节点
       r=r+1;
       z(r)=i;    %将节点位置赋值
   end
end
for i=1:N
    if B(1,i)==3
        s=s+1;
        v(s)=i;
    end
end
arraya=[];
arrayb=[];%定义空数组存放节点B的位置，此B节点收到SA扩散的信息；
xha=0;   %矩阵arraya的序号 
xhb=0;
q=0;t=0;

for j=1:kk  
    p=q+1;   %这两行语句是为了控制每次循环判断时已经扩散过的节点不再扩散，67行
    q=r;     % 即某一节点已经扩散过，下一循环只判断其影响过并成为扩算节点的新点


for xa=p:q
        n=z(xa);
        XLAWZ=find(Nodes(n,:)==1); %与节点n相连的所有节点的位置               
        XLA=length(XLAWZ)-1;   %与节点n相连的节点数量
        for   k=1:XLA
              switch B(1,XLAWZ(k))
                     case  B(1,XLAWZ(k))==1   %与转发A节点相连的节点状态为1，Unknown
                            e1=rand(1);
                             if  e1<a*qa
                                 B(1,XLAWZ(k))=2;  %随机数小于设定概率，与扩散节点连接的节点状态为2
                                 r=r+1;
                                 z(r)= XLAWZ(k);
                             elseif e1<qa 
                                    B(1,XLAWZ(k))=4;  %否则状态变为RA,4
                             end 
                      case  B(1,XLAWZ(k))==3   %与转发A节点相连的节点状态为3，SB,该连接节点扩散结束后成为RAB
                                e2=rand(1);   
                                if e2<pa          
                                          xha=xha+1;
                                          arraya(xha)=XLAWZ(k);
                                end
                       case  B(1,XLAWZ(k))==5  %SA信息转发到RB，RB同时也知道了A，RB成为RAB节点
                             e3=rand(1);
                                 if e3<ga
                                     B(1,XLAWZ(k))=6; 
                                 end    
              end 
        end 
        if  ismember(n,arrayb)==1;   
                 B(1,n)=6;
        else
                 B(1,n)=4;
        end 
end 
if j>=2
    u=t+1;   %此两行语句同上
    t=s;
for  xb=u:t
        m=v(xb);    
        XLBWZ=find(Nodes(m,:)==1); %与节点n相连的所有节点的位置               
        XLB=length(XLBWZ)-1;   %与节点n相连的节点数量 
        for  k=1:XLB
             switch B(1,XLBWZ(k))
                    case  B(1,XLBWZ(k))==1   %与转发B节点相连的节点状态为1
                          f1=rand(1);
                          if  f1<b*qb
                              B(1,XLBWZ(k))=3;  %随机数小于设定概率，与扩散节点连接的节点状态为3
                              s=s+1;
                              v(s)= XLBWZ(k);
                          elseif f1<qb
                              B(1,XLBWZ(k))=5;  %否则状态变为RB,5
                          end 
                    case  B(1,XLBWZ(k))==2
                                       f2=rand(1);
                                       if f2<pb
                                           xhb=xhb+1;
                                           arrayb(xhb)=XLBWZ(k);
                                       end
                    case  B(1,XLBWZ(k))==4  %SB信息转发到RA，RA同时也知道了B，所以RAB数量加1
                                        f3=rand(1);
                                        if f3<gb
                                           B(1,XLBWZ(k))=6; 
                                        end
                   
             end    
        end
        if  ismember(m,arraya)==1;   
             B(1,m)=6;
        else
             B(1,m)=5;
        end  
end 
end
end
I(ii,j)=length(find(B(1,:)==1))/N;  % 节点密度
SA(ii,j)=length(find(B(1,:)==2))/N;
SB(ii,j)=length(find(B(1,:)==3))/N;
RA(ii,j)=(length(find(B(1,:)==4)))/N;
RB(ii,j)=(length(find(B(1,:)==5)))/N;  
RAB(ii,j)=(length(find(B(1,:)==6)))/N; 
end
xxxxx(K)=mean(RA(:,j))+mean(RAB(:,j));
yyyyy(K)=mean(RB(:,j))+mean(RAB(:,j));
end
K=1:50;
plot(K,xxxxx(K),'-rd');%  扩散结束时A状态的平均密度
hold on
plot(K,yyyyy(K),'-bd');%  扩散结束时B状态的平均密度
hold on
%hold on
%plot(K,mean(SA),'yd-');
%hold on
%plot(K,mean(SB),'gh-');
%hold on
%plot(K,mean(RA),'m--');
%hold on
%plot(K,mean(RB),'b--');
%hold on
%plot(K,mean(RAB),'c--');
%hold on
xlabel('K')
ylabel('RB')
axis([1 50 0 1])
%legend('I');
end
