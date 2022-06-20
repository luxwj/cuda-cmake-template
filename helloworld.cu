# include <stdio.h>

__global__ void test_kernel(double *arr) {
    *arr = 3.1415926;
}

int main() {
    double *arr_h, *arr_d;
    size_t arr_size = sizeof(double) * 50;
    arr_h = (double *)malloc(arr_size);
    cudaMalloc((void **)&arr_d, arr_size);
    dim3 gridDim = dim3(1, 1, 1);
    dim3 blockDim = dim3(1, 1, 1);

    test_kernel<<<gridDim, blockDim>>>(arr_d);
    cudaMemcpy(arr_h, arr_d, arr_size, cudaMemcpyDeviceToHost);
    printf("Hello world!\n");
    if (*arr_h == 3.1415926) {
        printf("Hello world!\n");
    }
    return 0;
}