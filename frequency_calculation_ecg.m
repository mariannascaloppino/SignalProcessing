clc
clear
close
load ecg.asc
%Guarda il workspace 6143 righe per 3 colonne
%la prima colonna rappresenta l'asse dei tempi in millisecondi
%le ultime colonne sono due derivazioni dell'ecg
d1=ecg(:,2);
d2=ecg(:,3);
t=ecg(:,1)/1000; %asse dei tempi in secondi

if max(d1)>max(d2)
    %impostiamo gli assi, come se fosse axis tight
    d=d1; %per lavorare con la derivazione scelta senza sapere quale venga scelta tra d1 e d2
else
    d=d2;
end
plot(t,d)
hold on
ylabel("Derivazione [mV]")
axis([t(1) t(end) min(d) max(d)]) %impostiamo gli assi, come se fosse axis tight
xlabel("Tempo [s]")
title("ECG")

%creare la linea dello zero
%yline(0)
%oppure
yzero=zeros(1,length(t));
plot(t,yzero)
% ALGORITMO A SOGLIA con soglia pari a 300mV
soglia=zeros(1,length(t))+300;
%oppure soglia=ones(1,length(t))*300;
plot(t,soglia,'g')
hold off
%calcoliamo la frequenza cardiaca come inverso della media della distanza
%R-R
[x,y]=ginput(3) %il parametro di ingresso corrisponde al numero di click da fare sul plot, la funzione mi restituirà
%le coordinate dei punti su cui ho premuto
%premiamo su 3 picchi R, meglio quelli tra 27 e 30 s
help ginput

%for i=2:length(x)
%   diff(i-1)=abs(x(i)-x(i-1)) %calcolo le distanze temporali tra i picchi R
%end

%oppure
differenze=abs(diff(x))
Fbps=1/mean(differenze) %bps battiti al secondo
Fbpm=60*Fbps %bpm

% Scorrere l'ecg con una finestra di m campioni che si sposta per 5 volte e
% di volta in volta fare il plot
m=250; %lunghezza della finestra

ripetizioni=5*m;
lunghezza_segnale=length(d)

if 5*m<=lunghezza_segnale %ci assicuriamo che il numero di campioni totale da scorrere sia inferiore o uguale alla lunghezza del segnale.
    for i=1:m:ripetizioni
        plot(t(i:i+m-1),d(i:i+m-1)) % ci vuole il meno 1 perchè da 1 a 251 conto 251 pti, ne devo contare 250
        %li plottiamo su figure diverse, come se stessimo effettuando uno zoom
        axis([t(1) t(5*m) -1000 1000])
        pause %premere tasto dalla command window per riprendere
    end
end