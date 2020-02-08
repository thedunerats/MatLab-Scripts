function [Margin] = CanProfit(r,h)
%CanProfit: calculates the profit made by producing and selling
%1 unit, the unit being a cylindrical aliminum can
Margin = CanPrice(r,h)-CanCost(r,h);
end