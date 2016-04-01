function [Wstar, bstar,histErr] = algoritmRosenblattOnline_v2 (X, T, maxEpoci)

d = size(X,1);
nrExemple = size(X,2);

W = rand(d,1);
bias = rand(1);
nrEpoci = 0;
convergenta = 0;

eroriMisclasare = zeros(maxEpoci + 1 ,1);

while nrEpoci <= maxEpoci && convergenta == 0
    convergenta = 1;
    nrEpoci = nrEpoci + 1;
    
    for i = 1:nrExemple
        y = hardlims(W' * X(:,i) + bias);
        
        if y ~= T(i)
            W = W + T(i) * X(:,i) ;
            bias = bias + T(i);
            convergenta = 0;
            eroriMisclasare(nrEpoci) = eroriMisclasare(nrEpoci) + 1;
        end
    end
end

Wstar = W;
bstar = bias;
histErr = eroriMisclasare/nrExemple;
histErr(nrEpoci+1:end)=[];

end
