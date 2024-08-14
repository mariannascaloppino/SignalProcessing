clear 
close all
t=1:15;
j=0;
somma=sum(t)
csum=cumsum(t) %vi sono tutte le somme parziali.(1,1+2=3,3+3=6,6+4=10...)
plot(t,csum)
%secondo cumsum,vogliamo fare il cumsum di ogni riga della matrice e plottarle:
A=[1,2,3;4,5,6;7,8,9;0,-3,10;1,1,5]
t=1:numel(A);% numel conta il numero di elementi della matrice uguale a numrig*numcol
[numrig,numcol]=size(A);
figure
hold on
i=1; 
j=1;%prendiamo in considerazione due variabili contatore, la prima per scorrere
%le righe della matrice A e la seconda per scorrere il vettore dei tempi 3
%elementi alla volta
while (j<=numrig) 
 plot(t(i:i+numcol-1),cumsum(A(j,:))) %i permette di scorrere tutta la matrice e non rappresenta il valore della colonna corrispondente 
 j=j+1;
 i=i+numcol;
end
