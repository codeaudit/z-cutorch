#include "torch/utils.h"
#include "THZCTensorCopy.h"
#include "THZTensor.h"
#include "THZC.h"
#include "THFile.h"
#include "luaT.h"
#include <stdio.h>
/* everything is as the generic Storage.c, except few things (see below) */

#define real float
#define Real ZCuda

#define torch_Storage_(NAME) TH_CONCAT_4(torch_, Real, Storage_, NAME)
#define torch_Storage TH_CONCAT_STRING_3(torch., Real, Storage)
#define torch_Tensor_(NAME) TH_CONCAT_4(torch_, Real, Tensor_, NAME)
#define torch_Tensor TH_CONCAT_STRING_3(torch., Real, Tensor)
#define torch_CTensor TH_CONCAT_STRING_3(torch., Cuda, Tensor)
#define THZCTensor TH_CONCAT_3(TH, ZCuda, Tensor)

#define TH_GENERIC_FILE "generic/Tensor.c"
#include "generic/Tensor.c"
#undef TH_GENERIC_FILE

#undef real
#undef Real

/* now we overwrite some methods specific to ZCudaTensor */
// static int zcutorch_ZCudaTensor_copy(lua_State *L) {
//   THCState *state = cutorch_getstate(L);
//   THZCudaTensor *storage = luaT_checkudata(L, 1, "torch.ZCudaTensor");
//   printf("here: 1\n");
//   void *src;
//   if ((src = luaT_toudata(L, 2, "torch.ZCudaTensor"))) {
//     THZCudaTensor_copy(state, storage, src);
//   } else if ((src = luaT_toudata(L, 2, "torch.ByteTensor"))) {
//     THZFloatTensor *t = THZFloatTensor_new();
//     THZFloatTensor_copyByte(t, src);
//     THZCudaTensor_copyZFloat(state, storage, t);
//   } else if ((src = luaT_toudata(L, 2, "torch.CharTensor"))) {
//     THZFloatTensor *t = THZFloatTensor_new();
//     THZFloatTensor_copyChar(t, src);
//     THZCudaTensor_copyZFloat(state, storage, t);
//   } else if ((src = luaT_toudata(L, 2, "torch.ShortTensor"))) {
//     THZFloatTensor *t = THZFloatTensor_new();
//     THZFloatTensor_copyShort(t, src);
//     THZCudaTensor_copyZFloat(state, storage, t);
//   } else if ((src = luaT_toudata(L, 2, "torch.IntTensor"))) {
//     THZFloatTensor *t = THZFloatTensor_new();
//     THZFloatTensor_copyInt(t, src);
//     THZCudaTensor_copyZFloat(state, storage, t);
//   } else if ((src = luaT_toudata(L, 2, "torch.LongTensor"))) {
//     THZFloatTensor *t = THZFloatTensor_new();
//     THZFloatTensor_copyLong(t, src);
//     THZCudaTensor_copyZFloat(state, storage, t);
//   } else if ((src = luaT_toudata(L, 2, "torch.FloatTensor"))) {
//     THZFloatTensor *t = THZFloatTensor_new();
//     THZFloatTensor_copyFloat(t, src);
//     THZCudaTensor_copyZFloat(state, storage, t);
//   } else if ((src = luaT_toudata(L, 2, "torch.DoubleTensor"))) {
//     THZFloatTensor *t = THZFloatTensor_new();
//     THZFloatTensor_copyDouble(t, src);
//     THZCudaTensor_copyZFloat(state, storage, t);
//   } else if ((src = luaT_toudata(L, 2, "torch.ZFloatTensor"))) {
//     THZCudaTensor_copyZFloat(state, storage, src);
//   } else {
//     printf("here: %s, %s\n",luaL_typename(L,1),luaL_typename(L,2));
//     luaL_typerror(L, 2, "torch.*Tensor");
//     printf("here: 3\n");
//   }
//
//   lua_settop(L, 1);
//   return 1;
// }

static int zcutorch_ZCudaTensor_copyAsync(lua_State *L) {
  THCState *state = cutorch_getstate(L);
  THZCudaTensor *storage = luaT_checkudata(L, 1, "torch.ZCudaTensor");
  void *src;
  if ((src = luaT_toudata(L, 2, "torch.ZCudaTensor")))
    THZCudaTensor_copyZCuda(state, storage, src);
  else if ((src = luaT_toudata(L, 2, "torch.ZFloatTensor")))
    THZCudaTensor_copyAsyncZFloat(state, storage, src);
  else
    luaL_typerror(L, 2, "torch.ZFloatTensor or torch.ZCudaTensor");

  lua_settop(L, 1);
  return 1;
}

