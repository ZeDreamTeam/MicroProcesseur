/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/djemaa/workspace/ProjetInfo/exampleXilinx/sources/alu/rtl/alu.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char t7[16];
    char t13[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned char t12;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned char t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 568U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 2156);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(54, ng0);
    t3 = (t0 + 868U);
    t4 = *((char **)t3);
    t3 = (t0 + 3952U);
    t5 = (t0 + 4011);
    t8 = (t7 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 7;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t10 = (7 - 0);
    t11 = (t10 * 1);
    t11 = (t11 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t11;
    t12 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t3, t5, t7);
    if (t12 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 868U);
    t3 = *((char **)t1);
    t1 = (t0 + 3952U);
    t4 = (t0 + 4019);
    t6 = (t7 + 0U);
    t8 = (t6 + 0U);
    *((int *)t8) = 0;
    t8 = (t6 + 4U);
    *((int *)t8) = 7;
    t8 = (t6 + 8U);
    *((int *)t8) = 1;
    t10 = (7 - 0);
    t11 = (t10 * 1);
    t11 = (t11 + 1);
    t8 = (t6 + 12U);
    *((unsigned int *)t8) = t11;
    t2 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t1, t4, t7);
    if (t2 != 0)
        goto LAB10;

LAB11:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(55, ng0);
    t9 = (t0 + 776U);
    t14 = *((char **)t9);
    t9 = (t0 + 3936U);
    t15 = (t0 + 684U);
    t16 = *((char **)t15);
    t15 = (t0 + 3920U);
    t17 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t13, t14, t9, t16, t15);
    t18 = (t13 + 12U);
    t11 = *((unsigned int *)t18);
    t19 = (1U * t11);
    t20 = (8U != t19);
    if (t20 == 1)
        goto LAB8;

LAB9:    t21 = (t0 + 2200);
    t22 = (t21 + 32U);
    t23 = *((char **)t22);
    t24 = (t23 + 32U);
    t25 = *((char **)t24);
    memcpy(t25, t17, 8U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB6;

LAB8:    xsi_size_not_matching(8U, t19, 0);
    goto LAB9;

LAB10:    xsi_set_current_line(57, ng0);
    t8 = (t0 + 776U);
    t9 = *((char **)t8);
    t8 = (t0 + 3936U);
    t14 = (t0 + 684U);
    t15 = *((char **)t14);
    t14 = (t0 + 3920U);
    t16 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t13, t9, t8, t15, t14);
    t17 = (t13 + 12U);
    t11 = *((unsigned int *)t17);
    t19 = (1U * t11);
    t12 = (8U != t19);
    if (t12 == 1)
        goto LAB12;

LAB13:    t18 = (t0 + 2200);
    t21 = (t18 + 32U);
    t22 = *((char **)t21);
    t23 = (t22 + 32U);
    t24 = *((char **)t23);
    memcpy(t24, t16, 8U);
    xsi_driver_first_trans_fast_port(t18);
    goto LAB6;

LAB12:    xsi_size_not_matching(8U, t19, 0);
    goto LAB13;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/alu_beh.isim.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
