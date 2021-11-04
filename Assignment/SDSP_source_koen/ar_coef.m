function [mean_ar, var_ar] = ar_coef(x, p)
    % Make segments of 1000 samples and use this to estimate AR
    % coefficients

    L = 1000;
    N = numel(x);
    M = round(N / L); % number of frames
    
    framed = zeros(L,M);
    
    for m = 1:M
        framed(:,m) = x((m-1)*L+1 : m*L);
    end
    
    % calculate AR coefficients for all segments
    ar = zeros(p+1,M);
    for m = 1:M
        ar(:,m) = arburg(framed(:,m),p);
    end

    mean_ar = mean(ar,2);
    var_ar = var(ar');
end

