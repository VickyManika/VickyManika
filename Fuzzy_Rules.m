% Αρχικές εντολές
close all;
clear all;
clc;
format long;

%____(1)___________________________________________________________________ 
% Πεδία ορισμόυ x και y με βήμα 0.01 για τις μεταβλητές 
x0=linspace(0,20,2001);
y0=linspace(0,100,10001);

% Περιγραφή ασαφών συνόλων
% Περιγραφή εισόδων Α και Α'
mf_input0(1,:)=tri_MF(x0,4,8,13); % Σύνολο Α
mf_input0(2,:)=trap_MF(x0,7,11,13,17); % Σύνολο Α'

% Περιγραφή εξόδου Β
mf_output0(1,:)=tri_MF(y0,45,55,75); % Σύνολο Β

%____(2)___________________________________________________________________
% Απεικόνιση των συνόλων
% A και Α' στο ίδιο γράφημα
figure(1)
plot(x0,mf_input0(1,:),'b',x0,mf_input0(2,:),'r','LineWidth',2);
title('Γραφική συνόλων Α και Α΄ ');
legend('Σύνολο Α ','Σύνολο Α΄'); 

% Σύνολο Β
figure(2)
subplot(2,1,1)
plot(y0,mf_output0(1,:),'b','LineWidth',2);
title('Γραφική συνόλου B ');

%____(3)___________________________________________________________________
% GMP-Mamdani
mf_x_bar0=trap_MF(x0,7,11,13,17); % Σύνολο Α'
w0=max(min(mf_x_bar0,mf_input0(1,:))); % GMP - παράγοντας w
mf_y_bar_Mamdani0=min(w0,mf_output0(1,:)); % Τελεστής συμπερασμού Mamdani - Σύνολο Β'

% Απεικόνιση του συνόλου Β' στο είκόνα 2 
subplot(2,1,2);
plot(y0,mf_output0(1,:),'b','LineWidth',2); 
hold on;
area(y0,mf_y_bar_Mamdani0); % αντί για plot, για να γεμίσει με χρώμα το σύνολο Β'
title('Τελεστής Mamdani')
legend('Σύνολο Β', 'Σύνολο Β''')

%____(4)___________________________________________________________________
% Επανάληψη των βημάτων (2) και (3) με διαφορετικά Α'
% (α)-Τριγωνική συνάρτηση συμμετοχής--------------------------------------- 
mf_input1(1,:)=tri_MF(x0,4,8,13); % Σύνολο Α
mf_input1(2,:)=tri_MF(x0,4,8,13); % Σύνολο Α'

% Περιγραφή εξόδου Β 
mf_output1(1,:)=tri_MF(y0,45,55,75);

% Απεικόνιση συνόλων Α και Α'
figure(3)
plot(x0,mf_input1(1,:),'b',x0,mf_input1(2,:),'r','LineWidth',2);
title('Γραφική συνόλων Α και Α΄ ');
legend('Σύνολο Α ','Σύνολο Α΄'); 

% Απεικόνιση συνόλου Β 
figure(4)
subplot(2,1,1)
plot(y0,mf_output1(1,:),'m','LineWidth',2);
title('Γραφική συνόλoυ B ');
 
% GMP-Mamdani  
mf_x_bar1=tri_MF(x0,4,8,13); % Σύνολο Α'
w1=max(min(mf_x_bar1,mf_input1(1,:))); % GMP - παράγοντας w
mf_y_bar_Mamdani1=min(w1,mf_output1(1,:)); % Τελεστής συμπερασμού Mamdani - Σύνολο Β'

% Απεικόνιση του συνόλου Β' στο είκόνα 4
subplot(2,1,2);
plot(y0,mf_output1(1,:),'m','LineWidth',2);
hold on;
area(y0,mf_y_bar_Mamdani1);  % αντί για plot, για να γεμίσει με χρώμα το σύνολο Β'
title('Τελεστής Mamdani')
legend('Σύνολο Β', 'Σύνολο Β''')

% (β)-Γκαουσιανή συνάρτηση συμμετοχής--------------------------------------
mf_input2(1,:)=tri_MF(x0,4,8,13); % Σύνολο Α
mf_input2(2,:)=gauss_MF(x0,3,2); % Σύνολο Α'

