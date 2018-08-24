function [B]=paperinitial2(N)%,k1)%N:节点数量,1表示为易感节点；2表示为传播A信息节点；3表示为传播B信息节点;4表示为知道A信息但不传播节点；5为知道B信息但不传播节点
C=ones(1,N);%产生N列为全为1的矩阵，即全部为易感节点
randnum=randperm(length(C));
C(randnum(1))=2;  %对选择的矩阵位置的元素赋值
C(randnum(2))=3;  %此处可修改扩散节点初始数量
B=C;










%data=randn(1000,1);  %需要随机提取数据的矩阵
%randnum=randperm(length(data)); %随机产生矩阵位置
%outdata=data(randnum(1:100));  %可随机从data中提取100个数据

%使用randperm函数,随机选取20到100中的5个随机数
%a=20:100;
%K=randperm(length(a));
%N=5;
%b=a(K(1:N))


%随机选取矩阵元素并确定位置
%A=ones(1,N)
%randnum=randperm(length(A))
% A(randnum(1:5))=2=2，对选择的矩阵位置的元素赋值