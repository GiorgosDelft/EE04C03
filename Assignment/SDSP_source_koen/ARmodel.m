function y = ARmodel(a, n)
    x = normrnd(0, 1, n,1); % create noise with variance 1
    
    y = filter(1,a,x);
end

