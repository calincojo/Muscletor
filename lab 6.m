
S = [0 0 1; 0 0.5 1; 0 1 1; 0.5 0 1; 0.5 0.5 -1; 0.5 0.5 -1; 0.5 1 -1; 1 0 -1; 1 0.5 -1];
nrMaximEpoci= 10;

wstar, bstar, eroare = algoritmRosenblattOnline(S(1:2,:),S(3,:), nrMaximEpoci);



conditie = (S(3) == 1);
x= S(1:2,:);
clasa1= x(conditie);
clasa2= x(not(conditie));

plot(clasa1(1,:), clasa1(2,:), '*r' ); hold on;
plot(clasa2(1,:), clasa2(2,:), '*b' ); hold on;
plotpc(wstar, bstar);