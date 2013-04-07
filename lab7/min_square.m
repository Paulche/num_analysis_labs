function [r_dep r_indep] = min_square(dep,indep)
  dep_mean    = mean(dep)
  indep_mean  = mean(indep)

  r_indep = indep

  b_one   = sum((indep - indep_mean).*(dep - dep_mean)) / sum((indep - indep_mean).^2)

  b_zero  = dep_mean - b_one * indep_mean

  r_dep   = b_zero + b_one * indep
end
