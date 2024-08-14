clc
clear 
close all
%CREAZIONE SENO
fs=50                %hz frequenza del segnale da creare
fc=1000              %hz, frequenza di campionamento
dt=1/fc              %secondi, passo di campionamento
t=0:dt:10/fs;        %creazione asse dei tempi, va da 0 a 0.2, Dividiamo per fs perchè 10 non è in secondi
y=sin(2*pi*fs*t);
plot(t,y)

%pause               %per riprendere lo svolgimento dello script premere qualsiasi tanto nella command window
%%
%TRASFORMATA, SPETTRO DI AMPIEZZA E DI FASE

                   %il numero di punti su cui spesso si calcola la fft è 256
npunti=256;
                   %bisogna essere sicuri che sia inferiore al numero di punti del seno,
                   %altrimenti il plot non funziona, non avrei abbastanza pti della mia funzione per farne la trasformata
length(t)
                   %in questo caso il numero di punti è 201<256
                   %allunghiamo il seno
t=0:dt:15/fs;
y=sin(2*pi*fs*t);  %arriviamo ad avere 300 campioni
                   %prendiamo i primi 256 punti del segnale
s=y(1:256);

df=fc/npunti;         %Creazione asse frequenze, %spalmiamo tutto il periodo sul numero di punti necessari
f=(0:df:fc-1);        %è necessario il valore -1 perchè contiamo anche il valore 0, se non ci fosse conterei un valore in più
                      %fc/npunti=RISOLUZIONE IN FREQUENZA=distanza tra 2 punti dello spettro
F_y=fft(s);
figure
plot(f(1:npunti/2),abs(F_y(1:npunti/2))) %lo spettro in ampiezza di segnali reali è simmetrico, plottiamo la metà dei punti
                                         %il picco si trova a 50 hz, come la frequenza della sinusoide!
                                         %non otteniamo un impulso di dirac perchè la sinusoide è troncata e non è
                                         %continua-> non siamo in condizioni ideali
%SPETTRO DI FASE
figure;
plot(f,angle(F_y)) % in realtà non sarebbe necessario plottare tutti i punti, anch'essa simmetrica
ylabel('Rad')
xlabel('Frequenze Hz')
title('SPETTO DI FASE')
%%
%SPETTRO DI POTENZA
PS=abs(F_y).^2
plot(f,PS)
%Matlab effettua uno spostamento in banda base, simmetria rispetto al punto di mezzo
ylabel('PSD','FontSize',14,'FontWeight',"bold",'Color',[0.2 0.5 0.8 ])
%Se eseguito dalla command window si possono effettuare delle modifiche
%attraverso il property inspector del grafico, oppure fai apri in figure
%window
gtext('consente di aggiungere una stringa sull''ultima figura aperta scegliendo col mouse dove posizionarla')
%per farlo funzionare da qui (dal live script) premi sulla figura