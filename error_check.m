clc
clear all;
close all;
%% 读入数据
file_path = 'D:\rawam\research work\Experiment\Droplet\mine\dodecane (C12H26)\5 atm\matlab\';  % 文件路径
file_name = 'All_data-gw80.xlsx';                                               % 文件名
full_path = fullfile(file_path, file_name);                                % 完整路径
biaohao = '5atm';                                                        % 压力参数
Bouncing_data = xlsread(full_path, biaohao, 'A:B');
Coalescence_data = xlsread(full_path, biaohao, 'G:H');
Reflective_data = xlsread(full_path, biaohao, 'M:N');
Stretching_data = xlsread(full_path, biaohao, 'S:T');
Other_data=cat(1,Coalescence_data,Reflective_data,Stretching_data);
Bouncing_number=length(Bouncing_data);
Other_number=length(Other_data);
All_number=Bouncing_number+Other_number;
plot(Bouncing_data(:,1),Bouncing_data(:,2),'o');
hold on;
plot(Other_data(:,1),Other_data(:,2),'*');
xlim([0 50]);
ylim([0 1]);
xlabel('We');
ylabel('B');
hold on;
abc=xlsread('D:\rawam\research work\Experiment\Droplet\mine\dodecane (C12H26)\5 atm\matlab\test.xlsx',biaohao,'H2:J2');
%% 循环参数
we_all=[];
count=0;
for i=1:size(abc,1)
    aa=abc(i,1);
    bb=abc(i,2);
    cc=abc(i,3);
for b=0:0.0001:0.9
    n=round(b*10000+1);
    t=2*(1-b);
    fai=aa*b^bb+cc;
    fai_1=1*2*(6/fai-2)^(1/3)+((6/fai-2)^(-2/3));
if t>1
    x=1-0.25*((2-t)^2)*(1+t);
else
    x=0.25*(t^2)*(3-t);
end
 we=(8*(fai_1-3))/(x*(1-b^2)); 
 we_all(n,:)=we;
 b_all(n,:)=b;
 all_data=[we_all,b_all];
end
We_B{i,:}=all_data;
plot(we_all,b_all); hold on
end
%% 误差计算
we_min_all=[];
we_max_all=[];
for m=1:size(abc,1)
    for n=1:9001
        we1(n,m)=We_B{m}(n,1);
    end
end
for mm=1:9001
    we_min=min(we1(mm,:));
    we_max=max(we1(mm,:));
    we_min_all(mm,:)=we_min;
    we_max_all(mm,:)=we_max;
end
xlim([0 50]);
ylim([0 1]);
xlabel('We');
ylabel('B');
