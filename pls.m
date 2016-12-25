function SCOEFF=pls(h,p,W,P,R)
%PLS 求偏最小二乘法回归方程系数
%h 用于建模的主成分个数
%p 自变量个数
%W 模型效应权重矩阵
%P 模型效应载荷量矩阵
%R 因变量载荷量矩阵
%SCOEFF 偏最小二乘法回归方程的系数矩阵
for i=1:h
    if i==1
        WX(:,i)=W(:,i);
        SCOEFF=WX(:,i)*R(:,i)';
    else
        I=eye(p);
        ww=eye(p);
        for j=1:i-1
            ww=ww*(1-W(:,j)*p(:,j)');
        end
        WX(:,i)=ww*W(:,i);
    end
    SCOEFF=WX(:,i)*R(:,i)';
end