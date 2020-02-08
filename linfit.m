function [ params ] = linfit( xdata, ydata )
%linfit performs linear regression on any data set
%   xdata and ydata are assumed to be vectors of the same length
%   params is a vector containing [slope yintercept]

%calculate polynomial, assign output to params
params = polyfit(xdata, ydata, 1);


%calculate polyval of x
ymodel = polyval(params, xdata);

%plot regression line
plot(xdata, ydata, '*', xdata, ymodel)

%calculate total sum of squares
ymean=mean(ydata);
SStot=sum((ydata-ymean).^2);
%calculate regression sum of squares
SSreg=sum((ymodel-ymean).^2);
%calculate sum of squares of residuals
SSres=sum((ydata-ymodel).^2);
%calculate coefficient of determination
rsq=1-(SSres/SStot);

%add legend to plot
legend ( 'Measured data' , sprintf( 'Linear fit r^2 = %6.4f ', rsq )  )


end