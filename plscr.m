function [W,C,T,U,P,R]=plscr(E0,F0)
%PLS partial least square 偏最小二乘法
%该函数用于提取PLS建模中所有可能的成分
%E0 自变量标准化的样本数据
%F0 因变量标准化的样本数据
%W 模拟效应权重
%C 因变量权重
%T 自变量系统主成分得分
%U 因变量系统主成分得分
%P 模型效应载荷量
%R 因变量载荷量
A=rank(E0);
% rank returns the number of singular values of A that are larger than the default tolerance, max(size(A))*eps(norm(A)).
W=[];
C=[];
T=[];
U=[];
P=[];
R=[];
for i=1:A
    %提取主轴与主成分
    E=E0'*F0*F0'*E0;
    F=F0'*E0*E0'*F0;%KL变化推到
    [w,Lambda]=eigs(E,1,'lm');%Largest magnitude (default).
    [c,Lambda]=eigs(F,1,'lm');
    t1=E0*w;
    u1=F0*c;
    W=[W,w];
    C=[C,c];
    T=[T,t1];
    U=[U,u1];
    %计算残差
    p1=(E0'*t1)/norm(t1)^2;
    E1=E0-t1*p1';
    E0=E1;
    r1=(F0'*t1)/norm(t1)^2;
    F1=F0-t1*r1';
    F0=F1;
    P=[P,p1];
    R=[R,r1];
end






















