function cr=plsutcor(U,T)
%plsuscor����t1/u1ͼ�����������ߵ����ϵ��
%U �������ȡ�ĳɷ�
%T �Ա�����ȡ�ĳɷ�
%cr ��������Ա��������ϵ��
u1=U(:,1);
t1=T(:,1);
ut=[u1,t1];
cr=corrcoef(ut);
plot(t1,u1,'o');
lsline;%superimposes a least-squares line on each scatter plot in the current axes.
title('t1/u1ͼ');
xlabel('t1');
ylabel('u1');