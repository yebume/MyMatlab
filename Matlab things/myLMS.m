function [e,w] = myLMS(M, mu, s, d)
%OUTPUT: [e,w]
%M                  % szűrő együtthatók száma
%mu                 % bátorsági tényező ~(1/M)
%s                  % reprezentálni kívánt rendszer bemenete
%d                  % reprezentálni kívánt rendszer kimenete


L = length(s);      % gerj hossza
w = zeros(M, 1);    % szűrő együtthatók
x = zeros(M,1);     % forgó vektor, késleltetők értékét tartalmazza
e = zeros(1,L);     % hiba vektor
% y                 % szűrő által becsült kimenet

    for k = 1:L     % k: futó IDŐváltózó
        x(1)   = s(k); 
        y      = w' * x; 
        e(k)   = d(k)  - y;
        w      = w  + mu*e(k)*x;
        x(2:M) = x(1:(M-1)); 
    end
end

