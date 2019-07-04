%%
%
%function GPS_time=UTC2GPS_time(UTC)
% input:UTC=[utc_year,utc_mon,utc_day,utc_hou,utc_min,utc_second] 年月日时分秒
% output: GPS_time=[weekNo,secondOfWeek] 周数，周内秒
% author: sjj,CQU
%%
function GPS_time=UTC2GPS_time(UTC)
utc_year=UTC(1);%UTC year
utc_mon=UTC(2);%UTC Month
utc_day=UTC(3);%UTC Day
utc_hour=UTC(4);%UTC Hour
utc_min=UTC(5);%UTC minute
utc_sec=UTC(6);%UTC second

dayOfYear=0;
dayOfMonth=0;
for i=1980:utc_year-1
    if ((mod(i,4)==0)&&(mod(i,100)~=0)||mod(i,400)==0)
       dayOfYear=dayOfYear+366; 
    else
        dayOfYear=dayOfYear+365;
    end
end
for i=1:utc_mon-1
    if (i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i ==12)
        dayOfMonth=dayOfMonth+31;
    else if (i == 4 || i == 6 || i == 9 || i == 11)
        dayOfMonth=dayOfMonth+30;
        else
            if ((mod(utc_year,4)==0)&&(mod(utc_year,100)~=0)||mod(utc_year,400)==0)
               dayOfMonth=dayOfMonth+29;
            else
               dayOfMonth=dayOfMonth+28;
            end
        end
    end
end
Day=dayOfMonth+utc_day+dayOfYear-6;%because 1980.1.6 is sunday
weekNo=floor(Day/7);
mod(Day,7);
secondOfWeek=mod(Day,7) * 86400 + utc_hour * 3600 + utc_min * 60 + utc_sec+18;%2017之后+18秒  该方法只能计算2017润秒之后
GPS_time=[weekNo,secondOfWeek];
end