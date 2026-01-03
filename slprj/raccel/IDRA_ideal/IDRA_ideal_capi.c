#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "IDRA_ideal_capi_host.h"
#define sizeof(...) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)
#ifndef SS_UINT64
#define SS_UINT64 18
#endif
#ifndef SS_INT64
#define SS_INT64 19
#endif
#else
#include "builtin_typeid_types.h"
#include "IDRA_ideal.h"
#include "IDRA_ideal_capi.h"
#include "IDRA_ideal_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               ((NULL))
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 1 , TARGET_STRING ( "IDRA_ideal/MATLAB Function" ) , TARGET_STRING ( "qdd_true" ) , 0 , 0 , 0 , 0 , 0 } , { 1 , 4 , TARGET_STRING ( "IDRA_ideal/MATLAB Function3" ) , TARGET_STRING ( "tau" ) , 0 , 0 , 0 , 0 , 1 } , { 2 , 5 , TARGET_STRING ( "IDRA_ideal/MATLAB Function4" ) , TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 1 } , { 3 , 5 , TARGET_STRING ( "IDRA_ideal/MATLAB Function4" ) , TARGET_STRING ( "" ) , 1 , 0 , 2 , 0 , 1 } , { 4 , 5 , TARGET_STRING ( "IDRA_ideal/MATLAB Function4" ) , TARGET_STRING ( "" ) , 2 , 0 , 1 , 0 , 1 } , { 5 , 5 , TARGET_STRING ( "IDRA_ideal/MATLAB Function4" ) , TARGET_STRING ( "" ) , 3 , 0 , 0 , 0 , 1 } , { 6 , 6 , TARGET_STRING ( "IDRA_ideal/MATLAB Function5" ) , TARGET_STRING ( "qd_meas" ) , 0 , 0 , 0 , 0 , 2 } , { 7 , 7 , TARGET_STRING ( "IDRA_ideal/MATLAB Function6" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 8 , 8 , TARGET_STRING ( "IDRA_ideal/MATLAB Function7" ) , TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 2 } , { 9 , 8 , TARGET_STRING ( "IDRA_ideal/MATLAB Function7" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 2 } , { 10 , 8 , TARGET_STRING ( "IDRA_ideal/MATLAB Function7" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 2 } , { 11 , 9 , TARGET_STRING ( "IDRA_ideal/MATLAB Function8" ) , TARGET_STRING ( "tau_m" ) , 0 , 0 , 0 , 0 , 2 } , { 12 , 9 , TARGET_STRING ( "IDRA_ideal/MATLAB Function8" ) , TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 2 } , { 13 , 9 , TARGET_STRING ( "IDRA_ideal/MATLAB Function8" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 , 2 } , { 14 , 9 , TARGET_STRING ( "IDRA_ideal/MATLAB Function8" ) , TARGET_STRING ( "" ) , 3 , 0 , 0 , 0 , 2 } , { 15 , 0 , TARGET_STRING ( "IDRA_ideal/Clock" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 } , { 16 , 0 , TARGET_STRING ( "IDRA_ideal/Clock1" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 } , { 17 , 0 , TARGET_STRING ( "IDRA_ideal/From File" ) , TARGET_STRING ( "" ) , 0 , 0 , 5 , 0 , 3 } , { 18 , 0 , TARGET_STRING ( "IDRA_ideal/From File1" ) , TARGET_STRING ( "" ) , 0 , 0 , 5 , 0 , 3 } , { 19 , 0 , TARGET_STRING ( "IDRA_ideal/From File2" ) , TARGET_STRING ( "" ) , 0 , 0 , 5 , 0 , 3 } , { 20 , 0 , TARGET_STRING ( "IDRA_ideal/Gain2" ) , TARGET_STRING ( "ki*err_i" ) , 0 , 0 , 5 , 0 , 2 } , { 21 , 0 , TARGET_STRING ( "IDRA_ideal/integrate qdd" ) , TARGET_STRING ( "qd_true" ) , 0 , 0 , 0 , 0 , 0 } , { 22 , 0 , TARGET_STRING ( "IDRA_ideal/Add" ) , TARGET_STRING ( "tau_p" ) , 0 , 0 , 5 , 0 , 3 } , { 23 , 0 , TARGET_STRING ( "IDRA_ideal/Add1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 24 , 0 , TARGET_STRING ( "IDRA_ideal/Subtract1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 3 } , { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 25 , TARGET_STRING ( "IDRA_ideal/integrate err" ) , TARGET_STRING ( "gainval" ) , 0 , 4 , 0 } , { 26 , TARGET_STRING ( "IDRA_ideal/integrate err" ) , TARGET_STRING ( "InitialCondition" ) , 0 , 4 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 } } ; static int_T rt_LoggedStateIdxList [ ] = { - 1 } ; static const rtwCAPI_Signals rtRootInputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_Signals rtRootOutputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_ModelParameters rtModelParameters [ ] = { { 27 , TARGET_STRING ( "A_c" ) , 0 , 5 , 0 } , { 28 , TARGET_STRING ( "A_v" ) , 0 , 1 , 0 } , { 29 , TARGET_STRING ( "DELTA" ) , 0 , 4 , 0 } , { 30 , TARGET_STRING ( "K" ) , 0 , 4 , 0 } , { 31 , TARGET_STRING ( "Kd" ) , 0 , 1 , 0 } , { 32 , TARGET_STRING ( "Ki" ) , 0 , 1 , 0 } , { 33 , TARGET_STRING ( "Kp" ) , 0 , 1 , 0 } , { 34 , TARGET_STRING ( "M_m" ) , 0 , 1 , 0 } , { 35 , TARGET_STRING ( "Ra" ) , 0 , 5 , 0 } , { 36 , TARGET_STRING ( "T_moto_A" ) , 0 , 4 , 0 } , { 37 , TARGET_STRING ( "T_s" ) , 0 , 4 , 0 } , { 38 , TARGET_STRING ( "gear_ratio" ) , 0 , 5 , 0 } , { 39 , TARGET_STRING ( "ke" ) , 0 , 5 , 0 } , { 40 , TARGET_STRING ( "km" ) , 0 , 5 , 0 } , { 41 , TARGET_STRING ( "q0_A" ) , 0 , 5 , 0 } , { 42 , TARGET_STRING ( "qd0_A" ) , 0 , 5 , 0 } , { 43 , TARGET_STRING ( "qdd0_A" ) , 0 , 5 , 0 } , { 44 , TARGET_STRING ( "t_LPF" ) , 0 , 4 , 0 } , { 45 , TARGET_STRING ( "t_const" ) , 0 , 4 , 0 } , { 46 , TARGET_STRING ( "t_fade" ) , 0 , 4 , 0 } , { 0 , ( NULL ) , 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . faqro4qsbw [ 0 ] , & rtB .
be34bt2ox5 [ 0 ] , & rtB . bzl0ko0cuy [ 0 ] , & rtB . ovthouobfc [ 0 ] , &
rtB . jym5i5fv03 [ 0 ] , & rtB . gz4je3xrs2 [ 0 ] , & rtB . gm5u2wszg5 [ 0 ]
, & rtB . b3q0dwdslb [ 0 ] , & rtB . ikueevaqcu [ 0 ] , & rtB . jbqnkbo01d [
0 ] , & rtB . kd1lrgsfm5 [ 0 ] , & rtB . jgfeqbyr5s [ 0 ] , & rtB .
dwu33zmije [ 0 ] , & rtB . gjrxh0fggm [ 0 ] , & rtB . nkffw5s2fh [ 0 ] , &
rtB . lhkkowo0nn , & rtB . eridgjr4ky , & rtB . fa5pa5xss3 [ 0 ] , & rtB .
dfgp2cfok2 [ 0 ] , & rtB . clzeg0mgxn [ 0 ] , & rtB . m0zpelvx4c [ 0 ] , &
rtB . ml11i2hghx [ 0 ] , & rtB . iaqh5zb44n [ 0 ] , & rtB . duhcegxiww [ 0 ]
, & rtB . ayze2qgrmj [ 0 ] , & rtP . integrateerr_gainval , & rtP .
integrateerr_IC , & rtP . A_c [ 0 ] , & rtP . A_v [ 0 ] , & rtP . DELTA , &
rtP . K , & rtP . Kd [ 0 ] , & rtP . Ki [ 0 ] , & rtP . Kp [ 0 ] , & rtP .
M_m [ 0 ] , & rtP . Ra [ 0 ] , & rtP . T_moto_A , & rtP . T_s , & rtP .
gear_ratio [ 0 ] , & rtP . ke [ 0 ] , & rtP . km [ 0 ] , & rtP . q0_A [ 0 ] ,
& rtP . qd0_A [ 0 ] , & rtP . qdd0_A [ 0 ] , & rtP . t_LPF , & rtP . t_const
, & rtP . t_fade , } ; static int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , ( uint8_T ) SS_DOUBLE , 0 , 0 , 0 } }
;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_MATRIX_COL_MAJOR , 0 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 2 , 2 ,
0 } , { rtwCAPI_MATRIX_COL_MAJOR , 4 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR ,
6 , 2 , 0 } , { rtwCAPI_SCALAR , 8 , 2 , 0 } , { rtwCAPI_VECTOR , 0 , 2 , 0 }
} ; static const uint_T rtDimensionArray [ ] = { 5 , 1 , 5 , 5 , 5 , 10 , 10
, 1 , 1 , 1 } ; static const real_T rtcapiStoredFloats [ ] = { 0.0 , 0.02 ,
0.01 , 0.005 } ; static const rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL )
, ( NULL ) , rtwCAPI_FIX_RESERVED , 0 , 0 , ( boolean_T ) 0 } , } ; static
const rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( const void * ) &
rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 0 ] , ( int8_T ) 0 , ( uint8_T ) 0 } , { ( const void * ) & rtcapiStoredFloats [ 1 ] , ( const void * ) & rtcapiStoredFloats [ 0 ] , ( int8_T ) 3 , ( uint8_T ) 0 } , { ( const void * ) & rtcapiStoredFloats [ 2 ] , ( const void * ) & rtcapiStoredFloats [ 0 ] , ( int8_T ) 2 , ( uint8_T ) 0 } , { ( const void * ) & rtcapiStoredFloats [ 3 ] , ( const void * ) & rtcapiStoredFloats [ 0 ] , ( int8_T ) 1 , ( uint8_T ) 0 } } ; static rtwCAPI_ModelMappingStaticInfo mmiStatic = { { rtBlockSignals , 25 , rtRootInputs , 0 , rtRootOutputs , 0 } , { rtBlockParameters , 2 , rtModelParameters , 20 } , { ( NULL ) , 0 } , { rtDataTypeMap , rtDimensionMap , rtFixPtMap , rtElementMap , rtSampleTimeMap , rtDimensionArray } , "float" , { 2000280846U , 4129644776U , 1002236201U , 1554170852U } , ( NULL ) , 0 , ( boolean_T ) 0 , rt_LoggedStateIdxList } ; const rtwCAPI_ModelMappingStaticInfo * IDRA_ideal_GetCAPIStaticMap ( void ) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void IDRA_ideal_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void IDRA_ideal_host_InitializeDataMapInfo ( IDRA_ideal_host_DataMapInfo_T *
dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ;
rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ;
rtwCAPI_SetDataAddressMap ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetPath
( dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , ( NULL ) )
; rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
