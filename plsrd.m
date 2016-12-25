function[Rdx,RdX,RdXt,Rdy,RdY,RdYt]=plsrd(E0,F0,T,h)
%E0 标准化之后的自变量数据
%F0 标准化之后的因变量数据
%T 自变量系统主成分得分矩阵
%h 用于建模的主成分个数
%Rdx 各主成分对某自变量的解释能力
%RdX 各个主成分对自变量组的解释能力
%RdXt 全部主成分对自变量组的累积解释能力
%Rdy 各个主成分对某因变量的解释能力
%RdY 各个主成分对因变量组的解释能力
%RdYt 全部主成分对因变量组的累积解释能力
% 成分对自变量解释能力分析
[nr,nx]=size(E0);
[nr,ny]=size(F0);
Rdx=zeros(nx,h);
t1=zeros(nr,1);
x1=zeros(nr,1);
for xj=1:nx
    for ti=1:h
        t1=T(:,ti);
        x1=E0(:,xj);
        cc=(corrcoef(t1,x1).^2);
        Rdx(xj,ti)=cc(1,2);
    end
end
RdX=sum(Rdx)./nx;
RdXt=sum(RdX);
%----------成分对因变量解释能力的分析------
Rdy=zeros(ny,h);
y1=zeros(nr,1);
for yi=1:ny
    for ti=1:h
        t1=T(:,ti);
        y1=F0(:,yi);
        rr=(corrcoef(t1,y1)).^2;
        Rdy(yi,ti)=rr(1,2);
    end
end
RdY=sum(Rdy)./ny;
RdYt=sum(RdY);

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        