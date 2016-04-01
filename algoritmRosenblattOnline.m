function [ wstar, bstar, eroareAntrenare ] = algoritmRosenblattOnline( X, T , nrEpoci )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    d= size(X,1);
    m= size(X,2);
    
    w = zeros(d,1);
    b= 0;
    k=0;
    epocaCurenta= 0;
    eroareAntrenare = zeros(1,nrEpoci);
    modificare = 1;
    while epocaCurenta <= nrEpoci && modificare == 1
        modificare= 0;
        epocaCurenta= epocaCurenta + 1;
        
        nrExempleMisclasate = 0;
        
        for i=1:m
            yi= hardlims(w(k)'*X(:,i)+b);
            
            if yi ~= T(i)
                w = w + T(i)*X(:,i);
                b = b + T(i);
                modificare = 1;
                nrExempleMisclasate = nrExempleMisclasate+1;
            end
        end
        eroareAntrenare(epocaCurenta) = nrExempleMisclasate / m;
    end
    
    wstar= w;
    bstar= b;
end