% Περιγραφή εξόδου Β 
mf_output2(1,:)=tri_MF(y0,45,55,75); % Σύνολο Β

% Απεικόνιση συνόλων Α και Α'
figure(5)
plot(x0,mf_input2(1,:),'b',x0,mf_input2(2,:),'r','LineWidth',2);
title('Γραφική συνόλων Α και Α΄ ');
legend('Σύνολο Α ','Σύνολο Α΄'); 

% Απεικόνιση συνόλου Β 
figure(6)
subplot(2,1,1)
plot(y0,mf_output2(1,:),'g','LineWidth',2);
title('Γραφική συνόλου Β ');

% GMP-Mamdani
mf_x_bar2=trap_MF(x0,7,11,13,17); % Σύνολο Α'
w2=max(min(mf_x_bar2,mf_input2(1,:))); % GMP - παράγοντας w
mf_y_bar_Mamdani2=min(w2,mf_output2(1,:));  % Τελεστής συμπερασμού Mamdani - Σύνολο Β'

% Απεικόνιση του συνόλου Β' στο είκόνα 6
subplot(2,1,2);
plot(y0,mf_output2(1,:),'g','LineWidth',2); 
hold on;
area(y0,mf_y_bar_Mamdani2);  % αντί για plot, για να γεμίσει με χρώμα το σύνολο Β'
title('Τελεστής Mamdani')
legend('Σύνολο Β', 'Σύνολο Β''')

%____(5)___________________________________________________________________
% Πεδία ορισμού x,y,z με βήμα 0.01  
x=0:0.01:100;
y=0:0.01:30;
z=0:0.01:3;
z_optimal=0:1.0:3;

%___(5.1)&(5.2)____________________________________________________________
% Ομοιόμορφος διαμερισμός των χώρων με τριγωνικές συναρτήσεις με συντελεστή επικάλυψης 0.4 
overlap=0.4; % Σύντελεστής επικάλυψης κοινός για όλα τα σύνολα

% Για την ταχύτητα του αυτοκινήτου-Ux--------------------------------------
inputSets_x=4; % Αριθμός ασαφή συνόλων για το Ux

[Alpha,Beta,Gamma]=tri_MF_partition(min(x),max(x),inputSets_x,overlap);
for (k=1:inputSets_x)
  mf_x(k,:)=tri_MF(x,Alpha(k),Beta(k),Gamma(k));
  XX=overlap*ones(size(x));
end

figure(7)
plot(x,mf_x,x,XX,'k--','LineWidth',2);
title('Ασαφή σύνολα για τοv χώρο Ux')
legend('Slow','Moderate','Cruising', 'Fast','Overlap')

% Για την επιτάχυνση του αυτοκινήτου-Uy------------------------------------
inputSets_y=2; % Αριθμός ασαφή συνόλων για το Uy

[Alpha,Beta,Gamma]=tri_MF_partition(min(y),max(y),inputSets_y,overlap);
for (k=1:inputSets_y)
  mf_y(k,:)=tri_MF(y,Alpha(k),Beta(k),Gamma(k));
  YY=overlap*ones(size(y));
end

figure(8)
plot(y,mf_y,y,YY,'k--','LineWidth',2);
title('Ασαφή σύνολα για τοω χώρο Uy')
legend('Small','Large','Overlap')

% Για την δύναμη που εφαρμόζεται στο γκάζι-Uz------------------------------
inputSets_z=2; % Αριθμός ασαφή συνόλων για το Uz

[Alpha,Beta,Gamma]=tri_MF_partition(min(z),max(z),inputSets_z,overlap);
for (k=1:inputSets_z)
  mf_z(k,:)=tri_MF(z,Alpha(k),Beta(k),Gamma(k));
  ZZ=overlap*ones(size(z));
end

figure(9)
plot(z,mf_z,z,ZZ,'k--','LineWidth',2);
title('Ασαφή σύνολα για τον χώρο Uz')
legend('Small','Large','Overlap')

