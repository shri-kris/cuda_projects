%%cuda
#include <stdio.h>


__global__ void square(float *d_out, float *d_in) {
  int idx = threadIdx.x;
  float f = d_in[idx];
  d_out[idx]=f*f;
}






// Function to print an array on the host
void printArray(float *arr, int size) {
    for (int i = 0; i < size; ++i) {
        printf("%f ", arr[i]);
    }
    printf("\n");
}




int main(int argc, char **argv) {


  const int ARRAY_SIZE = 64;
  const int ARRAY_BYTES = ARRAY_SIZE * sizeof(float);


  float h_in[ARRAY_SIZE];
  float h_out[ARRAY_SIZE];
  for (int i = 0; i < ARRAY_SIZE; i++) {
    h_in[i] = float(i);
  }




  float *d_in;
  float *d_out;
  cudaMalloc((void **)&d_in, ARRAY_BYTES);
  cudaMalloc((void **)&d_out, ARRAY_BYTES);


    //copy results to GPU
    cudaMemcpy(d_in, h_in, ARRAY_BYTES, cudaMemcpyHostToDevice);
    //Launch the Kernel
    square<<<1, ARRAY_SIZE>>>(d_out, d_in);


    //copy results back from GPU
    cudaMemcpy(h_out, d_out, ARRAY_BYTES, cudaMemcpyDeviceToHost);


    //release GPU memory
    cudaFree(d_in);
    cudaFree(d_out);




    printArray(h_out, ARRAY_SIZE);
}
