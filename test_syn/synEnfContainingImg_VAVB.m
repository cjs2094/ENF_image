function [img_syn, trueParam] = synEnfContainingImg_VAVB(img, param)
% This function add synthetic ENF signal to a rolling shutter image
% Jisoo Choi, 4/4/2021, 

f_ENF       = param.f_ENF;
T_row       = param.T_row;
%phi         = param.phi;
useRelative = param.useRelative;
relativeMag = param.relativeMag;
absoluteMag = param.absoluteMag;

dim = size(img);
if dim(1) > dim(2)
    error('Image is not in the landscape mode. Please rotate it before call this function.')
end
img = double(img);
M = dim(1);
mRange = 1 : M;

mu_img = mean(img(:));
if useRelative == 1  % 1: relative, 2: absolute
    mag = relativeMag * mu_img;
elseif useRelative == 2
    mag = absoluteMag;
else
    error('useRelative must be 1 or 2');
end

[a_1, a_M, k, b, phi] = func_assignParam(mag, M);

trueParam = [a_1, a_M, k, b, phi];

mag = ((a_M - a_1)/(M - 1)*(mRange - 1) + a_1);

trend = k*mRange + b;

enfSignal = mag .* cos(2*pi*f_ENF*T_row*mRange + phi) + trend;

% enfSignal_sinusoidalPart = mag .* cos(2*pi*f_ENF*T_row*mRange + phi);

mag = abs(mean(mag(:)));
disp(sprintf('ENF magnitude = %.2f (out of 255)', mag));
disp(sprintf('MSNR = %.2f dB', 20*log10(mu_img/mag)));

img_syn = zeros(size(img));
enfComp = enfSignal(:)* ones(1, dim(2));
if length(dim) == 2
    img_syn = img + enfComp;
else
    for i = 1 : dim(3)
        img_syn(:,:,i) = img(:,:,i) + enfComp;
    end
end

clipLogSet1 = img_syn > 255;
clipLogSet2 = img_syn < 0;
clipPerc = mean(clipLogSet1(:)) + mean(clipLogSet2(:));
disp(sprintf('clipped perc = %.1f%%', clipPerc*100));

img_syn = uint8(img_syn);

disp(sprintf('\n'))

end


function [a_1, a_M, k, b, phi] = func_assignParam(mag, M)

delta = unifrnd(-mag, mag);
a_1 = mag - 0.5*delta;
a_M = mag + 0.5*delta;

if rand > 0.5
    a_1 = -a_1;
    a_M = -a_M;
end

if mag == 0
    k = 0;
    b = 0;
    phi = 0;
else
    k = unifrnd(-2/M, 2/M);
    b = unifrnd(-1, 1);
%     % REMOVE BELOW LATER
    phi = 2*pi*0.6;
    %phi = 2*pi*rand;
end

%     % REMOVE BELOW LATER
a_1 = 18;
a_M = 14;
k = -1.684022410846293e-04;
b = 0.2067;
end