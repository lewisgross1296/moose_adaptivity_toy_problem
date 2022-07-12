# MOOSE adaptivity Toy Problem
A repository for playing with the adaptive mesh refinement MOOSE system. The toy problem is one with a mesh that combines radial and rectangular geometry. The heat source is radial and cuts off at the heating radius, <img src="https://render.githubusercontent.com/render/math?math={\R_{h}}#gh-light-mode-only"> <img src="https://render.githubusercontent.com/render/math?math={R_{h}}#gh-dark-mode-only">, which is expected to cause a sharp temperature gradient at the interface. The heating source used is given by
```math
    q'''(r) =
    \begin{cases}
      Q_{0} \big( \frac{r}{R_{h}}\big)^{5} &\quad r \in [0,R_{h}] \\
        0 &\quad else
    \end{cases}
```

See the toy directory for the simple problem and the variation directory for the slight variation on the original configuration.