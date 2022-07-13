[Mesh]
  [ConcentricCircleMeshGenerator]
    type = ConcentricCircleMeshGenerator
    num_sectors = 2
    radii = '1'
    rings = '1 1'
    has_outer_square = on
    pitch = '4'
    preserve_volumes = off
  []
[]

[Variables]
  # fill with the variables you are solving for
[]

[Kernels]
  # fill with the kernels; this will be a heat conduction kernel plus a volumetric heat source
[]

[Functions]
  # fill with a function to compute your specified volumetric heat source term
[]

[AuxVariables]
  # fill with an auxvariable to represent your volumetric heat source
[]

[AuxKernels]
  # fill with an auxkernel to set your volumetric heat source auxvariable to the function you want
[]

[Executioner]
  # fill with the executioner
[]

[Outputs]
  # specify the output
[]