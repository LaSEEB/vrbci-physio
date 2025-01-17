%kruskall wallis for each electrode 

load('RESULTS')

p_vals = nan(32,5);

for i = 1 : 32

    test_table = nan(6,20);
    test_table(:,:) = RESULTS.EEG.frequency.theta(i,:,:);
    test_table = test_table';
    [p_vals(i,1)] = kruskalwallis(test_table,[],'off');
end

for i = 1 : 32

    test_table = nan(6,20);
    test_table(:,:) = RESULTS.EEG.frequency.delta(i,:,:);
    test_table = test_table';
    [p_vals(i,2)] = kruskalwallis(test_table,[],'off');
end

for i = 1 : 32

    test_table = nan(6,20);
    test_table(:,:) = RESULTS.EEG.frequency.alpha(i,:,:);
    test_table = test_table';
    [p_vals(i,3)] = kruskalwallis(test_table,[],'off');
end

for i = 1 : 32

    test_table = nan(6,20);
    test_table(:,:) = RESULTS.EEG.frequency.beta(i,:,:);
    test_table = test_table';
    [p_vals(i,4)] = kruskalwallis(test_table,[],'off');
end

for i = 1 : 32

    test_table = nan(6,20);
    test_table(:,:) = RESULTS.EEG.frequency.low_gamma(i,:,:);
    test_table = test_table';
    [p_vals(i,5)] = kruskalwallis(test_table,[],'off');
end

p_vals_less = nan(32,5);
for x=1:32
    for y=1:5
        if p_vals(x,y) < 0.05
            p_vals_less(x,y) = p_vals(x,y);
        end
    end
end

figure
title("Kruskal-Wallis Test for each electrode")
stem(p_vals, 'LineStyle', 'none', 'MarkerFaceColor','auto')
yline(0.05, 'r--')
xticks(1:32)
ylabel('p value')
xlabel('Electrode')
for i=1:32
    xline(i, 'black')
end
legend("delta","theta","alpha","beta","low gamma")
% hold on
% for x = 1:32
%     for y = 1:5
%         text(x, p_vals_less(x,y), num2str(p_vals(x,y)))
%         hold on
%     end
% end

% f = figure; 
% data = p_vals; 
% ronames= {'delta','theta','alpha','beta','low gamma'}; 
% t = uitable(f, 'Data', data', 'RowName', ronames)

%kanoume remove ta p_vals pou einai <0.05
for i=1:32
    for j=1:5
        if p_vals(i,j) > 0.05
            p_vals(i,j) = p_vals(i,j);
        else 
            p_vals(i,j) = nan;
        end
    end
end

%kanoume remove ta p_vals pou einai >0.05
for i=1:32
    for j=1:5
        if p_vals(i,j) < 0.05
            p_vals(i,j) = p_vals(i,j);
        else 
            p_vals(i,j) = 0;
        end
    end
end

p_vals_true = p_vals > 0;

%afairw apo ta frequency bands ta electrodes pou einai p<0.05 kai
%antikathisrw me nan
%delta
for x = 1:6
    for y = 1:20
        for z = 1:32
            RESULTS.EEG.frequency.delta(z,x,y) = RESULTS.EEG.frequency.delta(z,x,y) * p_vals_true(z,1);
            if RESULTS.EEG.frequency.delta(z,x,y) == 0
                RESULTS.EEG.frequency.delta(z,x,y) = nan;
            end
        end
    end
end

%theta
for x = 1:6
    for y = 1:20
        for z = 1:32
            RESULTS.EEG.frequency.theta(z,x,y) = RESULTS.EEG.frequency.theta(z,x,y) * p_vals_true(z,2);
            if RESULTS.EEG.frequency.theta(z,x,y) == 0
                RESULTS.EEG.frequency.theta(z,x,y) = nan;
            end
        end
    end
end

%alpha
for x = 1:6
    for y = 1:20
        for z = 1:32
            RESULTS.EEG.frequency.alpha(z,x,y) = RESULTS.EEG.frequency.alpha(z,x,y) * p_vals_true(z,3);
            if RESULTS.EEG.frequency.alpha(z,x,y) == 0
                RESULTS.EEG.frequency.alpha(z,x,y) = nan;
            end 
        end 
    end 
end

%beta
for x = 1:6
    for y = 1:20
        for z = 1:32
            RESULTS.EEG.frequency.beta(z,x,y) = RESULTS.EEG.frequency.beta(z,x,y) * p_vals_true(z,4);
            if RESULTS.EEG.frequency.beta(z,x,y) == 0
                RESULTS.EEG.frequency.beta(z,x,y) = nan;
            end 
        end 
    end 
end

%low gamma
for x = 1:6
    for y = 1:20
        for z = 1:32
            RESULTS.EEG.frequency.low_gamma(z,x,y) = RESULTS.EEG.frequency.low_gamma(z,x,y) * p_vals_true(z,5);
            if RESULTS.EEG.frequency.low_gamma(z,x,y) == 0
                RESULTS.EEG.frequency.low_gamma(z,x,y) = nan;
            end 
        end 
    end 
end

load('chanlocs');

max_alpha = max(p_vals(:,3));
min_alpha = min(p_vals(:,3));

max_beta = max(p_vals(:,4));
min_beta = min(p_vals(:,4));

max_gamma = max(p_vals(:,5));
min_gamma = min(p_vals(:,5));

max_delta = max(p_vals(:,1));
min_delta = min(p_vals(:,1));

max_theta = max(p_vals(:,2));
min_theta = min(p_vals(:,2));

figure
t = tiledlayout('flow');

nexttile
topoplot(p_vals(:,1),chanlocs, 'maplimits', [min_delta max_delta], 'colormap', parula)
title('Delta', 'FontAngle', 'italic')

nexttile
topoplot(p_vals(:,2),chanlocs, 'maplimits', [min_theta max_theta], 'colormap', parula)
title('Theta', 'FontAngle', 'italic')

nexttile
topoplot(p_vals(:,3),chanlocs, 'maplimits', [min_alpha max_alpha], 'colormap', parula)
title('Alpha', 'FontAngle', 'italic')

nexttile
topoplot(p_vals(:,4),chanlocs, 'maplimits', [min_beta max_beta], 'colormap', parula)
title('Beta', 'FontAngle', 'italic')

nexttile
topoplot(p_vals(:,5),chanlocs, 'maplimits', [min_gamma max_gamma], 'colormap', parula)
title('Low Gamma', 'FontAngle', 'italic')

%DUNN TEST FOR ELECTRODES WITH STATISTICALLY SIGNIFICANT DIFFERENCES

p_vals_true = p_vals > 0;

g = [ones(1,20) repmat(2,1,20) repmat(3,1,20) repmat(4,1,20) repmat(5,1,20) repmat(6,1,20)];

%delta 3,30

delta_elec_3(:,:) = RESULTS.EEG.frequency.delta(3,:,:);
delta_elec_3 = delta_elec_3(:);
delta_elec_3 = delta_elec_3'
med_delta_elec_3 = median(delta_elec_3, 'omitnan')
delta_isnan = isnan(delta_elec_3);
delta_isnan = not(delta_isnan); 
delta_elec_3 = delta_elec_3 .* delta_isnan;

delta_elec_30(:,:) = RESULTS.EEG.frequency.delta(30,:,:);

dunn(delta_elec_3, g, 'omitnan');
