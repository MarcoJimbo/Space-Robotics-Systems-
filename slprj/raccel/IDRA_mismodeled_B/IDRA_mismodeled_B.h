#ifndef IDRA_mismodeled_B_h_
#define IDRA_mismodeled_B_h_
#ifndef IDRA_mismodeled_B_COMMON_INCLUDES_
#define IDRA_mismodeled_B_COMMON_INCLUDES_
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
#include "IDRA_mismodeled_B_types.h"
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#define MODEL_NAME IDRA_mismodeled_B
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
typedef struct { real_T bk34atmqkv [ 5 ] ; real_T mqwwdbscsp ; real_T
kjoi100cx4 [ 5 ] ; real_T ovs00otw3u [ 5 ] ; real_T bnnw0amrvx [ 5 ] ; real_T
fsr5bzx1oh [ 5 ] ; real_T lgbaltvotk [ 5 ] ; real_T icfevjhfbv ; real_T
br3q5hawof [ 5 ] ; real_T cekv3kowwv [ 5 ] ; real_T a5vnu54yuc [ 5 ] ; real_T
a0f1uqlo5t [ 5 ] ; real_T fyqyyop2ds [ 5 ] ; real_T g4qp5jvw5i [ 5 ] ; real_T
g5b03i0i4v [ 10 ] ; real_T oiyzmkjmnx [ 5 ] ; real_T loddh0rxe1 [ 5 ] ;
real_T kb2qw4laxx [ 5 ] ; real_T aoghkjbkap [ 5 ] ; real_T alugh3ia1a [ 25 ]
; real_T hnh24jti00 [ 50 ] ; real_T czlp4dgpl3 [ 25 ] ; real_T mag4nk0wez [ 5
] ; real_T mvlp2zjkzm [ 5 ] ; real_T ae0roupsxl [ 5 ] ; } B ; typedef struct
{ csliv2k3ag * ik2nt4kirk ; real_T ar1qdb2bya [ 5 ] ; real_T hymaymjr2m [ 5 ]
; real_T jbcn1stmt0 [ 5 ] ; real_T ejxcl04tnz [ 5 ] ; real_T d1rzixwq5l [ 5 ]
; real_T kmnj0svy0x ; struct { void * PrevTimePtr ; } bx1r1wnndy ; struct {
void * PrevTimePtr ; } ekxe04xgmq ; struct { void * PrevTimePtr ; }
jqsqrg2tq1 ; struct { void * LoggedData ; } deo2ftbpks ; struct { void *
AQHandles ; } pxe0kat1bq ; struct { void * AQHandles ; } p3lelogsv1 ; struct
{ void * AQHandles ; } ofdd12hvu3 ; struct { void * AQHandles ; } brswaitusf
; struct { void * AQHandles ; } de0h4oeeaw ; struct { void * AQHandles ; }
cqf1b0q1yq ; struct { void * AQHandles ; } pl1gozuo52 ; struct { void *
LoggedData ; } m25hd3toxa ; struct { void * LoggedData ; } ndlzigmtfk ;
struct { void * LoggedData ; } brjrqvh5tp ; struct { void * LoggedData ; }
iixv40mef0 ; struct { void * LoggedData ; } hpff4zfdv3 ; struct { void *
LoggedData ; } ond4lvahvr ; struct { void * LoggedData ; } cfjmngyo45 ;
struct { void * LoggedData ; } jpywfrpg45 ; struct { void * LoggedData ; }
ddy0weruq3 ; struct { void * LoggedData ; } ojxyrjsls4 ; int32_T gn1t23i0hr ;
int32_T cnttnquf1c ; int32_T jt2n1iofoe ; int32_T nkgmjyf0wx ; int32_T
n4vjhihyks ; int32_T ppl1go1kmf ; int32_T ap5gosu1m0 ; int32_T mby5bvs3q3 ;
int32_T an0fflqoce ; boolean_T jjaxhm5x0f ; boolean_T hensx4maxq ; boolean_T
lrpjyi3rji ; boolean_T nsqfpifvir ; boolean_T fwwntbog1a ; boolean_T
mrxzjoxuen ; boolean_T jfc1rhfxpy ; boolean_T fyx1qlbsom ; boolean_T
aq0lkmh1yw ; boolean_T gyy03kqtwl ; boolean_T cope2mtchg ; boolean_T
hdzeg0hviw ; boolean_T mhjf5rp4ar ; boolean_T n2qt0eb4rl ; boolean_T
l0uu2vzpze ; boolean_T gbzoiksats ; boolean_T n2gad4nr14 ; boolean_T
bqtjylbrq5 ; boolean_T ffarchkewk ; } DW ; typedef struct { real_T iphrqyudnr
[ 5 ] ; real_T fh0ngxqmhq [ 5 ] ; } X ; typedef struct { real_T iphrqyudnr [
5 ] ; real_T fh0ngxqmhq [ 5 ] ; } XDot ; typedef struct { boolean_T
iphrqyudnr [ 5 ] ; boolean_T fh0ngxqmhq [ 5 ] ; } XDis ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T A_c [ 5 ] ;
real_T A_v [ 25 ] ; real_T DELTA [ 5 ] ; real_T K ; real_T Kd [ 25 ] ; real_T
Ki [ 25 ] ; real_T Kp [ 25 ] ; real_T M_m [ 25 ] ; real_T Ra [ 5 ] ; real_T
T_moto_B ; real_T T_s ; real_T gear_ratio [ 5 ] ; real_T ke [ 5 ] ; real_T km
[ 5 ] ; real_T q0_B [ 5 ] ; real_T qd0_B [ 5 ] ; real_T qdd0_B [ 5 ] ; real_T
t_const ; real_T t_fade ; real_T integrateerr_gainval ; real_T
integrateerr_IC ; } ; extern const char_T * RT_MEMORY_ALLOCATION_ERROR ;
extern B rtB ; extern X rtX ; extern DW rtDW ; extern P rtP ; extern mxArray
* mr_IDRA_mismodeled_B_GetDWork ( ) ; extern void
mr_IDRA_mismodeled_B_SetDWork ( const mxArray * ssDW ) ; extern mxArray *
mr_IDRA_mismodeled_B_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * IDRA_mismodeled_B_GetCAPIStaticMap ( void )
; extern SimStruct * const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ;
extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T
tid ) ; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
