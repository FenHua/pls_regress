function RA=plsra(T,R,F0,rankE0)
%�ú���������ɷֵ��ۻ��ⶨϵ��
%T �Ա���ϵͳ���ɷֵ÷־���
%R ������غ�������
%F0 �������׼������������
%rankE0 ��ȡ�����ɷֵĸ���
RAAA=[];
for i=1:rankE0
    RABYK=sum(norm(T(:,i)).^2*norm(R(:,i)).^2)./(norm(F0))^2;
    RAAA=[RAAA,RABYK];
end
RA=cumsum(RAAA);