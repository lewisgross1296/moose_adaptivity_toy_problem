# moose_adaptivity_toy_problem
A repository for playing with the adaptive mesh refinement MOOSE system. The toy problem is one with a mesh that combines spherical and rectangular geometry and a heat source that is expected to have a sharp gradient at the interface of the sphere boundary

# import openmc to test python API
`python`
`import openmc`

# run openmc simulation
python make_openmc_model.py

# to test the mesh
~/caridnal/cardinal-opt -i openmc.i --mesh-only

# run cardinl simulation using mpi paralellism and openmp parallelism
mpiexec -np 4 ~/cardinal/cardinal-opt -i openmc.i --n-threads=20