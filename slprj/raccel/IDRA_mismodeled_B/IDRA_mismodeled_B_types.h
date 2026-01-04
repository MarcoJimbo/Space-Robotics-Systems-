#ifndef IDRA_mismodeled_B_types_h_
#define IDRA_mismodeled_B_types_h_
#include "rtwtypes.h"
#ifndef struct_emxArray_real_T
#define struct_emxArray_real_T
struct emxArray_real_T { real_T * data ; int32_T * size ; int32_T
allocatedSize ; int32_T numDimensions ; boolean_T canFreeData ; } ;
#endif
#ifndef typedef_csliv2k3ag
#define typedef_csliv2k3ag
typedef struct emxArray_real_T csliv2k3ag ;
#endif
#ifndef SS_UINT64
#define SS_UINT64 18
#endif
#ifndef SS_INT64
#define SS_INT64 19
#endif
typedef struct P_ P ;
#endif