%___(5.3)___________________________________________________________________
% Υλοποίηση λεκτικού μετασχηματισμού <<Very>>
mf_y_very=(mf_y(1,:)).^2; % Σύνολο <<very small>> του y
mf_z_very=(mf_z(2,:)).^2; % Σύνολο <<very large>> του z

figure(10)
plot(y,mf_y_very,'g','LineWidth',2);
title('Very Small - Uy')

figure(11)
plot(z,mf_z_very,'m','LineWidth',2);
title('Very Large - Uz')

%____(6)___________________________________________________________________
% Ομοιόμορφος διαμερισμός των χώρων με γκαουσιανές συναρτήσεις με συντελεστή επικάλυψης 0.4
% Για την ταχύτητα του αυτοκινήτου-Ux--------------------------------------
temp2=(100-0)/(inputSets_x-1);

for (k=1:inputSets_x)
    meso(k)=(k-1)*temp2;
end 
sigma=(meso(k)-meso(k-1))/(2*sqrt((-2)*log(overlap)));
for (k=1:inputSets_x)
    mf_x_gauss(k,:)=exp(-0.5*(x-meso(k)).^2/(sigma^2));
end

figure(12)
plot(x,mf_x_gauss,'LineWidth',2);
title('Ασαφή σύνολα για τον χώρο Ux ')
legend('Slow','Moderate','Cruising', 'Fast')


% Για την επιτάχυνση του αυτοκινήτου-Uy------------------------------------
temp2=(30-0)/(inputSets_y-1);
meso=0;
for (k=1:inputSets_y)
    meso(k)=(k-1)*temp2;
end 
sigma=(meso(k)-meso(k-1))/(2*sqrt((-2)*log(overlap)));
for (k=1:inputSets_y)
    mf_y_gauss(k,:)=exp(-0.5*(y-meso(k)).^2/(sigma^2));
end

figure(13)
plot(y,mf_y_gauss,'LineWidth',2);
title('Ασαφή σύνολα για τον χώρο Uy')
legend('Small','Large')

% Για την δύναμη που εφαρμόζεται στο γκάζι-Uz------------------------------
temp2=(3-0)/(inputSets_z-1);
meso=0;
for (k=1:inputSets_z)
    meso(k)=(k-1)*temp2;
end 
sigma=(meso(k)-meso(k-1))/(2*sqrt((-2)*log(overlap)));
for (k=1:inputSets_z)
    mf_z_gauss(k,:)=exp(-0.5*(z-meso(k)).^2/(sigma^2));
end

figure(14)
plot(z,mf_z_gauss,'LineWidth',2);
title('Ασαφή σύνολα για τον χώρο Uz')
legend('Small','Large')

% Υλοποίηση λεκτικόυ μετασχηματισμού <<Very>> 
mf_y_very_G=(mf_y_gauss(1,:)).^2;
mf_z_very_G=(mf_z_gauss(2,:)).^2;

figure(15)
plot(y,mf_y_very_G,'g','LineWidth',2);
title('Very Small - Uy')

figure(16)
plot(z,mf_z_very_G,'m','LineWidth',2);
title('Very Large - Uz')

