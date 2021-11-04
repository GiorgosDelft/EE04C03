clear;

p = 5;
d = 10; % number of files
lead = 2;
fs = 500;
t = 0:1/fs:(5000-1)/fs;

NSR_means = zeros(p+1, d);
NSR_vars = zeros(p+1, d);
AF_means = zeros(p+1, d);
AF_vars = zeros(p+1, d);


NSR_noframe = zeros(p+1,d);
AF_noframe = zeros(p+1,d);

for i = 1:10
    AF_data = load(['data/AF/AF', num2str(i), '.mat']).data;
    NSR_data = load(['data/NSR/NSR', num2str(i), '.mat']).data;
    
%     AF_data_filt = lowpass(AF_data(lead,:), 250, fs);
%     NSR_data_filt = lowpass(NSR_data(lead,:), 250, fs);
    
    [NSR_means(:,i), NSR_vars(:,i)] = ar_coef(NSR_data(lead,:)',p);
    [AF_means(:,i), AF_vars(:,i)] = ar_coef(AF_data(lead,:)',p);
    
    NSR_noframe(:,i) = ar_coef_noframe(NSR_data(lead,:)',p);
    AF_noframe(:,i) = ar_coef_noframe(AF_data(lead,:)',p);
end

nosegment_means_NSR = mean(NSR_noframe, 2);
segment_means_NSR = mean(NSR_means, 2);

nosegment_means_AF = mean(NSR_noframe, 2);
segment_means_AF = mean(NSR_means, 2);

segment_vars_NSR = mean(NSR_vars,2);
segment_vars_AF = mean(AF_vars,2);

%% Statistical t-test
disp("NONSEGMENTED STATS");
p_mean = 0;
for i = 2:p+1
    [h,P] = ttest(AF_noframe(i,:)', NSR_noframe(i,:)');
    fprintf("The P-value for coefficient %i: %f \n", i-1,P);
    p_mean = p_mean + (1/p) * P;
end
fprintf("The mean p-value is: %f \n", p_mean);
p_mean = 0;

disp("FRAMED STATS MEANS");
for i = 2:p+1
    [h,P] = ttest(NSR_means(i,:)', AF_means(i,:)');
    fprintf("The P-value for coefficient %i: %f \n", i-1,P);
    p_mean = p_mean + (1/p) * P;
end
fprintf("The mean p-value is: %f \n", p_mean);
p_mean = 0;

disp("FRAMED STATS VARS");
for i = 2:p+1
    [h,P] = ttest(NSR_vars(i,:)', AF_vars(i,:)');
    fprintf("The P-value for coefficient %i: %f \n", i-1,P);
    p_mean = p_mean + (1/p) * P;
end
fprintf("The mean p-value is: %f \n", p_mean);
p_mean = 0;

%%
close all;

figure;
subplot(121)
boxplot(NSR_noframe(2:end,:)', 'Colors','k');
ylabel('Estimated value statistics');
xlabel("Model coefficient");
title('Estimated AR model coefficients of NSR signal (not segmented)');

subplot(122)
boxplot(AF_noframe(2:end,:)', 'Colors','k');
ylabel('Estimated value statistics');
xlabel('Model coefficient');
title('Estimated AR model coefficients of AF signal (not segmented)');

figure;
subplot(121)
boxplot(NSR_means(2:end,:)', 'Colors','k');
ylabel('Estimated value statistics');
xlabel("Model coefficient");
title('Estimated AR model coefficient of NSR signal (segmented)');

subplot(122)
boxplot(AF_means(2:end,:)', 'Colors','k');
ylabel('Estimated value statistics');
xlabel('Model coefficient');
title('Estimated AR model coefficient of AF signal (segmented)');

figure;
subplot(121)
boxplot(NSR_vars(2:end,:)', 'Colors','k');
ylabel('Estimated value statistics');
xlabel("AR model coefficient");
ylim([0,0.05]);
title({'Variance of estimated AR model coefficient', 'of NSR signal (segmented)'});

subplot(122)
boxplot(AF_vars(2:end,:)', 'Colors','k');
ylim([0,0.05]);
ylabel('Estimated value statistics');
xlabel('AR model coefficient');
title({'Variance of estimated AR model coefficient', 'of AF signal (segmented)'});

figure;
subplot(211)
plot(t, NSR_data(lead,:));
xlabel("Time [s]");
ylabel("Amplitude");
title("NSR ECG waveform");

subplot(212)
plot(t,AF_data(lead,:));
xlabel("Time [s]");
ylabel("Amplitude");
title("AF ECG waveform");