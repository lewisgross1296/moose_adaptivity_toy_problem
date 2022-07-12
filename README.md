# MOOSE adaptivity Toy Problem
A repository for playing with the adaptive mesh refinement MOOSE system. The toy problem is one with a mesh that combines radial and rectangular geometry. The heat source is radial and cuts off at the heating radius $R_{h}$ which is expected to cause a sharp temperature gradient near the interface. The heating source is given by
$$q'''(r) =  Q_{0} \big( \frac{r}{R_{h}}\big)^{5} \text{\quad FOR \quad} r \in [0,R_{h}] $$ and is zero for $r>R_{h}$$

See the toy directory for the simple problem and the variation directory for the slight variation on the original configuration.