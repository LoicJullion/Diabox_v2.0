function [varout] = padit(varin,press,corrpress)

% function to pad varin to corrected depth - equivalent
% pressure is in corrpress

stations = size(varin,2);

varout = varin;

for i = 1:stations
    interval = press(2,i) - press(1,i);
    dmeas = max(find(~isnan(varin(:,i))));
    dbottom = round((corrpress(i)-press(1))/interval) + 1;
    for j = dmeas+1:dbottom;
        varout(j,i) = varin(dmeas,i); 
    end
end
