#ifndef IDRA_mismodeled_A_h_
#define IDRA_mismodeled_A_h_
#ifndef IDRA_mismodeled_A_COMMON_INCLUDES_
#define IDRA_mismodeled_A_COMMON_INCLUDES_
#include <stddef.h>
#include <stdlib.h>
#include "sl_AsyncioQueue/AsyncioQueueCAPI.h"
#include "sl_fileio_rtw.h"
#include "simtarget/slSimTgtSlFileioRTW.h"
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging_simtarget.h"
#include "rt_nonfinite.h"
#include "math.h"
#include "dt_info.h"
#include "ext_work.h"
#include "blas.h"
#endif
#include "IDRA_mismodeled_A_types.h"
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#define MODEL_NAME IDRA_mismodeled_A
#define NSAMPLE_TIMES (5) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (32) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (10)   
#elif NCSTATES != 10
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T n5xr5njcua [ 5 ] ; real_T eukpwigpzj ; real_T
l242ahah3l [ 5 ] ; real_T m35vfhspni [ 5 ] ; real_T kunfnxzism [ 5 ] ; real_T
l22zbia3wy [ 5 ] ; real_T etkweornb4 [ 5 ] ; real_T mwi3gmsjsh ; real_T
fwtv12rxyl [ 5 ] ; real_T lja53h1mv0 [ 5 ] ; real_T k5nl4qx3lk [ 5 ] ; real_T
gzuuqzbm0d [ 5 ] ; real_T gaicd5yeyt [ 5 ] ; real_T kqtyr5igtp [ 5 ] ; real_T
b5cu1wtcmo [ 10 ] ; real_T hvdzpvdqz2 [ 5 ] ; real_T mqd0soihwr [ 5 ] ;
real_T nv1psjvd2k [ 5 ] ; real_T bjlsurcqq3 [ 5 ] ; real_T di0rwgvsyo [ 25 ]
; real_T juhzfokcop [ 50 ] ; real_T cldckdbf5g [ 25 ] ; real_T olk5ekrjnx [ 5
] ; real_T gkyg0slat4 [ 5 ] ; real_T pjafrqv45j [ 5 ] ; } B ; typedef struct
{ ppr2z3uuj4 * dygf2ftvjj ; real_T oiukevuitk [ 5 ] ; real_T m3chjijl0d [ 5 ]
; real_T hickzsamlu [ 5 ] ; real_T ksfzgqfukh [ 5 ] ; real_T gnh1ryygwp [ 5 ]
; real_T kwl3yzcmor ; struct { void * PrevTimePtr ; } p14mucnvmp ; struct {
void * PrevTimePtr ; } ilte4aiyo5 ; struct { void * PrevTimePtr ; }
cdx03i5frz ; struct { void * LoggedData ; } hbnvoymfak ; struct { void *
AQHandles ; } mbe201oe5v ; struct { void * AQHandles ; } pg45ke0axf ; struct
{ void * AQHandles ; } h4bxgfxloh ; struct { void * AQHandles ; } l2a3onaamy
; struct { void * AQHandles ; } cja23q2jv1 ; struct { void * AQHandles ; }
bc2leufkrn ; struct { void * AQHandles ; } it2tjs3ozz ; struct { void *
LoggedData ; } mnaqg2n5ue ; struct { void * LoggedData ; } ap4ch4x3ro ;
struct { void * LoggedData ; } av2jdtrst0 ; struct { void * LoggedData ; }
kw24o5ryr1 ; struct { void * LoggedData ; } lfr51cd4r3 ; struct { void *
LoggedData ; } odubkdhol5 ; struct { void * LoggedData ; } obqlyopk5w ;
struct { void * LoggedData ; } ehycuwfiky ; struct { void * LoggedData ; }
knmknf5jqq ; struct { void * LoggedData ; } aamdqse3cd ; int32_T pa3dqsb340 ;
int32_T iiqtrvsiuy ; int32_T aawojtlsiv ; int32_T d5bu03ftgu ; int32_T
f0pwgsrhyq ; int32_T da13aaqjlz ; int32_T heschxcuox ; int32_T loudm4h2ge ;
int32_T jpulpqppfe ; boolean_T ijkhui25gd ; boolean_T oth4403mh5 ; boolean_T
okkg5capjl ; boolean_T eucdibji1z ; boolean_T m1s25jqvod ; boolean_T
czdpkegx5k ; boolean_T ls1o2mfmjo ; boolean_T bsgtwsd1jf ; boolean_T
c1hbv4rx4l ; boolean_T h520wyoarp ; boolean_T c0ilvtxztb ; boolean_T
it3tlk4adc ; boolean_T ehvjsjgo0b ; boolean_T cgpp5rflcl ; boolean_T
lnoyt2jl5z ; boolean_T blcudpdeor ; boolean_T m0z2tnolrm ; boolean_T
amaoifwnpv ; boolean_T owv5eyemxf ; } DW ; typedef struct { real_T mgh0nacuex
[ 5 ] ; real_T avejo2dyxm [ 5 ] ; } X ; typedef struct { real_T mgh0nacuex [
5 ] ; real_T avejo2dyxm [ 5 ] ; } XDot ; typedef struct { boolean_T
mgh0nacuex [ 5 ] ; boolean_T avejo2dyxm [ 5 ] ; } XDis ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T A_c [ 5 ] ;
real_T A_v [ 25 ] ; real_T DELTA [ 5 ] ; real_T K ; real_T Kd [ 25 ] ; real_T
Ki [ 25 ] ; real_T Kp [ 25 ] ; real_T M_m [ 25 ] ; real_T Ra [ 5 ] ; real_T
T_moto_A ; real_T T_s ; real_T gear_ratio [ 5 ] ; real_T ke [ 5 ] ; real_T km
[ 5 ] ; real_T q0_A [ 5 ] ; real_T qd0_A [ 5 ] ; real_T qdd0_A [ 5 ] ; real_T
t_LPF ; real_T t_const ; real_T t_fade ; real_T integrateerr_gainval ; real_T
integrateerr_IC ; } ; extern const char_T * RT_MEMORY_ALLOCATION_ERROR ;
extern B rtB ; extern X rtX ; extern DW rtDW ; extern P rtP ; extern mxArray
* mr_IDRA_mismodeled_A_GetDWork ( ) ; extern void
mr_IDRA_mismodeled_A_SetDWork ( const mxArray * ssDW ) ; extern mxArray *
mr_IDRA_mismodeled_A_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * IDRA_mismodeled_A_GetCAPIStaticMap ( void )
; extern SimStruct * const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ;
extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T
tid ) ; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
