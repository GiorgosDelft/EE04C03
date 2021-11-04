close all;
clear all;
clc;

%% Load Data
af01 = load('dataset/AF/AF1.mat').data;
NSR01 = load('dataset/NSR/NSR1.mat').data;
af02 = load('dataset/AF/AF2.mat').data;
NSR02 = load('dataset/NSR/NSR2.mat').data;
af03 = load('dataset/AF/AF3.mat').data;
NSR03 = load('dataset/NSR/NSR3.mat').data;
af04 = load('dataset/AF/AF4.mat').data;
NSR04 = load('dataset/NSR/NSR4.mat').data;
af05 = load('dataset/AF/AF5.mat').data;
NSR05 = load('dataset/NSR/NSR5.mat').data;
af06 = load('dataset/AF/AF6.mat').data;
NSR06 = load('dataset/NSR/NSR6.mat').data;
af07 = load('dataset/AF/AF7.mat').data;
NSR07 = load('dataset/NSR/NSR7.mat').data;
af08 = load('dataset/AF/AF8.mat').data;
NSR08 = load('dataset/NSR/NSR8.mat').data;
af09 = load('dataset/AF/AF9.mat').data;
NSR09 = load('dataset/NSR/NSR9.mat').data;
af10 = load('dataset/AF/AF10.mat').data;
NSR10 = load('dataset/NSR/NSR10.mat').data;

%% Calculate PSD for AFs dataset

PSD_af01 = bartlett_estimate(af01,10);
PSD_af02 = bartlett_estimate(af02,10);
PSD_af03 = bartlett_estimate(af03,10);
PSD_af04 = bartlett_estimate(af04,10);
PSD_af05 = bartlett_estimate(af05,10);
PSD_af06 = bartlett_estimate(af06,10);
PSD_af07 = bartlett_estimate(af07,10);
PSD_af08 = bartlett_estimate(af08,10);
PSD_af09 = bartlett_estimate(af09,10);
PSD_af10 = bartlett_estimate(af10,10);


%% Calculate PSD for NSRs dataset

PSD_NSR01 = bartlett_estimate(NSR01,10);
PSD_NSR02 = bartlett_estimate(NSR02,10);
PSD_NSR03 = bartlett_estimate(NSR03,10);
PSD_NSR04 = bartlett_estimate(NSR04,10);
PSD_NSR05 = bartlett_estimate(NSR05,10);
PSD_NSR06 = bartlett_estimate(NSR06,10);
PSD_NSR07 = bartlett_estimate(NSR07,10);
PSD_NSR08 = bartlett_estimate(NSR08,10);
PSD_NSR09 = bartlett_estimate(NSR09,10);
PSD_NSR10 = bartlett_estimate(NSR10,10);

%% Anova Test 12-lead mean

% lead = 9;
% 
% Y_mean= [mean(PSD_NSR01(lead,:).') , mean(PSD_NSR02(lead,:).') , mean(PSD_NSR03(lead,:).') , mean(PSD_NSR04(lead,:).') , mean(PSD_NSR05(lead,:).') , mean(PSD_NSR06(lead,:).') , mean(PSD_NSR07(lead,:).') , mean(PSD_NSR08(lead,:).') , mean(PSD_NSR09(lead,:).') , mean(PSD_NSR10(lead,:).') , mean(PSD_af01(lead,:).') , mean(PSD_af02(lead,:).') , mean(PSD_af03(lead,:).') , mean(PSD_af04(lead,:).') , mean(PSD_af05(lead,:).') , mean(PSD_af06(lead,:).') , mean(PSD_af07(lead,:).') , mean(PSD_af08(lead,:).') , mean(PSD_af09(lead,:).') , mean(PSD_af10(lead,:).') ];
% group = {'NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR' ,'AR','AR','AR','AR','AR','AR','AR','AR','AR','AR'}
% [p,tbl,stats] = anova1(Y_mean,group)

%% Anova Test all-lead var

