close all;
clc;
for i=1:6530  %ǰ�����õ���Ƶ֡��
    path='D:\ZhangYuGe\LUNKUO\'; %֡ͼ·��
     disp(i); 
     path=strcat(path,num2str(i));
    p=strcat(path,'.jpg');
    f=imread(p);
    %��ת��Ϊ�Ҷ�ͼ����ڱ�Ե���
    f=rgb2gray(f);
   roberts=edge(f,'roberts');   %roberts����  ����ֵ roberts1��Ӧ�Ҷ�ͼ���еı�Ե
   [m,n]=find(roberts==1);
    mh=scatter(n,-m,'.'); %  2     ȷ�����  ����ָ����ͼ��
    axis([0 1920 -1080 0]);   %�����ݴ��ڴ�С���е�������ϵ
    lujing=strcat('D:\ZhangYuGe\TEST\',num2str(i)); %  3    ������·��
    lujing=strcat(lujing,'.jpg'); %  4     �����ʽΪipg
    saveas(gcf,lujing); %  5     ����
    close all 
end
