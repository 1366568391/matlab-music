clear;
clc;
WriterObj=VideoWriter('ZhangYuGe_PLUS.mp4', 'MPEG-4'); 
open(WriterObj);
for i=1:6530  %帧图数量
  pic='D:\ZhangYuGe\TEST\';  %前面边缘检测的图片的存储路径
  pic=strcat(pic,num2str(i));
  ppic=strcat(pic,'.jpg');
  frame=imread(ppic);  % 读取图像，放在变量frame中
  disp(ppic);
  writeVideo(WriterObj,frame);  % 将frame放到变量WriterObj中
end
close(WriterObj);
