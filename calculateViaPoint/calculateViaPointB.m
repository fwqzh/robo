function d2 = calculateViaPointB(stairLength, stairHeight, dNQ, dQR, eta2, epsilon3, limit)

function tp = totalPotential(repulsivePotential, attractivePotential)
tp = repulsivePotential + attractivePotential;
end

function ur = U_rep(eta2, d2)
ur = 0.5 * eta2 * (1 ./ d2).^2;
end

function ua = U_att(epsilon3, d2)
ua = 0.5 * epsilon3 * d2.^2;
end

d = 0:0.01:stairLength;
tp = totalPotential(U_rep(eta2, d), U_att(epsilon3, d));

[m,n] = min(tp);
if dNQ ^ 2 + dQR ^ 2 <= d(n) ^ 2
    d2 = sqrt(dNQ ^ 2 + dQR ^ 2);
else
    d2 = d(n);
end

end