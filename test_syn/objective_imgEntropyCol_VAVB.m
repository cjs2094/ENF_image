function entropy_estRaw_total = objective_imgEntropyCol_VAVB(img, imgSize, colIdxSet, T_row, frequency, a_s, a_t, KSet, phi)
%  Chau-Wai Wong, 10/7/2016
%  Jisoo Choi, 09/05/2019

pelLevelRange = [0:255];

yRange = [0 : (imgSize(1)-1)]';

numOfColUsed = length(colIdxSet);

signalSet = img(:, colIdxSet);

mag = ((a_t - a_s)/(imgSize(1)-1)*yRange + a_s);

trend = KSet.*yRange;

enfEst = mag .* cos(2*pi*frequency*T_row*yRange + phi) + trend;

colResidue = signalSet - enfEst;
%colResidue = signalSet - enfEst * ones(1, numOfColUsed);

entropy_estRaw_arr = zeros(numOfColUsed, 1);
for i = 1 : numOfColUsed
    entropy_estRaw_arr(i) = computeEntropy(colResidue(:,i), pelLevelRange);
end

entropy_estRaw_total = mean(entropy_estRaw_arr);
%entropy_estRaw_total = min(entropy_estRaw_arr);



