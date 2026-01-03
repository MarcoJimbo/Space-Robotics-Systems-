#include "IDRA_ideal_A_capi_host.h"
static IDRA_ideal_A_host_DataMapInfo_T root;
static int initialized = 0;
__declspec( dllexport ) rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        IDRA_ideal_A_host_InitializeDataMapInfo(&(root), "IDRA_ideal_A");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction(){return(getRootMappingInfo());}
