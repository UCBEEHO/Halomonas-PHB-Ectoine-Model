# Halomonas PHB–Ectoine Model

## Description
This repository contains the mathematical model developed to describe carbon and nitrogen source utilisation, cell growth, and dual-product (PHB and ectoine) biosynthesis in *Halomonas bluephagenesis* TD1.0 under batch fermentation conditions.

The model incorporates substrate limitation, inhibition kinetics, and coupled product formation dynamics.

---

## Repository Structure

- MATLAB scripts: model equations and optimisation routines and results plotting 
- CSV files: experimental datasets used for model calibration and validation  

---

## Files

### Model and Scripts
- luong.m – kinetic model implementation  
- objective*.m – objective functions for parameter estimation  
- optimization8.m – optimisation routine  
- odefcn8.m – runs  dynamic model simulation by taking the starting conditions and parameter values.
- latest8.m- differential equation solver

### Data
- Book1.csv – experimental data for biomass, PHB, and ectoine production  as well as glucose and nitrogen utilisations.

---

## Requirements

- MATLAB (recommended version R2023b or later)  
- No additional toolboxes required (unless applicable)  

---

## How to Run

1. Open MATLAB  
2. Navigate to the repository folder  
3. Run the .m files of Luong1, Loung2, Loung3 and Loung4

4. The model will simulate growth and product formation as well as glucose and nitrogen utilisations at different glucose concentrations  based on already integrated a set of estimated parameters obtained by the optimization8.m across all glucose datasets

---

## Reproducibility

All  scripts intended to reproduce the results presented in the manuscript 

---



## Author

[Dr. Elaheh Hojaji]
