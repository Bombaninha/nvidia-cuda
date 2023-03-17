#include <stdio.h>

#define NUMBER_OF_BLOCKS 2

/*
 * Refactor `loop` to be a CUDA Kernel. The new kernel should
 * only do the work of 1 iteration of the original loop.
 */

__global__ void loop() {
    int iteration = threadIdx.x + blockIdx.x * blockDim.x;
    printf("%d\n", iteration);
}

int main() {
    /*
    * When refactoring `loop` to launch as a kernel, be sure
    * to use the execution configuration to control how many
    * "iterations" to perform.
    *
    * For this exercise, be sure to use more than 1 block in
    * the execution configuration.
    */
    int N = 10;
    loop<<<NUMBER_OF_BLOCKS, N>>>();
    
    cudaDeviceSynchronize();
}
