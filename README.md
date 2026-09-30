# Asynchronous FIFO in Verilog

## Overview

Designed an Asynchronous FIFO in Verilog HDL for reliable data transfer between two independent clock domains.

## Features

- Independent read and write clock domains
- Read and write pointer management
- Gray-code pointer conversion
- Clock-domain synchronization
- Full and empty detection

## Architecture

Write Clock Domain
        |
Write Pointer
        |
Gray Code
        |
Synchronizer
        |
Read Clock Domain

## Concepts

- Clock Domain Crossing (CDC)
- Gray code
- Synchronizer design
- FIFO full detection
- FIFO empty detection
- Dual-clock memory interface

## Verification

Verified FIFO read/write behavior, full and empty conditions, and clock-domain operation using Xilinx Vivado simulation.

## Tools

- Verilog HDL
- Xilinx Vivado
