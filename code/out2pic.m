clear;
clc;
se = strel('line',11,90);
%视频存放路径
path='D:\jiji\Download\ZhangYuGe.mp4';  
obj=VideoReader(path);
%NumberOfFrames为obj的属性，代表帧数
num=obj.NumberOfFrames;
%6530为视频ZHANGYUGE的总帧数
for i=1:6530  
    frame=read(obj,i);
    %帧图输出路径
    lujing=strcat('D:\ZhangYuGe\LUNKUO\',num2str(i));  
    %输出图片格式
    lujing=strcat(lujing,'.jpg');
    imwrite(frame,lujing)
end 
