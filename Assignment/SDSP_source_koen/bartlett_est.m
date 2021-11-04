af = load('data/AF/AF1.mat').data;
nsr = load('data/NSR/NSR1.mat').data;

af_framed = frame(af(1,:)', 500);
nsr_framed = frame(nsr(1,:)', 500);


af_fft = fft(af_framed);
nsr_fft = fft(nsr_framed);