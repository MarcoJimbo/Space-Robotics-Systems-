#ifndef IDRA_ideal_B_h_
#define IDRA_ideal_B_h_
#ifndef IDRA_ideal_B_COMMON_INCLUDES_
#define IDRA_ideal_B_COMMON_INCLUDES_
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
#include "IDRA_ideal_B_types.h"
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#define MODEL_NAME IDRA_ideal_B
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
typedef struct { real_T n1oz2c3t2a [ 5 ] ; real_T e2s20tsxaa ; real_T
h1leody4tn [ 5 ] ; real_T d0ifxc5wh0 [ 5 ] ; real_T ccvbkrt4v4 [ 5 ] ; real_T
c0ax03vq2v [ 5 ] ; real_T kpaw1p5che [ 5 ] ; real_T nhgukwje4x ; real_T
pfdmh1dvth [ 5 ] ; real_T idkedhj1gx [ 5 ] ; real_T hk4ssbgnc3 [ 5 ] ; real_T
o42ulnsst0 [ 5 ] ; real_T mwcy0hmri2 [ 5 ] ; real_T l5uscq33yk [ 5 ] ; real_T
hsm0pgvnyw [ 10 ] ; real_T mesim2xb0r [ 5 ] ; real_T oksuagjkwm [ 5 ] ;
real_T ha34cak4gh [ 5 ] ; real_T n5mva5rtd5 [ 5 ] ; real_T of1pab14lr [ 25 ]
; real_T lzgyzybwwh [ 50 ] ; real_T efgvxcbvt5 [ 25 ] ; real_T kcbposzcko [ 5
] ; real_T fvp3r43dub [ 5 ] ; real_T pnpzndquzc [ 5 ] ; } B ; typedef struct
{ nuqiuodoz1 * hegpjbqysl ; real_T nzndxympu3 [ 5 ] ; real_T fbnumlygvc [ 5 ]
; real_T jwgivpi2yu [ 5 ] ; real_T lvine12n0d [ 5 ] ; real_T fn2ofbhl3x [ 5 ]
; real_T hsuc1nohj5 ; struct { void * PrevTimePtr ; } egsxxoarbt ; struct {
void * PrevTimePtr ; } nneeeb0iuz ; struct { void * PrevTimePtr ; }
lkmwpzekjz ; struct { void * LoggedData ; } jayzaj2o1p ; struct { void *
AQHandles ; } alndjjvjyw ; struct { void * AQHandles ; } mpdnz1jcwp ; struct
{ void * AQHandles ; } jekgl13na3 ; struct { void * AQHandles ; } gyqqdbx1jg
; struct { void * AQHandles ; } kqtdmzmqxf ; struct { void * AQHandles ; }
frjyyhu4xb ; struct { void * AQHandles ; } hgkqu3zwj0 ; struct { void *
LoggedData ; } f1foptg31p ; struct { void * LoggedData ; } lwgynhknu3 ;
struct { void * LoggedData ; } fh1gtij1vs ; struct { void * LoggedData ; }
akzrhxwp5r ; struct { void * LoggedData ; } cibjnrbqhy ; struct { void *
LoggedData ; } iwfq1mmk0k ; struct { void * LoggedData ; } nivfsr02r2 ;
struct { void * LoggedData ; } dg2lr04vlh ; struct { void * LoggedData ; }
gj2kjttt03 ; struct { void * LoggedData ; } hexlg0cqe1 ; int32_T ms524pfmnv ;
int32_T dailpgjdzv ; int32_T kcbd40pvdy ; int32_T b3qxwcgril ; int32_T
j3jekqtdio ; int32_T bo1ufldfwj ; int32_T d2xyny3irt ; int32_T pkbwaqyxzb ;
int32_T orswnhtaqo ; boolean_T ajasvf3l3m ; boolean_T pertqyapae ; boolean_T
g2sqsfgtev ; boolean_T hs22bqvhej ; boolean_T ezcyivy2e3 ; boolean_T
eoy3vdfhpu ; boolean_T hauwsh452n ; boolean_T c5jyjm1qbm ; boolean_T
nlmvww4f23 ; boolean_T l01p1xmoso ; boolean_T ivaipftxuu ; boolean_T
e3swq5uvyf ; boolean_T k1t5udcjyq ; boolean_T i4gquommii ; boolean_T
eeoqcblfuq ; boolean_T kqez4und1p ; boolean_T apkdzfruza ; boolean_T
pvp3qg02yh ; boolean_T b0om0n1qji ; } DW ; typedef struct { real_T bmpdykjrkv
[ 5 ] ; real_T oxeacfkwk5 [ 5 ] ; } X ; typedef struct { real_T bmpdykjrkv [
5 ] ; real_T oxeacfkwk5 [ 5 ] ; } XDot ; typedef struct { boolean_T
bmpdykjrkv [ 5 ] ; boolean_T oxeacfkwk5 [ 5 ] ; } XDis ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T A_c [ 5 ] ;
real_T A_v [ 25 ] ; real_T DELTA ; real_T K ; real_T Kd [ 25 ] ; real_T Ki [
25 ] ; real_T Kp [ 25 ] ; real_T M_m [ 25 ] ; real_T Ra [ 5 ] ; real_T
T_moto_B ; real_T T_s ; real_T gear_ratio [ 5 ] ; real_T ke [ 5 ] ; real_T km
[ 5 ] ; real_T q0_B [ 5 ] ; real_T qd0_B [ 5 ] ; real_T qdd0_B [ 5 ] ; real_T
t_const ; real_T t_fade ; real_T integrateerr_gainval ; real_T
integrateerr_IC ; } ; extern const char_T * RT_MEMORY_ALLOCATION_ERROR ;
extern B rtB ; extern X rtX ; extern DW rtDW ; extern P rtP ; extern mxArray
* mr_IDRA_ideal_B_GetDWork ( ) ; extern void mr_IDRA_ideal_B_SetDWork ( const
mxArray * ssDW ) ; extern mxArray *
mr_IDRA_ideal_B_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * IDRA_ideal_B_GetCAPIStaticMap ( void ) ;
extern SimStruct * const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ;
extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T
tid ) ; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
