`timescale 1 ns/100 ps
// Version: 9.1 SP5 9.1.5.1


module signed_mult8x8(DataA,DataB,Mult);
input [7:0] DataA, DataB;
output [15:0] Mult;

    wire S_0_net, S_1_net, S_2_net, S_3_net, E_0_net, E_1_net, 
        E_2_net, E_3_net, EBAR, PP0_1_net, PP0_2_net, PP0_3_net, 
        PP0_4_net, PP0_5_net, PP0_6_net, PP0_7_net, PP0_8_net, 
        PP1_0_net, PP1_1_net, PP1_2_net, PP1_3_net, PP1_4_net, 
        PP1_5_net, PP1_6_net, PP1_7_net, PP1_8_net, PP2_0_net, 
        PP2_1_net, PP2_2_net, PP2_3_net, PP2_4_net, PP2_5_net, 
        PP2_6_net, PP2_7_net, PP2_8_net, PP3_0_net, PP3_1_net, 
        PP3_2_net, PP3_3_net, PP3_4_net, PP3_5_net, PP3_6_net, 
        PP3_7_net, PP3_8_net, SumA_3_net, SumA_4_net, SumA_5_net, 
        SumA_6_net, SumA_7_net, SumA_8_net, SumA_9_net, 
        SumA_10_net, SumA_11_net, SumA_12_net, SumA_13_net, 
        SumB_2_net, SumB_3_net, SumB_4_net, SumB_5_net, 
        SumB_6_net, SumB_7_net, SumB_8_net, SumB_9_net, 
        SumB_10_net, SumB_11_net, SumB_12_net, SumB_13_net, 
        SumB_14_net, XOR2_10_Y, AND2_30_Y, XOR2_1_Y, AND2_7_Y, 
        XOR2_41_Y, AND2_3_Y, XOR2_25_Y, AND2_66_Y, XOR2_6_Y, 
        AND2_60_Y, XOR2_4_Y, AND2_15_Y, XOR3_4_Y, MAJ3_1_Y, 
        XOR3_3_Y, MAJ3_3_Y, XOR3_5_Y, MAJ3_5_Y, XOR3_1_Y, 
        MAJ3_6_Y, XOR3_6_Y, MAJ3_4_Y, XOR3_2_Y, MAJ3_2_Y, 
        XOR3_0_Y, MAJ3_0_Y, BUFF_6_Y, BUFF_3_Y, BUFF_4_Y, 
        BUFF_10_Y, XOR2_15_Y, XOR2_3_Y, AO1_22_Y, XOR2_21_Y, 
        NOR2_1_Y, AND2_40_Y, MX2_19_Y, AND2_21_Y, MX2_6_Y, 
        MX2_23_Y, XNOR2_7_Y, XOR2_47_Y, NOR2_3_Y, AND2_38_Y, 
        MX2_25_Y, AND2_62_Y, MX2_1_Y, AND2_10_Y, MX2_14_Y, 
        XNOR2_5_Y, XOR2_19_Y, NOR2_0_Y, AND2_32_Y, MX2_2_Y, 
        AND2_20_Y, AND2_55_Y, MX2_24_Y, XNOR2_0_Y, OR3_0_Y, 
        AND3_3_Y, BUFF_2_Y, BUFF_0_Y, BUFF_1_Y, BUFF_5_Y, 
        XOR2_34_Y, XOR2_43_Y, AO1_32_Y, XOR2_48_Y, NOR2_2_Y, 
        AND2_27_Y, MX2_27_Y, AND2_67_Y, MX2_8_Y, MX2_26_Y, 
        XNOR2_1_Y, XOR2_30_Y, NOR2_8_Y, AND2_74_Y, MX2_16_Y, 
        AND2_63_Y, MX2_29_Y, AND2_8_Y, MX2_15_Y, XNOR2_2_Y, 
        XOR2_42_Y, NOR2_4_Y, AND2_77_Y, MX2_31_Y, AND2_39_Y, 
        AND2_79_Y, MX2_4_Y, XNOR2_4_Y, OR3_3_Y, AND3_1_Y, 
        BUFF_12_Y, BUFF_8_Y, BUFF_11_Y, BUFF_14_Y, XOR2_27_Y, 
        XOR2_17_Y, AO1_12_Y, XOR2_5_Y, NOR2_7_Y, AND2_49_Y, 
        MX2_11_Y, AND2_69_Y, MX2_17_Y, MX2_7_Y, XNOR2_8_Y, 
        XOR2_20_Y, NOR2_6_Y, AND2_28_Y, MX2_12_Y, AND2_4_Y, 
        MX2_20_Y, AND2_41_Y, MX2_28_Y, XNOR2_3_Y, XOR2_35_Y, 
        NOR2_5_Y, AND2_53_Y, MX2_30_Y, AND2_45_Y, AND2_25_Y, 
        MX2_9_Y, XNOR2_6_Y, OR3_1_Y, AND3_0_Y, BUFF_7_Y, BUFF_9_Y, 
        BUFF_13_Y, XOR2_51_Y, XOR2_13_Y, AND2A_2_Y, AND2_22_Y, 
        MX2_0_Y, AND2_37_Y, MX2_21_Y, MX2_18_Y, AND2A_1_Y, 
        AND2_61_Y, MX2_13_Y, AND2_5_Y, MX2_22_Y, AND2_47_Y, 
        MX2_3_Y, AND2A_0_Y, AND2_44_Y, MX2_10_Y, AND2_18_Y, 
        AND2_31_Y, MX2_5_Y, OR3_2_Y, AND3_2_Y, AND2_51_Y, 
        AND2_71_Y, AND2_19_Y, AND2_50_Y, AND2_54_Y, AND2_81_Y, 
        AND2_23_Y, AND2_58_Y, AND2_12_Y, AND2_24_Y, AND2_35_Y, 
        AND2_33_Y, AND2_2_Y, AND2_43_Y, XOR2_0_Y, XOR2_8_Y, 
        XOR2_39_Y, XOR2_37_Y, XOR2_2_Y, XOR2_44_Y, XOR2_16_Y, 
        XOR2_7_Y, XOR2_45_Y, XOR2_28_Y, XOR2_40_Y, XOR2_23_Y, 
        XOR2_32_Y, XOR2_9_Y, XOR2_31_Y, AND2_36_Y, AO1_9_Y, 
        AND2_70_Y, AO1_28_Y, AND2_80_Y, AO1_13_Y, AND2_75_Y, 
        AO1_2_Y, AND2_9_Y, AO1_17_Y, AND2_64_Y, AO1_20_Y, 
        AND2_78_Y, AND2_48_Y, AND2_65_Y, AO1_15_Y, AND2_82_Y, 
        AO1_7_Y, AND2_68_Y, AO1_5_Y, AND2_14_Y, AO1_16_Y, 
        AND2_34_Y, AO1_29_Y, AND2_26_Y, AO1_31_Y, AND2_52_Y, 
        AND2_56_Y, AND2_73_Y, AND2_42_Y, AND2_57_Y, AO1_27_Y, 
        AND2_76_Y, AO1_14_Y, AND2_59_Y, AO1_11_Y, AND2_6_Y, 
        AO1_19_Y, AND2_17_Y, AND2_11_Y, AND2_46_Y, AND2_0_Y, 
        AND2_16_Y, AND2_72_Y, AND2_1_Y, AO1_30_Y, AND2_29_Y, 
        AND2_13_Y, AO1_3_Y, AO1_8_Y, AO1_6_Y, AO1_4_Y, AO1_21_Y, 
        AO1_24_Y, AO1_18_Y, AO1_0_Y, AO1_1_Y, AO1_10_Y, AO1_25_Y, 
        AO1_26_Y, AO1_23_Y, XOR2_49_Y, XOR2_18_Y, XOR2_22_Y, 
        XOR2_14_Y, XOR2_12_Y, XOR2_38_Y, XOR2_50_Y, XOR2_33_Y, 
        XOR2_26_Y, XOR2_24_Y, XOR2_46_Y, XOR2_11_Y, XOR2_36_Y, 
        XOR2_29_Y, VCC, GND;
    
    VCC VCC_1_net(.Y(VCC));
    GND GND_1_net(.Y(GND));
    AND2 AND2_2(.A(SumA_13_net), .B(SumB_13_net), .Y(AND2_2_Y));
    NOR2 NOR2_2(.A(XOR2_48_Y), .B(XNOR2_1_Y), .Y(NOR2_2_Y));
    AND2 AND2_20(.A(XOR2_19_Y), .B(DataA[0]), .Y(AND2_20_Y));
    AO1 AO1_11(.A(AND2_78_Y), .B(AO1_29_Y), .C(AO1_20_Y), .Y(
        AO1_11_Y));
    XOR3 XOR3_SumB_8_inst(.A(MAJ3_5_Y), .B(XOR2_41_Y), .C(
        XOR3_1_Y), .Y(SumB_8_net));
    AND2 AND2_11(.A(AND2_57_Y), .B(XOR2_45_Y), .Y(AND2_11_Y));
    XOR2 XOR2_PP3_6_inst(.A(MX2_8_Y), .B(BUFF_5_Y), .Y(PP3_6_net));
    XOR2 XOR2_PP0_6_inst(.A(MX2_21_Y), .B(BUFF_13_Y), .Y(
        PP0_6_net));
    XOR2 XOR2_PP1_4_inst(.A(MX2_25_Y), .B(BUFF_4_Y), .Y(PP1_4_net)
        );
    BUFF BUFF_10(.A(DataB[3]), .Y(BUFF_10_Y));
    XOR2 XOR2_PP2_6_inst(.A(MX2_17_Y), .B(BUFF_14_Y), .Y(
        PP2_6_net));
    AND2 AND2_22(.A(DataB[0]), .B(DataA[7]), .Y(AND2_22_Y));
    AND2 AND2_71(.A(S_1_net), .B(SumB_2_net), .Y(AND2_71_Y));
    XOR2 XOR2_19(.A(BUFF_6_Y), .B(DataB[2]), .Y(XOR2_19_Y));
    XOR2 XOR2_PP0_5_inst(.A(MX2_3_Y), .B(BUFF_9_Y), .Y(PP0_5_net));
    AND2 AND2_44(.A(DataB[0]), .B(DataA[1]), .Y(AND2_44_Y));
    AO1 AO1_31(.A(XOR2_31_Y), .B(AO1_20_Y), .C(AND2_43_Y), .Y(
        AO1_31_Y));
    XOR2 XOR2_23(.A(SumA_11_net), .B(SumB_11_net), .Y(XOR2_23_Y));
    XOR2 XOR2_1(.A(PP1_6_net), .B(PP0_8_net), .Y(XOR2_1_Y));
    MX2 MX2_17(.A(AND2_69_Y), .B(DataA[5]), .S(NOR2_7_Y), .Y(
        MX2_17_Y));
    AND2 AND2_S_3_inst(.A(XOR2_34_Y), .B(DataB[7]), .Y(S_3_net));
    MAJ3 MAJ3_SumA_11_inst(.A(XOR3_2_Y), .B(MAJ3_4_Y), .C(
        XOR2_6_Y), .Y(SumA_11_net));
    AO1 AO1_EBAR(.A(XOR2_13_Y), .B(OR3_2_Y), .C(AND3_2_Y), .Y(
        EBAR));
    BUFF BUFF_8(.A(DataB[5]), .Y(BUFF_8_Y));
    MX2 MX2_PP2_8_inst(.A(MX2_7_Y), .B(AO1_12_Y), .S(NOR2_7_Y), 
        .Y(PP2_8_net));
    XOR2 XOR2_PP1_0_inst(.A(XOR2_15_Y), .B(DataB[3]), .Y(
        PP1_0_net));
    XOR2 XOR2_47(.A(BUFF_6_Y), .B(DataB[2]), .Y(XOR2_47_Y));
    XOR2 XOR2_38(.A(SumA_6_net), .B(SumB_6_net), .Y(XOR2_38_Y));
    XOR2 XOR2_Mult_0_inst(.A(XOR2_51_Y), .B(DataB[1]), .Y(Mult[0])
        );
    MX2 MX2_21(.A(AND2_37_Y), .B(DataA[5]), .S(AND2A_2_Y), .Y(
        MX2_21_Y));
    AO1 AO1_7(.A(XOR2_16_Y), .B(AO1_28_Y), .C(AND2_81_Y), .Y(
        AO1_7_Y));
    AOI1 AOI1_E_2_inst(.A(XOR2_17_Y), .B(OR3_1_Y), .C(AND3_0_Y), 
        .Y(E_2_net));
    XOR2 XOR2_PP2_4_inst(.A(MX2_12_Y), .B(BUFF_11_Y), .Y(
        PP2_4_net));
    AND2 AND2_18(.A(DataB[0]), .B(DataA[0]), .Y(AND2_18_Y));
    AND2 AND2_15(.A(PP1_3_net), .B(PP0_5_net), .Y(AND2_15_Y));
    AO1 AO1_25(.A(AND2_26_Y), .B(AO1_18_Y), .C(AO1_29_Y), .Y(
        AO1_25_Y));
    NOR2 NOR2_6(.A(XOR2_20_Y), .B(XNOR2_3_Y), .Y(NOR2_6_Y));
    AND2 AND2_78(.A(XOR2_32_Y), .B(XOR2_9_Y), .Y(AND2_78_Y));
    AND2 AND2_75(.A(XOR2_16_Y), .B(XOR2_7_Y), .Y(AND2_75_Y));
    XOR2 XOR2_45(.A(SumA_8_net), .B(SumB_8_net), .Y(XOR2_45_Y));
    AND2 AND2_SumA_3_inst(.A(PP1_1_net), .B(PP0_3_net), .Y(
        SumA_3_net));
    AND2 AND2_S_0_inst(.A(XOR2_51_Y), .B(DataB[1]), .Y(S_0_net));
    AND2 AND2_1(.A(AND2_76_Y), .B(AND2_6_Y), .Y(AND2_1_Y));
    AND2 AND2_49(.A(XOR2_5_Y), .B(DataA[7]), .Y(AND2_49_Y));
    AO1 AO1_8(.A(XOR2_39_Y), .B(AO1_3_Y), .C(AND2_71_Y), .Y(
        AO1_8_Y));
    AND2 AND2_10(.A(XOR2_47_Y), .B(DataA[5]), .Y(AND2_10_Y));
    AND2 AND2_7(.A(PP1_6_net), .B(PP0_8_net), .Y(AND2_7_Y));
    XOR2 XOR2_20(.A(BUFF_12_Y), .B(DataB[4]), .Y(XOR2_20_Y));
    AND2 AND2_70(.A(XOR2_39_Y), .B(XOR2_37_Y), .Y(AND2_70_Y));
    AND2 AND2_S_1_inst(.A(XOR2_15_Y), .B(DataB[3]), .Y(S_1_net));
    OR3 OR3_1(.A(DataB[3]), .B(DataB[4]), .C(DataB[5]), .Y(
        OR3_1_Y));
    AND2A AND2A_1(.A(DataB[0]), .B(BUFF_9_Y), .Y(AND2A_1_Y));
    AND2 AND2_12(.A(SumA_9_net), .B(SumB_9_net), .Y(AND2_12_Y));
    AND2 AND2_72(.A(AND2_76_Y), .B(AND2_59_Y), .Y(AND2_72_Y));
    AND2 AND2_61(.A(DataB[0]), .B(DataA[4]), .Y(AND2_61_Y));
    AO1 AO1_15(.A(AND2_70_Y), .B(AO1_3_Y), .C(AO1_9_Y), .Y(
        AO1_15_Y));
    MX2 MX2_5(.A(AND2_31_Y), .B(DataA[1]), .S(AND2A_0_Y), .Y(
        MX2_5_Y));
    MX2 MX2_25(.A(AND2_38_Y), .B(DataA[3]), .S(NOR2_3_Y), .Y(
        MX2_25_Y));
    XOR2 XOR2_24(.A(SumA_10_net), .B(SumB_10_net), .Y(XOR2_24_Y));
    AND2 AND2_57(.A(AND2_82_Y), .B(AND2_14_Y), .Y(AND2_57_Y));
    XOR2 XOR2_21(.A(BUFF_6_Y), .B(DataB[2]), .Y(XOR2_21_Y));
    BUFF BUFF_2(.A(DataB[5]), .Y(BUFF_2_Y));
    XOR2 XOR2_PP0_7_inst(.A(MX2_0_Y), .B(BUFF_13_Y), .Y(PP0_7_net)
        );
    AND2 AND2_46(.A(AND2_57_Y), .B(AND2_9_Y), .Y(AND2_46_Y));
    XOR2 XOR2_PP3_7_inst(.A(MX2_27_Y), .B(BUFF_5_Y), .Y(PP3_7_net)
        );
    XOR2 XOR2_16(.A(SumA_6_net), .B(SumB_6_net), .Y(XOR2_16_Y));
    AND2 AND2_68(.A(AND2_80_Y), .B(XOR2_16_Y), .Y(AND2_68_Y));
    AND2 AND2_65(.A(AND2_36_Y), .B(AND2_70_Y), .Y(AND2_65_Y));
    AO1 AO1_24(.A(AND2_68_Y), .B(AO1_15_Y), .C(AO1_7_Y), .Y(
        AO1_24_Y));
    AND2 AND2_43(.A(E_3_net), .B(SumB_14_net), .Y(AND2_43_Y));
    XOR3 XOR3_SumB_5_inst(.A(AND2_15_Y), .B(PP3_0_net), .C(
        XOR3_4_Y), .Y(SumB_5_net));
    NOR2 NOR2_3(.A(XOR2_47_Y), .B(XNOR2_5_Y), .Y(NOR2_3_Y));
    AND3 AND3_3(.A(DataB[1]), .B(DataB[2]), .C(DataB[3]), .Y(
        AND3_3_Y));
    MX2 MX2_20(.A(AND2_4_Y), .B(DataA[2]), .S(NOR2_6_Y), .Y(
        MX2_20_Y));
    MX2 MX2_19(.A(AND2_40_Y), .B(DataA[6]), .S(NOR2_1_Y), .Y(
        MX2_19_Y));
    AND2 AND2_6(.A(AND2_26_Y), .B(AND2_78_Y), .Y(AND2_6_Y));
    AND3 AND3_0(.A(DataB[3]), .B(DataB[4]), .C(DataB[5]), .Y(
        AND3_0_Y));
    AND2 AND2_60(.A(E_1_net), .B(E_0_net), .Y(AND2_60_Y));
    XOR2 XOR2_Mult_5_inst(.A(XOR2_14_Y), .B(AO1_6_Y), .Y(Mult[5]));
    AND2 AND2_62(.A(XOR2_47_Y), .B(DataA[3]), .Y(AND2_62_Y));
    XOR2 XOR2_33(.A(SumA_8_net), .B(SumB_8_net), .Y(XOR2_33_Y));
    XNOR2 XNOR2_2(.A(DataB[6]), .B(BUFF_1_Y), .Y(XNOR2_2_Y));
    MX2 MX2_31(.A(AND2_77_Y), .B(DataA[0]), .S(NOR2_4_Y), .Y(
        MX2_31_Y));
    XOR2 XOR2_49(.A(PP0_2_net), .B(PP1_0_net), .Y(XOR2_49_Y));
    AO1 AO1_14(.A(XOR2_32_Y), .B(AO1_29_Y), .C(AND2_33_Y), .Y(
        AO1_14_Y));
    XOR3 XOR3_SumB_3_inst(.A(PP1_2_net), .B(PP0_4_net), .C(
        PP2_0_net), .Y(SumB_3_net));
    XOR2 XOR2_4(.A(PP1_3_net), .B(PP0_5_net), .Y(XOR2_4_Y));
    MAJ3 MAJ3_SumA_9_inst(.A(XOR3_1_Y), .B(MAJ3_5_Y), .C(
        XOR2_41_Y), .Y(SumA_9_net));
    AND3 AND3_1(.A(DataB[5]), .B(DataB[6]), .C(DataB[7]), .Y(
        AND3_1_Y));
    MX2 MX2_14(.A(AND2_10_Y), .B(DataA[4]), .S(NOR2_3_Y), .Y(
        MX2_14_Y));
    XOR2 XOR2_Mult_7_inst(.A(XOR2_38_Y), .B(AO1_21_Y), .Y(Mult[7])
        );
    AND2 AND2_24(.A(SumA_10_net), .B(SumB_10_net), .Y(AND2_24_Y));
    XOR2 XOR2_PP3_3_inst(.A(MX2_29_Y), .B(BUFF_1_Y), .Y(PP3_3_net)
        );
    XNOR2 XNOR2_0(.A(DataB[2]), .B(BUFF_3_Y), .Y(XNOR2_0_Y));
    MAJ3 MAJ3_0(.A(PP3_6_net), .B(PP2_8_net), .C(VCC), .Y(
        MAJ3_0_Y));
    AND2 AND2_31(.A(DataB[0]), .B(DataA[2]), .Y(AND2_31_Y));
    XOR2 XOR2_PP1_5_inst(.A(MX2_14_Y), .B(BUFF_4_Y), .Y(PP1_5_net)
        );
    XOR2 XOR2_18(.A(S_1_net), .B(SumB_2_net), .Y(XOR2_18_Y));
    BUFF BUFF_14(.A(DataB[5]), .Y(BUFF_14_Y));
    MX2 MX2_PP1_8_inst(.A(MX2_23_Y), .B(AO1_22_Y), .S(NOR2_1_Y), 
        .Y(PP1_8_net));
    XOR2 XOR2_Mult_15_inst(.A(XOR2_29_Y), .B(AO1_23_Y), .Y(
        Mult[15]));
    OR3 OR3_2(.A(GND), .B(DataB[0]), .C(DataB[1]), .Y(OR3_2_Y));
    XOR2 XOR2_8(.A(PP0_2_net), .B(PP1_0_net), .Y(XOR2_8_Y));
    MAJ3 MAJ3_SumA_5_inst(.A(XOR2_4_Y), .B(S_2_net), .C(PP2_1_net)
        , .Y(SumA_5_net));
    NOR2 NOR2_0(.A(XOR2_19_Y), .B(XNOR2_0_Y), .Y(NOR2_0_Y));
    XOR2 XOR2_30(.A(BUFF_2_Y), .B(DataB[6]), .Y(XOR2_30_Y));
    XOR3 XOR3_SumB_12_inst(.A(PP3_7_net), .B(E_2_net), .C(
        MAJ3_0_Y), .Y(SumB_12_net));
    XOR2 XOR2_PP3_2_inst(.A(MX2_4_Y), .B(BUFF_0_Y), .Y(PP3_2_net));
    AND2 AND2_38(.A(XOR2_47_Y), .B(DataA[4]), .Y(AND2_38_Y));
    AND2 AND2_35(.A(SumA_11_net), .B(SumB_11_net), .Y(AND2_35_Y));
    XOR2 XOR2_Mult_13_inst(.A(XOR2_11_Y), .B(AO1_25_Y), .Y(
        Mult[13]));
    MX2 MX2_8(.A(AND2_67_Y), .B(DataA[5]), .S(NOR2_2_Y), .Y(
        MX2_8_Y));
    AND2 AND2_29(.A(AND2_76_Y), .B(AND2_17_Y), .Y(AND2_29_Y));
    OR3 OR3_3(.A(DataB[5]), .B(DataB[6]), .C(DataB[7]), .Y(
        OR3_3_Y));
    XOR2 XOR2_34(.A(AND2_39_Y), .B(BUFF_0_Y), .Y(XOR2_34_Y));
    MAJ3 MAJ3_4(.A(AND2_3_Y), .B(PP3_4_net), .C(PP2_6_net), .Y(
        MAJ3_4_Y));
    XOR2 XOR2_31(.A(E_3_net), .B(SumB_14_net), .Y(XOR2_31_Y));
    AND2 AND2_3(.A(PP1_7_net), .B(EBAR), .Y(AND2_3_Y));
    MAJ3 MAJ3_SumA_10_inst(.A(XOR3_6_Y), .B(MAJ3_6_Y), .C(
        XOR2_25_Y), .Y(SumA_10_net));
    AND2 AND2_30(.A(PP1_5_net), .B(PP0_7_net), .Y(AND2_30_Y));
    XNOR2 XNOR2_6(.A(DataB[4]), .B(BUFF_8_Y), .Y(XNOR2_6_Y));
    AND2 AND2_14(.A(AND2_80_Y), .B(AND2_75_Y), .Y(AND2_14_Y));
    AND2 AND2_74(.A(XOR2_30_Y), .B(DataA[4]), .Y(AND2_74_Y));
    AND2 AND2_32(.A(XOR2_19_Y), .B(DataA[1]), .Y(AND2_32_Y));
    XOR2 XOR2_PP3_5_inst(.A(MX2_15_Y), .B(BUFF_1_Y), .Y(PP3_5_net)
        );
    BUFF BUFF_5(.A(DataB[7]), .Y(BUFF_5_Y));
    XOR2 XOR2_PP2_2_inst(.A(MX2_9_Y), .B(BUFF_8_Y), .Y(PP2_2_net));
    XOR3 XOR3_4(.A(PP1_4_net), .B(PP0_6_net), .C(PP2_2_net), .Y(
        XOR3_4_Y));
    MX2 MX2_30(.A(AND2_53_Y), .B(DataA[0]), .S(NOR2_5_Y), .Y(
        MX2_30_Y));
    XOR2 XOR2_46(.A(SumA_11_net), .B(SumB_11_net), .Y(XOR2_46_Y));
    MX2 MX2_22(.A(AND2_5_Y), .B(DataA[2]), .S(AND2A_1_Y), .Y(
        MX2_22_Y));
    AO1 AO1_2(.A(XOR2_28_Y), .B(AND2_58_Y), .C(AND2_12_Y), .Y(
        AO1_2_Y));
    AND2 AND2_26(.A(AND2_9_Y), .B(AND2_64_Y), .Y(AND2_26_Y));
    AOI1 AOI1_E_3_inst(.A(XOR2_43_Y), .B(OR3_3_Y), .C(AND3_1_Y), 
        .Y(E_3_net));
    XOR2 XOR2_9(.A(SumA_13_net), .B(SumB_13_net), .Y(XOR2_9_Y));
    AND2 AND2_23(.A(SumA_7_net), .B(SumB_7_net), .Y(AND2_23_Y));
    XNOR2 XNOR2_4(.A(DataB[6]), .B(BUFF_0_Y), .Y(XNOR2_4_Y));
    NOR2 NOR2_1(.A(XOR2_21_Y), .B(XNOR2_7_Y), .Y(NOR2_1_Y));
    XOR2 XOR2_5(.A(BUFF_12_Y), .B(DataB[4]), .Y(XOR2_5_Y));
    XOR2 XOR2_PP0_1_inst(.A(MX2_10_Y), .B(BUFF_7_Y), .Y(PP0_1_net)
        );
    MX2 MX2_0(.A(AND2_22_Y), .B(DataA[6]), .S(AND2A_2_Y), .Y(
        MX2_0_Y));
    AO1 AO1_28(.A(XOR2_44_Y), .B(AND2_50_Y), .C(AND2_54_Y), .Y(
        AO1_28_Y));
    XOR2 XOR2_PP2_0_inst(.A(XOR2_27_Y), .B(DataB[5]), .Y(
        PP2_0_net));
    AND2 AND2_19(.A(SumA_3_net), .B(SumB_3_net), .Y(AND2_19_Y));
    AND2 AND2_79(.A(XOR2_42_Y), .B(DataA[2]), .Y(AND2_79_Y));
    XOR2 XOR2_22(.A(SumA_3_net), .B(SumB_3_net), .Y(XOR2_22_Y));
    AO1 AO1_1(.A(AND2_9_Y), .B(AO1_18_Y), .C(AO1_2_Y), .Y(AO1_1_Y)
        );
    MX2 MX2_28(.A(AND2_41_Y), .B(DataA[4]), .S(NOR2_6_Y), .Y(
        MX2_28_Y));
    AOI1 AOI1_E_1_inst(.A(XOR2_3_Y), .B(OR3_0_Y), .C(AND3_3_Y), 
        .Y(E_1_net));
    XOR2 XOR2_PP1_3_inst(.A(MX2_1_Y), .B(BUFF_4_Y), .Y(PP1_3_net));
    XOR2 XOR2_13(.A(DataA[7]), .B(DataB[1]), .Y(XOR2_13_Y));
    XOR3 XOR3_SumB_11_inst(.A(MAJ3_2_Y), .B(AND2_60_Y), .C(
        XOR3_0_Y), .Y(SumB_11_net));
    AND2 AND2_51(.A(PP0_2_net), .B(PP1_0_net), .Y(AND2_51_Y));
    AO1 AO1_3(.A(XOR2_8_Y), .B(AND2_13_Y), .C(AND2_51_Y), .Y(
        AO1_3_Y));
    AND2 AND2_64(.A(XOR2_40_Y), .B(XOR2_23_Y), .Y(AND2_64_Y));
    AND2 AND2_47(.A(DataB[0]), .B(DataA[5]), .Y(AND2_47_Y));
    AO1 AO1_18(.A(AND2_14_Y), .B(AO1_15_Y), .C(AO1_5_Y), .Y(
        AO1_18_Y));
    XOR2 XOR2_48(.A(BUFF_2_Y), .B(DataB[6]), .Y(XOR2_48_Y));
    MX2 MX2_26(.A(BUFF_5_Y), .B(XOR2_43_Y), .S(XOR2_48_Y), .Y(
        MX2_26_Y));
    AND2A AND2A_2(.A(DataB[0]), .B(BUFF_13_Y), .Y(AND2A_2_Y));
    AND2 AND2_16(.A(AND2_57_Y), .B(AND2_26_Y), .Y(AND2_16_Y));
    XOR2 XOR2_PP1_6_inst(.A(MX2_6_Y), .B(BUFF_10_Y), .Y(PP1_6_net)
        );
    AND2 AND2_76(.A(AND2_82_Y), .B(AND2_14_Y), .Y(AND2_76_Y));
    MAJ3 MAJ3_SumA_8_inst(.A(XOR3_5_Y), .B(MAJ3_3_Y), .C(XOR2_1_Y)
        , .Y(SumA_8_net));
    AND2 AND2_13(.A(PP0_1_net), .B(S_0_net), .Y(AND2_13_Y));
    XOR2 XOR2_PP1_1_inst(.A(MX2_2_Y), .B(BUFF_3_Y), .Y(PP1_1_net));
    AND2 AND2_73(.A(AND2_65_Y), .B(AND2_80_Y), .Y(AND2_73_Y));
    XNOR2 XNOR2_1(.A(DataB[6]), .B(BUFF_5_Y), .Y(XNOR2_1_Y));
    XOR2 XOR2_10(.A(PP1_5_net), .B(PP0_7_net), .Y(XOR2_10_Y));
    AND2 AND2_58(.A(SumA_8_net), .B(SumB_8_net), .Y(AND2_58_Y));
    AND2 AND2_55(.A(XOR2_19_Y), .B(DataA[2]), .Y(AND2_55_Y));
    MX2 MX2_2(.A(AND2_32_Y), .B(DataA[0]), .S(NOR2_0_Y), .Y(
        MX2_2_Y));
    XOR2 XOR2_SumA_13_inst(.A(PP3_8_net), .B(VCC), .Y(SumA_13_net)
        );
    MX2 MX2_23(.A(BUFF_10_Y), .B(XOR2_3_Y), .S(XOR2_21_Y), .Y(
        MX2_23_Y));
    AND2 AND2_69(.A(XOR2_5_Y), .B(DataA[6]), .Y(AND2_69_Y));
    XOR3 XOR3_3(.A(PP3_1_net), .B(PP2_3_net), .C(S_3_net), .Y(
        XOR3_3_Y));
    XOR2 XOR2_27(.A(AND2_45_Y), .B(BUFF_8_Y), .Y(XOR2_27_Y));
    MAJ3 MAJ3_3(.A(S_3_net), .B(PP3_1_net), .C(PP2_3_net), .Y(
        MAJ3_3_Y));
    MAJ3 MAJ3_SumA_4_inst(.A(PP2_0_net), .B(PP1_2_net), .C(
        PP0_4_net), .Y(SumA_4_net));
    XOR3 XOR3_SumB_10_inst(.A(MAJ3_4_Y), .B(XOR2_6_Y), .C(
        XOR3_2_Y), .Y(SumB_10_net));
    BUFF BUFF_12(.A(DataB[3]), .Y(BUFF_12_Y));
    XOR2 XOR2_7(.A(SumA_7_net), .B(SumB_7_net), .Y(XOR2_7_Y));
    AND2 AND2_5(.A(DataB[0]), .B(DataA[3]), .Y(AND2_5_Y));
    XOR2 XOR2_14(.A(SumA_4_net), .B(SumB_4_net), .Y(XOR2_14_Y));
    AND2 AND2_50(.A(SumA_4_net), .B(SumB_4_net), .Y(AND2_50_Y));
    XOR2 XOR2_PP3_0_inst(.A(XOR2_34_Y), .B(DataB[7]), .Y(
        PP3_0_net));
    XOR2 XOR2_Mult_3_inst(.A(XOR2_18_Y), .B(AO1_3_Y), .Y(Mult[3]));
    XOR2 XOR2_Mult_8_inst(.A(XOR2_50_Y), .B(AO1_24_Y), .Y(Mult[8])
        );
    XNOR2 XNOR2_3(.A(DataB[4]), .B(BUFF_11_Y), .Y(XNOR2_3_Y));
    XOR2 XOR2_PP0_4_inst(.A(MX2_13_Y), .B(BUFF_9_Y), .Y(PP0_4_net)
        );
    XOR2 XOR2_11(.A(SumA_12_net), .B(SumB_12_net), .Y(XOR2_11_Y));
    XOR3 XOR3_6(.A(PP3_4_net), .B(PP2_6_net), .C(AND2_3_Y), .Y(
        XOR3_6_Y));
    AND2 AND2_SumB_14_inst(.A(PP3_8_net), .B(VCC), .Y(SumB_14_net)
        );
    AND2 AND2_52(.A(AND2_78_Y), .B(XOR2_31_Y), .Y(AND2_52_Y));
    XOR2 XOR2_25(.A(PP1_8_net), .B(EBAR), .Y(XOR2_25_Y));
    AO1 AO1_22(.A(XOR2_3_Y), .B(OR3_0_Y), .C(AND3_3_Y), .Y(
        AO1_22_Y));
    MAJ3 MAJ3_SumA_12_inst(.A(XOR3_0_Y), .B(MAJ3_2_Y), .C(
        AND2_60_Y), .Y(SumA_12_net));
    BUFF BUFF_0(.A(DataB[7]), .Y(BUFF_0_Y));
    MX2 MX2_27(.A(AND2_27_Y), .B(DataA[6]), .S(NOR2_2_Y), .Y(
        MX2_27_Y));
    AND2 AND2_34(.A(AND2_9_Y), .B(XOR2_40_Y), .Y(AND2_34_Y));
    AND2 AND2_66(.A(PP1_8_net), .B(EBAR), .Y(AND2_66_Y));
    XOR2 XOR2_SumB_2_inst(.A(PP1_1_net), .B(PP0_3_net), .Y(
        SumB_2_net));
    AO1 AO1_6(.A(AND2_70_Y), .B(AO1_3_Y), .C(AO1_9_Y), .Y(AO1_6_Y)
        );
    XOR2 XOR2_Mult_4_inst(.A(XOR2_22_Y), .B(AO1_8_Y), .Y(Mult[4]));
    MX2 MX2_11(.A(AND2_49_Y), .B(DataA[6]), .S(NOR2_7_Y), .Y(
        MX2_11_Y));
    NOR2 NOR2_4(.A(XOR2_42_Y), .B(XNOR2_4_Y), .Y(NOR2_4_Y));
    XOR2 XOR2_Mult_1_inst(.A(PP0_1_net), .B(S_0_net), .Y(Mult[1]));
    AND3 AND3_2(.A(GND), .B(DataB[0]), .C(DataB[1]), .Y(AND3_2_Y));
    AND2 AND2_63(.A(XOR2_30_Y), .B(DataA[3]), .Y(AND2_63_Y));
    AO1 AO1_12(.A(XOR2_17_Y), .B(OR3_1_Y), .C(AND3_0_Y), .Y(
        AO1_12_Y));
    XOR2 XOR2_32(.A(SumA_12_net), .B(SumB_12_net), .Y(XOR2_32_Y));
    XOR3 XOR3_SumB_6_inst(.A(MAJ3_1_Y), .B(XOR2_10_Y), .C(
        XOR3_3_Y), .Y(SumB_6_net));
    XOR2 XOR2_Mult_10_inst(.A(XOR2_26_Y), .B(AO1_0_Y), .Y(
        Mult[10]));
    XOR2 XOR2_Mult_2_inst(.A(XOR2_49_Y), .B(AND2_13_Y), .Y(
        Mult[2]));
    OR3 OR3_0(.A(DataB[1]), .B(DataB[2]), .C(DataB[3]), .Y(
        OR3_0_Y));
    XOR2 XOR2_PP0_2_inst(.A(MX2_5_Y), .B(BUFF_7_Y), .Y(PP0_2_net));
    AND2 AND2_9(.A(XOR2_45_Y), .B(XOR2_28_Y), .Y(AND2_9_Y));
    MX2 MX2_6(.A(AND2_21_Y), .B(DataA[5]), .S(NOR2_1_Y), .Y(
        MX2_6_Y));
    MX2 MX2_PP3_8_inst(.A(MX2_26_Y), .B(AO1_32_Y), .S(NOR2_2_Y), 
        .Y(PP3_8_net));
    AO1 AO1_32(.A(XOR2_43_Y), .B(OR3_3_Y), .C(AND3_1_Y), .Y(
        AO1_32_Y));
    XOR2 XOR2_43(.A(DataA[7]), .B(DataB[7]), .Y(XOR2_43_Y));
    XOR2 XOR2_PP3_4_inst(.A(MX2_16_Y), .B(BUFF_1_Y), .Y(PP3_4_net)
        );
    MX2 MX2_7(.A(BUFF_14_Y), .B(XOR2_17_Y), .S(XOR2_5_Y), .Y(
        MX2_7_Y));
    AO1 AO1_9(.A(XOR2_37_Y), .B(AND2_71_Y), .C(AND2_19_Y), .Y(
        AO1_9_Y));
    NOR2 NOR2_8(.A(XOR2_30_Y), .B(XNOR2_2_Y), .Y(NOR2_8_Y));
    XOR3 XOR3_SumB_4_inst(.A(S_2_net), .B(PP2_1_net), .C(XOR2_4_Y)
        , .Y(SumB_4_net));
    AND2 AND2_39(.A(XOR2_42_Y), .B(DataA[0]), .Y(AND2_39_Y));
    XOR2 XOR2_Mult_6_inst(.A(XOR2_12_Y), .B(AO1_4_Y), .Y(Mult[6]));
    BUFF BUFF_9(.A(DataB[1]), .Y(BUFF_9_Y));
    XOR3 XOR3_SumB_9_inst(.A(MAJ3_6_Y), .B(XOR2_25_Y), .C(
        XOR3_6_Y), .Y(SumB_9_net));
    MX2 MX2_15(.A(AND2_8_Y), .B(DataA[4]), .S(NOR2_8_Y), .Y(
        MX2_15_Y));
    MAJ3 MAJ3_6(.A(AND2_7_Y), .B(PP3_3_net), .C(PP2_5_net), .Y(
        MAJ3_6_Y));
    XOR2 XOR2_PP2_3_inst(.A(MX2_20_Y), .B(BUFF_11_Y), .Y(
        PP2_3_net));
    AND2 AND2_27(.A(XOR2_48_Y), .B(DataA[7]), .Y(AND2_27_Y));
    MX2 MX2_3(.A(AND2_47_Y), .B(DataA[4]), .S(AND2A_1_Y), .Y(
        MX2_3_Y));
    XOR2 XOR2_Mult_12_inst(.A(XOR2_46_Y), .B(AO1_10_Y), .Y(
        Mult[12]));
    AO1 AO1_20(.A(XOR2_9_Y), .B(AND2_33_Y), .C(AND2_2_Y), .Y(
        AO1_20_Y));
    AO1 AO1_0(.A(XOR2_45_Y), .B(AO1_18_Y), .C(AND2_58_Y), .Y(
        AO1_0_Y));
    XOR2 XOR2_29(.A(E_3_net), .B(SumB_14_net), .Y(XOR2_29_Y));
    XOR2 XOR2_40(.A(SumA_10_net), .B(SumB_10_net), .Y(XOR2_40_Y));
    BUFF BUFF_6(.A(DataB[1]), .Y(BUFF_6_Y));
    XOR3 XOR3_0(.A(PP2_8_net), .B(VCC), .C(PP3_6_net), .Y(
        XOR3_0_Y));
    BUFF BUFF_7(.A(DataB[1]), .Y(BUFF_7_Y));
    MX2 MX2_9(.A(AND2_25_Y), .B(DataA[1]), .S(NOR2_5_Y), .Y(
        MX2_9_Y));
    XOR2 XOR2_2(.A(SumA_4_net), .B(SumB_4_net), .Y(XOR2_2_Y));
    XOR2 XOR2_37(.A(SumA_3_net), .B(SumB_3_net), .Y(XOR2_37_Y));
    AND2A AND2A_0(.A(DataB[0]), .B(BUFF_7_Y), .Y(AND2A_0_Y));
    AND2 AND2_36(.A(XOR2_0_Y), .B(XOR2_8_Y), .Y(AND2_36_Y));
    XOR2 XOR2_PP2_1_inst(.A(MX2_30_Y), .B(BUFF_8_Y), .Y(PP2_1_net)
        );
    AO1 AO1_26(.A(AND2_59_Y), .B(AO1_27_Y), .C(AO1_14_Y), .Y(
        AO1_26_Y));
    XOR3 XOR3_5(.A(PP3_2_net), .B(PP2_4_net), .C(AND2_30_Y), .Y(
        XOR3_5_Y));
    MX2 MX2_10(.A(AND2_44_Y), .B(DataA[0]), .S(AND2A_0_Y), .Y(
        MX2_10_Y));
    AO1 AO1_23(.A(AND2_6_Y), .B(AO1_27_Y), .C(AO1_11_Y), .Y(
        AO1_23_Y));
    AND2 AND2_33(.A(SumA_12_net), .B(SumB_12_net), .Y(AND2_33_Y));
    XOR2 XOR2_44(.A(SumA_5_net), .B(SumB_5_net), .Y(XOR2_44_Y));
    AO1 AO1_10(.A(AND2_34_Y), .B(AO1_18_Y), .C(AO1_16_Y), .Y(
        AO1_10_Y));
    XOR2 XOR2_41(.A(PP1_7_net), .B(EBAR), .Y(XOR2_41_Y));
    XOR2 XOR2_35(.A(BUFF_12_Y), .B(DataB[4]), .Y(XOR2_35_Y));
    XOR2 XOR2_PP1_7_inst(.A(MX2_19_Y), .B(BUFF_10_Y), .Y(
        PP1_7_net));
    MX2 MX2_29(.A(AND2_63_Y), .B(DataA[2]), .S(NOR2_8_Y), .Y(
        MX2_29_Y));
    XOR2 XOR2_PP2_5_inst(.A(MX2_28_Y), .B(BUFF_11_Y), .Y(
        PP2_5_net));
    AND2 AND2_S_2_inst(.A(XOR2_27_Y), .B(DataB[5]), .Y(S_2_net));
    NOR2 NOR2_5(.A(XOR2_35_Y), .B(XNOR2_6_Y), .Y(NOR2_5_Y));
    AO1 AO1_30(.A(AND2_17_Y), .B(AO1_27_Y), .C(AO1_19_Y), .Y(
        AO1_30_Y));
    AND2 AND2_41(.A(XOR2_20_Y), .B(DataA[5]), .Y(AND2_41_Y));
    AND2 AND2_0(.A(AND2_57_Y), .B(AND2_34_Y), .Y(AND2_0_Y));
    AO1 AO1_16(.A(XOR2_40_Y), .B(AO1_2_Y), .C(AND2_24_Y), .Y(
        AO1_16_Y));
    XOR2 XOR2_PP1_2_inst(.A(MX2_24_Y), .B(BUFF_3_Y), .Y(PP1_2_net)
        );
    AND2 AND2_17(.A(AND2_26_Y), .B(AND2_52_Y), .Y(AND2_17_Y));
    MAJ3 MAJ3_SumA_6_inst(.A(XOR3_4_Y), .B(AND2_15_Y), .C(
        PP3_0_net), .Y(SumA_6_net));
    BUFF BUFF_3(.A(DataB[3]), .Y(BUFF_3_Y));
    AO1 AO1_29(.A(AND2_64_Y), .B(AO1_2_Y), .C(AO1_17_Y), .Y(
        AO1_29_Y));
    XOR2 XOR2_6(.A(E_1_net), .B(E_0_net), .Y(XOR2_6_Y));
    AND2 AND2_77(.A(XOR2_42_Y), .B(DataA[1]), .Y(AND2_77_Y));
    MX2 MX2_PP0_8_inst(.A(MX2_18_Y), .B(EBAR), .S(AND2A_2_Y), .Y(
        PP0_8_net));
    MX2 MX2_24(.A(AND2_55_Y), .B(DataA[1]), .S(NOR2_0_Y), .Y(
        MX2_24_Y));
    AND2 AND2_54(.A(SumA_5_net), .B(SumB_5_net), .Y(AND2_54_Y));
    AO1 AO1_13(.A(XOR2_7_Y), .B(AND2_81_Y), .C(AND2_23_Y), .Y(
        AO1_13_Y));
    AND2 AND2_81(.A(SumA_6_net), .B(SumB_6_net), .Y(AND2_81_Y));
    MAJ3 MAJ3_5(.A(AND2_30_Y), .B(PP3_2_net), .C(PP2_4_net), .Y(
        MAJ3_5_Y));
    XOR2 XOR2_Mult_9_inst(.A(XOR2_33_Y), .B(AO1_18_Y), .Y(Mult[9])
        );
    XNOR2 XNOR2_7(.A(DataB[2]), .B(BUFF_10_Y), .Y(XNOR2_7_Y));
    XOR2 XOR2_12(.A(SumA_5_net), .B(SumB_5_net), .Y(XOR2_12_Y));
    AND2 AND2_48(.A(AND2_36_Y), .B(XOR2_39_Y), .Y(AND2_48_Y));
    AND2 AND2_45(.A(XOR2_35_Y), .B(DataA[0]), .Y(AND2_45_Y));
    AO1 AO1_19(.A(AND2_52_Y), .B(AO1_29_Y), .C(AO1_31_Y), .Y(
        AO1_19_Y));
    XOR2 XOR2_PP3_1_inst(.A(MX2_31_Y), .B(BUFF_0_Y), .Y(PP3_1_net)
        );
    XOR2 XOR2_26(.A(SumA_9_net), .B(SumB_9_net), .Y(XOR2_26_Y));
    AND2 AND2_59(.A(AND2_26_Y), .B(XOR2_32_Y), .Y(AND2_59_Y));
    XOR3 XOR3_SumB_7_inst(.A(MAJ3_3_Y), .B(XOR2_1_Y), .C(XOR3_5_Y)
        , .Y(SumB_7_net));
    AND2 AND2_4(.A(XOR2_20_Y), .B(DataA[3]), .Y(AND2_4_Y));
    AND2 AND2_40(.A(XOR2_21_Y), .B(DataA[7]), .Y(AND2_40_Y));
    BUFF BUFF_4(.A(DataB[3]), .Y(BUFF_4_Y));
    XOR2 XOR2_50(.A(SumA_7_net), .B(SumB_7_net), .Y(XOR2_50_Y));
    AND2 AND2_42(.A(AND2_82_Y), .B(AND2_68_Y), .Y(AND2_42_Y));
    AOI1 AOI1_E_0_inst(.A(XOR2_13_Y), .B(OR3_2_Y), .C(AND3_2_Y), 
        .Y(E_0_net));
    XNOR2 XNOR2_5(.A(DataB[2]), .B(BUFF_4_Y), .Y(XNOR2_5_Y));
    MX2 MX2_4(.A(AND2_79_Y), .B(DataA[1]), .S(NOR2_4_Y), .Y(
        MX2_4_Y));
    AO1 AO1_5(.A(AND2_75_Y), .B(AO1_28_Y), .C(AO1_13_Y), .Y(
        AO1_5_Y));
    AND2 AND2_67(.A(XOR2_48_Y), .B(DataA[6]), .Y(AND2_67_Y));
    BUFF BUFF_13(.A(DataB[1]), .Y(BUFF_13_Y));
    XOR3 XOR3_2(.A(PP3_5_net), .B(PP2_7_net), .C(AND2_66_Y), .Y(
        XOR3_2_Y));
    XOR2 XOR2_39(.A(S_1_net), .B(SumB_2_net), .Y(XOR2_39_Y));
    AND2 AND2_8(.A(XOR2_30_Y), .B(DataA[5]), .Y(AND2_8_Y));
    AND2 AND2_80(.A(XOR2_2_Y), .B(XOR2_44_Y), .Y(AND2_80_Y));
    NOR2 NOR2_7(.A(XOR2_5_Y), .B(XNOR2_8_Y), .Y(NOR2_7_Y));
    XOR2 XOR2_3(.A(DataA[7]), .B(DataB[3]), .Y(XOR2_3_Y));
    MX2 MX2_12(.A(AND2_28_Y), .B(DataA[3]), .S(NOR2_6_Y), .Y(
        MX2_12_Y));
    XOR3 XOR3_1(.A(PP3_3_net), .B(PP2_5_net), .C(AND2_7_Y), .Y(
        XOR3_1_Y));
    XOR2 XOR2_51(.A(AND2_18_Y), .B(BUFF_7_Y), .Y(XOR2_51_Y));
    AO1 AO1_27(.A(AND2_14_Y), .B(AO1_15_Y), .C(AO1_5_Y), .Y(
        AO1_27_Y));
    AND2 AND2_82(.A(AND2_36_Y), .B(AND2_70_Y), .Y(AND2_82_Y));
    AND2 AND2_56(.A(AND2_65_Y), .B(XOR2_2_Y), .Y(AND2_56_Y));
    XOR2 XOR2_Mult_14_inst(.A(XOR2_36_Y), .B(AO1_26_Y), .Y(
        Mult[14]));
    XOR2 XOR2_17(.A(DataA[7]), .B(DataB[5]), .Y(XOR2_17_Y));
    AND2 AND2_53(.A(XOR2_35_Y), .B(DataA[1]), .Y(AND2_53_Y));
    XOR2 XOR2_28(.A(SumA_9_net), .B(SumB_9_net), .Y(XOR2_28_Y));
    XOR2 XOR2_15(.A(AND2_20_Y), .B(BUFF_3_Y), .Y(XOR2_15_Y));
    MAJ3 MAJ3_SumB_13_inst(.A(MAJ3_0_Y), .B(PP3_7_net), .C(
        E_2_net), .Y(SumB_13_net));
    MX2 MX2_18(.A(BUFF_13_Y), .B(XOR2_13_Y), .S(DataB[0]), .Y(
        MX2_18_Y));
    AO1 AO1_17(.A(XOR2_23_Y), .B(AND2_24_Y), .C(AND2_35_Y), .Y(
        AO1_17_Y));
    BUFF BUFF_11(.A(DataB[5]), .Y(BUFF_11_Y));
    MAJ3 MAJ3_2(.A(AND2_66_Y), .B(PP3_5_net), .C(PP2_7_net), .Y(
        MAJ3_2_Y));
    XOR2 XOR2_PP0_3_inst(.A(MX2_22_Y), .B(BUFF_9_Y), .Y(PP0_3_net)
        );
    MAJ3 MAJ3_SumA_7_inst(.A(XOR3_3_Y), .B(MAJ3_1_Y), .C(
        XOR2_10_Y), .Y(SumA_7_net));
    XOR2 XOR2_Mult_11_inst(.A(XOR2_24_Y), .B(AO1_1_Y), .Y(
        Mult[11]));
    XOR2 XOR2_PP2_7_inst(.A(MX2_11_Y), .B(BUFF_14_Y), .Y(
        PP2_7_net));
    AND2 AND2_21(.A(XOR2_21_Y), .B(DataA[6]), .Y(AND2_21_Y));
    MX2 MX2_16(.A(AND2_74_Y), .B(DataA[3]), .S(NOR2_8_Y), .Y(
        MX2_16_Y));
    XOR2 XOR2_0(.A(PP0_1_net), .B(S_0_net), .Y(XOR2_0_Y));
    MAJ3 MAJ3_1(.A(PP2_2_net), .B(PP1_4_net), .C(PP0_6_net), .Y(
        MAJ3_1_Y));
    AO1 AO1_4(.A(XOR2_2_Y), .B(AO1_6_Y), .C(AND2_50_Y), .Y(
        AO1_4_Y));
    AND2 AND2_37(.A(DataB[0]), .B(DataA[6]), .Y(AND2_37_Y));
    XOR2 XOR2_42(.A(BUFF_2_Y), .B(DataB[6]), .Y(XOR2_42_Y));
    AO1 AO1_21(.A(AND2_80_Y), .B(AO1_6_Y), .C(AO1_28_Y), .Y(
        AO1_21_Y));
    XOR2 XOR2_36(.A(SumA_13_net), .B(SumB_13_net), .Y(XOR2_36_Y));
    BUFF BUFF_1(.A(DataB[7]), .Y(BUFF_1_Y));
    XNOR2 XNOR2_8(.A(DataB[4]), .B(BUFF_14_Y), .Y(XNOR2_8_Y));
    MX2 MX2_1(.A(AND2_62_Y), .B(DataA[2]), .S(NOR2_3_Y), .Y(
        MX2_1_Y));
    AND2 AND2_28(.A(XOR2_20_Y), .B(DataA[4]), .Y(AND2_28_Y));
    AND2 AND2_25(.A(XOR2_35_Y), .B(DataA[2]), .Y(AND2_25_Y));
    MX2 MX2_13(.A(AND2_61_Y), .B(DataA[3]), .S(AND2A_1_Y), .Y(
        MX2_13_Y));
    
endmodule

// _Disclaimer: Please leave the following comments in the file, they are for internal purposes only._


// _GEN_File_Contents_

// Version:9.1.5.1
// ACTGENU_CALL:1
// BATCH:T
// FAM:SmartFusion
// OUTFORMAT:Verilog
// LPMTYPE:LPM_MULT
// LPM_HINT:XBOOTHMULT
// INSERT_PAD:NO
// INSERT_IOREG:NO
// GEN_BHV_VHDL_VAL:F
// GEN_BHV_VERILOG_VAL:F
// MGNTIMER:F
// MGNCMPL:T
// DESDIR:C:/Actelprj/SDRv2_LiberoV9/smartgen\signed_mult8x8
// GEN_BEHV_MODULE:T
// SMARTGEN_DIE:IP6X5M2
// SMARTGEN_PACKAGE:fg484
// AGENIII_IS_SUBPROJECT_LIBERO:T
// WIDTHA:8
// WIDTHB:8
// REPRESENTATION:SIGNED
// CLK_EDGE:RISE
// MAXPGEN:0
// PIPES:0
// INST_FA:1
// HYBRID:0
// DEBUG:0

// _End_Comments_

