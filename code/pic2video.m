clear;
clc;
WriterObj=VideoWriter('ZhangYuGe_PLUS.mp4', 'MPEG-4'); 
open(WriterObj);
for i=1:6530  %֡ͼ����
  pic='D:\ZhangYuGe\TEST\';  %ǰ���Ե����ͼƬ�Ĵ洢·��
  pic=strcat(pic,num2str(i));
  ppic=strcat(pic,'.jpg');
  frame=imread(ppic);  % ��ȡͼ�񣬷��ڱ���frame��
  disp(ppic);
  writeVideo(WriterObj,frame);  % ��frame�ŵ�����WriterObj��
end
close(WriterObj);
