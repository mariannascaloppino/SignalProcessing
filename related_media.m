clear
close
clc
load Pot_evocato.mat
%pei potenziale evocato ideale
plot(pei)
%segnale è una successione di stimoli
plot(segnale)
%2 set di risposte non omogenee => cambia l'ampiezza

%per poter separare i 2 set o usiamo la tecnica del cumsum e precum oppure
%se il problema è nei ritardi potremmo applicare il filtro di woody

%i picchi di ampiezza elevata sono gli stimoli applicati
%il potenziale evocato arriva max a 0.5, gli stimoli a 2
%troviamo gli stimoli , le risposte sono correlate ad essi.
%fissiamo la soglia a 1.5
soglia=1.5;
x=find(segnale>=soglia);
 
%realizziamo la matrice dove per ogni riga vi è la risposta allo stimolo
%corrispondente
for k=1:length(x)
    m(k,:)=segnale(x(k)+1:(x(k)+1)+191);
    %mettiamo 191 perche è la lunghezza di pei
end
%media della matrice
media=mean(m);
figure
plot(m(10,:))
hold
plot(media)
%Operazione di media correlata, la media è molto simile al segnale pei
plot(pei,'g')