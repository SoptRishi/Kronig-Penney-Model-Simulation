
# Kronig-Penney Model Simulation

This MATLAB script simulates the formation of electron energy bands in a 1D periodic lattice using the Kronig-Penney model. It solves the transcendental boundary condition equations to determine allowed and forbidden energy states.

## Physics Implementation

The code implements two specific variations of the potential profile:

### 1. Finite Rectangular Potential

Solves the characteristic equation for a periodic potential with finite barrier width  and well width . The code calculates the Left-Hand Side (LHS) of the condition:

Where:

* : Wavevector in the well region (related to Energy).
* : Wavevector in the barrier region.

### 2. Dirac Delta Potential

Solves the limiting case where barrier width  and barrier height  while the potential strength  remains constant. The condition simplifies to:

## Output Plots

The script generates two figures for each case to visualize the band structure solution method:

**Characteristic Function**

* Plots the LHS of the transcendental equation against  (dimensionless energy).
* **Red Lines ():** Indicate the range of validity for .
* **Interpretation:** Regions where the curve lies *outside*  correspond to complex  values (evanescent waves), representing **forbidden energy gaps**.

**E-k Dispersion Relation**

* Filters the data from Figure 5 to keep only valid indices where .
* Plots Energy () versus the crystal momentum .
* Shows the resulting parabolic bands separated by energy gaps.

## Key Parameters

* `a`: Lattice/well constant.
* `b`: Barrier width (Finite case only).
* `P`: Dimensionless scattering power (Delta case).
* `n`: Resolution of the -space simulation.

