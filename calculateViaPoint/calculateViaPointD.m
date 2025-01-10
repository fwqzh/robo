function d4 = calculateViaPointD(stairLength, stairHeight, eta4, epsilon5)

function tp = totalPotential(repulsivePotential, attractivePotential)
tp = repulsivePotential + attractivePotential;
end

function ur = U_rep(eta4, d4)
ur = 0.5 * eta4 * (1 ./ d4).^2;
end

    function ua = U_att(epsilon5, d4)
ua = 0.5 * epsilon5 * d4.^2;
end

d = 0:0.01:stairLength;
tp = totalPotential(U_rep(eta4, d), U_att(epsilon5, d));

[m,n] = min(tp);
d4 = d(n);

end