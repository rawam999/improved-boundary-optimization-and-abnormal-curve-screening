# Droplet Collision Regime Boundary Plotting and Envelope Calculation

This computational script reads experimental droplet collision outcome data from Excel files, plots collision regimes on a **Weber number (`We`) vs impact parameter (`B`)** map, and computes fitted theoretical/regression boundary curves.

The script is designed for classifying and visualizing droplet collision outcomes such as:

- **Bouncing**
- **Coalescence**
- **Reflective separation**
- **Stretching separation**

It also calculates the **minimum and maximum boundary envelopes** from a set of fitted parameter combinations.

---

## Overview

The script performs the following tasks:

1. Reads experimental collision data from an Excel file
2. Separates different collision outcome regimes
3. Plots the experimental data on a `We-B` diagram
4. Reads fitting parameters from another Excel file
5. Generates theoretical/fitted boundary curves
6. Computes the lower and upper envelopes of all curves
7. Displays the final regime map

This is useful for analyzing droplet collision behavior under a given pressure condition.

---

## Input Files

The script uses two Excel files:

### 1. Experimental data file

```matlab
All_data-gw80.xlsx
