clc;
clearvars;
close all;

model=CreateModel();

% saving=clarke_wright_savings_function(model);

routes=parallel_savings_init(model);

routes(cellfun(@(routes) any(isnan(routes)),routes)) = [];

for i=1:numel(routes)
    routes{i}=[1,routes{i},1];
end

DD=DisAllRoute(model,routes);

disp(['Cost= ' num2str(DD)]);

PlotSolution(model,routes);

for v = 1 : numel(routes)

    disp(['The route of vehicle ' num2str(v) ' is: ' num2str(routes{v}) ]);
end