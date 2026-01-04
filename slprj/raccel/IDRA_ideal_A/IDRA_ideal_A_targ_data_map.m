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

                    ;% rtB.g5xwnazqpz
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.jz4m5cmwj5
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 5;

                    ;% rtB.eui0ydajkz
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 6;

                    ;% rtB.hdz5un0qo2
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 11;

                    ;% rtB.nc2znxpbty
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 16;

                    ;% rtB.eygf2xxaku
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 21;

                    ;% rtB.ihd3wyvjoy
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 26;

                    ;% rtB.dv24ac1zbl
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 31;

                    ;% rtB.g13cu5gihi
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 32;

                    ;% rtB.gsbfze2nok
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 37;

                    ;% rtB.hnoablh4jk
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 42;

                    ;% rtB.hpqd21hy52
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 47;

                    ;% rtB.o5rg1udzsb
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 52;

                    ;% rtB.hlid0vfc4k
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 57;

                    ;% rtB.bi1q3dr41y
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 62;

                    ;% rtB.mcfjuxg2hs
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 72;

                    ;% rtB.hify2k5p5a
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 77;

                    ;% rtB.jixbzym12d
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 82;

                    ;% rtB.doe3yn4drb
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 87;

                    ;% rtB.dyrdfzzyfp
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 92;

                    ;% rtB.loc04zqipc
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 117;

                    ;% rtB.erjs0ezque
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 167;

                    ;% rtB.hwstuumpmz
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 192;

                    ;% rtB.evft3hf130
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 197;

                    ;% rtB.m2rcdpkic4
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

                    ;% rtDW.ptdsq0gbgo
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 6;
            section.data(6)  = dumData; %prealloc

                    ;% rtDW.dmail24epa
                    section.data(1).logicalSrcIdx = 1;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.fqj2qn0kad
                    section.data(2).logicalSrcIdx = 2;
                    section.data(2).dtTransOffset = 5;

                    ;% rtDW.k1hxqopvaz
                    section.data(3).logicalSrcIdx = 3;
                    section.data(3).dtTransOffset = 10;

                    ;% rtDW.fsqagztsdg
                    section.data(4).logicalSrcIdx = 4;
                    section.data(4).dtTransOffset = 15;

                    ;% rtDW.mn3aaukrbk
                    section.data(5).logicalSrcIdx = 5;
                    section.data(5).dtTransOffset = 20;

                    ;% rtDW.gftrdpsljd
                    section.data(6).logicalSrcIdx = 6;
                    section.data(6).dtTransOffset = 25;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 21;
            section.data(21)  = dumData; %prealloc

                    ;% rtDW.bdq3qnahrm.PrevTimePtr
                    section.data(1).logicalSrcIdx = 7;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.atdk04hawl.PrevTimePtr
                    section.data(2).logicalSrcIdx = 8;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.aqd3xtvp0z.PrevTimePtr
                    section.data(3).logicalSrcIdx = 9;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.ofknef5lgm.LoggedData
                    section.data(4).logicalSrcIdx = 10;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.foef342asi.AQHandles
                    section.data(5).logicalSrcIdx = 11;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.lnntenep3v.AQHandles
                    section.data(6).logicalSrcIdx = 12;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.igpowliegm.AQHandles
                    section.data(7).logicalSrcIdx = 13;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.blqel5eqjx.AQHandles
                    section.data(8).logicalSrcIdx = 14;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.hlcxtww0bh.AQHandles
                    section.data(9).logicalSrcIdx = 15;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.aeno52smt3.AQHandles
                    section.data(10).logicalSrcIdx = 16;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.mj0vahssrn.AQHandles
                    section.data(11).logicalSrcIdx = 17;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.jlpsuiihlb.LoggedData
                    section.data(12).logicalSrcIdx = 18;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.hhgg3xluyu.LoggedData
                    section.data(13).logicalSrcIdx = 19;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.k1szcucby1.LoggedData
                    section.data(14).logicalSrcIdx = 20;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.jskxqlewth.LoggedData
                    section.data(15).logicalSrcIdx = 21;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.ebcnifwpnd.LoggedData
                    section.data(16).logicalSrcIdx = 22;
                    section.data(16).dtTransOffset = 15;

                    ;% rtDW.pvcvhobzdm.LoggedData
                    section.data(17).logicalSrcIdx = 23;
                    section.data(17).dtTransOffset = 16;

                    ;% rtDW.glf01vh42y.LoggedData
                    section.data(18).logicalSrcIdx = 24;
                    section.data(18).dtTransOffset = 17;

                    ;% rtDW.docgoxov5u.LoggedData
                    section.data(19).logicalSrcIdx = 25;
                    section.data(19).dtTransOffset = 18;

                    ;% rtDW.akpkegkdgg.LoggedData
                    section.data(20).logicalSrcIdx = 26;
                    section.data(20).dtTransOffset = 19;

                    ;% rtDW.puurf4vao3.LoggedData
                    section.data(21).logicalSrcIdx = 27;
                    section.data(21).dtTransOffset = 20;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 9;
            section.data(9)  = dumData; %prealloc

                    ;% rtDW.jsjhxgbq4p
                    section.data(1).logicalSrcIdx = 28;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.ar4tuzzakt
                    section.data(2).logicalSrcIdx = 29;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.j23errvikb
                    section.data(3).logicalSrcIdx = 30;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.kkz5ixjw4y
                    section.data(4).logicalSrcIdx = 31;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.gyjlr3zlft
                    section.data(5).logicalSrcIdx = 32;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.ou32kwsdoi
                    section.data(6).logicalSrcIdx = 33;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.hh2zbkeczc
                    section.data(7).logicalSrcIdx = 34;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.ozgo3c3hnm
                    section.data(8).logicalSrcIdx = 35;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.h2fl0qlslk
                    section.data(9).logicalSrcIdx = 36;
                    section.data(9).dtTransOffset = 8;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 19;
            section.data(19)  = dumData; %prealloc

                    ;% rtDW.e1tavwfxd4
                    section.data(1).logicalSrcIdx = 37;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.n2hbr2jjcv
                    section.data(2).logicalSrcIdx = 38;
                    section.data(2).dtTransOffset = 1;

                    ;% rtDW.d414zffzug
                    section.data(3).logicalSrcIdx = 39;
                    section.data(3).dtTransOffset = 2;

                    ;% rtDW.ghm1s0sgaq
                    section.data(4).logicalSrcIdx = 40;
                    section.data(4).dtTransOffset = 3;

                    ;% rtDW.hj3lkescgh
                    section.data(5).logicalSrcIdx = 41;
                    section.data(5).dtTransOffset = 4;

                    ;% rtDW.lgtfdx1rsv
                    section.data(6).logicalSrcIdx = 42;
                    section.data(6).dtTransOffset = 5;

                    ;% rtDW.df1c4owviu
                    section.data(7).logicalSrcIdx = 43;
                    section.data(7).dtTransOffset = 6;

                    ;% rtDW.hkgs5qhhhw
                    section.data(8).logicalSrcIdx = 44;
                    section.data(8).dtTransOffset = 7;

                    ;% rtDW.lvs1wgssr4
                    section.data(9).logicalSrcIdx = 45;
                    section.data(9).dtTransOffset = 8;

                    ;% rtDW.gcipi40n22
                    section.data(10).logicalSrcIdx = 46;
                    section.data(10).dtTransOffset = 9;

                    ;% rtDW.ntr02yokun
                    section.data(11).logicalSrcIdx = 47;
                    section.data(11).dtTransOffset = 10;

                    ;% rtDW.a0oiybhwtu
                    section.data(12).logicalSrcIdx = 48;
                    section.data(12).dtTransOffset = 11;

                    ;% rtDW.nmhz1ukklp
                    section.data(13).logicalSrcIdx = 49;
                    section.data(13).dtTransOffset = 12;

                    ;% rtDW.bn1vo20qqd
                    section.data(14).logicalSrcIdx = 50;
                    section.data(14).dtTransOffset = 13;

                    ;% rtDW.b4rsgvywtm
                    section.data(15).logicalSrcIdx = 51;
                    section.data(15).dtTransOffset = 14;

                    ;% rtDW.m2k1hcgh5w
                    section.data(16).logicalSrcIdx = 52;
                    section.data(16).dtTransOffset = 15;

                    ;% rtDW.jsnmmngw4p
                    section.data(17).logicalSrcIdx = 53;
                    section.data(17).dtTransOffset = 16;

                    ;% rtDW.eduf3mu53i
                    section.data(18).logicalSrcIdx = 54;
                    section.data(18).dtTransOffset = 17;

                    ;% rtDW.lccbxwhby2
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


    targMap.checksum0 = 1561514302;
    targMap.checksum1 = 3479793350;
    targMap.checksum2 = 3273908324;
    targMap.checksum3 = 1283633278;

