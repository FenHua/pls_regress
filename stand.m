function stand_data=stand(data)
%�����ݽ��б�׼�����������׼������
zeros(size(data));
[nr,nc]=size(data);
for i=1:nr
    stand_data(i,:)=((data(i,:)-mean(data))./std(data));
end