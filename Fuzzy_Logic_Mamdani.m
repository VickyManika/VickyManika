%--------------------------------------------------------------------------
% Αναγνώριση συστήματος με ασαφές σύστημα τύπου Mamdani.
%--------------------------------------------------------------------------
clc;
close all;
clear all;
% Μέρος 1------------------------------------------------------------------
%(1.1)_____________________________________________________________________
% Βασικές Παράμετροι
% Παράμετροι για την είσοδο και έξοδο
ruleNumber = 7;
inputSets = ruleNumber;
outputSets = 5;
overlappingCoefficient = 0.5;
%--------------------------------------------------------------------------
x=0:1:360;
y=linspace(-0.4,1,361);
z=0.5*sin(2*pi*x/360)+0.5*(sin(2*pi*(x+30)/360)).^2;
figure(1)
plot(x,z);
title('Γραφική παράσταση φυσικού συστήματος')
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εισόδου
figure(2);
axis([min(x) max(x) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εισόδου-x');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(x),max(x),inputSets,overlappingCoefficient);
for (k=1:inputSets)
    mf_x(k,:)=tri_MF(x,Alpha(k),Beta(k),Gamma(k));
    plot(x,mf_x(k,:))
end
%-----------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εξόδου
figure(3);
axis([min(y) max(y) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εξόδου-y');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(y),max(y),outputSets,overlappingCoefficient);
for (k=1:outputSets)
    mf_y(k,:)=tri_MF(y,Alpha(k),Beta(k),Gamma(k));
    plot(y,mf_y(k,:))
end
%-----------------------------------------------------------------------
% Βάση κανόνων, αντιστοίχηση των ασαφών συνόλων στα σύνολα των κανόνων
In(1,:)=mf_x(1,:);    In(2,:)=mf_x(2,:);  In(3,:)=mf_x(3,:);  In(4,:)=mf_x(4,:);
In(5,:)=mf_x(5,:);    In(6,:)=mf_x(6,:);  In(7,:)=mf_x(7,:);    
Out(1,:)=mf_y(3,:);   Out(2,:)=mf_y(5,:); Out(3,:)=mf_y(4,:); Out(4,:)=mf_y(3,:);
Out(5,:)=mf_y(2,:);   Out(6,:)=mf_y(1,:); Out(7,:)=mf_y(2,:); 
%-----------------------------------------------------------------------
for j=1:length(x)
    for i=1:ruleNumber
        Bbar(i,:)=min(In(i,j),Out(i,:));
    end    
    total=Bbar(1,:);
    for i=2:ruleNumber
        total=max(total,Bbar(i,:));
    end
    output(j)=sum(y.*total)/sum(total);
end

figure(4);
plot(x,z,'b',x,output,'r--');
STR=sprintf('Συντελεστής Επικάλυψης %.2f: Γράφημα Σύγκρισης',overlappingCoefficient);
title(STR);
legend('Γραφική φυσικού συστήματος','Έξοδος ασαφούς συστήματος')
clc

%(1.2)_____________________________________________________________________
% < < γ=0.3 > >------------------------------------------------------------
overlappingCoefficient_1 = 0.3;
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εισόδου
figure(5);
axis([min(x) max(x) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εισόδου-x');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(x),max(x),inputSets,overlappingCoefficient_1);
for (k=1:inputSets)
    mf_x(k,:)=tri_MF(x,Alpha(k),Beta(k),Gamma(k));
    plot(x,mf_x(k,:))
end
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εξόδου
figure(6);
axis([min(y) max(y) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εξόδου-y');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(y),max(y),outputSets,0.5);
for (k=1:outputSets)
    mf_y(k,:)=tri_MF(y,Alpha(k),Beta(k),Gamma(k));
    plot(y,mf_y(k,:))
end
%--------------------------------------------------------------------------
% Βάση κανόνων, αντιστοίχηση των ασαφών συνόλων στα σύνολα των κανόνων
In(1,:)=mf_x(1,:);    In(2,:)=mf_x(2,:);  In(3,:)=mf_x(3,:);  In(4,:)=mf_x(4,:);
In(5,:)=mf_x(5,:);    In(6,:)=mf_x(6,:);  In(7,:)=mf_x(7,:);    
Out(1,:)=mf_y(3,:);   Out(2,:)=mf_y(5,:); Out(3,:)=mf_y(4,:); Out(4,:)=mf_y(3,:);
Out(5,:)=mf_y(2,:);   Out(6,:)=mf_y(1,:); Out(7,:)=mf_y(2,:); 
%--------------------------------------------------------------------------
for j=1:length(x)
    for i=1:ruleNumber
        Bbar(i,:)=min(In(i,j),Out(i,:));
    end    
    total=Bbar(1,:);
    for i=2:ruleNumber
        total=max(total,Bbar(i,:));
    end
    output(j)=sum(y.*total)/sum(total);
end

figure(7);
plot(x,z,'b',x,output,'r--');
STR=sprintf('Συντελεστής Επικάλυψης %.2f: Γράφημα Σύγκρισης',overlappingCoefficient_1);
title(STR);
legend('Γραφική φυσικού συστήματος','Έξοδος ασαφούς συστήματος')
clc

% < < γ=0.4 > > -----------------------------------------------------------
overlappingCoefficient_2 = 0.4;
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εισόδου
figure(8);
axis([min(x) max(x) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εισόδου-x');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(x),max(x),inputSets,overlappingCoefficient_2);
for (k=1:inputSets)
    mf_x(k,:)=tri_MF(x,Alpha(k),Beta(k),Gamma(k));
    plot(x,mf_x(k,:))
end
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εξόδου
figure(9);
axis([min(y) max(y) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εξόδου-y');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(y),max(y),outputSets,overlappingCoefficient_2);
for (k=1:outputSets)
    mf_y(k,:)=tri_MF(y,Alpha(k),Beta(k),Gamma(k));
    plot(y,mf_y(k,:))
end
%--------------------------------------------------------------------------
% Βάση κανόνων, αντιστοίχηση των ασαφών συνόλων στα σύνολα των κανόνων
In(1,:)=mf_x(1,:);    In(2,:)=mf_x(2,:);  In(3,:)=mf_x(3,:);  In(4,:)=mf_x(4,:);
In(5,:)=mf_x(5,:);    In(6,:)=mf_x(6,:);  In(7,:)=mf_x(7,:);    
Out(1,:)=mf_y(3,:);   Out(2,:)=mf_y(5,:); Out(3,:)=mf_y(4,:); Out(4,:)=mf_y(3,:);
Out(5,:)=mf_y(2,:);   Out(6,:)=mf_y(1,:); Out(7,:)=mf_y(2,:); 
%--------------------------------------------------------------------------
for j=1:length(x)
    for i=1:ruleNumber
        Bbar(i,:)=min(In(i,j),Out(i,:));
    end    
    total=Bbar(1,:);
    for i=2:ruleNumber
        total=max(total,Bbar(i,:));
    end
    output(j)=sum(y.*total)/sum(total);
end

figure(10);
plot(x,z,'b',x,output,'r--');
STR=sprintf('Συντελεστής Επικάλυψης %.2f: Γράφημα Σύγκρισης',overlappingCoefficient_2);
title(STR);
legend('Γραφική φυσικού συστήματος','Έξοδος ασαφούς συστήματος')
clc
% < < γ=0.6 > > ----------------------------------------------------------- 
overlappingCoefficient_3 = 0.6;
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εισόδου
figure(11);
axis([min(x) max(x) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εισόδου-x');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(x),max(x),inputSets,overlappingCoefficient_3);
for (k=1:inputSets)
    mf_x(k,:)=tri_MF(x,Alpha(k),Beta(k),Gamma(k));
    plot(x,mf_x(k,:))
end
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εξόδου
figure(12);
axis([min(y) max(y) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εξόδου-y');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(y),max(y),outputSets,overlappingCoefficient_3);
for (k=1:outputSets)
    mf_y(k,:)=tri_MF(y,Alpha(k),Beta(k),Gamma(k));
    plot(y,mf_y(k,:))
end
%-----------------------------------------------------------------------
% Βάση κανόνων, αντιστοίχηση των ασαφών συνόλων στα σύνολα των κανόνων
In(1,:)=mf_x(1,:);    In(2,:)=mf_x(2,:);  In(3,:)=mf_x(3,:);  In(4,:)=mf_x(4,:);
In(5,:)=mf_x(5,:);    In(6,:)=mf_x(6,:);  In(7,:)=mf_x(7,:);    
Out(1,:)=mf_y(3,:);   Out(2,:)=mf_y(5,:); Out(3,:)=mf_y(4,:); Out(4,:)=mf_y(3,:);
Out(5,:)=mf_y(2,:);   Out(6,:)=mf_y(1,:); Out(7,:)=mf_y(2,:);
%--------------------------------------------------------------------------
for j=1:length(x)
    for i=1:ruleNumber
        Bbar(i,:)=min(In(i,j),Out(i,:));
    end    
    total=Bbar(1,:);
    for i=2:ruleNumber
        total=max(total,Bbar(i,:));
    end
    output(j)=sum(y.*total)/sum(total);
end

figure(13);
plot(x,z,'b',x,output,'r--');
STR=sprintf('Συντελεστής Επικάλυψης %.2f: Γράφημα Σύγκρισης',overlappingCoefficient_3);
title(STR);
legend('Γραφική φυσικού συστήματος','Έξοδος ασαφούς συστήματος')
clc

%(1.3)_____________________________________________________________________
% | Πρώτη προσέγγιση | --> 9 σύνολα εισόδου-5 σύνολα εξόδου με γ=0.5
% Παράμετροι για την είσοδο και έξοδο
ruleNumber = 9;
inputSets = ruleNumber;
outputSets = 5;
overlappingCoefficient = 0.5;
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εισόδου
figure(14);
axis([min(x) max(x) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εισόδου-x');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(x),max(x),inputSets,overlappingCoefficient);
for (k=1:inputSets)
    mf_x(k,:)=tri_MF(x,Alpha(k),Beta(k),Gamma(k));
    plot(x,mf_x(k,:))
end
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εξόδου
figure(15);
axis([min(y) max(y) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εξόδου-y');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(y),max(y),outputSets,overlappingCoefficient);
for (k=1:outputSets)
    mf_y(k,:)=tri_MF(y,Alpha(k),Beta(k),Gamma(k));
    plot(y,mf_y(k,:))
end
%--------------------------------------------------------------------------
% Βάση κανόνων, αντιστοίχηση των ασαφών συνόλων στα σύνολα των κανόνων
In(1,:)=mf_x(1,:);    In(2,:)=mf_x(2,:);  In(3,:)=mf_x(3,:);  In(4,:)=mf_x(4,:);
In(5,:)=mf_x(5,:);    In(6,:)=mf_x(6,:);    In(7,:)=mf_x(7,:);  In(8,:)=mf_x(8,:);  In(9,:)=mf_x(9,:);   
Out(1,:)=mf_y(3,:);   Out(2,:)=mf_y(5,:); Out(3,:)=mf_y(5,:); Out(4,:)=mf_y(3,:);
Out(5,:)=mf_y(2,:);   Out(6,:)=mf_y(3,:); Out(7,:)=mf_y(2,:); Out(8,:)=mf_y(1,:); Out(9,:)=mf_y(2,:); 
%-----------------------------------------------------------------------
for j=1:length(x)
    for i=1:ruleNumber
        Bbar(i,:)=min(In(i,j),Out(i,:));
    end    
    total=Bbar(1,:);
    for i=2:ruleNumber
        total=max(total,Bbar(i,:));
    end
    output(j)=sum(y.*total)/sum(total);
end

figure(16);
plot(x,z,'b',x,output,'r--');
title('1η Προσέγγιση: 9 σύνολα εισόδου - 5 σύνολα εξόδου')
legend('Γραφική φυσικού συστήματος','Έξοδος ασαφούς συστήματος')
clc
%--------------------------------------------------------------------------
% | Δεύτερη προσέγγιση | --> 15 σύνολα εισόδου-5 σύνολα εξόδου με γ=0.5
% Παράμετροι για την είσοδο και έξοδο
ruleNumber = 15;
inputSets = ruleNumber;
outputSets = 5;
overlappingCoefficient = 0.5;
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εισόδου
figure(17);
axis([min(x) max(x) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εισόδου-x');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(x),max(x),inputSets,overlappingCoefficient);
for (k=1:inputSets)
    mf_x(k,:)=tri_MF(x,Alpha(k),Beta(k),Gamma(k));
    plot(x,mf_x(k,:))
end
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εξόδου
figure(18);
axis([min(y) max(y) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εξόδου-y');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(y),max(y),outputSets,overlappingCoefficient);
for (k=1:outputSets)
    mf_y(k,:)=tri_MF(y,Alpha(k),Beta(k),Gamma(k));
    plot(y,mf_y(k,:))
end
%--------------------------------------------------------------------------
% Βάση κανόνων, αντιστοίχηση των ασαφών συνόλων στα σύνολα των κανόνων
In(1,:)=mf_x(1,:);    In(2,:)=mf_x(2,:);  In(3,:)=mf_x(3,:);  In(4,:)=mf_x(4,:);
In(5,:)=mf_x(5,:);    In(6,:)=mf_x(6,:);  In(7,:)=mf_x(7,:);  In(8,:)=mf_x(8,:);  In(9,:)=mf_x(9,:);   
In(10,:)=mf_x(10,:); In(11,:)=mf_x(11,:); In(12,:)=mf_x(12,:); In(13,:)=mf_x(13,:); In(14,:)=mf_x(14,:); In(15,:)=mf_x(15,:); 
Out(1,:)=mf_y(3,:);   Out(2,:)=mf_y(4,:); Out(3,:)=mf_y(5,:); Out(4,:)=mf_y(5,:);
Out(5,:)=mf_y(4,:);   Out(6,:)=mf_y(3,:); Out(7,:)=mf_y(3,:); Out(8,:)=mf_y(2,:); Out(9,:)=mf_y(3,:); 
Out(10,:)=mf_y(2,:); Out(11,:)=mf_y(2,:); Out(12,:)=mf_y(2,:); Out(13,:)=mf_y(1,:); Out(14,:)=mf_y(1,:); Out(15,:)=mf_y(2,:); 
%--------------------------------------------------------------------------
for j=1:length(x)
    for i=1:ruleNumber
        Bbar(i,:)=min(In(i,j),Out(i,:));
    end    
    total=Bbar(1,:);
    for i=2:ruleNumber
        total=max(total,Bbar(i,:));
    end
    output(j)=sum(y.*total)/sum(total);
end

figure(19);
plot(x,z,'b',x,output,'r--');
title('2η Προσέγγιση: 15 σύνολα εισόδου - 5 σύνολα εξόδου')
legend('Γραφική φυσικού συστήματος','Έξοδος ασαφούς συστήματος')
clc

%--------------------------------------------------------------------------
% | Τρίτη προσέγγιση | --> 8 σύνολα εισόδου-6 σύνολα εξόδου με γ=0.5
% Παράμετροι για την είσοδο και έξοδο
ruleNumber = 8;
inputSets = ruleNumber;
outputSets = 6;
overlappingCoefficient = 0.5;
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εισόδου
figure(20);
axis([min(x) max(x) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εισόδου-x');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(x),max(x),inputSets,overlappingCoefficient);
for (k=1:inputSets)
    mf_x(k,:)=tri_MF(x,Alpha(k),Beta(k),Gamma(k));
    plot(x,mf_x(k,:))
end
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εξόδου
figure(21);
axis([min(y) max(y) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εξόδου-y');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(y),max(y),outputSets,overlappingCoefficient);
for (k=1:outputSets)
    mf_y(k,:)=tri_MF(y,Alpha(k),Beta(k),Gamma(k));
    plot(y,mf_y(k,:))
end
%--------------------------------------------------------------------------
% Βάση κανόνων, αντιστοίχηση των ασαφών συνόλων στα σύνολα των κανόνων
In(1,:)=mf_x(1,:);    In(2,:)=mf_x(2,:);  In(3,:)=mf_x(3,:);  In(4,:)=mf_x(4,:);
In(5,:)=mf_x(5,:);    In(6,:)=mf_x(6,:);    In(7,:)=mf_x(7,:); In(8,:)=mf_x(8,:);  
Out(1,:)=mf_y(4,:);   Out(2,:)=mf_y(6,:); Out(3,:)=mf_y(6,:); Out(4,:)=mf_y(3,:);
Out(5,:)=mf_y(3,:);   Out(6,:)=mf_y(1,:); Out(7,:)=mf_y(1,:); Out(8,:)=mf_y(2,:); 
%--------------------------------------------------------------------------
for j=1:length(x)
    for i=1:ruleNumber
        Bbar(i,:)=min(In(i,j),Out(i,:));
    end    
    total=Bbar(1,:);
    for i=2:ruleNumber
        total=max(total,Bbar(i,:));
    end
    output(j)=sum(y.*total)/sum(total);
end

figure(22);
plot(x,z,'b',x,output,'r--');
title('3η Προσέγγιση: 8 σύνολα εισόδου - 6 σύνολα εξόδου')
legend('Γραφική φυσικού συστήματος','Έξοδος ασαφούς συστήματος')
clc

%--------------------------------------------------------------------------
% | Τέταρτη προσέγγιση | --> 9 σύνολα εισόδου-7 σύνολα εξόδου με γ=0.5
% Παράμετροι για την είσοδο και έξοδο
ruleNumber = 9;
inputSets = ruleNumber;
outputSets = 7;
overlappingCoefficient = 0.5;
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εισόδου
figure(23);
axis([min(x) max(x) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εισόδου-x');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(x),max(x),inputSets,overlappingCoefficient);
for (k=1:inputSets)
    mf_x(k,:)=tri_MF(x,Alpha(k),Beta(k),Gamma(k));
    plot(x,mf_x(k,:))
end
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εξόδου
figure(24);
axis([min(y) max(y) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εξόδου-y');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(y),max(y),outputSets,overlappingCoefficient);
for (k=1:outputSets)
    mf_y(k,:)=tri_MF(y,Alpha(k),Beta(k),Gamma(k));
    plot(y,mf_y(k,:))
end
%--------------------------------------------------------------------------
% Βάση κανόνων, αντιστοίχηση των ασαφών συνόλων στα σύνολα των κανόνων
In(1,:)=mf_x(1,:);    In(2,:)=mf_x(2,:);  In(3,:)=mf_x(3,:);  In(4,:)=mf_x(4,:);
In(5,:)=mf_x(5,:);    In(6,:)=mf_x(6,:);  In(7,:)=mf_x(7,:);  In(8,:)=mf_x(8,:);  In(9,:)=mf_x(9,:);  
Out(1,:)=mf_y(4,:);   Out(2,:)=mf_y(7,:); Out(3,:)=mf_y(7,:); Out(4,:)=mf_y(4,:);
Out(5,:)=mf_y(3,:);   Out(6,:)=mf_y(3,:); Out(7,:)=mf_y(2,:); Out(8,:)=mf_y(1,:); Out(9,:)=mf_y(2,:); 
%--------------------------------------------------------------------------
for j=1:length(x)
    for i=1:ruleNumber
        Bbar(i,:)=min(In(i,j),Out(i,:));
    end    
    total=Bbar(1,:);
    for i=2:ruleNumber
        total=max(total,Bbar(i,:));
    end
    output(j)=sum(y.*total)/sum(total);
end

figure(25);
plot(x,z,'b',x,output,'r--');
title('4η Προσέγγιση: 9 σύνολα εισόδου - 7 σύνολα εξόδου')
legend('Γραφική φυσικού συστήματος','Έξοδος ασαφούς συστήματος')
clc
%==========================================================================
%==========================================================================
%% Οι προηγούμενες προσεγγίσεις με συντελεστή επικάλυψης 0.3, 0.4, 0.6   %%
a=input('Συντελεστής επικάλυψης= ');
% | Πρώτη προσέγγιση | --> 9 σύνολα εισόδου-5 σύνολα εξόδου
% Παράμετροι για την είσοδο και έξοδο
ruleNumber = 9;
inputSets = ruleNumber;
outputSets = 5;
overlappingCoefficient = a;
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εισόδου
figure(26);
axis([min(x) max(x) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εισόδου-x');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(x),max(x),inputSets,overlappingCoefficient);
for (k=1:inputSets)
    mf_x(k,:)=tri_MF(x,Alpha(k),Beta(k),Gamma(k));
    plot(x,mf_x(k,:))
end
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εξόδου
figure(27);
axis([min(y) max(y) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εξόδου-y');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(y),max(y),outputSets,overlappingCoefficient);
for (k=1:outputSets)
    mf_y(k,:)=tri_MF(y,Alpha(k),Beta(k),Gamma(k));
    plot(y,mf_y(k,:))
end
%--------------------------------------------------------------------------
% Βάση κανόνων, αντιστοίχηση των ασαφών συνόλων στα σύνολα των κανόνων
In(1,:)=mf_x(1,:);    In(2,:)=mf_x(2,:);  In(3,:)=mf_x(3,:);  In(4,:)=mf_x(4,:);
In(5,:)=mf_x(5,:);    In(6,:)=mf_x(6,:);    In(7,:)=mf_x(7,:);  In(8,:)=mf_x(8,:);  In(9,:)=mf_x(9,:);   
Out(1,:)=mf_y(3,:);   Out(2,:)=mf_y(5,:); Out(3,:)=mf_y(5,:); Out(4,:)=mf_y(3,:);
Out(5,:)=mf_y(2,:);   Out(6,:)=mf_y(3,:); Out(7,:)=mf_y(2,:); Out(8,:)=mf_y(1,:); Out(9,:)=mf_y(2,:); 
%-----------------------------------------------------------------------
for j=1:length(x)
    for i=1:ruleNumber
        Bbar(i,:)=min(In(i,j),Out(i,:));
    end    
    total=Bbar(1,:);
    for i=2:ruleNumber
        total=max(total,Bbar(i,:));
    end
    output(j)=sum(y.*total)/sum(total);
end

figure(28);
plot(x,z,'b',x,output,'r--');
STR=sprintf('1η Προσέγγιση: 9 σύνολα εισόδου- 5 σύνολα εξόδου με γ= %.2f',overlappingCoefficient);
title(STR);
legend('Γραφική φυσικού συστήματος','Έξοδος ασαφούς συστήματος')
clc

%--------------------------------------------------------------------------
% | Δεύτερη προσέγγιση | --> 15 σύνολα εισόδου- 5 σύνολα εξόδου 
% Παράμετροι για την είσοδο και έξοδο
ruleNumber = 15;
inputSets = ruleNumber;
outputSets = 5;
overlappingCoefficient = a;
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εισόδου
figure(29);
axis([min(x) max(x) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εισόδου-x');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(x),max(x),inputSets,overlappingCoefficient);
for (k=1:inputSets)
    mf_x(k,:)=tri_MF(x,Alpha(k),Beta(k),Gamma(k));
    plot(x,mf_x(k,:))
end
%-----------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εξόδου
figure(30);
axis([min(y) max(y) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εξόδου-y');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(y),max(y),outputSets,overlappingCoefficient);
for (k=1:outputSets)
    mf_y(k,:)=tri_MF(y,Alpha(k),Beta(k),Gamma(k));
    plot(y,mf_y(k,:))
end
%-----------------------------------------------------------------------
% Βάση κανόνων, αντιστοίχηση των ασαφών συνόλων στα σύνολα των κανόνων
In(1,:)=mf_x(1,:);    In(2,:)=mf_x(2,:);  In(3,:)=mf_x(3,:);  In(4,:)=mf_x(4,:);
In(5,:)=mf_x(5,:);    In(6,:)=mf_x(6,:);  In(7,:)=mf_x(7,:);  In(8,:)=mf_x(8,:);  In(9,:)=mf_x(9,:);   
In(10,:)=mf_x(10,:); In(11,:)=mf_x(11,:); In(12,:)=mf_x(12,:); In(13,:)=mf_x(13,:); In(14,:)=mf_x(14,:); In(15,:)=mf_x(15,:); 
Out(1,:)=mf_y(3,:);   Out(2,:)=mf_y(4,:); Out(3,:)=mf_y(5,:); Out(4,:)=mf_y(5,:);
Out(5,:)=mf_y(4,:);   Out(6,:)=mf_y(3,:); Out(7,:)=mf_y(3,:); Out(8,:)=mf_y(2,:); Out(9,:)=mf_y(3,:); 
Out(10,:)=mf_y(2,:); Out(11,:)=mf_y(2,:); Out(12,:)=mf_y(2,:); Out(13,:)=mf_y(1,:); Out(14,:)=mf_y(1,:); Out(15,:)=mf_y(2,:); 
%-----------------------------------------------------------------------
for j=1:length(x)
    for i=1:ruleNumber
        Bbar(i,:)=min(In(i,j),Out(i,:));
    end    
    total=Bbar(1,:);
    for i=2:ruleNumber
        total=max(total,Bbar(i,:));
    end
    output(j)=sum(y.*total)/sum(total);
end

figure(31);
plot(x,z,'b',x,output,'r--');
STR=sprintf('2η Προσέγγιση: 15 σύνολα εισόδου- 5 σύνολα εξόδου με γ= %.2f',overlappingCoefficient);
title(STR);
legend('Γραφική φυσικού συστήματος','Έξοδος ασαφούς συστήματος')
clc

%--------------------------------------------------------------------------
% | Τρίτη προσέγγιση | --> 8 σύνολα εισόδου-6 σύνολα εξόδου
% Παράμετροι για την είσοδο και έξοδο
ruleNumber = 8;
inputSets = ruleNumber;
outputSets = 6;
overlappingCoefficient = a;
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εισόδου
figure(32);
axis([min(x) max(x) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εισόδου-x');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(x),max(x),inputSets,overlappingCoefficient);
for (k=1:inputSets)
    mf_x(k,:)=tri_MF(x,Alpha(k),Beta(k),Gamma(k));
    plot(x,mf_x(k,:))
end
%-----------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εξόδου
figure(33);
axis([min(y) max(y) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εξόδου-y');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(y),max(y),outputSets,overlappingCoefficient);
for (k=1:outputSets)
    mf_y(k,:)=tri_MF(y,Alpha(k),Beta(k),Gamma(k));
    plot(y,mf_y(k,:))
end
%-----------------------------------------------------------------------
% Βάση κανόνων, αντιστοίχηση των ασαφών συνόλων στα σύνολα των κανόνων
In(1,:)=mf_x(1,:);    In(2,:)=mf_x(2,:);  In(3,:)=mf_x(3,:);  In(4,:)=mf_x(4,:);
In(5,:)=mf_x(5,:);    In(6,:)=mf_x(6,:);    In(7,:)=mf_x(7,:); In(8,:)=mf_x(8,:);  
Out(1,:)=mf_y(4,:);   Out(2,:)=mf_y(6,:); Out(3,:)=mf_y(6,:); Out(4,:)=mf_y(3,:);
Out(5,:)=mf_y(3,:);   Out(6,:)=mf_y(1,:); Out(7,:)=mf_y(1,:); Out(8,:)=mf_y(2,:); 
%-----------------------------------------------------------------------
for j=1:length(x)
    for i=1:ruleNumber
        Bbar(i,:)=min(In(i,j),Out(i,:));
    end    
    total=Bbar(1,:);
    for i=2:ruleNumber
        total=max(total,Bbar(i,:));
    end
    output(j)=sum(y.*total)/sum(total);
end

figure(34);
plot(x,z,'b',x,output,'r--');
STR=sprintf('3η Προσέγγιση: 8 σύνολα εισόδου-6 σύνολα εξόδου με γ= %.2f',overlappingCoefficient);
title(STR);
legend('Γραφική φυσικού συστήματος','Έξοδος ασαφούς συστήματος')
clc

%--------------------------------------------------------------------------
% | Τέταρτη προσέγγιση | --> 9 σύνολα εισόδου-7 σύνολα εξόδου 
% Παράμετροι για την είσοδο και έξοδο
ruleNumber = 9;
inputSets = ruleNumber;
outputSets = 7;
overlappingCoefficient = a;
%--------------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εισόδου
figure(35);
axis([min(x) max(x) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εισόδου-x');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(x),max(x),inputSets,overlappingCoefficient);
for (k=1:inputSets)
    mf_x(k,:)=tri_MF(x,Alpha(k),Beta(k),Gamma(k));
    plot(x,mf_x(k,:))
end
%-----------------------------------------------------------------------
% Ομοιόμορφη κατανομή του χώρου εξόδου
figure(36);
axis([min(y) max(y) 0 1.05]);   title('Ομοιόμορφη κατανομή του χώρου εξόδου-y');
hold on
[Alpha,Beta,Gamma]=tri_MF_partition(min(y),max(y),outputSets,overlappingCoefficient);
for (k=1:outputSets)
    mf_y(k,:)=tri_MF(y,Alpha(k),Beta(k),Gamma(k));
    plot(y,mf_y(k,:))
end
%-----------------------------------------------------------------------
% Βάση κανόνων, αντιστοίχηση των ασαφών συνόλων στα σύνολα των κανόνων
In(1,:)=mf_x(1,:);    In(2,:)=mf_x(2,:);  In(3,:)=mf_x(3,:);  In(4,:)=mf_x(4,:);
In(5,:)=mf_x(5,:);    In(6,:)=mf_x(6,:);  In(7,:)=mf_x(7,:);  In(8,:)=mf_x(8,:);  In(9,:)=mf_x(9,:);  
Out(1,:)=mf_y(4,:);   Out(2,:)=mf_y(7,:); Out(3,:)=mf_y(7,:); Out(4,:)=mf_y(4,:);
Out(5,:)=mf_y(3,:);   Out(6,:)=mf_y(3,:); Out(7,:)=mf_y(2,:); Out(8,:)=mf_y(1,:); Out(9,:)=mf_y(2,:); 
%-----------------------------------------------------------------------
for j=1:length(x)
    for i=1:ruleNumber
        Bbar(i,:)=min(In(i,j),Out(i,:));
    end    
    total=Bbar(1,:);
    for i=2:ruleNumber
        total=max(total,Bbar(i,:));
    end
    output(j)=sum(y.*total)/sum(total);
end

figure(37);
plot(x,z,'b',x,output,'r--');
STR=sprintf('4η Προσέγγιση: 9 σύνολα εισόδου-7 σύνολα εξόδου με γ= %.2f',overlappingCoefficient);
title(STR);
legend('Γραφική φυσικού συστήματος','Έξοδος ασαφούς συστήματος')
clc