// #define CUDA_IMPLEMENT_TENSOR_COPY(TYPEC)                               \
//   static int zcutorch_##TYPEC##Tensor_copy(lua_State *L)                 \
//   {                                                                     \
//     TH##TYPEC##Tensor *storage = luaT_checkudata(L, 1, "torch." #TYPEC "Tensor"); \
//     void *src;                                                          \
//     if( (src = luaT_toudata(L, 2, "torch." #TYPEC "Tensor")) )          \
//       TH##TYPEC##Tensor_copy(storage, src);                             \
//     else if( (src = luaT_toudata(L, 2, "torch.ByteTensor")) )           \
//       TH##TYPEC##Tensor_copyByte(storage, src);                         \
//     else if( (src = luaT_toudata(L, 2, "torch.CharTensor")) )           \
//       TH##TYPEC##Tensor_copyChar(storage, src);                         \
//     else if( (src = luaT_toudata(L, 2, "torch.ShortTensor")) )          \
//       TH##TYPEC##Tensor_copyShort(storage, src);                        \
//     else if( (src = luaT_toudata(L, 2, "torch.IntTensor")) )            \
//       TH##TYPEC##Tensor_copyInt(storage, src);                          \
//     else if( (src = luaT_toudata(L, 2, "torch.LongTensor")) )           \
//       TH##TYPEC##Tensor_copyLong(storage, src);                         \
//     else if( (src = luaT_toudata(L, 2, "torch.FloatTensor")) )          \
//       TH##TYPEC##Tensor_copyFloat(storage, src);                        \
//     else if( (src = luaT_toudata(L, 2, "torch.DoubleTensor")) )         \
//       TH##TYPEC##Tensor_copyDouble(storage, src);                       \
//     else if( (src = luaT_toudata(L, 2, "torch.CudaTensor")) )           \
//       TH##TYPEC##Tensor_copyCuda(cutorch_getstate(L), storage, src);    \
//     else                                                                \
//       luaL_typerror(L, 2, "torch.*Tensor");                             \
//                                                                         \
//     lua_settop(L, 1);                                                   \
//     return 1;                                                           \
//   }
//
// CUDA_IMPLEMENT_TENSOR_COPY(Byte)
// CUDA_IMPLEMENT_TENSOR_COPY(Char)
// CUDA_IMPLEMENT_TENSOR_COPY(Short)
// CUDA_IMPLEMENT_TENSOR_COPY(Int)
// CUDA_IMPLEMENT_TENSOR_COPY(Long)
// CUDA_IMPLEMENT_TENSOR_COPY(Float)
// CUDA_IMPLEMENT_TENSOR_COPY(Double)

static int zcutorch_ZFloatTensor_copyAsync(lua_State *L) {
  THZFloatTensor *storage = luaT_checkudata(L, 1, "torch.ZFloatTensor");
  void *src;
  if ((src = luaT_toudata(L, 2, "torch.ZCudaTensor")))
    THZFloatTensor_copyAsyncZCuda(cutorch_getstate(L), storage, src);
  else
    luaL_typerror(L, 2, "torch.CudaTensor");

  lua_settop(L, 1);
  return 1;
}

static void THZFloatTensor_computesz(THZFloatTensor *self, long **sz_,
                                     long **st_) {
  long *sz, *st, *szh;
  int i;

  sz = (long *)THAlloc(sizeof(long) * self->nDimension);
  st = (long *)THAlloc(sizeof(long) * self->nDimension);
  szh = (long *)THAlloc(sizeof(long) * self->nDimension);

  for (i = self->nDimension - 1; i >= 0; i--) {
    if (i == self->nDimension - 1)
      szh[i] = 1;
    else
      szh[i] = szh[i + 1] * self->size[i + 1];
  }

  memcpy(sz, szh, self->nDimension * sizeof(long));
  memcpy(st, self->stride, self->nDimension * sizeof(long));
  THFree(szh);

  *sz_ = sz;
  *st_ = st;
}

void THZFloatTensor_kernel_copy(cx *dst, long *dst_sz, long *dst_st,
                                int dst_dim, cx *src, long *src_sz,
                                long *src_st, int src_dim, long n_elem) {
  long k;

  for (k = 0; k < n_elem; k++) {
    long src_idx = 0;
    long src_rest = k;
    long dst_idx = 0;
    long dst_rest = k;
    int dim;

    for (dim = 0; dim < dst_dim; dim++) {
      dst_idx += (dst_rest / dst_sz[dim]) * dst_st[dim];
      dst_rest = dst_rest % dst_sz[dim];
    }

    for (dim = 0; dim < src_dim; dim++) {
      src_idx += (src_rest / src_sz[dim]) * src_st[dim];
      src_rest = src_rest % src_sz[dim];
    }

    dst[dst_idx] = src[src_idx];
  }
}

