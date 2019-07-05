clear;
clc;
filename='1005905105I2_SF_G.pos';
[year,month,day,hour,minite,second,lat,lon,alt,fix_type]=readRtklib(filename);
utc=[year;month;day;hour;minite;second];
gps_time=[];
for i=1:length(utc)
    gps_time(:,i)=UTC2GPS_time(utc(:,i));
    
end
%UTC2GPS_time();
