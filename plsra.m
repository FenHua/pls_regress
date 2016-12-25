function RA=plsra(T,R,F0,rankE0)
%该函数求出主成分的累积测定系数
%T 自变量系统主成分得分矩阵
%R 因变量载荷量矩阵
%F0 因变量标准化的样本数据
%rankE0 提取的主成分的个数
RAAA=[];
for i=1:rankE0
    RABYK=sum(norm(T(:,i)).^2*norm(R(:,i)).^2)./(norm(F0))^2;
    RAAA=[RAAA,RABYK];
end
RA=cumsum(RAAA);