clc
clear
close
load 11HP.mat
lung=length(fhr);
t=1:lung;
plot(t,fhr)
%finestra di campioni pari a 160
ncampioni=160;
%quante finestre vi entrano nel segnale?
y=round(lung/ncampioni);% a rigore ci vorrebbe il floor
%creiamo una matrice di turning point su ogni riga vi è la finestra in
%esame
r=1; %inizializziamo il numero di righe
tp=zeros(y,ncampioni);
%scorriamo l
for k=2:ncampioni:(lung-ncampioni) %l'ultimo pezzo non lo vogliamo analizzare
    for n=1:ncampioni-1 %k=2 quindi possiamo mettere n=1, n=2 sarebbe scorretto.
        d1=fhr(n)-fhr(n-1);
        d2=fhr(n+1)-fhr(n);
        if d1*d2<0
            tp(r,n)=1;
        end

    end
    r=r+1;
end
%analizziamo finestra per finestra se il segnale è random

%Fatto da ME, era lasciato come compito a casa

%scorriamo quindi una riga alla volta per vedere nella i-esima finestra se
%il segnale è random
for riga=1:y
    if length(find(tp(riga,:)))>2*(160-2)/3
        fprintf("Il segnale risulta random nella finestra %d \n\r",riga)  
    end
end
% con find(tp(riga,:)) trovo gli indici dei turning points su ogni riga
% con length(find(tp(riga,:))) trovo il numero di turning points presenti
% su ogni riga (e quindi in ogni finestra)
%riga i-esima -> finestra i-esima 

%fare il plot