#include "THZCStorageCopy.h"
#include "THZCGeneral.h"

void THZCudaStorage_rawCopy(THCState *state, THZCudaStorage *self, float *src)
{
  THZCudaCheck(cudaMemcpyAsync(self->data, src, self->size * sizeof(float), cudaMemcpyDeviceToDevice, THCState_getCurrentStream(state)));
}

void THZCudaStorage_copy(THCState *state, THZCudaStorage *self, THZCudaStorage *src)
{
  THArgCheck(self->size == src->size, 2, "size does not match");
  THZCudaCheck(cudaMemcpyAsync(self->data, src->data, self->size * sizeof(float), cudaMemcpyDeviceToDevice, THCState_getCurrentStream(state)));
}

void THZCudaStorage_copyCuda(THCState *state, THZCudaStorage *self, THZCudaStorage *src)
{
  THArgCheck(self->size == src->size, 2, "size does not match");
  THZCudaCheck(cudaMemcpyAsync(self->data, src->data, self->size * sizeof(float), cudaMemcpyDeviceToDevice, THCState_getCurrentStream(state)));
}
