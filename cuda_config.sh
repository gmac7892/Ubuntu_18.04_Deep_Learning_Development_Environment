#!/bin/bash

export PATH=/usr/local/cuda-11.4/bin${PATH:+:${PATH}}
echo export PATH=/usr/local/cuda-11.4/bin${PATH:+:${PATH}}

export LD_LIBRARY_PATH=/usr/local/cuda-11.4/lib64\${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
echo export LD_LIBRARY_PATH=/usr/local/cuda-11.4/lib64\${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

source ~/.bashrc
echo source ~/.bashrc

sudo ldconfig /usr/local/cuda/lib64
echo sudo ldconfig /usr/local/cuda/lib64

nvcc -V
echo nvcc -V
