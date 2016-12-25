function stand_data=stand(data)
%将数据进行标准化处理，输出标准化数据
zeros(size(data));
[nr,nc]=size(data);
for i=1:nr
    stand_data(i,:)=((data(i,:)-mean(data))./std(data));
end