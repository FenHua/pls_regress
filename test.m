% 演示基于偏最小二乘法的回归算法
% 数据的拟合
clear all;
close all;
clc;
load('data.mat');
cr=corrcoef(data);%计算变量之间的相关系数
%建立偏最小二乘回归模型
X=data(:,1:3);
Y=data(:,3:6);
E0=stand(X);
F0=stand(Y);%标准化
A=rank(E0);%求矩阵的秩
% eps 表示精度
[W,C,T,U,P,R]=plscr(E0,F0);%主成分解释能力分析
RA=plsra(T,R,F0,A);%计算主成分累计测定系数
[Rdx,RdX,RdXt,Rdy,RdY,RdYt]=plsrd(E0,F0,T,A);%计算主成分的信息解释能力
cr=plsutcor(U,T);%计算第一主成分间的相关性，通过t1/u1图像直观的考查第一主成分间的相关性
TCOEFF=R(:,1) %标准化因变量关于主成分t1的经验回归系数
SCOEFF=pls(1,5,W,P,R);%1为建模的主成分个数，5为自变量个数，计算回归系数
[COEFF,INTERCEP]=plsiscoeff(X,Y,SCOEFF);%对标准化的回归系数进行逆标准化处理，输出原始自变量对因变量的回归系数及常数项
result=plsresult(W,RdY,RdYt,1) %result 表示第j个自变量对因变量的解释能力




















