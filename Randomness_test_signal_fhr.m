%RANDOMNESS TEST
clc
clear 
close 
load 11HP % carichiamo i segnali (le variabili) fhr e toco
%vogliamo eseguire il randomness test sul segnale fhr
lung=length(fhr);
t=1:lung;
plot(t,fhr)
%il segnale plottato rappresenta il ritmo cardiaco di un feto

%il segnale è classificato random se tP>2/3(N-2) ( lo facciamo su tutto il
%segnale senza finestre mobili)
%ad un turning point il segno della derivata è diverso da quello calcolato
%al punto precedente
tP=zeros(1,lung);
for k=2:lung-1 %escludiamo il pto iniziale e finale
    d1=fhr(k)-fhr(k-1); %derivata del segnale in k-1 (differenza tra pto corrente e precedente)
    d2=fhr(k+1)-fhr(k); %derivata del segnale in k (differenza tra pto corrente e successivo)
    if d1*d2<0
        tP(k)=1; %ho trovato il turning point
    end
end
x=find(tP); %estraiamo gli indici delle posizioni dove gli elementi del vettore sono diversi da 0
%contiamo quanti sono gli elementi diversi da 0
ntp=length(x);
if ntp>2*(lung-2)/3
    disp("il segnale è random")
else
    disp("il segnale non è random")
    hold on
    %plottiamo i turning points
    plot(t(x),fhr(x),'*r')
end

plot(t,fhr,'ob') %plottiamo tutti i pti dell'fhr per verificare che non vi sono dei falsi negativi