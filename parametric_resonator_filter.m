
clear 
close
clc
load ecg.asc

t=ecg(:,1);
d1=ecg(:,2);
%progettare un risuonatore parametrico per la rivelazione del complesso QRS
fw=17%freq centro banda
Q=4 %fattore di qualità
fc=250 %Hz
AEMG=30;
frete=50;
Arete=60;
y=addnoise(d1,t,AEMG,Arete,frete);

num=[1 0 -1];
%den=[1,-2rcos(wo),r^2]
wo=2*pi*fw/fc; %pulsazione digitale di centro banda
%r=1-deltaw/2 deltaw è la larghezza di banda
Dw=wo/Q;
r=1-Dw/2;
den=[1 -2*r*cos(wo) r^2];
%per filtrare il segnale y
uscita_filtrata=filter(num,den,y);
plot(t,d1,'m',t,uscita_filtrata,'c')
legend('segnale rumoroso','segnale filtrato')
title('segnale filtrato/segnale rumoroso')
axis tight
%ha eliminato l'oscillazione della linea di base

%fino ad ora i coefficienti facevano riferimento a z^-1
%scriviamo quelli che fanno riferimento a z e usiamo la 
%funzione zplane

num1=[0 0 1];
 % il denominatore rimane uguale
%i vettori num1 e den devono essere vettori riga per poterli
%dare in ingresso a zplane
zplane(num1,den)
help zplane;