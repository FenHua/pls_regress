% ��ʾ����ƫ��С���˷��Ļع��㷨
% ���ݵ����
clear all;
close all;
clc;
load('data.mat');
cr=corrcoef(data);%�������֮������ϵ��
%����ƫ��С���˻ع�ģ��
X=data(:,1:3);
Y=data(:,3:6);
E0=stand(X);
F0=stand(Y);%��׼��
A=rank(E0);%��������
% eps ��ʾ����
[W,C,T,U,P,R]=plscr(E0,F0);%���ɷֽ�����������
RA=plsra(T,R,F0,A);%�������ɷ��ۼƲⶨϵ��
[Rdx,RdX,RdXt,Rdy,RdY,RdYt]=plsrd(E0,F0,T,A);%�������ɷֵ���Ϣ��������
cr=plsutcor(U,T);%�����һ���ɷּ������ԣ�ͨ��t1/u1ͼ��ֱ�۵Ŀ����һ���ɷּ�������
TCOEFF=R(:,1) %��׼��������������ɷ�t1�ľ���ع�ϵ��
SCOEFF=pls(1,5,W,P,R);%1Ϊ��ģ�����ɷָ�����5Ϊ�Ա�������������ع�ϵ��
[COEFF,INTERCEP]=plsiscoeff(X,Y,SCOEFF);%�Ա�׼���Ļع�ϵ���������׼���������ԭʼ�Ա�����������Ļع�ϵ����������
result=plsresult(W,RdY,RdYt,1) %result ��ʾ��j���Ա�����������Ľ�������




















