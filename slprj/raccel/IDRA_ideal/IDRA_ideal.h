#ifndef IDRA_ideal_h_
#define IDRA_ideal_h_
#ifndef IDRA_ideal_COMMON_INCLUDES_
#define IDRA_ideal_COMMON_INCLUDES_
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
#include "IDRA_ideal_types.h"
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#define MODEL_NAME IDRA_ideal
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
typedef struct { real_T duhcegxiww [ 5 ] ; real_T lhkkowo0nn ; real_T
clzeg0mgxn [ 5 ] ; real_T m0zpelvx4c [ 5 ] ; real_T fa5pa5xss3 [ 5 ] ; real_T
dfgp2cfok2 [ 5 ] ; real_T iaqh5zb44n [ 5 ] ; real_T eridgjr4ky ; real_T
ayze2qgrmj [ 5 ] ; real_T ml11i2hghx [ 5 ] ; real_T jgfeqbyr5s [ 5 ] ; real_T
dwu33zmije [ 5 ] ; real_T gjrxh0fggm [ 5 ] ; real_T nkffw5s2fh [ 5 ] ; real_T
ikueevaqcu [ 10 ] ; real_T jbqnkbo01d [ 5 ] ; real_T kd1lrgsfm5 [ 5 ] ;
real_T b3q0dwdslb [ 5 ] ; real_T gm5u2wszg5 [ 5 ] ; real_T bzl0ko0cuy [ 25 ]
; real_T ovthouobfc [ 50 ] ; real_T jym5i5fv03 [ 25 ] ; real_T gz4je3xrs2 [ 5
] ; real_T be34bt2ox5 [ 5 ] ; real_T faqro4qsbw [ 5 ] ; } B ; typedef struct
{ kxg4oc5jml * mi3zr05m4m ; real_T mznpziqilf [ 5 ] ; real_T emznpnkn2r [ 5 ]
; real_T etkg31qada [ 5 ] ; real_T pb2ntxenga [ 5 ] ; real_T piesobdo33 [ 5 ]
; real_T lezbekocq5 ; struct { void * PrevTimePtr ; } kv5cshr4pr ; struct {
void * PrevTimePtr ; } g1iyzdoa4d ; struct { void * PrevTimePtr ; }
houxtxsdbs ; struct { void * LoggedData ; } fmultj3scx ; struct { void *
AQHandles ; } kdjze5zyat ; struct { void * AQHandles ; } omeeantnzf ; struct
{ void * AQHandles ; } mfwodyrjey ; struct { void * AQHandles ; } fyfgkslcyk
; struct { void * AQHandles ; } fdqevx30qz ; struct { void * AQHandles ; }
lurh2sfopt ; struct { void * AQHandles ; } p4sjgoac5d ; struct { void *
LoggedData ; } njtg3wlgpq ; struct { void * LoggedData ; } g41jsyd2ce ;
struct { void * LoggedData ; } jveh5kwnyn ; struct { void * LoggedData ; }
d1wedjrugl ; struct { void * LoggedData ; } hlbe0u5set ; struct { void *
LoggedData ; } atle5sx0dw ; struct { void * LoggedData ; } i5aivn5bzu ;
struct { void * LoggedData ; } cgspc25xxu ; struct { void * LoggedData ; }
ma4rew40gx ; struct { void * LoggedData ; } e4kfppx3aw ; int32_T kzlwqraqij ;
int32_T h3vk22mn5c ; int32_T lcwydbxwp2 ; int32_T cvrmw0cqs3 ; int32_T
nzif0s4jqa ; int32_T anwyxd3iti ; int32_T als1agj0yy ; int32_T dwmuy0hq5e ;
int32_T gba44xx4sm ; boolean_T kwbneksam0 ; boolean_T lbfl044rgi ; boolean_T
mldbalci1x ; boolean_T hratggtsdz ; boolean_T bbvckms0db ; boolean_T
bgwce04xfh ; boolean_T n304r1ooyz ; boolean_T g040bpnhdc ; boolean_T
kocgo44ina ; boolean_T gmw3hy3son ; boolean_T eqonurh4qc ; boolean_T
ia4rs3qk4c ; boolean_T dkjmicunwo ; boolean_T fpbdm0p31c ; boolean_T
au2zeyz4gc ; boolean_T lhpd5viobv ; boolean_T i4kxhu0aka ; boolean_T
isgdpunkdd ; boolean_T i3at1auhld ; } DW ; typedef struct { real_T nhcknjm5ka
[ 5 ] ; real_T ch55w1wg03 [ 5 ] ; } X ; typedef struct { real_T nhcknjm5ka [
5 ] ; real_T ch55w1wg03 [ 5 ] ; } XDot ; typedef struct { boolean_T
nhcknjm5ka [ 5 ] ; boolean_T ch55w1wg03 [ 5 ] ; } XDis ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T A_c [ 5 ] ;
real_T A_v [ 25 ] ; real_T DELTA ; real_T K ; real_T Kd [ 25 ] ; real_T Ki [
25 ] ; real_T Kp [ 25 ] ; real_T M_m [ 25 ] ; real_T Ra [ 5 ] ; real_T
T_moto_A ; real_T T_s ; real_T gear_ratio [ 5 ] ; real_T ke [ 5 ] ; real_T km
[ 5 ] ; real_T q0_A [ 5 ] ; real_T qd0_A [ 5 ] ; real_T qdd0_A [ 5 ] ; real_T
t_LPF ; real_T t_const ; real_T t_fade ; real_T integrateerr_gainval ; real_T
integrateerr_IC ; } ; extern const char_T * RT_MEMORY_ALLOCATION_ERROR ;
extern B rtB ; extern X rtX ; extern DW rtDW ; extern P rtP ; extern mxArray
* mr_IDRA_ideal_GetDWork ( ) ; extern void mr_IDRA_ideal_SetDWork ( const
mxArray * ssDW ) ; extern mxArray * mr_IDRA_ideal_GetSimStateDisallowedBlocks
( ) ; extern const rtwCAPI_ModelMappingStaticInfo *
IDRA_ideal_GetCAPIStaticMap ( void ) ; extern SimStruct * const rtS ; extern
DataMapInfo * rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo *
rt_modelMapInfoPtr ; void MdlOutputs ( int_T tid ) ; void
MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ;
void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void
MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
