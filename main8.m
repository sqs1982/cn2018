function [I,SA,SB,RA,RB,RAB]=main(N,p,qa,qb,a,b,pa,pb,ga,gb)
for K=1:50
N=4000;   %input('����ڵ����N:  ');  % �ı�ڵ��������Ƚ��ڲ�ͬ�Ķ�����£��Ƚϲ�ͬ����ڵ���������ɢ���
%K=6;     %input('����m:');
p=0.6;
qa=0.2         ;  %input('���յ�A�ĸ��ʣ�I��ΪSA:  '); �ı���� qa,a�Լ�qb,b,�Ƚ��ڲ�ͬ�Ķ�����£��Ƚϲ�ͬ��������£� ����ڵ���ɢ���
a=0.2;    %input('����ת��A�ĸ���');
qb=0.3;    %input('���յ�B�ĸ���5��I��ΪSB:  ');
b=0.1;    %input('����ת��B�ĸ���');
pa=0.2;    %input('����A��Ϣ���ʣ�SB����B��Ϣ�������ΪRAB:  ')pa=0.2,ga=0.3/;pa=0.3/ga=0.4/pa=0.4
pb=0.3;    %input('����B��Ϣ���ʣ�SA����A��Ϣ�������ΪRAB:  ');
ga=0.3;     %input('���յ�SA��Ϣ��RB��ΪRAB:  ');
gb=0.1;   %input('���յ�SB��Ϣ��RA��ΪRAB:  ');
% [Nodes]=smallworld1(N,m,p) 
%p=0.5
tt=1000;  %ʵ���ظ�����
kk=30;%��ɢ����ʱ��
ra=0;
rb=0;
j=0;
I=zeros(tt,kk);   %tt�У�kk�е�ȫ�����,
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
z=[];  %������Ҫ�޸�
v=[];
for i=1:N             
   if  B(1,i)==2  %�ҳ���ʼ�Ľڵ���Ϊ��ɢA��Ϣ�Ľڵ�
       r=r+1;
       z(r)=i;    %���ڵ�λ�ø�ֵ
   end
end
for i=1:N
    if B(1,i)==3
        s=s+1;
        v(s)=i;
    end
end
arraya=[];
arrayb=[];%����������Žڵ�B��λ�ã���B�ڵ��յ�SA��ɢ����Ϣ��
xha=0;   %����arraya����� 
xhb=0;
q=0;t=0;

for j=1:kk  
    p=q+1;   %�����������Ϊ�˿���ÿ��ѭ���ж�ʱ�Ѿ���ɢ���Ľڵ㲻����ɢ��67��
    q=r;     % ��ĳһ�ڵ��Ѿ���ɢ������һѭ��ֻ�ж���Ӱ�������Ϊ����ڵ���µ�


for xa=p:q
        n=z(xa);
        XLAWZ=find(Nodes(n,:)==1); %��ڵ�n���������нڵ��λ��               
        XLA=length(XLAWZ)-1;   %��ڵ�n�����Ľڵ�����
        for   k=1:XLA
              switch B(1,XLAWZ(k))
                     case  B(1,XLAWZ(k))==1   %��ת��A�ڵ������Ľڵ�״̬Ϊ1��Unknown
                            e1=rand(1);
                             if  e1<a*qa
                                 B(1,XLAWZ(k))=2;  %�����С���趨���ʣ�����ɢ�ڵ����ӵĽڵ�״̬Ϊ2
                                 r=r+1;
                                 z(r)= XLAWZ(k);
                             elseif e1<qa 
                                    B(1,XLAWZ(k))=4;  %����״̬��ΪRA,4
                             end 
                      case  B(1,XLAWZ(k))==3   %��ת��A�ڵ������Ľڵ�״̬Ϊ3��SB,�����ӽڵ���ɢ�������ΪRAB
                                e2=rand(1);   
                                if e2<pa          
                                          xha=xha+1;
                                          arraya(xha)=XLAWZ(k);
                                end
                       case  B(1,XLAWZ(k))==5  %SA��Ϣת����RB��RBͬʱҲ֪����A��RB��ΪRAB�ڵ�
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
    u=t+1;   %���������ͬ��
    t=s;
for  xb=u:t
        m=v(xb);    
        XLBWZ=find(Nodes(m,:)==1); %��ڵ�n���������нڵ��λ��               
        XLB=length(XLBWZ)-1;   %��ڵ�n�����Ľڵ����� 
        for  k=1:XLB
             switch B(1,XLBWZ(k))
                    case  B(1,XLBWZ(k))==1   %��ת��B�ڵ������Ľڵ�״̬Ϊ1
                          f1=rand(1);
                          if  f1<b*qb
                              B(1,XLBWZ(k))=3;  %�����С���趨���ʣ�����ɢ�ڵ����ӵĽڵ�״̬Ϊ3
                              s=s+1;
                              v(s)= XLBWZ(k);
                          elseif f1<qb
                              B(1,XLBWZ(k))=5;  %����״̬��ΪRB,5
                          end 
                    case  B(1,XLBWZ(k))==2
                                       f2=rand(1);
                                       if f2<pb
                                           xhb=xhb+1;
                                           arrayb(xhb)=XLBWZ(k);
                                       end
                    case  B(1,XLBWZ(k))==4  %SB��Ϣת����RA��RAͬʱҲ֪����B������RAB������1
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
I(ii,j)=length(find(B(1,:)==1))/N;  % �ڵ��ܶ�
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
plot(K,xxxxx(K),'-rd');%  ��ɢ����ʱA״̬��ƽ���ܶ�
hold on
plot(K,yyyyy(K),'-bd');%  ��ɢ����ʱB״̬��ƽ���ܶ�
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
