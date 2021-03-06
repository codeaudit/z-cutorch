#include "THZCBlas.h"

void THZCudaBlas_swap(THCState *state, long n, cx *x, long incx,  cx  *y, long incy)
{
  if(n == 1)
  {
    incx = 1;
    incy = 1;
  }

  if( (n <= INT_MAX) && (incx <= INT_MAX) && (incy <= INT_MAX) )
  {
    int i_n = (int)n;
    int i_incx = (int)incx;
    int i_incy = (int)incy;
    THZCublasCheck(cublasCswap(THCState_getCurrentBlasHandle(state), i_n, (cux*)x, i_incx, (cux*)y, i_incy));
    return;
  }
  THError("Cublas_swap only supports n, incx and"
          " incy upto signed integer limits: %d", INT_MAX);
}

void THZCudaBlas_scal(THCState *state, long n,  cx  a,  cx  *x, long incx)
{
  if(n == 1)
    incx = 1;

  if( (n <= INT_MAX) && (incx <= INT_MAX) )
  {
    int i_n = (int)n;
    int i_incx = (int)incx;
    THZCublasCheck(cublasCscal(THCState_getCurrentBlasHandle(state), i_n, (cux*)&a, (cux*)x, i_incx));
    return;
  }
  THError("Cublas_scal only supports n and incx "
          "upto signed integer limits: %d", INT_MAX);
}

void THZCudaBlas_copy(THCState *state, long n,  cx  *x, long incx,  cx  *y, long incy)
{
  if(n == 1)
  {
    incx = 1;
    incy = 1;
  }

  if( (n <= INT_MAX) && (incx <= INT_MAX) && (incy <= INT_MAX) )
  {
    int i_n = (int)n;
    int i_incx = (int)incx;
    int i_incy = (int)incy;
    THZCublasCheck(cublasCcopy(THCState_getCurrentBlasHandle(state), i_n, (cux*)x, i_incx, (cux*)y, i_incy));
    return;
  }

  THError("Cublas_copy only supports n, incx and incy "
          "upto signed integer limits: %d", INT_MAX);
}

void THZCudaBlas_axpy(THCState *state, long n,  cx  a,  cx  *x, long incx,  cx  *y, long incy)
{
    if(n == 1)
  {
    incx = 1;
    incy = 1;
  }

  if( (n <= INT_MAX) && (incx <= INT_MAX) && (incy <= INT_MAX) )
  {
    int i_n = (int)n;
    int i_incx = (int)incx;
    int i_incy = (int)incy;
    THZCublasCheck(cublasCaxpy(THCState_getCurrentBlasHandle(state), i_n, (cux*)&a, (cux*)x, i_incx, (cux*)y, i_incy));
    return;
  }

  THError("Cublas_axpy only supports n, incx and incy "
          "upto signed integer limits: %d", INT_MAX);
}

cx  THZCudaBlas_dot(THCState *state, long n, cx *x, long incx, cx *y, long incy)
{
  if(n == 1)
  {
    incx = 1;
    incy = 1;
  }

  if( (n <= INT_MAX) && (incx <= INT_MAX) && (incy <= INT_MAX) )
  {
    int i_n = (int)n;
    int i_incx = (int)incx;
    int i_incy = (int)incy;
    cuComplex result;
    THZCublasCheck(cublasCdotc(THCState_getCurrentBlasHandle(state), i_n, (cux*)x, i_incx, (cux*)y, i_incy, &result));
    cudaDeviceSynchronize();
    cx tmp = cuCrealf(result) + cuCimagf(result) * I;
    return tmp;
  }
  THError("Cublas_dot only supports n, incx and incy "
          "upto signed integer limits: %d", INT_MAX);
  return -1;
}

/* Level 2 */
void THZCudaBlas_gemv(THCState *state, char trans, long m, long n,  cx  alpha,  cx  *a, long lda,  cx  *x, long incx,  cx  beta,  cx  *y, long incy)
{
  if(n == 1)
    lda = m;

  cublasOperation_t op;
  if (trans == 't') op = CUBLAS_OP_T;
  else if (trans == 'n') op = CUBLAS_OP_N;
  else if (trans == 'c') op = CUBLAS_OP_C;

  if( (m <= INT_MAX) && (n <= INT_MAX) &&
      (lda > 0) && (lda <= INT_MAX) &&
      (incx > 0) && (incx <= INT_MAX) &&
      (incy > 0) && (incy <= INT_MAX) )
  {
    int i_m = (int)m;
    int i_n = (int)n;
    int i_lda = (int)lda;
    int i_incx = (int)incx;
    int i_incy = (int)incy;

    THZCublasCheck(cublasCgemv(THCState_getCurrentBlasHandle(state), op, i_m, i_n, (cux*)&alpha, (cux*)a, i_lda, (cux*)x, i_incx, (cux*)&beta, (cux*)y, i_incy));
    return;
  }
  THError("Cublas_gemv only supports m, n, lda, incx, incy"
          "in the range 0 < [val] <= %d", INT_MAX);
}

