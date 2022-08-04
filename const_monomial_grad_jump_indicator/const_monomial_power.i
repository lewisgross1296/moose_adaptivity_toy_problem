# GLOBAL VARS
r_h = 1
k_h = 100
[Mesh]
  [ConcentricCircleMeshGenerator]
    type = ConcentricCircleMeshGenerator
    num_sectors = 10
    radii = '${r_h} ${fparse 1.05*r_h}'
    rings = '1 1 1'
    has_outer_square = on
    pitch = '${fparse 4*r_h}'
    preserve_volumes = off
  []
[]

[Variables]
  # fill with the variables you are solving for
  [temperature]
    # non nodal
    order = FIRST
    family = LAGRANGE
  []
[]

[Kernels]
  # fill with the kernels; this will be a heat conduction kernel plus a volumetric heat source
  [heat_conduction]
    type = ADHeatConduction
    variable = temperature
    block = '1 2 3'
  []
  [volumetric_heat_generation]
    type = CoupledForce
    v = power
    variable = temperature
    block = '1'
  []
[]

[BCs]
[left]
  type = NeumannBC
  variable = temperature
  boundary = left
  value = 0
[]
[right]
  type = DirichletBC
  variable = temperature
  boundary = right
  value = 1000
[]
[top]
  type = DirichletBC
  variable = temperature
  boundary = top
  value = 200
[]
[bottom]
  type = DirichletBC
  variable = temperature
  boundary = bottom
  value = 600
[]
[]

[Functions]
  # fill with a function to compute your specified volumetric heat source term
  [heat_source]
    type = ParsedFunction
    value = (2*sqrt(x*x+y*y)/${r_h})^5
    []
[]

[AuxVariables]
  # fill with an auxvariable to represent your volumetric heat source
  [power]
    order = CONSTANT
    family = MONOMIAL
  []
[]

[AuxKernels]
  # fill with an auxkernel to set your volumetric heat source auxvariable to the function you want
  [volumetric_heat_gegneration]
    type = FunctionAux
    variable = power
    function = heat_source
    block = 1
  []
[]


[Materials]
  [heat_source_material]
    type = ADHeatConductionMaterial
    thermal_conductivity = ${k_h}
    block = '1'
  []
  [thin_material_low_conductivity]
    type = ADHeatConductionMaterial
    thermal_conductivity = ${fparse k_h/100}
    block = '2'
  []
  [outer_material]
    type = ADHeatConductionMaterial
    thermal_conductivity = ${fparse 1.5*k_h}
    block = '3'
  []
[]

[Adaptivity]
  steps = 4
  max_h_level = 4
  marker = error_fraction_marker
  [Indicators]
    [grad_jump_temp]
      type = GradientJumpIndicator
      variable = temperature
    []
  []
  [Markers]
    [error_fraction_marker]
      type = ErrorFractionMarker
      coarsen = 0.3
      refine = 0.3
      indicator = grad_jump_temp
    []
  []
[]


[Executioner]
  # fill with the executioner
  type = Steady
  solve_type = PJFNK
 []

[Outputs]
  # specify the output
  exodus = true
[]