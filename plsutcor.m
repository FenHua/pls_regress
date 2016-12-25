function cr=plsutcor(U,T)
%plsuscor绘制t1/u1图，并给出二者的相关系数
%U 因变量提取的成分
%T 自变量提取的成分
%cr 因变量与自变量的相关系数
u1=U(:,1);
t1=T(:,1);
ut=[u1,t1];
cr=corrcoef(ut);
plot(t1,u1,'o');
lsline;%superimposes a least-squares line on each scatter plot in the current axes.
title('t1/u1图');
xlabel('t1');
ylabel('u1');