function d3 = calculateViaPointC(stairLength, stairHeight, eta3, epsilon4)

function tp = totalPotential(repulsivePotential, attractivePotential)
tp = repulsivePotential + attractivePotential;
end

function ur = U_rep(eta3, d3)
ur = 0.5 * eta3 * (1 ./ d3).^2;
end

function ua = U_att(epsilon4, d3)
ua = 0.5 * epsilon4 * d3.^2;
end

d = 0:0.01:stairLength;
tp = totalPotential(U_rep(eta3, d), U_att(epsilon4, d));

[m,n] = min(tp);
d3 = d(n);

end