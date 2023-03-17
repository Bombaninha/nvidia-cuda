#include <stdio.h>

#define NUMBER_OF_BLOCKS 5
#define NUMBER_OF_THREADS_PER_BLOCK 5

/*
 * Refactor firstParallel so that it can run on the GPU.
 */
__global__ void firstParallel() {
  printf("This should be running in parallel.\n");
}

int main() {
    /*
    * Refactor this call to firstParallel to execute in parallel
    * on the GPU.
    */
    firstParallel<<<NUMBER_OF_BLOCKS, NUMBER_OF_THREADS_PER_BLOCK>>>();

    /*
    * Some code is needed below so that the CPU will wait
    * for the GPU kernels to complete before proceeding.
    */
    cudaDeviceSynchronize();
}
