clc
close 
clear 
load Pot_evocato

%pei (size=1,192): potenziale evocato ideale
%segnale (size=1,19159): successione di stimoli e di potenziali evocati di ampiezza
%diversa, con sovrapposizione di rumore (rete e ritmo alfa)
%segnale_w (size=1,19159): successione di stimoli e di potenziali evocati con ritardi
%variabili e con sovrapposizione di rumore
%segnale_w_sr (size=1,19159): successione di stimoli e di potenziali evocati ideali
%con ritardi variabili


len=length(pei) %pei sta per potenziale evocato ideale
t1=1:len;
figure
plot(t1,pei)
xlabel('[s]')
title('PEI') %plottiamo il potenziale evocato

figure
t2=1:length(segnale);
plot(t2,segnale)
xlabel('[s]')
title('SEGNALE')
ylim([-1 3])
 
%Generiamo adesso una versione ritardata del segnale pei e li grafichiamo
%sovrapponendoli
%Poi ne calcoliamo la crosscorrelazione
ritardo=pei(1)*ones(1,40) %prendo il primo valore di pei e lo moltiplico per un vettore colonna di tutti 1 di 40 elementi
%cosicchè da avere un ritardo di 40 campioni
%costruisco il segnale ritardato di 40 come unione dei vettori ritardo e
%pei privato degli ultimi 40 campioni
segr=[ritardo pei(1:(end-length(ritardo)))]

figure
plot(t1,pei,'m',t1,segr,'g')
legend('pei','pei ritardato')
axis tight
[c,lags]=xcorr(segr,pei);
%cross-correlazione o correlazione incrociata con M numero di campioni
stem(lags,c)%Plot discrete sequence data
taumax=lags(c==max(c)) %ritardo per cui si ha il max della correlazione!
%% 
% $$R_{xy}[m]=\sum_{n=0}^{M}x_ny_{n-m}$$