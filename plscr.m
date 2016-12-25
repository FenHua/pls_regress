function [W,C,T,U,P,R]=plscr(E0,F0)
%PLS partial least square ƫ��С���˷�
%�ú���������ȡPLS��ģ�����п��ܵĳɷ�
%E0 �Ա�����׼������������
%F0 �������׼������������
%W ģ��ЧӦȨ��
%C �����Ȩ��
%T �Ա���ϵͳ���ɷֵ÷�
%U �����ϵͳ���ɷֵ÷�
%P ģ��ЧӦ�غ���
%R ������غ���
A=rank(E0);
% rank returns the number of singular values of A that are larger than the default tolerance, max(size(A))*eps(norm(A)).
W=[];
C=[];
T=[];
U=[];
P=[];
R=[];
for i=1:A
    %��ȡ���������ɷ�
    E=E0'*F0*F0'*E0;
    F=F0'*E0*E0'*F0;%KL�仯�Ƶ�
    [w,Lambda]=eigs(E,1,'lm');%Largest magnitude (default).
    [c,Lambda]=eigs(F,1,'lm');
    t1=E0*w;
    u1=F0*c;
    W=[W,w];
    C=[C,c];
    T=[T,t1];
    U=[U,u1];
    %����в�
    p1=(E0'*t1)/norm(t1)^2;
    E1=E0-t1*p1';
    E0=E1;
    r1=(F0'*t1)/norm(t1)^2;
    F1=F0-t1*r1';
    F0=F1;
    P=[P,p1];
    R=[R,r1];
end






















