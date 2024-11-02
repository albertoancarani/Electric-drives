clc
clear
close all

%% Input:
esercitazione_2;
Vfprime=1;
Vavec=[-1, -0.5, 0, 0.5, 1];
CLvec=[-1, -0.5, 0, 0.5, 1];
%% Grafici:
for i = 1:5
    for j = 1:5
       Vaprime = Vavec(i); %mantiene il valore uguale mentre varia j
       CLi = CLvec(j);
       Out = sim('Esercitazione__2'); % lancia la simulazione simscape
       timevec=Out.omega_out.time; % prende il tempo dalla simulazione e ne fa un vettore grazie al ciclo
       omegavec = Out.omega_out.signals.values(:,1); % importiamo la velocità angolare da simscape
       iavec = Out.ia.signals.values(:,1); % importiamo la corrente di armatura da simscape
       omega_regime = mean(omegavec(end-10:end)); % fa la media degli ultimi 11 valori di omegavec
       ia_regime = mean(iavec(end-10:end)); % fa la media degli ultimi 11 valori di ia
       caratteristica_mecc(i,j) = omega_regime;
       corrente_coppia(i,j) = ia_regime;
    end
end

%% CURVA CARATTERISTICA

plot(caratteristica_mecc(1,:),CLvec,  'LineWidth',2) % plotto la curva con va'=0
hold on
grid on
ylabel('C_L^{\prime}','fontsize',18)
xlabel('\omega^{\prime}','fontsize',18)
plot(caratteristica_mecc(2,:),CLvec,  'LineWidth',2) % plotto le altre curve
plot(caratteristica_mecc(3,:),CLvec,  'LineWidth',2)
plot(caratteristica_mecc(4,:),CLvec,  'LineWidth',2)
plot(caratteristica_mecc(5,:),CLvec,  'LineWidth',2)
legend('v_a^{\prime} = -1','v_a^{\prime} = -0.5','v_a^{\prime} = 0','v_a^{\prime} = 0.5','v_a^{\prime} = 1', 'fontsize',18)

%% VERIFICA CORRENTE-COPPIA DI CARICO

figure(2);
plot(CLvec, corrente_coppia(1,:), 'LineWidth',2) % plotto la curva con va'=0
hold on
grid on
xlabel('C_L^{\prime}','fontsize',18)
ylabel('i_a^{\prime}','fontsize',18)
plot(CLvec, corrente_coppia(2,:), 'LineWidth',2) % plotto le altre curve
plot(CLvec, corrente_coppia(3,:), 'LineWidth',2)
plot(CLvec, corrente_coppia(4,:), 'LineWidth',2)
plot(CLvec, corrente_coppia(5,:), 'LineWidth',2)
legend('v_a^{\prime} = -1','v_a^{\prime} = -0.5','v_a^{\prime} = 0','v_a^{\prime} = 0.5','v_a^{\prime} = 1', 'fontsize',18,'Location','northwest')