void THZCudaBlas_ger(THCState *state, long m, long n,  cx  alpha,  cx  *x, long incx,  cx  *y, long incy,  cx  *a, long lda)
{
  if(n == 1)
    lda = m;

  if( (m <= INT_MAX) && (n <= INT_MAX) && (lda <= INT_MAX)  && (incx <= INT_MAX) && (incy <= INT_MAX) )
    {
      int i_m = (int)m;
      int i_n = (int)n;
      int i_lda = (int)lda;
      int i_incx = (int)incx;
      int i_incy = (int)incy;

      THZCublasCheck(cublasCgeru(THCState_getCurrentBlasHandle(state), i_m, i_n, (cux*)&alpha, (cux*)x, i_incx, (cux*)y, i_incy, (cux*)a, i_lda));
      return;
    }
  THError("Cublas_ger only supports m, n, lda, incx, incy"
          "with the bound [val] <= %d", INT_MAX);
}

cublasOperation_t convertTransToCublasOperation(char trans) {
  if (trans == 't') return CUBLAS_OP_T;
  else if (trans == 'n') return CUBLAS_OP_N;
  else if (trans == 'c') return CUBLAS_OP_C;
  else {
    THError("trans must be one of: t, n, c");
    return CUBLAS_OP_T;
  }
}

void adjustLd(char transa, char transb, long m, long n, long k, long *lda, long *ldb, long *ldc)
{
  int transa_ = ((transa == 't') || (transa == 'T'));
  int transb_ = ((transb == 't') || (transb == 'T'));

  if(n == 1)
    *ldc = m;

  if(transa_)
  {
    if(m == 1)
      *lda = k;
  }
  else
  {
    if(k == 1)
      *lda = m;
  }

  if(transb_)
  {
    if(k == 1)
      *ldb = n;
  }
  else
  {
    if(n == 1)
      *ldb = k;
  }
}

/* Level 3 */
void THZCudaBlas_gemm(THCState *state, char transa, char transb, long m, long n, long k,  cx  alpha,  cx  *a, long lda,  cx  *b, long ldb,  cx  beta,  cx  *c, long ldc)
{
  adjustLd(transa, transb, m, n, k, &lda, &ldb, &ldc);
  cublasOperation_t opa = convertTransToCublasOperation(transa);
  cublasOperation_t opb = convertTransToCublasOperation(transb);

  if( (m <= INT_MAX) && (n <= INT_MAX) && (k <= INT_MAX) && (lda <= INT_MAX)  && (ldb <= INT_MAX) && (ldc <= INT_MAX) )
  {
    int i_m = (int)m;
    int i_n = (int)n;
    int i_k = (int)k;
    int i_lda = (int)lda;
    int i_ldb = (int)ldb;
    int i_ldc = (int)ldc;

    THZCublasCheck(cublasCgemm(THCState_getCurrentBlasHandle(state), opa, opb, i_m, i_n, i_k, (cux*)&alpha, (cux*)a, i_lda, (cux*)b, i_ldb, (cux*)&beta, (cux*)c, i_ldc));
    return;
  }
  THError("Cublas_gemm only supports m, n, k, lda, ldb, ldc"
          "with the bound [val] <= %d", INT_MAX);
}

void THZCudaBlas_gemmBatched(THCState *state, char transa, char transb, long m, long n, long k,
                             cx  alpha, const  cx  *a[], long lda, const  cx  *b[], long ldb,
                             cx * beta, cx  *c[], long ldc, long batchCount)
{
  if( (m >= INT_MAX) || (n >= INT_MAX) || (k >= INT_MAX) || (lda >= INT_MAX)  || (ldb >= INT_MAX) || (ldc >= INT_MAX) || (batchCount >= INT_MAX) )
  {
    THError("Cublas_gemm only supports m, n, k, lda, ldb, ldc, batchCount"
            "with the bound [val] <= %d", INT_MAX);
  }

  adjustLd(transa, transb, m, n, k, &lda, &ldb, &ldc);
  cublasOperation_t opa = convertTransToCublasOperation(transa);
  cublasOperation_t opb = convertTransToCublasOperation(transb);

  THZCublasCheck(cublasCgemmBatched(THCState_getCurrentBlasHandle(state),
                                   opa, opb, (int)m, (int)n, (int)k,
                                   (const cux*)&alpha, (const cux**)a, (int)lda, (const cux**)b, (int)ldb, (const cux*)&beta, (cux**)c, (int)ldc,
                                   (int)batchCount));
}
