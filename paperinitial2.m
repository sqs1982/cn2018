function [B]=paperinitial2(N)%,k1)%N:节点数量,1表示为易感节点；2表示为传播A信息节点；3表示为传播B信息节点;4表示为知道A信息但不传播节点；5为知道B信息但不传播节点
C=ones(1,N);%产生N列为全为1的矩阵，即全部为易感节点
randnum=randperm(length(C));
C(randnum(1))=2;  %对选择的矩阵位置的元素赋值
C(randnum(2))=3;  %此处可修改扩散节点初始数量
B=C;