Y_var= [mean(var(PSD_NSR01(:,:))'), mean(var(PSD_NSR02(:,:))'), mean(var(PSD_NSR03(:,:))') , mean(var(PSD_NSR04(:,:))') , mean(var(PSD_NSR05(:,:))' ), mean(var(PSD_NSR06(:,:))') , mean(var(PSD_NSR07(:,:))' ), mean(var(PSD_NSR08(:,:))' ), mean(var(PSD_NSR09(:,:))') , mean(var(PSD_NSR10(:,:))') , mean(var(PSD_af01(:,:))') , mean(var(PSD_af02(:,:))') , mean(var(PSD_af03(:,:))') , mean(var(PSD_af04(:,:))'), mean(var(PSD_af05(:,:))') , mean(var(PSD_af06(:,:))') , mean(var(PSD_af07(:,:))') , mean(var(PSD_af08(:,:))'), mean(var(PSD_af09(:,:))') , mean(var(PSD_af10(:,:))') ];
group = {'NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR' ,'AR','AR','AR','AR','AR','AR','AR','AR','AR','AR'} 
[p,tbl,stats] = anova1(Y_var,group)

%% Anova test mean of the frequency  

f=0:250;

% PSD_NSR_norm_1 = 1/trapz(f,PSD_NSR01(lead,:)').*PSD_NSR01(lead,:)';
% exp_NSR_PSD_norm_1 = trapz(f,PSD_NSR_norm_1'.*f);
% var_NSR_PSD_norm_1 = trapz(f,(PSD_NSR_norm_1'.*f.^2))-exp_NSR_PSD_norm_1.^2;
% 
% 
% PSD_af_norm_1 = 1/trapz(f,PSD_af01(lead,:)').*PSD_af01(lead,:)';
% exp_af_PSD_norm_1 = trapz(f,PSD_af_norm_1'.*f)
% var_af_PSD_norm_1 = trapz(f,(PSD_af_norm_1'.*f.^2))-exp_af_PSD_norm_1.^2;

f=0:250;
lead =5;

% NSR Data
PSD_NSR_norm_1 = 1/trapz(f,PSD_NSR01(lead,:)').*PSD_NSR01(lead,:)';
exp_NSR_PSD_norm_1 = trapz(f,PSD_NSR_norm_1'.*f);
var_NSR_PSD_norm_1 = trapz(f,(PSD_NSR_norm_1'.*f.^2))-exp_NSR_PSD_norm_1.^2;

PSD_NSR_norm_2 = 1/trapz(f,PSD_NSR02(lead,:)').*PSD_NSR02(lead,:)';
exp_NSR_PSD_norm_2 = trapz(f,PSD_NSR_norm_2'.*f);
var_NSR_PSD_norm_2 = trapz(f,(PSD_NSR_norm_2'.*f.^2))-exp_NSR_PSD_norm_2.^2;

PSD_NSR_norm_3 = 1/trapz(f,PSD_NSR03(lead,:)').*PSD_NSR03(lead,:)';
exp_NSR_PSD_norm_3 = trapz(f,PSD_NSR_norm_3'.*f);
var_NSR_PSD_norm_3 = trapz(f,(PSD_NSR_norm_3'.*f.^2))-exp_NSR_PSD_norm_3.^2;

PSD_NSR_norm_4 = 1/trapz(f,PSD_NSR04(lead,:)').*PSD_NSR04(lead,:)';
exp_NSR_PSD_norm_4 = trapz(f,PSD_NSR_norm_4'.*f);
var_NSR_PSD_norm_4 = trapz(f,(PSD_NSR_norm_4'.*f.^2))-exp_NSR_PSD_norm_4.^2;

PSD_NSR_norm_5 = 1/trapz(f,PSD_NSR05(lead,:)').*PSD_NSR05(lead,:)';
exp_NSR_PSD_norm_5 = trapz(f,PSD_NSR_norm_5'.*f);
var_NSR_PSD_norm_5 = trapz(f,(PSD_NSR_norm_5'.*f.^2))-exp_NSR_PSD_norm_5.^2;

PSD_NSR_norm_6 = 1/trapz(f,PSD_NSR06(lead,:)').*PSD_NSR06(lead,:)';
exp_NSR_PSD_norm_6 = trapz(f,PSD_NSR_norm_6'.*f);
var_NSR_PSD_norm_6 = trapz(f,(PSD_NSR_norm_6'.*f.^2))-exp_NSR_PSD_norm_6.^2;

PSD_NSR_norm_7 = 1/trapz(f,PSD_NSR07(lead,:)').*PSD_NSR07(lead,:)';
exp_NSR_PSD_norm_7 = trapz(f,PSD_NSR_norm_7'.*f);
var_NSR_PSD_norm_7 = trapz(f,(PSD_NSR_norm_7'.*f.^2))-exp_NSR_PSD_norm_7.^2;

PSD_NSR_norm_8 = 1/trapz(f,PSD_NSR08(lead,:)').*PSD_NSR08(lead,:)';
exp_NSR_PSD_norm_8 = trapz(f,PSD_NSR_norm_8'.*f);
var_NSR_PSD_norm_8 = trapz(f,(PSD_NSR_norm_8'.*f.^2))-exp_NSR_PSD_norm_8.^2;

PSD_NSR_norm_9 = 1/trapz(f,PSD_NSR09(lead,:)').*PSD_NSR09(lead,:)';
exp_NSR_PSD_norm_9 = trapz(f,PSD_NSR_norm_9'.*f);
var_NSR_PSD_norm_9 = trapz(f,(PSD_NSR_norm_9'.*f.^2))-exp_NSR_PSD_norm_9.^2;

PSD_NSR_norm_10 = 1/trapz(f,PSD_NSR10(lead,:)').*PSD_NSR10(lead,:)';
exp_NSR_PSD_norm_10 = trapz(f,PSD_NSR_norm_10'.*f);
var_NSR_PSD_norm_10 = trapz(f,(PSD_NSR_norm_10'.*f.^2))-exp_NSR_PSD_norm_10.^2;

% AR DATA

PSD_af_norm_1 = 1/trapz(f,PSD_af01(lead,:)').*PSD_af01(lead,:)';
exp_af_PSD_norm_1 = trapz(f,PSD_af_norm_1'.*f)
var_af_PSD_norm_1 = trapz(f,(PSD_af_norm_1'.*f.^2))-exp_af_PSD_norm_1.^2;

PSD_af_norm_2 = 1/trapz(f,PSD_af02(lead,:)').*PSD_af02(lead,:)';
exp_af_PSD_norm_2 = trapz(f,PSD_af_norm_2'.*f)
var_af_PSD_norm_2 = trapz(f,(PSD_af_norm_2'.*f.^2))-exp_af_PSD_norm_2.^2;

PSD_af_norm_3 = 1/trapz(f,PSD_af03(lead,:)').*PSD_af03(lead,:)';
exp_af_PSD_norm_3 = trapz(f,PSD_af_norm_3'.*f)
var_af_PSD_norm_3 = trapz(f,(PSD_af_norm_3'.*f.^2))-exp_af_PSD_norm_3.^2;

PSD_af_norm_4 = 1/trapz(f,PSD_af04(lead,:)').*PSD_af04(lead,:)';
exp_af_PSD_norm_4 = trapz(f,PSD_af_norm_4'.*f)
var_af_PSD_norm_4 = trapz(f,(PSD_af_norm_4'.*f.^2))-exp_af_PSD_norm_4.^2;

PSD_af_norm_5 = 1/trapz(f,PSD_af05(lead,:)').*PSD_af05(lead,:)';
exp_af_PSD_norm_5 = trapz(f,PSD_af_norm_5'.*f)
var_af_PSD_norm_5 = trapz(f,(PSD_af_norm_5'.*f.^2))-exp_af_PSD_norm_5.^2;

PSD_af_norm_6 = 1/trapz(f,PSD_af06(lead,:)').*PSD_af06(lead,:)';
exp_af_PSD_norm_6 = trapz(f,PSD_af_norm_6'.*f)
var_af_PSD_norm_6 = trapz(f,(PSD_af_norm_6'.*f.^2))-exp_af_PSD_norm_6.^2;

PSD_af_norm_7 = 1/trapz(f,PSD_af07(lead,:)').*PSD_af07(lead,:)';
exp_af_PSD_norm_7 = trapz(f,PSD_af_norm_7'.*f)
var_af_PSD_norm_7 = trapz(f,(PSD_af_norm_7'.*f.^2))-exp_af_PSD_norm_7.^2;

PSD_af_norm_8 = 1/trapz(f,PSD_af08(lead,:)').*PSD_af08(lead,:)';
exp_af_PSD_norm_8 = trapz(f,PSD_af_norm_8'.*f)
var_af_PSD_norm_8 = trapz(f,(PSD_af_norm_8'.*f.^2))-exp_af_PSD_norm_8.^2;

PSD_af_norm_9 = 1/trapz(f,PSD_af09(lead,:)').*PSD_af09(lead,:)';
exp_af_PSD_norm_9 = trapz(f,PSD_af_norm_9'.*f)
var_af_PSD_norm_9 = trapz(f,(PSD_af_norm_9'.*f.^2))-exp_af_PSD_norm_9.^2;

PSD_af_norm_10 = 1/trapz(f,PSD_af10(lead,:)').*PSD_af10(lead,:)';
exp_af_PSD_norm_10 = trapz(f,PSD_af_norm_10'.*f)
var_af_PSD_norm_10 = trapz(f,(PSD_af_norm_10'.*f.^2))-exp_af_PSD_norm_10.^2;

Y_var_all_lead_freq = [var_NSR_PSD_norm_1,var_NSR_PSD_norm_2,var_NSR_PSD_norm_3,var_NSR_PSD_norm_4,var_NSR_PSD_norm_5,var_NSR_PSD_norm_6,var_NSR_PSD_norm_7,var_NSR_PSD_norm_8,var_NSR_PSD_norm_9,var_NSR_PSD_norm_10,var_af_PSD_norm_1,var_af_PSD_norm_2,var_af_PSD_norm_3,var_af_PSD_norm_4,var_af_PSD_norm_5,var_af_PSD_norm_6,var_af_PSD_norm_7,var_af_PSD_norm_8,var_af_PSD_norm_9,var_af_PSD_norm_10]
Y_exp_all_lead_freq = [exp_NSR_PSD_norm_1,exp_NSR_PSD_norm_2,exp_NSR_PSD_norm_3,exp_NSR_PSD_norm_4,exp_NSR_PSD_norm_5,exp_NSR_PSD_norm_6,exp_NSR_PSD_norm_7,exp_NSR_PSD_norm_8,exp_NSR_PSD_norm_9,exp_NSR_PSD_norm_10,exp_af_PSD_norm_1,exp_af_PSD_norm_2,exp_af_PSD_norm_3,exp_af_PSD_norm_4,exp_af_PSD_norm_5,exp_af_PSD_norm_6,exp_af_PSD_norm_7,exp_af_PSD_norm_8,exp_af_PSD_norm_9,exp_af_PSD_norm_10]

group = {'NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR' ,'AR','AR','AR','AR','AR','AR','AR','AR','AR','AR'} 
[p,tbl,stats] = anova1(Y_var_all_lead_freq,group)

% %% Anova Test all-lead mean of the mean
% Y_mean_all_lead= [mean(mean(PSD_NSR01(:,:))'), mean(mean(PSD_NSR02(:,:))') , mean(mean(PSD_NSR03(:,:))') , mean(mean(PSD_NSR04(:,:))') , mean(mean(PSD_NSR05(:,:))') , mean(mean(mean(PSD_NSR06(:,:))')), mean(mean(PSD_NSR07(:,:))') , mean(mean(PSD_NSR08(:,:))') , mean(mean(PSD_NSR09(:,:))') , mean(mean(PSD_NSR10(:,:))') , mean(mean(PSD_af01(:,:))') , mean(mean(PSD_af02(:,:))') , mean(mean(PSD_af03(:,:))') , mean(mean(PSD_af04(:,:))') , mean(mean(PSD_af05(:,:))') , mean(mean(PSD_af06(:,:))') , mean(mean(PSD_af07(:,:))') , mean(mean(PSD_af08(:,:))') , mean(mean(PSD_af09(:,:))') , mean(mean(PSD_af10(:,:))') ];
% group = {'NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR' ,'AR','AR','AR','AR','AR','AR','AR','AR','AR','AR'} 
% [p,tbl,stats] = anova1(Y_mean_all_lead,group)

%% Anova Test all-lead var 
Y_var_all_lead= [var(mean(PSD_NSR01(:,:))'), var(mean(PSD_NSR02(:,:))') , var(mean(PSD_NSR03(:,:))') , var(mean(PSD_NSR04(:,:))') , var(mean(PSD_NSR05(:,:))') , var(mean(mean(PSD_NSR06(:,:))')), var(mean(PSD_NSR07(:,:))') , var(mean(PSD_NSR08(:,:))') , var(mean(PSD_NSR09(:,:))') , var(mean(PSD_NSR10(:,:))') , var(mean(PSD_af01(:,:))') , var(mean(PSD_af02(:,:))') , var(mean(PSD_af03(:,:))') , var(mean(PSD_af04(:,:))') , var(mean(PSD_af05(:,:))') , var(mean(PSD_af06(:,:))') , var(mean(PSD_af07(:,:))') , var(mean(PSD_af08(:,:))') , var(mean(PSD_af09(:,:))') , var(mean(PSD_af10(:,:))') ];

group = {'NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR','NSR' ,'AR','AR','AR','AR','AR','AR','AR','AR','AR','AR'} 

[p,tbl,stats] = anova1(Y_var_all_lead,group)
