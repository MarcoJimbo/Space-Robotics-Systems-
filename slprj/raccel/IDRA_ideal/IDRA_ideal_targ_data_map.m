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
            section.nData     = 17;
            section.data(17)  = dumData; %prealloc

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

                    ;% rtP.T_s
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 132;

                    ;% rtP.q0_A
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 133;

                    ;% rtP.qd0_A
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 138;

                    ;% rtP.qdd0_A
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 143;

                    ;% rtP.t_LPF
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 148;

                    ;% rtP.t_const
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 149;

                    ;% rtP.t_fade
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 150;

                    ;% rtP.integrateerr_gainval
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 151;

                    ;% rtP.integrateerr_IC
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 152;

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
            section.nData     = 19;
            section.data(19)  = dumData; %prealloc

                    ;% rtB.duhcegxiww
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.lhkkowo0nn
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 5;

                    ;% rtB.fa5pa5xss3
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 6;

                    ;% rtB.dfgp2cfok2
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 11;

                    ;% rtB.m0zpelvx4c
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 16;

                    ;% rtB.iaqh5zb44n
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 21;

                    ;% rtB.ayze2qgrmj
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 26;

                    ;% rtB.ml11i2hghx
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 31;

                    ;% rtB.ikueevaqcu
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 36;

                    ;% rtB.jbqnkbo01d
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 46;

                    ;% rtB.kd1lrgsfm5
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 51;

                    ;% rtB.b3q0dwdslb
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 56;

                    ;% rtB.gm5u2wszg5
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 61;

                    ;% rtB.bzl0ko0cuy
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 66;

                    ;% rtB.ovthouobfc
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 91;

                    ;% rtB.jym5i5fv03
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 141;

                    ;% rtB.gz4je3xrs2
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 166;

                    ;% rtB.be34bt2ox5
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 171;

                    ;% rtB.faqro4qsbw
                    section.data(19).logicalSrcIdx = 25;
                    section.data(19).dtTransOffset = 176;

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

                    ;% rtDW.mi3zr05m4m
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 6;
            section.data(6)  = dumData; %prealloc

                    ;% rtDW.mznpziqilf
                    section.data(1).logicalSrcIdx = 1;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.emznpnkn2r
                    section.data(2).logicalSrcIdx = 2;
                    section.data(2).dtTransOffset = 5;

                    ;% rtDW.etkg31qada
                    section.data(3).logicalSrcIdx = 3;
                    section.data(3).dtTransOffset = 10;

                    ;% rtDW.pb2ntxenga
                    section.data(4).logicalSrcIdx = 4;
                    section.data(4).dtTransOffset = 15;

                    ;% rtDW.piesobdo33
                    section.data(5).logicalSrcIdx = 5;
                    section.data(5).dtTransOffset = 20;

                    ;% rtDW.lezbekocq5
                    section.data(6).logicalSrcIdx = 6;
                    section.data(6).dtTransOffset = 25;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 12;
            section.data(12)  = dumData; %prealloc

                    ;% rtDW.g31n03pmgo.LoggedData
                    section.data(1).logicalSrcIdx = 7;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.nzs4hn2gu1.LoggedData
                    section.data(2).logicalSrcIdx = 8;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.g1iyzdoa4d.PrevTimePtr
                    section.data(3).logicalSrcIdx = 9;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.nrp5wjsdhp.LoggedData
                    section.data(4).logicalSrcIdx = 10;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.houxtxsdbs.PrevTimePtr
                    section.data(5).logicalSrcIdx = 11;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.pnnv13nchn.LoggedData
                    section.data(6).logicalSrcIdx = 12;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.kdjze5zyat.AQHandles
                    section.data(7).logicalSrcIdx = 13;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.omeeantnzf.AQHandles
                    section.data(8).logicalSrcIdx = 14;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.kv5cshr4pr.PrevTimePtr
                    section.data(9).logicalSrcIdx = 15;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.mfwodyrjey.AQHandles
                    section.data(10).logicalSrcIdx = 16;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.njtg3wlgpq.LoggedData
                    section.data(11).logicalSrcIdx = 17;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.cgspc25xxu.LoggedData
                    section.data(12).logicalSrcIdx = 18;
                    section.data(12).dtTransOffset = 11;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 8;
            section.data(8)  = dumData; %prealloc

                    ;% rtDW.h3vk22mn5c
                    section.data(1).logicalSrcIdx = 19;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.lcwydbxwp2
                    section.data(2).logicalSrcIdx = 20;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.cvrmw0cqs3
                    section.data(3).logicalSrcIdx = 21;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.nzif0s4jqa
                    section.data(4).logicalSrcIdx = 22;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.anwyxd3iti
                    section.data(5).logicalSrcIdx = 23;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.als1agj0yy
                    section.data(6).logicalSrcIdx = 24;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.dwmuy0hq5e
                    section.data(7).logicalSrcIdx = 25;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.gba44xx4sm
                    section.data(8).logicalSrcIdx = 26;
                    section.data(8).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 18;
            section.data(18)  = dumData; %prealloc

                    ;% rtDW.lbfl044rgi
                    section.data(1).logicalSrcIdx = 27;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.mldbalci1x
                    section.data(2).logicalSrcIdx = 28;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.hratggtsdz
                    section.data(3).logicalSrcIdx = 29;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.bbvckms0db
                    section.data(4).logicalSrcIdx = 30;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.bgwce04xfh
                    section.data(5).logicalSrcIdx = 31;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.n304r1ooyz
                    section.data(6).logicalSrcIdx = 32;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.g040bpnhdc
                    section.data(7).logicalSrcIdx = 33;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.kocgo44ina
                    section.data(8).logicalSrcIdx = 34;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.gmw3hy3son
                    section.data(9).logicalSrcIdx = 35;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.eqonurh4qc
                    section.data(10).logicalSrcIdx = 36;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.ia4rs3qk4c
                    section.data(11).logicalSrcIdx = 37;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.dkjmicunwo
                    section.data(12).logicalSrcIdx = 38;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.fpbdm0p31c
                    section.data(13).logicalSrcIdx = 39;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.au2zeyz4gc
                    section.data(14).logicalSrcIdx = 40;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.lhpd5viobv
                    section.data(15).logicalSrcIdx = 41;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.i4kxhu0aka
                    section.data(16).logicalSrcIdx = 42;
                    section.data(16).dtTransOffset = 15;

                    ;% rtDW.isgdpunkdd
                    section.data(17).logicalSrcIdx = 43;
                    section.data(17).dtTransOffset = 16;

                    ;% rtDW.i3at1auhld
                    section.data(18).logicalSrcIdx = 44;
                    section.data(18).dtTransOffset = 17;

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


    targMap.checksum0 = 405011508;
    targMap.checksum1 = 1703298597;
    targMap.checksum2 = 4191889648;
    targMap.checksum3 = 1454577562;

