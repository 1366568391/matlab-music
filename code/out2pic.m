clear;
clc;
se = strel('line',11,90);
%��Ƶ���·��
path='D:\jiji\Download\ZhangYuGe.mp4';  
obj=VideoReader(path);
%NumberOfFramesΪobj�����ԣ�����֡��
num=obj.NumberOfFrames;
%6530Ϊ��ƵZHANGYUGE����֡��
for i=1:6530  
    frame=read(obj,i);
    %֡ͼ���·��
    lujing=strcat('D:\ZhangYuGe\LUNKUO\',num2str(i));  
    %���ͼƬ��ʽ
    lujing=strcat(lujing,'.jpg');
    imwrite(frame,lujing)
end 
