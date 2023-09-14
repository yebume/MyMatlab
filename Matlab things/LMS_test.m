function [e,w] = myLMS(M, mu, d, s)

%M = 1000;          % szűrő ehatók száma
%mu = 0.1 /M;        % bátorsági tényező ~(1/M)
L = length(y);      % gerj hossza
w = zeros(M, 1);    % szűrő e.hatók
%s = randn(1,L);     % bemeneti jel
%d = filter(h,1,s);  % kimeneti jel
x = zeros(M,1);     % forgó vekt, késleltetők imeneti értékét tartalmazza
e = zeros(1,L);     % hiba vektor

    for k = 1:L     % k: futó időváltózó
        x(1)   = s(k); 
        y      = w' * x; 
        e(k)   = d(k)  - y;
        w      = w  + mu*e(k)*x;
        x(2:M) = x(1:(M-1)); 
    end
end