%____(7)___________________________________________________________________
%___(7.1)(Tριγωνικές Α,B,C,C')________________________________________________
% Ασαφή σύνολα Α' και Β'
mf_Abar_x=tri_MF(x,15,35,55);
mf_Bbar_y=tri_MF(y,9,12,15);

% (α) Υπολοσισμός των βαθμών εκπλήρωσης w1 και w2 των κανόνων
disp('7.1 --> Τριγωνικές Συναρτήσεις Συμμετοχής για τα Α,A'',Β,B'',C,C'' με βήμα διακριτοποίησης 0.01')
disp('Rule 1')
w1_7_1=w_2_inputs(mf_x(1,:),mf_Abar_x,mf_y_very,mf_Bbar_y);
disp( [ 'Ο βάθος εκλπήρωσης w1 = ' num2str(w1_7_1) ] );
disp('Rule 2')
w2_7_1=w_2_inputs(mf_x(2,:),mf_Abar_x,mf_y(2,:),mf_Bbar_y);
disp( [ 'Ο βάθος εκλπήρωσης w2 = ' num2str(w2_7_1) ] );

% (β) Εξαγωγή των ασαφή συνόλων εξόδου C1' και C2' 
C1_bar= min(w1_7_1,mf_z_very);
C2_bar= min(w2_7_1,mf_z(1,:));

% (γ) Εξαγωγή του συνολικού ασαφές συνόλου εξόδου C'
C_bar=max(C1_bar,C2_bar);

% (δ) Απεικόνιση των συνόλων C1',C2' και C'
figure(17)
% plot_all_3(x,A,Abar,y,B,Bbar,z,C,Cbar)
plot_all_3(x,mf_x(1,:),mf_Abar_x,y,mf_y_very,mf_Bbar_y,z,mf_z_very,C1_bar);
title('C1'' με βήμα 0.01 (Τριγωνικές)')
figure(18)
plot_all_3(x,mf_x(2,:),mf_Abar_x,y,mf_y(2,:),mf_Bbar_y,z,mf_z(1,:),C2_bar);
title('C2'' με βήμα 0.01 (Τριγωνικές)')
figure(19)
plot(z,C_bar,'r-o');
title('C'' με βήμα 0.01 (Τριγωνικές)')

% Έξοδος του συστήματος   
output0=sum(z.*C_bar)/sum(C_bar);
disp( [ 'Η σαφής έξοδος z* = ' num2str(output0) ] );

disp('-------------------------------------------------------------------')

%___(7.1)(Γκαουσιανές Α,B,C,C')_______________________________________________
% Ασαφή σύνολα Α' και Β'
mf_Abar_x=tri_MF(x,15,35,55);
mf_Bbar_y=tri_MF(y,9,12,15);

% (α) Υπολοσισμός των βαθμών εκπλήρωσης w1 και w2 των κανόνων
disp('7.1 --> Τριγωνικές Συναρτήσεις Συμμετοχής για τα A'',B'' και γκαουσιανές για Α,Β,C,C'' με βήμα διακριτοποίησης 0.01')
disp('Rule 1')
w1_7_1_G=w_2_inputs(mf_x_gauss(1,:),mf_Abar_x,mf_y_very_G,mf_Bbar_y);
disp( [ 'Ο βάθος εκλπήρωσης w1 = ' num2str(w1_7_1_G) ] );
disp('Rule 2')
w2_7_1_G=w_2_inputs(mf_x_gauss(2,:),mf_Abar_x,mf_y_gauss(2,:),mf_Bbar_y);
disp( [ 'Ο βάθος εκλπήρωσης w2 = ' num2str(w2_7_1_G) ] );

% (β) Εξαγωγή των ασαφή συνόλων εξόδου C1' και C2' 
C1_bar_G= min(w1_7_1_G,mf_z_very_G);
C2_bar_G= min(w2_7_1_G,mf_z_gauss(1,:));

% (γ) Εξαγωγή του συνολικού ασαφές συνόλου εξόδου C'
C_bar_G=max(C1_bar_G,C2_bar_G);

% (δ) Απεικόνιση των συνόλων C1',C2' και C'
figure(20)
% plot_all_3(x,A,Abar,y,B,Bbar,z,C,Cbar)
plot_all_3(x,mf_x_gauss(1,:),mf_Abar_x,y,mf_y_very_G,mf_Bbar_y,z,mf_z_very_G,C1_bar_G);
title('C1'' με βήμα 0.01 (Τριγωνικές & Γκαουσιανές)')
figure(21)
plot_all_3(x,mf_x_gauss(2,:),mf_Abar_x,y,mf_y_gauss(2,:),mf_Bbar_y,z,mf_z_gauss(1,:),C2_bar_G);
title('C2'' με βήμα 0.01 (Τριγωνικές & Γκαουσιανές)')
figure(22)
plot(z,C_bar_G,'r-o');
title('C'' με βήμα 0.01 (Τριγωνικές & Γκαουσιανές)')

% Έξοδος του συστήματος   
output00=sum(z.*C_bar_G)/sum(C_bar_G);
disp( [ 'Η σαφής έξοδος z* = ' num2str(output00) ] );

disp('-------------------------------------------------------------------')

%___(7.2)(Τριγωνικές Α,Β,C,C')________________________________________________
disp('7.2 --> Τριγωνικές Συναρτήσεις Συμμετοχής για τα Α,A'',Β,B'',C,C'' με βήμα διακριτοποίησης 1.0')

% Υπολογισμός συνάρτησης συμμετοχής για το z
[Alpha,Beta,Gamma]=tri_MF_partition(min(z_optimal),max(z_optimal),inputSets_z,overlap);
for (k=1:inputSets_z)
  mf_z_optimal(k,:)=tri_MF(z_optimal,Alpha(k),Beta(k),Gamma(k));
  ZZ=overlap*ones(size(z_optimal));
end

mf_z_very_optimal=(mf_z_optimal(2,:)).^2; % Σύνολο <<very large>> του z

% Ασαφή σύνολα εξόδου C1' και C2'
C1_optimal=min(w1_7_1,mf_z_very_optimal);
C2_optimal=min(w2_7_1,mf_z_optimal(1,:));

% Ασαφή σύνολο εξόδου C'
C_bar_optimal=max(C1_optimal,C2_optimal);

% Οπτικοποίηση των C1',C2' και C'
figure(23)
% plot_all_3(x,A,Abar,y,B,Bbar,z,C,Cbar)
plot_all_3(x,mf_x(1,:),mf_Abar_x,y,mf_y_very,mf_Bbar_y,z_optimal,mf_z_very_optimal,C1_optimal);
title('C1'' με βήμα 1.0 (Τριγωνικές)')
figure(24)
plot_all_3(x,mf_x(2,:),mf_Abar_x,y,mf_y(2,:),mf_Bbar_y,z_optimal,mf_z_optimal(1,:),C2_optimal);
title('C2'' με βήμα 1.0 (Τριγωνικές)')
figure(25)
plot(z_optimal,C_bar_optimal,'r-o');
title('C'' με βήμα 1.0 (Τριγωνικές)')

% Έξοδος του συστήματος  
output1=sum(z_optimal.*C_bar_optimal)/sum(C_bar_optimal);
disp( [ 'Η σαφής έξοδος z* = ' num2str(output1) ] );

disp('-------------------------------------------------------------------')

%___(7.2)(Γκαουσιανές Α,Β,C,C')________________________________________________
disp('7.2 --> Τριγωνικές Συναρτήσεις Συμμετοχής για τα A'',B'' και γκαουσιανές για Α,Β,C,C'' με βήμα διακριτοποίησης 1.0')

% Υπολογισμός συνάρτησης συμμετοχής για το z
temp2=(3-0)/(inputSets_z-1);
meso=0;
for (k=1:inputSets_z)
    meso(k)=(k-1)*temp2;
end 
sigma=(meso(k)-meso(k-1))/(2*sqrt((-2)*log(overlap)));
for (k=1:inputSets_z)
    mf_z_gauss_optimal(k,:)=exp(-0.5*(z_optimal-meso(k)).^2/(sigma^2));
end

mf_z_very_optimal_G=(mf_z_gauss_optimal(2,:)).^2; % Σύνολο <<very large>> του z

% Ασαφή σύνολα εξόδου C1' και C2'
C1_optimal_G=min(w1_7_1_G,mf_z_very_optimal_G);
C2_optimal_G=min(w2_7_1_G,mf_z_gauss_optimal(1,:));

% Ασαφή σύνολο εξόδου C'
C_bar_optimal_G=max(C1_optimal_G,C2_optimal_G);

% Οπτικοποίηση των C1',C2' και C'
figure(26)
% plot_all_3(x,A,Abar,y,B,Bbar,z,C,Cbar)
plot_all_3(x,mf_x_gauss(1,:),mf_Abar_x,y,mf_y_very_G,mf_Bbar_y,z_optimal,mf_z_very_optimal_G,C1_optimal_G);
title('C1'' με βήμα 1.0 (Τριγωνικές & Γκαουσιανές)')
figure(27)
plot_all_3(x,mf_x_gauss(2,:),mf_Abar_x,y,mf_y_gauss(2,:),mf_Bbar_y,z_optimal,mf_z_gauss_optimal(1,:),C2_optimal_G);
title('C2'' με βήμα 1.0 (Τριγωνικές & Γκαουσιανές)')
figure(28)
plot(z_optimal,C_bar_optimal_G,'r-o');
title('C'' με βήμα 1.0 (Τριγωνικές & Γκαουσιανές)')

% Έξοδος του συστήματος  
output11=sum(z_optimal.*C_bar_optimal_G)/sum(C_bar_optimal_G);
disp( [ 'Η σαφής έξοδος z* = ' num2str(output11) ] );

disp('-------------------------------------------------------------------')

%___(7.3)(Τριγωνικές Α,Β,C,C')________________________________________________
disp('7.3 --> Ζεύγος ασαφών singletons με τριγωνικές Α,Β,C,C'' και βήμα διακριτοποίησης 0.01')

A_bar=zeros(size(x));     
A_bar(find(x==35))=1;     
B_bar=zeros(size(y));      
B_bar(find(y==12))=1; 

disp('Rule 1')
w1_7_3=w_2_inputs(mf_x(1,:),A_bar,mf_y_very,B_bar);
disp( [ 'Ο βάθος εκλπήρωσης w1 = ' num2str(w1_7_3) ] );
disp('Rule 2')
w2_7_3=w_2_inputs(mf_x(2,:),A_bar,mf_y(2,:),B_bar);
disp( [ 'Ο βάθος εκλπήρωσης w2 = ' num2str(w2_7_3) ] );


% Ασαφή σύνολα εξόδου C1' και C2'
C1_7_3= min(w1_7_3,mf_z_very);
C2_7_3= min(w2_7_3,mf_z(1,:));

% Ασαφή σύνολο εξόδου C'
C_7_3=max(C1_7_3,C2_7_3);

% Οπτικοποίηση των C1',C2' και C'
figure(29)
plot_all_3(x,mf_x(1,:),A_bar,y,mf_y_very,B_bar,z,mf_z_very,C1_7_3);
title('C1'' (Singletons & Τριγωνικές)')
figure(30)
plot_all_3(x,mf_x(2,:),A_bar,y,mf_y(2,:),B_bar,z,mf_z(1,:),C2_7_3);
title('C2'' (Singletons & Τριγωνικές)')
figure(31)
plot(z,C_7_3,'r-o');
title('C'' (Singletons & Τριγωνικές)')

% Έξοδος του συστήματος  
output2=sum(z.*C_7_3)/sum(C_7_3);
disp( [ 'Η σαφής έξοδος z* = ' num2str(output2) ] );

disp('-------------------------------------------------------------------')

%___(7.3)(Γκαουσιανές Α,Β,C,C')________________________________________________
disp('7.3 --> Ζεύγος ασαφων singletons με γκαουσιανές Α,Β,C,C'' και βήμα διακριτοποίησης 0.01')

A_bar=zeros(size(x));     
A_bar(find(x==35))=1;     
B_bar=zeros(size(y));      
B_bar(find(y==12))=1; 

disp('Rule 1')
w1_7_3_G=w_2_inputs(mf_x_gauss(1,:),A_bar,mf_y_very_G,B_bar);
disp( [ 'Ο βάθος εκλπήρωσης w1 = ' num2str(w1_7_3_G) ] );
disp('Rule 2')
w2_7_3_G=w_2_inputs(mf_x_gauss(2,:),A_bar,mf_y_gauss(2,:),B_bar);
disp( [ 'Ο βάθος εκλπήρωσης w2 = ' num2str(w2_7_3_G) ] );


% Ασαφή σύνολα εξόδου C1' και C2'
C1_7_3_G= min(w1_7_3_G,mf_z_very_G);
C2_7_3_G= min(w2_7_3_G,mf_z_gauss(1,:));

% Ασαφή σύνολο εξόδου C'
C_7_3_G=max(C1_7_3_G,C2_7_3_G);

% Οπτικοποίηση των C1',C2' και C'
figure(32)
plot_all_3(x,mf_x_gauss(1,:),A_bar,y,mf_y_very_G,B_bar,z,mf_z_very_G,C1_7_3_G);
title('C1'' (Singletons & Γκαουσιανές)')
figure(33)
plot_all_3(x,mf_x_gauss(2,:),A_bar,y,mf_y_gauss(2,:),B_bar,z,mf_z_gauss(1,:),C2_7_3_G);
title('C2'' (Singletons & Γκαουσιανές)')
figure(34)
plot(z,C_7_3_G,'r-o');
title('C'' (Singletons & Γκαουσιανές)')

% Έξοδος του συστήματος  
output22=sum(z.*C_7_3_G)/sum(C_7_3_G);
disp( [ 'Η σαφής έξοδος z* = ' num2str(output22) ] );

disp('-------------------------------------------------------------------')

%___(8)(7.1)(Tριγωνικές Α,Β,C,C')_____________________________________________
disp('8 --> Γκαουσιανές Συναρτήσεις Συμμετοχής για τα Α'',Β'' και τριγωνικές για τα Α,Β,C,C'' με βήμα διακριτοποίησης 0.01')

mf_A_8=gauss_MF(x,35,8);
mf_B_8=gauss_MF(y,12,5);

disp('Rule 1')
w1_8=w_2_inputs(mf_x(1,:),mf_A_8,mf_y_very,mf_B_8);
disp( [ 'Ο βάθος εκλπήρωσης w1 = ' num2str(w1_8) ] )
disp('Rule 2')
w2_8=w_2_inputs(mf_x(2,:),mf_A_8,mf_y(2,:),mf_B_8);
disp( [ 'Ο βάθος εκλπήρωσης w2 = ' num2str(w2_8) ] )

% Ασαφή σύνολα εξόδου C1' και C2'
C1_8= min(w1_8,mf_z_very);
C2_8= min(w2_8,mf_z(1,:));

% Ασαφή σύνολο εξόδου C'
C_8=max(C1_8,C2_8);

% Οπτικοποίηση των C1',C2' και C'
figure(35)
plot_all_3(x,mf_x(1,:),mf_A_8,y,mf_y_very,mf_B_8,z,mf_z_very,C1_8);
title('C1'' με βήμα 0.01 (Γκαουσιανές & Τριγωνικές)')
figure(36)
plot_all_3(x,mf_x(2,:),mf_A_8,y,mf_y(2,:),mf_B_8,z,mf_z(1,:),C2_8);
title('C2'' με βήμα 0.01 (Γκαουσιανές & Τριγωνικές)')
figure(37)
plot(z,C_8,'r-o');
title('C'' με βήμα 0.01 (Γκαουσιανές & Τριγωνικές)')

% Έξοδος του συστήματος  
output3=sum(z.*C_8)/sum(C_8);
disp( [ 'Η σαφής έξοδος z* = ' num2str(output3) ] );

disp('-------------------------------------------------------------------')

%___(8)(7.1)(Γκαουσιανές Α,Β,C,C')_____________________________________________
disp('8 --> Γκαουσιανές Συναρτήσεις Συμμετοχής για τα Α,Α'',Β,Β'',C,C''με βήμα διακριτοποίησης 0.01')

mf_A_8=gauss_MF(x,35,8);
mf_B_8=gauss_MF(y,12,5);

disp('Rule 1')
w1_8_G=w_2_inputs(mf_x_gauss(1,:),mf_A_8,mf_y_very_G,mf_B_8);
disp( [ 'Ο βάθος εκλπήρωσης w1 = ' num2str(w1_8_G) ] )
disp('Rule 2')
w2_8_G=w_2_inputs(mf_x_gauss(2,:),mf_A_8,mf_y_gauss(2,:),mf_B_8);
disp( [ 'Ο βάθος εκλπήρωσης w2 = ' num2str(w2_8_G) ] )

% Ασαφή σύνολα εξόδου C1' και C2'
C1_8_G= min(w1_8_G,mf_z_very_G);
C2_8_G= min(w2_8_G,mf_z_gauss(1,:));

% Ασαφή σύνολο εξόδου C'
C_8_G=max(C1_8_G,C2_8_G);

% Οπτικοποίηση των C1',C2' και C'
figure(38)
plot_all_3(x,mf_x_gauss(1,:),mf_A_8,y,mf_y_very_G,mf_B_8,z,mf_z_very_G,C1_8_G);
title('C1'' με βήμα 0.01 (Γκαουσιανές)')
figure(39)
plot_all_3(x,mf_x_gauss(2,:),mf_A_8,y,mf_y_gauss(2,:),mf_B_8,z,mf_z_gauss(1,:),C2_8_G);
title('C2'' με βήμα 0.01 (Γκαουσιανές)')
figure(40)
plot(z,C_8_G,'r-o');
title('C'' με βήμα 0.01 (Γκαουσιανές)')

% Έξοδος του συστήματος  
output33=sum(z.*C_8_G)/sum(C_8_G);
disp( [ 'Η σαφής έξοδος z* = ' num2str(output33) ] );

disp('-------------------------------------------------------------------')

%___(8)(7.2)(Tριγωνικές Α,Β,C,C')_____________________________________________
disp('8 --> Γκαουσιανές Συναρτήσεις Συμμετοχής για τα Α'',Β'' και τριγωνικές για τα Α,Β,C,C'' με βήμα διακριτοποίησης 1.0')

% Ασαφή σύνολα εξόδου C1' και C2'
C1_8b= min(w1_8,mf_z_very_optimal);
C2_8b= min(w2_8,mf_z_optimal(1,:));

% Ασαφή σύνολο εξόδου C'
C_8b=max(C1_8b,C2_8b);

% Οπτικοποίηση των C1',C2' και C'
figure(41)
plot_all_3(x,mf_x(1,:),mf_A_8,y,mf_y_very,mf_B_8,z_optimal,mf_z_very_optimal,C1_8b);
title('C1'' με βήμα 1.0 (Γκαουσιανές & Τριγωνικές)')
figure(42)
plot_all_3(x,mf_x(2,:),mf_A_8,y,mf_y(2,:),mf_B_8,z_optimal,mf_z_optimal(1,:),C2_8b);
title('C2'' με βήμα 1.0 (Γκαουσιανές & Τριγωνικές)')
figure(43)
plot(z_optimal,C_8b,'r-o');
title('C'' με βήμα 1.0 (Γκαουσιανές & Τριγωνικές)')

% Έξοδος του συστήματος  
output4=sum(z_optimal.*C_8b)/sum(C_8b);
disp( [ 'Η σαφής έξοδος z* = ' num2str(output4) ] );

disp('-------------------------------------------------------------------')

%___(8)(7.2)(Γκαουσιανές Α,Β,C,C')_____________________________________________
disp('8 --> Γκαουσιανές Συναρτήσεις Συμμετοχής για τα Α,Α'',Β,Β'',C,C'' με βήμα διακριτοποίησης 1.0')

% Ασαφή σύνολα εξόδου C1' και C2'
C1_8b_G= min(w1_8_G,mf_z_very_optimal_G);
C2_8b_G= min(w2_8_G,mf_z_gauss_optimal(1,:));

% Ασαφή σύνολο εξόδου C'
C_8b_G=max(C1_8b_G,C2_8b_G);

% Οπτικοποίηση των C1',C2' και C'
figure(44)
plot_all_3(x,mf_x_gauss(1,:),mf_A_8,y,mf_y_very_G,mf_B_8,z_optimal,mf_z_very_optimal_G,C1_8b_G);
title('C1'' με βήμα 1.0 (Γκαουσιανές)')
figure(45)
plot_all_3(x,mf_x_gauss(2,:),mf_A_8,y,mf_y_gauss(2,:),mf_B_8,z_optimal,mf_z_gauss_optimal(1,:),C2_8b_G);
title('C2'' με βήμα 1.0 (Γκαουσιανές)')
figure(46)
plot(z_optimal,C_8b_G,'r-o');
title('C'' με βήμα 1.0 (Γκαουσιανές)')

% Έξοδος του συστήματος  
output44=sum(z_optimal.*C_8b_G)/sum(C_8b_G);
disp( [ 'Η σαφής έξοδος z* = ' num2str(output44) ] );
