# to test the mesh
`~/cardinal/cardinal-opt -i transient_variation.i --mesh-only`

# run cardinal simulation using mpi paralellism and openmp parallelism
`mpiexec -np 2 ~/cardinal/cardinal-opt -i transient_variation.i --n-threads=2`