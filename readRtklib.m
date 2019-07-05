%read rtklib pos File
%input: rtklib pos file
%output: utc_year,month,day,hour,minite,second,lat,lon,alt,fix_type
%author�� sjj CQU

function [year,month,day,hour,minite,second,lat,lon,alt,fix_type]= readRtklib(fileName)

fidin=fopen(fileName);                                  % ���ļ�             
i=1;                      
while ~feof(fidin)                                      % �ж��Ƿ�Ϊ�ļ�ĩβ               
    tline=fgetl(fidin);                                 % ���ļ�����   
    if tline(1)~='%'       % �ж����ַ��Ƿ���%
       fprintf('%s\n\n',tline);                  % ����������У���ӡ
       year(i)=str2num(tline(1:4));
       month(i)=str2num(tline(6:7));
       day(i)=str2num(tline(9:10));
       hour(i)=str2num(tline(12:13));
       minite(i)=str2num(tline(15:16));
       second(i)=str2num(tline(18:23));
       lat(i)=str2num(tline(26:38));
       lon(i)=str2num(tline(41:54));
       alt(i)=str2num(tline(57:65));
       fix_type(i)=str2num(tline(68));
       i=i+1;
       continue                                         % ����Ƿ����ּ�����һ��ѭ�� 
    end 
end 

end

