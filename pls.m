function SCOEFF=pls(h,p,W,P,R)
%PLS ��ƫ��С���˷��ع鷽��ϵ��
%h ���ڽ�ģ�����ɷָ���
%p �Ա�������
%W ģ��ЧӦȨ�ؾ���
%P ģ��ЧӦ�غ�������
%R ������غ�������
%SCOEFF ƫ��С���˷��ع鷽�̵�ϵ������
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