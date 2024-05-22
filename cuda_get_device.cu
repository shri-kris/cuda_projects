%%cuda
#include <stdio.h>
#include <cuda_runtime.h>

int main() {
    int device;
    cudaDeviceProp properties;

    // Get the current device
    cudaGetDevice(&device);
    // Get device properties
    cudaGetDeviceProperties(&properties, device);

    printf("Device Name: %s\n", properties.name);
    printf("Compute Capability: %d.%d\n", properties.major, properties.minor);
    printf("Max Threads per Block: %d\n", properties.maxThreadsPerBlock);
    printf("Max Threads per Multiprocessor: %d\n", properties.maxThreadsPerMultiProcessor);
    printf("Max Blocks per Multiprocessor: %d\n", properties.maxBlocksPerMultiProcessor);
    printf("Warp Size: %d\n", properties.warpSize);
    printf("Number of SMs: %d\n", properties.multiProcessorCount);

    return 0;
}
