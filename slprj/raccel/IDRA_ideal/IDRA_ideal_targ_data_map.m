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
            section.nData     = 14;
            section.data(14)  = dumData; %prealloc

                    ;% rtP.A_c
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.A_v
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 5;

                    ;% rtP.DELTA
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 30;

                    ;% rtP.Kd
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 31;

                    ;% rtP.Ki
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 56;

                    ;% rtP.Kp
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 81;

                    ;% rtP.M_m
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 106;

                    ;% rtP.T_s
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 131;

                    ;% rtP.q0_A
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 132;

                    ;% rtP.qd0_A
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 137;

                    ;% rtP.qdd0_A
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 142;

                    ;% rtP.t_const
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 147;

                    ;% rtP.integrateerr_gainval
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 148;

                    ;% rtP.integrateerr_IC
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 149;

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
            section.nData     = 18;
            section.data(18)  = dumData; %prealloc

                    ;% rtB.duhcegxiww
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.fa5pa5xss3
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 5;

                    ;% rtB.dfgp2cfok2
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 10;

                    ;% rtB.m0zpelvx4c
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 15;

                    ;% rtB.iaqh5zb44n
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 20;

                    ;% rtB.ayze2qgrmj
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 25;

                    ;% rtB.ml11i2hghx
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 30;

                    ;% rtB.ikueevaqcu
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 35;

                    ;% rtB.jbqnkbo01d
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 45;

                    ;% rtB.kd1lrgsfm5
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 50;

                    ;% rtB.b3q0dwdslb
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 55;

                    ;% rtB.jzojzgs1lv
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 60;

                    ;% rtB.bzl0ko0cuy
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 65;

                    ;% rtB.ovthouobfc
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 90;

                    ;% rtB.jym5i5fv03
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 140;

                    ;% rtB.gz4je3xrs2
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 165;

                    ;% rtB.be34bt2ox5
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 170;

                    ;% rtB.faqro4qsbw
                    section.data(18).logicalSrcIdx = 24;
                    section.data(18).dtTransOffset = 175;

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
        nTotSects     = 4;
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
            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% rtDW.mznpziqilf
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.emznpnkn2r
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 5;

                    ;% rtDW.hd1j5lknrz
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 10;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 12;
            section.data(12)  = dumData; %prealloc

                    ;% rtDW.g31n03pmgo.LoggedData
                    section.data(1).logicalSrcIdx = 3;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.nzs4hn2gu1.LoggedData
                    section.data(2).logicalSrcIdx = 4;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.g1iyzdoa4d.PrevTimePtr
                    section.data(3).logicalSrcIdx = 5;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.nrp5wjsdhp.LoggedData
                    section.data(4).logicalSrcIdx = 6;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.houxtxsdbs.PrevTimePtr
                    section.data(5).logicalSrcIdx = 7;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.pnnv13nchn.LoggedData
                    section.data(6).logicalSrcIdx = 8;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.kdjze5zyat.AQHandles
                    section.data(7).logicalSrcIdx = 9;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.omeeantnzf.AQHandles
                    section.data(8).logicalSrcIdx = 10;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.kv5cshr4pr.PrevTimePtr
                    section.data(9).logicalSrcIdx = 11;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.mfwodyrjey.AQHandles
                    section.data(10).logicalSrcIdx = 12;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.njtg3wlgpq.LoggedData
                    section.data(11).logicalSrcIdx = 13;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.cgspc25xxu.LoggedData
                    section.data(12).logicalSrcIdx = 14;
                    section.data(12).dtTransOffset = 11;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 7;
            section.data(7)  = dumData; %prealloc

                    ;% rtDW.h3vk22mn5c
                    section.data(1).logicalSrcIdx = 15;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.lcwydbxwp2
                    section.data(2).logicalSrcIdx = 16;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.nzif0s4jqa
                    section.data(3).logicalSrcIdx = 17;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.anwyxd3iti
                    section.data(4).logicalSrcIdx = 18;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.als1agj0yy
                    section.data(5).logicalSrcIdx = 19;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.dwmuy0hq5e
                    section.data(6).logicalSrcIdx = 20;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.gba44xx4sm
                    section.data(7).logicalSrcIdx = 21;
                    section.data(7).dtTransOffset = 6;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 11;
            section.data(11)  = dumData; %prealloc

                    ;% rtDW.lbfl044rgi
                    section.data(1).logicalSrcIdx = 22;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.mldbalci1x
                    section.data(2).logicalSrcIdx = 23;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.hratggtsdz
                    section.data(3).logicalSrcIdx = 24;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.akn4kfa0g4
                    section.data(4).logicalSrcIdx = 25;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.pjgy4flm4t
                    section.data(5).logicalSrcIdx = 26;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.clshd4n4yz
                    section.data(6).logicalSrcIdx = 27;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.au2zeyz4gc
                    section.data(7).logicalSrcIdx = 28;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.lhpd5viobv
                    section.data(8).logicalSrcIdx = 29;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.i4kxhu0aka
                    section.data(9).logicalSrcIdx = 30;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.isgdpunkdd
                    section.data(10).logicalSrcIdx = 31;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.i3at1auhld
                    section.data(11).logicalSrcIdx = 32;
                    section.data(11).dtTransOffset = 10;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
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


    targMap.checksum0 = 2353055895;
    targMap.checksum1 = 1415182951;
    targMap.checksum2 = 3446936850;
    targMap.checksum3 = 2809823770;

