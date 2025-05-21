selectedFeature = 'Mean';

% Get feature values
meanValues = [];
labels = [];

for f = 1:length(faultTypes)
    currentFault = faultTypes(f);
    subTable = SFeaturesByFault(SFeaturesByFault.FaultType == currentFault, :);
    
    % Take average across variables
    val = mean(subTable.(selectedFeature), 'omitnan');
    meanValues(end+1) = val;
    labels{end+1} = currentFault;
end

% Plot
figure;
bar(meanValues);
xticks(1:length(labels));
xticklabels(labels);
xtickangle(45);
ylabel(selectedFeature + " ", 'FontWeight', 'bold');
title(selectedFeature + " of Each Fault Type", 'FontWeight', 'bold');
grid on;

