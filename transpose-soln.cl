#pragma OPENCL EXTENSION cl_khr_fp64: enable

kernel void transpose(
    global double *a,
    global double *b,
    long n)
{
  long i = get_global_id(0);
  long j = get_global_id(1);

#if 0
  if (i > j)
  {
    double tmp = a[n*i + j];
    a[n*i+j] = a[i + n*j];
    a[i + n*j] = tmp;
  }
#endif
#if 1
  b[i + n*j] = a[n*i + j];
#endif
}
