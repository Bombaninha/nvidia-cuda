#include <stdio.h>

#define NUMBER_OF_BLOCKS 256
#define NUMBER_OF_THREADS_PER_BLOCK 1024

__global__ void printSuccessForCorrectExecutionConfiguration() {
    if(threadIdx.x == 1023 && blockIdx.x == 255) {
        printf("Success!\n");
    } 
}

int main() {
    /*
    * Update the execution configuration so that the kernel
    * will print `"Success!"`.
    */
    printSuccessForCorrectExecutionConfiguration<<<NUMBER_OF_BLOCKS, NUMBER_OF_THREADS_PER_BLOCK>>>();
    
    cudaDeviceSynchronize();
}