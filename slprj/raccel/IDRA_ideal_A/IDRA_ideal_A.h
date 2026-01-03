#ifndef IDRA_ideal_A_h_
#define IDRA_ideal_A_h_
#ifndef IDRA_ideal_A_COMMON_INCLUDES_
#define IDRA_ideal_A_COMMON_INCLUDES_
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
#include "IDRA_ideal_A_types.h"
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#define MODEL_NAME IDRA_ideal_A
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
typedef struct { real_T g5xwnazqpz [ 5 ] ; real_T jz4m5cmwj5 ; real_T
eui0ydajkz [ 5 ] ; real_T hdz5un0qo2 [ 5 ] ; real_T nc2znxpbty [ 5 ] ; real_T
eygf2xxaku [ 5 ] ; real_T ihd3wyvjoy [ 5 ] ; real_T dv24ac1zbl ; real_T
g13cu5gihi [ 5 ] ; real_T gsbfze2nok [ 5 ] ; real_T hnoablh4jk [ 5 ] ; real_T
hpqd21hy52 [ 5 ] ; real_T o5rg1udzsb [ 5 ] ; real_T hlid0vfc4k [ 5 ] ; real_T
bi1q3dr41y [ 10 ] ; real_T mcfjuxg2hs [ 5 ] ; real_T hify2k5p5a [ 5 ] ;
real_T jixbzym12d [ 5 ] ; real_T doe3yn4drb [ 5 ] ; real_T dyrdfzzyfp [ 25 ]
; real_T loc04zqipc [ 50 ] ; real_T erjs0ezque [ 25 ] ; real_T hwstuumpmz [ 5
] ; real_T evft3hf130 [ 5 ] ; real_T m2rcdpkic4 [ 5 ] ; } B ; typedef struct
{ cdof3ox1ad * ptdsq0gbgo ; real_T dmail24epa [ 5 ] ; real_T fqj2qn0kad [ 5 ]
; real_T k1hxqopvaz [ 5 ] ; real_T fsqagztsdg [ 5 ] ; real_T mn3aaukrbk [ 5 ]
; real_T gftrdpsljd ; struct { void * PrevTimePtr ; } bdq3qnahrm ; struct {
void * PrevTimePtr ; } atdk04hawl ; struct { void * PrevTimePtr ; }
aqd3xtvp0z ; struct { void * LoggedData ; } ofknef5lgm ; struct { void *
AQHandles ; } foef342asi ; struct { void * AQHandles ; } lnntenep3v ; struct
{ void * AQHandles ; } igpowliegm ; struct { void * AQHandles ; } blqel5eqjx
; struct { void * AQHandles ; } hlcxtww0bh ; struct { void * AQHandles ; }
aeno52smt3 ; struct { void * AQHandles ; } mj0vahssrn ; struct { void *
LoggedData ; } jlpsuiihlb ; struct { void * LoggedData ; } hhgg3xluyu ;
struct { void * LoggedData ; } k1szcucby1 ; struct { void * LoggedData ; }
jskxqlewth ; struct { void * LoggedData ; } ebcnifwpnd ; struct { void *
LoggedData ; } pvcvhobzdm ; struct { void * LoggedData ; } glf01vh42y ;
struct { void * LoggedData ; } docgoxov5u ; struct { void * LoggedData ; }
akpkegkdgg ; struct { void * LoggedData ; } puurf4vao3 ; int32_T jsjhxgbq4p ;
int32_T ar4tuzzakt ; int32_T j23errvikb ; int32_T kkz5ixjw4y ; int32_T
gyjlr3zlft ; int32_T ou32kwsdoi ; int32_T hh2zbkeczc ; int32_T ozgo3c3hnm ;
int32_T h2fl0qlslk ; boolean_T e1tavwfxd4 ; boolean_T n2hbr2jjcv ; boolean_T
d414zffzug ; boolean_T ghm1s0sgaq ; boolean_T hj3lkescgh ; boolean_T
lgtfdx1rsv ; boolean_T df1c4owviu ; boolean_T hkgs5qhhhw ; boolean_T
lvs1wgssr4 ; boolean_T gcipi40n22 ; boolean_T ntr02yokun ; boolean_T
a0oiybhwtu ; boolean_T nmhz1ukklp ; boolean_T bn1vo20qqd ; boolean_T
b4rsgvywtm ; boolean_T m2k1hcgh5w ; boolean_T jsnmmngw4p ; boolean_T
eduf3mu53i ; boolean_T lccbxwhby2 ; } DW ; typedef struct { real_T obfrs350ue
[ 5 ] ; real_T oap1sranuk [ 5 ] ; } X ; typedef struct { real_T obfrs350ue [
5 ] ; real_T oap1sranuk [ 5 ] ; } XDot ; typedef struct { boolean_T
obfrs350ue [ 5 ] ; boolean_T oap1sranuk [ 5 ] ; } XDis ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T A_c [ 5 ] ;
real_T A_v [ 25 ] ; real_T DELTA ; real_T K ; real_T Kd [ 25 ] ; real_T Ki [
25 ] ; real_T Kp [ 25 ] ; real_T M_m [ 25 ] ; real_T Ra [ 5 ] ; real_T
T_moto_A ; real_T T_s ; real_T gear_ratio [ 5 ] ; real_T ke [ 5 ] ; real_T km
[ 5 ] ; real_T q0_A [ 5 ] ; real_T qd0_A [ 5 ] ; real_T qdd0_A [ 5 ] ; real_T
t_LPF ; real_T t_const ; real_T t_fade ; real_T integrateerr_gainval ; real_T
integrateerr_IC ; } ; extern const char_T * RT_MEMORY_ALLOCATION_ERROR ;
extern B rtB ; extern X rtX ; extern DW rtDW ; extern P rtP ; extern mxArray
* mr_IDRA_ideal_A_GetDWork ( ) ; extern void mr_IDRA_ideal_A_SetDWork ( const
mxArray * ssDW ) ; extern mxArray *
mr_IDRA_ideal_A_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * IDRA_ideal_A_GetCAPIStaticMap ( void ) ;
extern SimStruct * const rtS ; extern DataMapInfo * rt_dataMapInfoPtr ;
extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ; void MdlOutputs ( int_T
tid ) ; void MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
