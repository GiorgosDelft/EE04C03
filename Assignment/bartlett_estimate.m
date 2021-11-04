function psd = bartlett_estimate(x_n,no_frames)
    L = floor(length(x_n(:,:))/no_frames);
    psd =0;
    n1 =1;
    nfft=500;
    for i=1:no_frames
        x_temp = x_n(:,n1:n1+L-1);
        psd = psd + periodogram(x_temp.',rectwin(500),nfft)/no_frames;
        n1 = n1+L;
    end
     psd = psd.';
end