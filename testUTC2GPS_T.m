clear;
clc;

%��֤��ַ��http://leapsecond.com/java/gpsclock.htm
utc=[2019,7,4,15,31,07];%utcʱ�� 
GPS_TIME=UTC2GPS_time(utc);
weekNo=GPS_TIME(1);
secondOfWeek=GPS_TIME(2);
fprintf('weekNo��%d,secondOfWeek��%d\n',weekNo,secondOfWeek);
