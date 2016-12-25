function [COEFF,INTERCEP]=plsiscoeff(X,Y,B)
% �ú�����׼���ع�ϵ�����׼���������ԭʼ�Ա�����������Ļع�ϵ����������
%X ԭʼ�Ա�������
%Y ԭʼ���������
%B ��׼�������ع鷽�̵�ϵ��
%COEFF ԭʼ�����ع鷽�̵�ϵ��
%INTERCEP ԭʼ�����ع鷽�̵ĳ�����
[xrow,xcol]=size(X);
[yrow,ycol]=size(Y);
for i=1:ycol
    bykCOEFF(:,i)=B(:,i).*std(Y(:,i));
end
for j=1:ycol
    for i=1:xcol
        COEFF(i,j)=bykCOEFF(i,j)/std(X(:,i));
    end
end
INTERCEP=mean(Y)-(mean(X)*COEFF);