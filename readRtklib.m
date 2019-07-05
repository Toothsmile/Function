%read rtklib pos File
%input: rtklib pos file
%output: utc_year,month,day,hour,minite,second,lat,lon,alt,fix_type
%author： sjj CQU

function [year,month,day,hour,minite,second,lat,lon,alt,fix_type]= readRtklib(fileName)

fidin=fopen(fileName);                                  % 打开文件             
i=1;                      
while ~feof(fidin)                                      % 判断是否为文件末尾               
    tline=fgetl(fidin);                                 % 从文件读行   
    if tline(1)~='%'       % 判断首字符是否是%
       fprintf('%s\n\n',tline);                  % 如果是数字行，打印
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
       continue                                         % 如果是非数字继续下一次循环 
    end 
end 

end

