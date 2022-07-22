# to test the mesh
`~/cardinal/cardinal-opt -i toy_variation.i --mesh-only`

# run cardinal simulation using mpi paralellism and openmp parallelism
`mpiexec -np 4 ~/cardinal/cardinal-opt -i toy_variation.i --n-threads=20`