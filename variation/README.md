# to test the mesh
`~/caridnal/cardinal-opt -i variation.i --mesh-only`

# run cardinal simulation using mpi paralellism and openmp parallelism
`mpiexec -np 4 ~/cardinal/cardinal-opt -i variation.i --n-threads=20`