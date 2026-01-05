    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 1;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (rtP)
        ;%
            section.nData     = 22;
            section.data(22)  = dumData; %prealloc

                    ;% rtP.A_c
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.A_v
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 5;

                    ;% rtP.DELTA
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 30;

                    ;% rtP.K
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 31;

                    ;% rtP.Kd
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 32;

                    ;% rtP.Ki
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 57;

                    ;% rtP.Kp
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 82;

                    ;% rtP.M_m
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 107;

                    ;% rtP.Ra
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 132;

                    ;% rtP.T_moto_A
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 137;

                    ;% rtP.T_s
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 138;

                    ;% rtP.gear_ratio
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 139;

                    ;% rtP.ke
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 144;

                    ;% rtP.km
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 149;

                    ;% rtP.q0_A
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 154;

                    ;% rtP.qd0_A
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 159;

                    ;% rtP.qdd0_A
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 164;

                    ;% rtP.t_LPF
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 169;

                    ;% rtP.t_const
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 170;

                    ;% rtP.t_fade
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 171;

                    ;% rtP.integrateerr_gainval
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 172;

                    ;% rtP.integrateerr_IC
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 173;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 1;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
            sigMap.sections(nTotSects) = dumSection; %prealloc
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (rtB)
        ;%
            section.nData     = 25;
            section.data(25)  = dumData; %prealloc

                    ;% rtB.n5xr5njcua
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.eukpwigpzj
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 5;

                    ;% rtB.l242ahah3l
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 6;

                    ;% rtB.m35vfhspni
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 11;

                    ;% rtB.kunfnxzism
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 16;

                    ;% rtB.l22zbia3wy
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 21;

                    ;% rtB.etkweornb4
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 26;

                    ;% rtB.mwi3gmsjsh
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 31;

                    ;% rtB.fwtv12rxyl
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 32;

                    ;% rtB.lja53h1mv0
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 37;

                    ;% rtB.k5nl4qx3lk
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 42;

                    ;% rtB.gzuuqzbm0d
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 47;

                    ;% rtB.gaicd5yeyt
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 52;

                    ;% rtB.kqtyr5igtp
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 57;

                    ;% rtB.b5cu1wtcmo
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 62;

                    ;% rtB.hvdzpvdqz2
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 72;

                    ;% rtB.mqd0soihwr
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 77;

                    ;% rtB.nv1psjvd2k
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 82;

                    ;% rtB.bjlsurcqq3
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 87;

                    ;% rtB.di0rwgvsyo
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 92;

                    ;% rtB.juhzfokcop
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 117;

                    ;% rtB.cldckdbf5g
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 167;

                    ;% rtB.olk5ekrjnx
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 192;

                    ;% rtB.gkyg0slat4
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 197;

                    ;% rtB.pjafrqv45j
                    section.data(25).logicalSrcIdx = 31;
                    section.data(25).dtTransOffset = 202;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section


            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 5;
        sectIdxOffset = 1;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (rtDW)
        ;%
            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% rtDW.dygf2ftvjj
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 6;
            section.data(6)  = dumData; %prealloc

                    ;% rtDW.oiukevuitk
                    section.data(1).logicalSrcIdx = 1;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.m3chjijl0d
                    section.data(2).logicalSrcIdx = 2;
                    section.data(2).dtTransOffset = 5;

                    ;% rtDW.hickzsamlu
                    section.data(3).logicalSrcIdx = 3;
                    section.data(3).dtTransOffset = 10;

                    ;% rtDW.ksfzgqfukh
                    section.data(4).logicalSrcIdx = 4;
                    section.data(4).dtTransOffset = 15;

                    ;% rtDW.gnh1ryygwp
                    section.data(5).logicalSrcIdx = 5;
                    section.data(5).dtTransOffset = 20;

                    ;% rtDW.kwl3yzcmor
                    section.data(6).logicalSrcIdx = 6;
                    section.data(6).dtTransOffset = 25;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 21;
            section.data(21)  = dumData; %prealloc

                    ;% rtDW.p14mucnvmp.PrevTimePtr
                    section.data(1).logicalSrcIdx = 7;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.ilte4aiyo5.PrevTimePtr
                    section.data(2).logicalSrcIdx = 8;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.cdx03i5frz.PrevTimePtr
                    section.data(3).logicalSrcIdx = 9;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.hbnvoymfak.LoggedData
                    section.data(4).logicalSrcIdx = 10;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.mbe201oe5v.AQHandles
                    section.data(5).logicalSrcIdx = 11;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.pg45ke0axf.AQHandles
                    section.data(6).logicalSrcIdx = 12;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.h4bxgfxloh.AQHandles
                    section.data(7).logicalSrcIdx = 13;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.l2a3onaamy.AQHandles
                    section.data(8).logicalSrcIdx = 14;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.cja23q2jv1.AQHandles
                    section.data(9).logicalSrcIdx = 15;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.bc2leufkrn.AQHandles
                    section.data(10).logicalSrcIdx = 16;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.it2tjs3ozz.AQHandles
                    section.data(11).logicalSrcIdx = 17;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.mnaqg2n5ue.LoggedData
                    section.data(12).logicalSrcIdx = 18;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.ap4ch4x3ro.LoggedData
                    section.data(13).logicalSrcIdx = 19;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.av2jdtrst0.LoggedData
                    section.data(14).logicalSrcIdx = 20;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.kw24o5ryr1.LoggedData
                    section.data(15).logicalSrcIdx = 21;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.lfr51cd4r3.LoggedData
                    section.data(16).logicalSrcIdx = 22;
                    section.data(16).dtTransOffset = 15;

                    ;% rtDW.odubkdhol5.LoggedData
                    section.data(17).logicalSrcIdx = 23;
                    section.data(17).dtTransOffset = 16;

                    ;% rtDW.obqlyopk5w.LoggedData
                    section.data(18).logicalSrcIdx = 24;
                    section.data(18).dtTransOffset = 17;

                    ;% rtDW.ehycuwfiky.LoggedData
                    section.data(19).logicalSrcIdx = 25;
                    section.data(19).dtTransOffset = 18;

                    ;% rtDW.knmknf5jqq.LoggedData
                    section.data(20).logicalSrcIdx = 26;
                    section.data(20).dtTransOffset = 19;

                    ;% rtDW.aamdqse3cd.LoggedData
                    section.data(21).logicalSrcIdx = 27;
                    section.data(21).dtTransOffset = 20;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 9;
            section.data(9)  = dumData; %prealloc

                    ;% rtDW.pa3dqsb340
                    section.data(1).logicalSrcIdx = 28;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.iiqtrvsiuy
                    section.data(2).logicalSrcIdx = 29;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.aawojtlsiv
                    section.data(3).logicalSrcIdx = 30;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.d5bu03ftgu
                    section.data(4).logicalSrcIdx = 31;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.f0pwgsrhyq
                    section.data(5).logicalSrcIdx = 32;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.da13aaqjlz
                    section.data(6).logicalSrcIdx = 33;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.heschxcuox
                    section.data(7).logicalSrcIdx = 34;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.loudm4h2ge
                    section.data(8).logicalSrcIdx = 35;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.jpulpqppfe
                    section.data(9).logicalSrcIdx = 36;
                    section.data(9).dtTransOffset = 8;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 19;
            section.data(19)  = dumData; %prealloc

                    ;% rtDW.ijkhui25gd
                    section.data(1).logicalSrcIdx = 37;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.oth4403mh5
                    section.data(2).logicalSrcIdx = 38;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.okkg5capjl
                    section.data(3).logicalSrcIdx = 39;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.eucdibji1z
                    section.data(4).logicalSrcIdx = 40;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.m1s25jqvod
                    section.data(5).logicalSrcIdx = 41;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.czdpkegx5k
                    section.data(6).logicalSrcIdx = 42;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.ls1o2mfmjo
                    section.data(7).logicalSrcIdx = 43;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.bsgtwsd1jf
                    section.data(8).logicalSrcIdx = 44;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.c1hbv4rx4l
                    section.data(9).logicalSrcIdx = 45;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.h520wyoarp
                    section.data(10).logicalSrcIdx = 46;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.c0ilvtxztb
                    section.data(11).logicalSrcIdx = 47;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.it3tlk4adc
                    section.data(12).logicalSrcIdx = 48;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.ehvjsjgo0b
                    section.data(13).logicalSrcIdx = 49;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.cgpp5rflcl
                    section.data(14).logicalSrcIdx = 50;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.lnoyt2jl5z
                    section.data(15).logicalSrcIdx = 51;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.blcudpdeor
                    section.data(16).logicalSrcIdx = 52;
                    section.data(16).dtTransOffset = 15;

                    ;% rtDW.m0z2tnolrm
                    section.data(17).logicalSrcIdx = 53;
                    section.data(17).dtTransOffset = 16;

                    ;% rtDW.amaoifwnpv
                    section.data(18).logicalSrcIdx = 54;
                    section.data(18).dtTransOffset = 17;

                    ;% rtDW.owv5eyemxf
                    section.data(19).logicalSrcIdx = 55;
                    section.data(19).dtTransOffset = 18;

            nTotData = nTotData + section.nData;
            dworkMap.sections(5) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 3428248122;
    targMap.checksum1 = 3021278040;
    targMap.checksum2 = 3297884093;
    targMap.checksum3 = 3204001862;

