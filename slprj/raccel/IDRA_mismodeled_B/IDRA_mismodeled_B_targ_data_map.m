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
            section.nData     = 25;
            section.data(25)  = dumData; %prealloc

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
                    section.data(4).dtTransOffset = 35;

                    ;% rtP.Kd
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 36;

                    ;% rtP.Ki
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 61;

                    ;% rtP.Kp
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 86;

                    ;% rtP.M_m
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 111;

                    ;% rtP.Ra
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 136;

                    ;% rtP.T_moto_B
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 141;

                    ;% rtP.T_s
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 142;

                    ;% rtP.gear_ratio
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 143;

                    ;% rtP.ke
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 148;

                    ;% rtP.km
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 153;

                    ;% rtP.q0_B
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 158;

                    ;% rtP.qd0_B
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 163;

                    ;% rtP.qdd0_B
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 168;

                    ;% rtP.t_const
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 173;

                    ;% rtP.t_fade
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 174;

                    ;% rtP.integrateerr_gainval
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 175;

                    ;% rtP.integrateerr_IC
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 176;

                    ;% rtP.RateTransition3_InitialCondition
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 177;

                    ;% rtP.RateTransition2_InitialCondition
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 178;

                    ;% rtP.RateTransition1_InitialCondition
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 179;

                    ;% rtP.RateTransition_InitialCondition
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 180;

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
            section.nData     = 29;
            section.data(29)  = dumData; %prealloc

                    ;% rtB.bk34atmqkv
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.mqwwdbscsp
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 5;

                    ;% rtB.kjoi100cx4
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 6;

                    ;% rtB.ovs00otw3u
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 11;

                    ;% rtB.bnnw0amrvx
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 16;

                    ;% rtB.fsr5bzx1oh
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 21;

                    ;% rtB.lgbaltvotk
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 26;

                    ;% rtB.nad3wqbfo2
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 31;

                    ;% rtB.ekbqijgag4
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 56;

                    ;% rtB.mztxcoovdw
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 106;

                    ;% rtB.cnti3wcczm
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 131;

                    ;% rtB.icfevjhfbv
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 136;

                    ;% rtB.br3q5hawof
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 137;

                    ;% rtB.cekv3kowwv
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 142;

                    ;% rtB.a5vnu54yuc
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 147;

                    ;% rtB.a0f1uqlo5t
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 152;

                    ;% rtB.fyqyyop2ds
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 157;

                    ;% rtB.g4qp5jvw5i
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 162;

                    ;% rtB.g5b03i0i4v
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 167;

                    ;% rtB.oiyzmkjmnx
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 177;

                    ;% rtB.loddh0rxe1
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 182;

                    ;% rtB.kb2qw4laxx
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 187;

                    ;% rtB.aoghkjbkap
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 192;

                    ;% rtB.alugh3ia1a
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 197;

                    ;% rtB.hnh24jti00
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 222;

                    ;% rtB.czlp4dgpl3
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 272;

                    ;% rtB.mag4nk0wez
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 297;

                    ;% rtB.mvlp2zjkzm
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 302;

                    ;% rtB.ae0roupsxl
                    section.data(29).logicalSrcIdx = 35;
                    section.data(29).dtTransOffset = 307;

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

                    ;% rtDW.ik2nt4kirk
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 9;
            section.data(9)  = dumData; %prealloc

                    ;% rtDW.ar1qdb2bya
                    section.data(1).logicalSrcIdx = 1;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.e1lnajbyd3
                    section.data(2).logicalSrcIdx = 2;
                    section.data(2).dtTransOffset = 5;

                    ;% rtDW.hz4vsyc02t
                    section.data(3).logicalSrcIdx = 3;
                    section.data(3).dtTransOffset = 30;

                    ;% rtDW.itr2dfkngw
                    section.data(4).logicalSrcIdx = 4;
                    section.data(4).dtTransOffset = 80;

                    ;% rtDW.hek5q13prs
                    section.data(5).logicalSrcIdx = 5;
                    section.data(5).dtTransOffset = 105;

                    ;% rtDW.jbcn1stmt0
                    section.data(6).logicalSrcIdx = 6;
                    section.data(6).dtTransOffset = 110;

                    ;% rtDW.ejxcl04tnz
                    section.data(7).logicalSrcIdx = 7;
                    section.data(7).dtTransOffset = 115;

                    ;% rtDW.d1rzixwq5l
                    section.data(8).logicalSrcIdx = 8;
                    section.data(8).dtTransOffset = 120;

                    ;% rtDW.kmnj0svy0x
                    section.data(9).logicalSrcIdx = 9;
                    section.data(9).dtTransOffset = 125;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 21;
            section.data(21)  = dumData; %prealloc

                    ;% rtDW.bx1r1wnndy.PrevTimePtr
                    section.data(1).logicalSrcIdx = 10;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.ekxe04xgmq.PrevTimePtr
                    section.data(2).logicalSrcIdx = 11;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.jqsqrg2tq1.PrevTimePtr
                    section.data(3).logicalSrcIdx = 12;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.deo2ftbpks.LoggedData
                    section.data(4).logicalSrcIdx = 13;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.pxe0kat1bq.AQHandles
                    section.data(5).logicalSrcIdx = 14;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.p3lelogsv1.AQHandles
                    section.data(6).logicalSrcIdx = 15;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.ofdd12hvu3.AQHandles
                    section.data(7).logicalSrcIdx = 16;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.brswaitusf.AQHandles
                    section.data(8).logicalSrcIdx = 17;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.de0h4oeeaw.AQHandles
                    section.data(9).logicalSrcIdx = 18;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.cqf1b0q1yq.AQHandles
                    section.data(10).logicalSrcIdx = 19;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.pl1gozuo52.AQHandles
                    section.data(11).logicalSrcIdx = 20;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.m25hd3toxa.LoggedData
                    section.data(12).logicalSrcIdx = 21;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.ndlzigmtfk.LoggedData
                    section.data(13).logicalSrcIdx = 22;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.brjrqvh5tp.LoggedData
                    section.data(14).logicalSrcIdx = 23;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.iixv40mef0.LoggedData
                    section.data(15).logicalSrcIdx = 24;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.hpff4zfdv3.LoggedData
                    section.data(16).logicalSrcIdx = 25;
                    section.data(16).dtTransOffset = 15;

                    ;% rtDW.ond4lvahvr.LoggedData
                    section.data(17).logicalSrcIdx = 26;
                    section.data(17).dtTransOffset = 16;

                    ;% rtDW.cfjmngyo45.LoggedData
                    section.data(18).logicalSrcIdx = 27;
                    section.data(18).dtTransOffset = 17;

                    ;% rtDW.jpywfrpg45.LoggedData
                    section.data(19).logicalSrcIdx = 28;
                    section.data(19).dtTransOffset = 18;

                    ;% rtDW.ddy0weruq3.LoggedData
                    section.data(20).logicalSrcIdx = 29;
                    section.data(20).dtTransOffset = 19;

                    ;% rtDW.ojxyrjsls4.LoggedData
                    section.data(21).logicalSrcIdx = 30;
                    section.data(21).dtTransOffset = 20;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 9;
            section.data(9)  = dumData; %prealloc

                    ;% rtDW.gn1t23i0hr
                    section.data(1).logicalSrcIdx = 31;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.cnttnquf1c
                    section.data(2).logicalSrcIdx = 32;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.jt2n1iofoe
                    section.data(3).logicalSrcIdx = 33;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.nkgmjyf0wx
                    section.data(4).logicalSrcIdx = 34;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.n4vjhihyks
                    section.data(5).logicalSrcIdx = 35;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.ppl1go1kmf
                    section.data(6).logicalSrcIdx = 36;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.ap5gosu1m0
                    section.data(7).logicalSrcIdx = 37;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.mby5bvs3q3
                    section.data(8).logicalSrcIdx = 38;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.an0fflqoce
                    section.data(9).logicalSrcIdx = 39;
                    section.data(9).dtTransOffset = 8;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 16;
            section.data(16)  = dumData; %prealloc

                    ;% rtDW.jjaxhm5x0f
                    section.data(1).logicalSrcIdx = 40;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.hensx4maxq
                    section.data(2).logicalSrcIdx = 41;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.lrpjyi3rji
                    section.data(3).logicalSrcIdx = 42;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.jfc1rhfxpy
                    section.data(4).logicalSrcIdx = 43;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.fyx1qlbsom
                    section.data(5).logicalSrcIdx = 44;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.aq0lkmh1yw
                    section.data(6).logicalSrcIdx = 45;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.gyy03kqtwl
                    section.data(7).logicalSrcIdx = 46;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.cope2mtchg
                    section.data(8).logicalSrcIdx = 47;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.hdzeg0hviw
                    section.data(9).logicalSrcIdx = 48;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.mhjf5rp4ar
                    section.data(10).logicalSrcIdx = 49;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.n2qt0eb4rl
                    section.data(11).logicalSrcIdx = 50;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.l0uu2vzpze
                    section.data(12).logicalSrcIdx = 51;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.gbzoiksats
                    section.data(13).logicalSrcIdx = 52;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.n2gad4nr14
                    section.data(14).logicalSrcIdx = 53;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.bqtjylbrq5
                    section.data(15).logicalSrcIdx = 54;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.ffarchkewk
                    section.data(16).logicalSrcIdx = 55;
                    section.data(16).dtTransOffset = 15;

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


    targMap.checksum0 = 3571101300;
    targMap.checksum1 = 3893501932;
    targMap.checksum2 = 1868410542;
    targMap.checksum3 = 3808195160;

