clc
clear
close all

%% Input:
esercitazione_2;
Vaprime=1;
CLvec=[1, 0.5, 0, -0.5, -1];
bvec=[1, 0.5, 0.33]; % valori del flusso magnetico

%% Grafici:
for i = 1:3
    for j = 1:5
       Vfprime = bvec(i); % manteniamo costante il flusso magnetico per ogni simulazione
       CLi = CLvec(j);
       Out = sim('Esercitazione__2');
       timevec=Out.omega_out.time;
       omegavec = Out.omega_out.signals.values(:,1);
       iavec = Out.ia.signals.values(:,1);
       omega_regime = mean(omegavec(end-10:end));
       ia_regime = mean(iavec(end-10:end));
       caratteristica_mecc(i,j) = omega_regime;
       corrente_coppia(i,j) = ia_regime;
    end
end

%% CURVA CARATTERISTICA

plot(CLvec, caratteristica_mecc(1,:), 'LineWidth',2)
hold on
grid on
xlabel('C_L^{\prime}','fontsize',18)
ylabel('\omega^{\prime}','fontsize',18)
plot(CLvec, caratteristica_mecc(2,:), 'LineWidth',2)
plot(CLvec, caratteristica_mecc(3,:), 'LineWidth',2)
% plot(CLvec, caratteristica_mecc(4,:), 'LineWidth',2)
% plot(CLvec, caratteristica_mecc(5,:), 'LineWidth',2)
axis([0 1 0 3]) % dimensionare gli assi
legend('v_f^{\prime} = 1','v_f^{\prime} = 1/2','v_f^{\prime} = 1/3', 'fontsize',18)

%% VERIFICA CORRENTE-COPPIA DI CARICO

figure(2);
plot(CLvec, corrente_coppia(1,:), 'LineWidth',2)
hold on
grid on
xlabel('C_L^{\prime}','fontsize',18)
ylabel('i_a^{\prime}','fontsize',18)
plot(CLvec, corrente_coppia(2,:), 'LineWidth',2)
plot(CLvec, corrente_coppia(3,:), 'LineWidth',2)
% plot(CLvec, corrente_coppia(4,:), 'LineWidth',2)
% plot(CLvec, corrente_coppia(5,:), 'LineWidth',2)
axis([0 1 0 1])
legend('v_f^{\prime} = 1','v_f^{\prime} = 1/2','v_f^{\prime} = 1/3', 'fontsize',18,'Location','northwest')