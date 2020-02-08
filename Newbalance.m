function [Balance] = Newbalance(P,i,n)
%Newbalance: calculates the balance from a
%pricipal investment, interest rate and number of years   
Balance = P.*(1+i).^n;
end

