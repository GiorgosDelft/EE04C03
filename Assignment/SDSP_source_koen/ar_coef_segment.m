function [mean_ar, var_ar] = ar_coef_segment(x, p)
    % find peaks to segment around
    [pks,locs] = findpeaks(x,'MinPeakHeight',max(x)/3, 'MinPeakProminence',100, 'MinPeakDistance',100);
    if numel(pks) < 1
        mean_ar = zeros(p+1, 1);
        var_ar = zeros(p+1,1);
        return
    end

    % plot peaks
    plot(x);
    hold on;
    plot(locs,pks,'ro');

    % make frames around peaks
    % calculate mean sample length between peaks
    L = round(mean(diff(locs))); % numer of samples per frame
    M = numel(locs); % number of frames
    N = numel(x);
    
    if (mod(L,2) == 1) % make L even
        L = L + 1;
    end
    framed = zeros(L,M);
    
    for m = 1:M
        middle = locs(m);
        start = middle - round(L/2);
        ending = middle + round(L/2) - 1;
        if (start < 1)
            framed(:,m) = [zeros(abs(start)+1,1); x(1:ending)];
        elseif (ending > N)
            framed(:,m) = [x(start:N); zeros(ending-N,1)];
        else
            framed(:,m) = x(start:ending);
        end
    end
    
    % calculate AR coefficients for all segments
    ar = zeros(p+1,M);
    for m = 1:M
        ar(:,m) = arburg(framed(:,m),p);
    end

    mean_ar = mean(ar,2);
    var_ar = var(ar');
end

