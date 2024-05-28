close all;
clc;
for i=1:6530  %前面所得的视频帧数
    path='D:\ZhangYuGe\LUNKUO\'; %帧图路径
     disp(i); 
     path=strcat(path,num2str(i));
    p=strcat(path,'.jpg');
    f=imread(p);
    %先转换为灰度图像便于边缘检测
    f=rgb2gray(f);
   roberts=edge(f,'roberts');   %roberts算子  返回值 roberts1对应灰度图像中的边缘
   [m,n]=find(roberts==1);
    mh=scatter(n,-m,'.'); %  2     确定输出  绘制指定的图像
    axis([0 1920 -1080 0]);   %可依据窗口大小自行调整坐标系
    lujing=strcat('D:\ZhangYuGe\TEST\',num2str(i)); %  3    输出存放路径
    lujing=strcat(lujing,'.jpg'); %  4     输出格式为ipg
    saveas(gcf,lujing); %  5     保存
    close all 
end
