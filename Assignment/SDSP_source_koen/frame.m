function y_framed = frame(y, M)
    % Outputs the input signal y in frames of M length with overlap, multiplied with a
    % hamming window, as the matrix y_framed.
    n_y = numel(y); % length of y
    window = hamming(M, 'periodic');
    overlap = floor(M/2);
    frames = ceil(n_y / (M-overlap));
    y_framed = zeros(M, frames);
    
    y_ind = 1;
    frame_ind = 1;
    while y_ind < n_y % go through entire signal vector
        % Check if whole frame fits
        if (n_y - y_ind) >= M
            y_framed(:, frame_ind) = y(y_ind:y_ind+M-1) .* window; % select correct region of signal and multiply with window
        else
            samples_left = n_y - y_ind;
            y_framed(1:samples_left+1, frame_ind) = y(y_ind:y_ind+samples_left);
            y_framed(:, frame_ind) = y_framed(:, frame_ind) .* window;
        end
        y_ind = y_ind + M - overlap; % forward the index with the correct amount
        frame_ind = frame_ind + 1;
    end
end

