function [B]=paperinitial2(N)%,k1)%N:�ڵ�����,1��ʾΪ�׸нڵ㣻2��ʾΪ����A��Ϣ�ڵ㣻3��ʾΪ����B��Ϣ�ڵ�;4��ʾΪ֪��A��Ϣ���������ڵ㣻5Ϊ֪��B��Ϣ���������ڵ�
C=ones(1,N);%����N��ΪȫΪ1�ľ��󣬼�ȫ��Ϊ�׸нڵ�
randnum=randperm(length(C));
C(randnum(1))=2;  %��ѡ��ľ���λ�õ�Ԫ�ظ�ֵ
C(randnum(2))=3;  %�˴����޸���ɢ�ڵ��ʼ����
B=C;










%data=randn(1000,1);  %��Ҫ�����ȡ���ݵľ���
%randnum=randperm(length(data)); %�����������λ��
%outdata=data(randnum(1:100));  %�������data����ȡ100������

%ʹ��randperm����,���ѡȡ20��100�е�5�������
%a=20:100;
%K=randperm(length(a));
%N=5;
%b=a(K(1:N))


%���ѡȡ����Ԫ�ز�ȷ��λ��
%A=ones(1,N)
%randnum=randperm(length(A))
% A(randnum(1:5))=2=2����ѡ��ľ���λ�õ�Ԫ�ظ�ֵ