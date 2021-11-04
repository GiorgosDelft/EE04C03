clear;
close all;

AF_data = load('data/AF/AF1.mat').data;
NSR_data = load('data/NSR/NSR1.mat').data;
N_af = size(AF_data,2);
N_nsr = size(NSR_data,2);

fs = 500; % Hz
t = 0:1/fs:(N_af-1)/fs;
p = 5; % ar model order

x = NSR_data(1,:)';
Rx = x*x'; % autocorrelation matrix
N = numel(x);



subplot(121)
bar(ar_NSR_mean);
title('NSR mean');
ylim([-2.5 2.5]);
subplot(122);
bar(ar_AF_mean,'r');
title('AF mean');
ylim([-2.5 2.5]);

figure
subplot(121)
bar(ar_NSR_var);
title('NSR var');
ylim([-2.5 2.5]);
subplot(122);
bar(ar_AF_var,'r');
title('AF var');
ylim([-2.5 2.5]);