static int zcuda_ZFloatTensor_fakecopy(lua_State *L) {
  THZFloatTensor *self = luaT_checkudata(L, 1, "torch.ZFloatTensor");
  THZFloatTensor *src = luaT_checkudata(L, 2, "torch.ZFloatTensor");
  long *d_self_sz, *d_self_st, *d_src_sz, *d_src_st;
  long nElement = THZFloatTensor_nElement(self);

  THArgCheck(THZFloatTensor_nElement(self) == THZFloatTensor_nElement(src), 2,
             "sizes do not match");

  THZFloatTensor_computesz(self, &d_self_sz, &d_self_st);
  THZFloatTensor_computesz(src, &d_src_sz, &d_src_st);

  THZFloatTensor_kernel_copy(THZFloatTensor_data(self), d_self_sz, d_self_st,
                             self->nDimension, THZFloatTensor_data(src),
                             d_src_sz, d_src_st, src->nDimension, nElement);

  THFree(d_self_sz);
  THFree(d_self_st);
  THFree(d_src_sz);
  THFree(d_src_st);

  lua_settop(L, 1);
  return 1;
}

static int zcutorch_ZCudaTensor_getDevice(lua_State *L) {
  THZCudaTensor *tensor = luaT_checkudata(L, 1, "torch.ZCudaTensor");
  lua_pushinteger(L, THZCudaTensor_getDevice(cutorch_getstate(L), tensor) + 1);
  return 1;
}

static int zcutorch_ZCudaTensor_wrapcdata(lua_State *L) {
  // printf("zcutorch_ZCudaTensor_wrapcdata\n");
  // int i = luaL_checkint(L, 1);
  void *l = (void *)lua_topointer(L, 1);
  // double d = luaL_checknumber(L, 1);
  THZCudaTensor *a = (THZCudaTensor *)lua_newuserdata(L, sizeof(THZCudaTensor));
  memcpy(a, (void *)l, sizeof(THZCudaTensor));
  // free(l);
  luaL_getmetatable(L, "torch.ZCudaTensor");
  lua_setmetatable(L, -2);
  return 1;
}

void zcutorch_ZCudaTensor_init(lua_State *L) {
  // printf("Still runningat %s:%d\n", __FILE__, __LINE__);
  /* the standard stuff */
  torch_ZCudaTensor_init(L);
  // printf("Still runningat %s:%d\n", __FILE__, __LINE__);
  /* additional methods */
  luaT_pushmetatable(L, "torch.ZFloatTensor");
  lua_pushcfunction(L, zcuda_ZFloatTensor_fakecopy);
  lua_setfield(L, -2, "fakecopy");
  lua_pop(L, 1);

  /* the copy methods */
  {
    int i;
#define N 1
    // const void *tnames[N] = {
    //     /*"torch.ByteTensor", "torch.CharTensor", "torch.ShortTensor",
    //     "torch.IntTensor", "torch.LongTensor",
    // 		"torch.FloatTensor", "torch.DoubleTensor", "torch.CudaTensor",
    // */
    // "torch.ZCudaTensor"};
    //
    // static int (*funcs[N])(lua_State *) = {
    //     /*zcutorch_ByteTensor_copy, zcutorch_CharTensor_copy,
    //     zcutorch_ShortTensor_copy, zcutorch_IntTensor_copy,
    //     zcutorch_LongTensor_copy, zcutorch_FloatTensor_copy,
    //     zcutorch_DoubleTensor_copy, zcutorch_CudaTensor_copy,*/
    //     zcutorch_ZCudaTensor_copy};
    // printf("Still running at %s:%d\n", __FILE__, __LINE__);
    // for (i = 0; i < N; i++) {
    //   luaT_pushmetatable(L, tnames[i]);
    //   lua_pushcfunction(L, funcs[i]);
    //   lua_setfield(L, -2, "copy");
    //   lua_pop(L, 1);
    // }
    // printf("Still runningat %s:%d\n", __FILE__, __LINE__);
    // Register async copy methods.
    luaT_pushmetatable(L, "torch.ZCudaTensor");
    lua_pushcfunction(L, zcutorch_ZCudaTensor_copyAsync);
    lua_setfield(L, -2, "copyAsync");
    lua_pop(L, 1);
    luaT_pushmetatable(L, "torch.ZCudaTensor");
    lua_pushcfunction(L, zcutorch_ZCudaTensor_wrapcdata);
    lua_setfield(L, -2, "wrapcdata");
    lua_pop(L, 1);
    // printf("Still runningat %s:%d\n", __FILE__, __LINE__);
    luaT_pushmetatable(L, "torch.ZFloatTensor");
    lua_pushcfunction(L, zcutorch_ZFloatTensor_copyAsync);
    lua_setfield(L, -2, "copyAsync");
    lua_pop(L, 1);
  }
  // printf("Still runningat %s:%d\n", __FILE__, __LINE__);
  luaT_pushmetatable(L, "torch.ZCudaTensor");
  lua_pushcfunction(L, zcutorch_ZCudaTensor_getDevice);
  lua_setfield(L, -2, "getDevice");

  lua_pop(L, 1);
}
