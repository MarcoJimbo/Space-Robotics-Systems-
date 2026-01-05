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
            section.nData     = 21;
            section.data(21)  = dumData; %prealloc

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

                    ;% rtB.n1oz2c3t2a
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.e2s20tsxaa
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 5;

                    ;% rtB.h1leody4tn
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 6;

                    ;% rtB.d0ifxc5wh0
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 11;

                    ;% rtB.ccvbkrt4v4
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 16;

                    ;% rtB.c0ax03vq2v
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 21;

                    ;% rtB.kpaw1p5che
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 26;

                    ;% rtB.nhgukwje4x
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 31;

                    ;% rtB.pfdmh1dvth
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 32;

                    ;% rtB.idkedhj1gx
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 37;

                    ;% rtB.hk4ssbgnc3
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 42;

                    ;% rtB.o42ulnsst0
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 47;

                    ;% rtB.mwcy0hmri2
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 52;

                    ;% rtB.l5uscq33yk
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 57;

                    ;% rtB.hsm0pgvnyw
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 62;

                    ;% rtB.mesim2xb0r
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 72;

                    ;% rtB.oksuagjkwm
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 77;

                    ;% rtB.ha34cak4gh
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 82;

                    ;% rtB.n5mva5rtd5
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 87;

                    ;% rtB.of1pab14lr
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 92;

                    ;% rtB.lzgyzybwwh
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 117;

                    ;% rtB.efgvxcbvt5
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 167;

                    ;% rtB.kcbposzcko
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 192;

                    ;% rtB.fvp3r43dub
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 197;

                    ;% rtB.pnpzndquzc
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

                    ;% rtDW.hegpjbqysl
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 6;
            section.data(6)  = dumData; %prealloc

                    ;% rtDW.nzndxympu3
                    section.data(1).logicalSrcIdx = 1;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.fbnumlygvc
                    section.data(2).logicalSrcIdx = 2;
                    section.data(2).dtTransOffset = 5;

                    ;% rtDW.jwgivpi2yu
                    section.data(3).logicalSrcIdx = 3;
                    section.data(3).dtTransOffset = 10;

                    ;% rtDW.lvine12n0d
                    section.data(4).logicalSrcIdx = 4;
                    section.data(4).dtTransOffset = 15;

                    ;% rtDW.fn2ofbhl3x
                    section.data(5).logicalSrcIdx = 5;
                    section.data(5).dtTransOffset = 20;

                    ;% rtDW.hsuc1nohj5
                    section.data(6).logicalSrcIdx = 6;
                    section.data(6).dtTransOffset = 25;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 21;
            section.data(21)  = dumData; %prealloc

                    ;% rtDW.egsxxoarbt.PrevTimePtr
                    section.data(1).logicalSrcIdx = 7;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.nneeeb0iuz.PrevTimePtr
                    section.data(2).logicalSrcIdx = 8;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.lkmwpzekjz.PrevTimePtr
                    section.data(3).logicalSrcIdx = 9;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.jayzaj2o1p.LoggedData
                    section.data(4).logicalSrcIdx = 10;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.alndjjvjyw.AQHandles
                    section.data(5).logicalSrcIdx = 11;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.mpdnz1jcwp.AQHandles
                    section.data(6).logicalSrcIdx = 12;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.jekgl13na3.AQHandles
                    section.data(7).logicalSrcIdx = 13;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.gyqqdbx1jg.AQHandles
                    section.data(8).logicalSrcIdx = 14;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.kqtdmzmqxf.AQHandles
                    section.data(9).logicalSrcIdx = 15;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.frjyyhu4xb.AQHandles
                    section.data(10).logicalSrcIdx = 16;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.hgkqu3zwj0.AQHandles
                    section.data(11).logicalSrcIdx = 17;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.f1foptg31p.LoggedData
                    section.data(12).logicalSrcIdx = 18;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.lwgynhknu3.LoggedData
                    section.data(13).logicalSrcIdx = 19;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.fh1gtij1vs.LoggedData
                    section.data(14).logicalSrcIdx = 20;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.akzrhxwp5r.LoggedData
                    section.data(15).logicalSrcIdx = 21;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.cibjnrbqhy.LoggedData
                    section.data(16).logicalSrcIdx = 22;
                    section.data(16).dtTransOffset = 15;

                    ;% rtDW.iwfq1mmk0k.LoggedData
                    section.data(17).logicalSrcIdx = 23;
                    section.data(17).dtTransOffset = 16;

                    ;% rtDW.nivfsr02r2.LoggedData
                    section.data(18).logicalSrcIdx = 24;
                    section.data(18).dtTransOffset = 17;

                    ;% rtDW.dg2lr04vlh.LoggedData
                    section.data(19).logicalSrcIdx = 25;
                    section.data(19).dtTransOffset = 18;

                    ;% rtDW.gj2kjttt03.LoggedData
                    section.data(20).logicalSrcIdx = 26;
                    section.data(20).dtTransOffset = 19;

                    ;% rtDW.hexlg0cqe1.LoggedData
                    section.data(21).logicalSrcIdx = 27;
                    section.data(21).dtTransOffset = 20;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 9;
            section.data(9)  = dumData; %prealloc

                    ;% rtDW.ms524pfmnv
                    section.data(1).logicalSrcIdx = 28;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.dailpgjdzv
                    section.data(2).logicalSrcIdx = 29;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.kcbd40pvdy
                    section.data(3).logicalSrcIdx = 30;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.b3qxwcgril
                    section.data(4).logicalSrcIdx = 31;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.j3jekqtdio
                    section.data(5).logicalSrcIdx = 32;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.bo1ufldfwj
                    section.data(6).logicalSrcIdx = 33;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.d2xyny3irt
                    section.data(7).logicalSrcIdx = 34;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.pkbwaqyxzb
                    section.data(8).logicalSrcIdx = 35;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.orswnhtaqo
                    section.data(9).logicalSrcIdx = 36;
                    section.data(9).dtTransOffset = 8;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 19;
            section.data(19)  = dumData; %prealloc

                    ;% rtDW.ajasvf3l3m
                    section.data(1).logicalSrcIdx = 37;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.pertqyapae
                    section.data(2).logicalSrcIdx = 38;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.g2sqsfgtev
                    section.data(3).logicalSrcIdx = 39;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.hs22bqvhej
                    section.data(4).logicalSrcIdx = 40;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.ezcyivy2e3
                    section.data(5).logicalSrcIdx = 41;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.eoy3vdfhpu
                    section.data(6).logicalSrcIdx = 42;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.hauwsh452n
                    section.data(7).logicalSrcIdx = 43;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.c5jyjm1qbm
                    section.data(8).logicalSrcIdx = 44;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.nlmvww4f23
                    section.data(9).logicalSrcIdx = 45;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.l01p1xmoso
                    section.data(10).logicalSrcIdx = 46;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.ivaipftxuu
                    section.data(11).logicalSrcIdx = 47;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.e3swq5uvyf
                    section.data(12).logicalSrcIdx = 48;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.k1t5udcjyq
                    section.data(13).logicalSrcIdx = 49;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.i4gquommii
                    section.data(14).logicalSrcIdx = 50;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.eeoqcblfuq
                    section.data(15).logicalSrcIdx = 51;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.kqez4und1p
                    section.data(16).logicalSrcIdx = 52;
                    section.data(16).dtTransOffset = 15;

                    ;% rtDW.apkdzfruza
                    section.data(17).logicalSrcIdx = 53;
                    section.data(17).dtTransOffset = 16;

                    ;% rtDW.pvp3qg02yh
                    section.data(18).logicalSrcIdx = 54;
                    section.data(18).dtTransOffset = 17;

                    ;% rtDW.b0om0n1qji
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


    targMap.checksum0 = 3166635648;
    targMap.checksum1 = 935449255;
    targMap.checksum2 = 1003340627;
    targMap.checksum3 = 780699501;

