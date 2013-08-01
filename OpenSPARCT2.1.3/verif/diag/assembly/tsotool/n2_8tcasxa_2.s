/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: n2_8tcasxa_2.s
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
#define N_CPUS  8
#define REGION_MAPPED_SIZE_RTL 8192
#define REGION_SIZE_RTL (128 * 1024)
#define RESULTS_BUF_SIZE_PER_CPU_RTL 1024
#define PRIVATE_DATA_AREA_PER_CPU_RTL 64

#define ALIGN_PAGE_8K .align 8192
#define ALIGN_PAGE_64K .align 65536
#define ALIGN_PAGE_512K .align 524288
#define ALIGN_PAGE_4M .align 4194304
#define USER_PAGE_CUSTOM_MAP

SECTION .MY_HYP_SEC TEXT_VA = 0x1100150000
attr_text {
        Name=.MY_HYP_SEC,
        hypervisor
	}
.text
.global intr0x60_custom_trap
intr0x60_custom_trap:
	ldxa	[%g0] 0x72, %g2;
	ldxa	[%g0] 0x74, %g1;	
	retry;

.global intr0x190_custom_trap
intr0x190_custom_trap:

.global intr0x190_custom_trap
intr0x190_custom_trap:

#ifdef SJM
! programming the JBI - not quite rrugho
!=====================
!setx 0x0000000006040012, %g1, %g2
!setx 0x8503000010, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000100, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000000, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000400, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000108, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000101, %g1, %g2
!setx 0x9800000008, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000408, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000110, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000202, %g1, %g2
!setx 0x9800000010, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000410, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000118, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000303, %g1, %g2
!setx 0x9800000018, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000418, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000120, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000404, %g1, %g2
!setx 0x9800000020, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000420, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000128, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000505, %g1, %g2
!setx 0x9800000028, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000428, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000130, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000606, %g1, %g2
!setx 0x9800000030, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000430, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000138, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000707, %g1, %g2
!setx 0x9800000038, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000438, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000140, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000808, %g1, %g2
!setx 0x9800000040, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000440, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000148, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000909, %g1, %g2
!setx 0x9800000048, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000448, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000150, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000a0a, %g1, %g2
!setx 0x9800000050, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000450, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000158, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000b0b, %g1, %g2
!setx 0x9800000058, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000458, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000160, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000c0c, %g1, %g2
!setx 0x9800000060, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000460, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000168, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000d0d, %g1, %g2
!setx 0x9800000068, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000468, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000170, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000e0e, %g1, %g2
!setx 0x9800000070, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000470, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000003, %g1, %g2
!setx 0x8500000178, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000f0f, %g1, %g2
!setx 0x9800000078, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000478, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x000000000000007f, %g1, %g2
!setx 0x8503000008, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000001010, %g1, %g2
!setx 0x9800000080, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000480, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000001111, %g1, %g2
!setx 0x9800000088, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000488, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000c00, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e20, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e28, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9300000e38, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000008, %g1, %g2
!setx 0x8503000018, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x9800000828, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000000, %g1, %g2
!setx 0x8503000028, %g1, %g3
!stx %g2, [%g3]
!!=====================
!setx 0x0000000000000001, %g1, %g2
!setx 0x8503000020, %g1, %g3
!stx %g2, [%g3]
!!=====================

/***********************************************************************
  Disable L2 Cache Visibility Port
 ***********************************************************************/

setx 0x0000000000000000, %g1, %g2
setx 0x9800001800, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001820, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001828, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001830, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001838, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800001840, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
  Disable IOBridge Visibility Ports
 ***********************************************************************/

setx 0x0000000000000000, %g1, %g2
setx 0x9800001000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002008, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002100, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002140, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002160, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002180, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021a0, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002148, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002168, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002188, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021a8, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002150, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002170, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x9800002190, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000000000000000, %g1, %g2
setx 0x98000021b0, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
 Configure jbi controller
 ***********************************************************************/

setx 0x03fb303e00000001, %g1, %g2
setx 0x8000000000, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x000000007033fe0f, %g1, %g2
setx 0x8000000008, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x0000003fc0000000, %g1, %g2
setx 0x80000100a0, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0x00000000fe0003ff, %g1, %g2
setx 0x8000004100, %g1, %g3
stx %g2, [%g3]
!=====================

/***********************************************************************
 IOSYNC cycles to start sjm
 ***********************************************************************/

setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xcf00beef00, %g1, %g3
stx %g2, [%g3]
!=====================
setx 0xdeadbeefdeadbeef, %g1, %g2
setx 0xef00beef00, %g1, %g3
stx %g2, [%g3]

!=============================
done;

#else
#ifdef  DC_ON_OFF
	
	and	%i0, 0x1, %i0
	brz	%i0, on
	nop

        mov     0xd, %i0
	ba	finish_dc_on_off
        stxa    %l0, [%g0] 0x45         /* turn D-cache off */
on:        
        mov     0xf, %i0
        stxa    %i0, [%g0] 0x45         /* turn D-cache back on */

finish_dc_on_off:
	done

#else
	stxa	%i0, [%g0] 0x73;	
	done;
#endif
#endif
!============================================================================

#define ENABLE_T0_Fp_exception_ieee_754_0x21
#define ENABLE_T0_Fp_exception_other_0x22
#define ENABLE_T0_Fp_disabled_0x20
#define ENABLE_T0_Illegal_instruction_0x10
#define ENABLE_T1_Illegal_instruction_0x10
#define ENABLE_HT0_Illegal_instruction_0x10
#define ENABLE_HT1_Illegal_instruction_0x10
#define ENABLE_T0_Clean_Window_0x24
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_VA_IS_RA_ALSO




#define H_T0_Trap_Instruction_0
#define My_T0_Trap_Instruction_0	\
	ta      0x90;			\
	done;

#define H_HT0_HTrap_Instruction_0 intr0x190_custom_trap
#ifdef SJM
#define My_HT0_HTrap_Instruction_0 \
	setx intr0x190_custom_trap, %g1, %g2; \
	jmp %g2; nop
#else
#define My_HT0_HTrap_Instruction_0      \
	stxa    %i0, [%g0] 0x73;        \
	done;
#endif

#define H_HT0_Interrupt_0x60 intr0x60_custom_trap
#define My_HT0_Interrupt_0x60   \
        ldxa    [%g0] 0x72, %g2;        \
        ldxa    [%g0] 0x74, %g1;        \
        retry;
#define H_HT0_Trap_Instruction_5
#define My_HT0_Trap_Instruction_5   \
        ldxa [%g0 + %g0]0x45, %g1;     \
		membar #Sync;  \
        xor  %g1, 19, %g1;   \
        stxa %g1, [%g0 + %g0]0x45;  \
		wrpr %g0, 0x200, %pstate;
        done;

#ifndef THREAD_COUNT
#define THREAD_COUNT 8
#endif

#ifndef THREAD_STRIDE
#define THREAD_STRIDE 1
#endif
#define SKIP_TRAPCHECK
! force ta T_RD_THID to return thread%8 (aka 0-7)
#define PORTABLE_CORE
#include "hboot.s"


!try later:
!	stxa    %l6, [$8] (0x22 | ($2 & 0x9)) ! ASI is randomly set
!===========
define(BST_INIT, `
	add     $6, ($7 & 0xfff0), $8	! 4-byte align the offset
	stxa    %l6, [$8] 0x22		! ASI is randomly set
')

!try later:
!ldda    [$8] (0x22 | ($2 & 0x9)), %l6 ! ASI is randomly set
!===========
define(BLD_INIT, `
        add     $6, ($7 & 0xfff0), $8 	! 4-byte align the offset
        ldda    [$8] 0x22, %l6 		! ASI is randomly set
')

define(CHECK_PROC_ID,`
check_cpu_id: 

	wr	%g0, 0x4, %fprs         /* make sure fef is 1 */
	mov 	THREAD_STRIDE, %l2
	th_fork(thread,%l0)

thread_0:
#ifdef SJM
	ta 	0x30
#endif
	mov 	0, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
	
thread_1:
	mov 	1, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_2:
	mov 	2, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_3:
	mov 	3, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_4:
	mov 	4, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_5:
	mov 	5, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_6:
	mov 	6, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_7:
	mov 	7, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_8:
	mov 	8, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_9:
	mov 	9, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_10:
	mov 	10, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_11:
	mov 	11, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_12:
	mov 	12, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_13:
	mov 	13, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_14:
	mov 	14, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_15:
	mov 	15, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_16:
	mov 	16, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_17:
	mov 	17, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_18:
	mov 	18, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_19:
	mov 	19, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_20:
	mov 	20, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_21:
	mov 	21, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_22:
	mov 	22, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_23:
	mov 	23, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_24:
	mov 	24, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_25:
	mov 	25, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_26:
	mov 	26, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
	
thread_27:
	mov 	27, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_28:
	mov 	28, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_29:
	mov 	29, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_30:
	mov 	30, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop
	
thread_31:
	mov 	31, %g1 
        udivx 	%g1, %l2, %g1
	ba	entry_point; nop

thread_32:
    mov     32, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_33:
    mov     33, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_34:
    mov     34, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_35:
    mov     35, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_36:
    mov     36, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_37:
    mov     37, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_38:
    mov     38, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_39:
    mov     39, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_40:
    mov     40, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_41:
    mov     41, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_42:
    mov     42, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_43:
    mov     43, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_44:
    mov     44, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_45:
    mov     45, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_46:
    mov     46, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_47:
    mov     47, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_48:
    mov     48, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_49:
    mov     49, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_50:
    mov     50, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_51:
    mov     51, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_52:
    mov     52, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_53:
    mov     53, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_54:
    mov     54, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_55:
    mov     55, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_56:
    mov     56, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_57:
    mov     57, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_58:
    mov     58, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_59:
    mov     59, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_60:
    mov     60, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_61:
    mov     61, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_62:
    mov     62, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

thread_63:
    mov     63, %g1
        udivx   %g1, %l2, %g1
    ba  entry_point; nop

entry_point:
#ifdef RTGPRIV
	ta	T_CHANGE_PRIV
#endif
	
')
! --- Common Macro Definitions ---
!
! macros will be instantiated with these arguments
! macro_name(P#, rand#, my_cpu#, PA_val, VA_val, VA_reg, VA_offset, \
!            tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3)
!
! P# - Pid, just in case one needs unique number
! rand# - random number
! my_cpu# - CPU id
! PA_val - shared memory physisal address value
! VA_val - shared memory virtual address value
! VA_reg - register containing VA region base address
! VA_offset - VA_reg + VA_offset will give correct VA address value
! tmp_reg0-tmp_reg3 - integer registers for arbitrary use within the macro
!                     tmp_reg0 & tmp_reg1 are even-odd register pair
!
! VA_val may be incorrect since VA will be determined at compile time by assembler
! and may not available at diag generation time, but VA_reg+VA_offset is valid
!
! ex. SAMPLE(1, 1249, 0, 0x43400100, 0x100, %i1, 0x100, %l6, %l7, %o5, %l3)
!
! Sample macro 1:
!  load unsigned byte from the given shared addr into tmp_reg1
!  the given shared addr is 4-byte aligned and we will randomly
!  pick one byte from the 4 bytes.
! 
! define(SAMPLE, `
!        ldub   [$6+$7+($2 mod 4)], $8
! ')
!
! Can also use C-like macro definition format.
!
! Sample macro 2:
!   issue an "ldda" instruction to the randomly picked shared location
!   (aligned it to 16-byte boundary first) with a random ASI value among
!   0x22, 0x23, 0x2a, and 0x2b (utilizing the provided "rand" value).
!
! #define BLD_INIT(Pid, rand, my_cpu, PA_val, \
!                 VA_val, VA_reg, VA_offset, \
!                 tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
!   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
!   ldda [tmp_reg2] (0x22 | (rand & 0x9)), tmp_reg0;
!
! ---

! Macro NOPTRAIN
! Train of NOPs

#define NOPTRAIN(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
		nop;\
		nop;\
		nop;\
		nop;


! Macro STTRAIN4
! Train of total 4 of UW stores.
! Note: doesn't use shared addresses

#define STTRAIN4(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        set 5120, tmp_reg1; \
        add %i0, tmp_reg1, tmp_reg1; \
        set rand, tmp_reg2; \
        stw tmp_reg2, [tmp_reg1]; \
        stw tmp_reg2, [tmp_reg1+4]; \
        stw tmp_reg2, [tmp_reg1+8]; \
        stw tmp_reg2, [tmp_reg1+16];

! Macro STTRAIN8
! Train of total 8 of UW stores 

#define STTRAIN8(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        set 5120, tmp_reg1; \
        add %i0, tmp_reg1, tmp_reg1; \
        set rand, tmp_reg2; \
        add tmp_reg2, rand % 4096, tmp_reg3; \
        stw tmp_reg2, [tmp_reg1]; \
        stw tmp_reg2, [tmp_reg1+4]; \
        stw tmp_reg2, [tmp_reg1+8]; \
        stw tmp_reg2, [tmp_reg1+12]; \
        stw tmp_reg3, [tmp_reg1+4]; \
        stw tmp_reg3, [tmp_reg1+12]; \
        stw tmp_reg3, [tmp_reg1]; \
        stw tmp_reg3, [tmp_reg1+8];
 
! Macro LDTRAIN4
! Train of total 4 of UW Loads
! Note the values of those loads inside the macro will not be analized,
! even though the accesses are [possibly] made to the shared locations

#define LDTRAIN4(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        ld [%i0], tmp_reg1; \
        ld [%i1+4], tmp_reg1; \
        ld [%i2+8], tmp_reg1; \
        ld [%i3+12], tmp_reg1;

! Macro LDTRAIN8

#define LDTRAIN8(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        ld [%i3], tmp_reg1; \
        ld [%i2+4], tmp_reg1; \
        ld [%i1+8], tmp_reg2; \
        ld [%i0+12], tmp_reg2; \
        ld [%i3+4], tmp_reg3; \
        ld [%i2], tmp_reg3; \
        ld [%i1+12], tmp_reg4; \
        ld [%i0+8], tmp_reg4;

! Macro PREFETCHTRAIN4

#define PREFETCHTRAIN4(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        prefetch [%i0+4], 0; \
        prefetch [%i1+12], 0; \
        prefetch [%i2+8], 0; \
        prefetch [%i3], 0;

! Macro PREFETCHTRAIN8

#define PREFETCHTRAIN8(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        prefetch [%i3], 0; \
        prefetch [%i2+4], 0; \
        prefetch [%i1+8], 0; \
        prefetch [%i0+12], 0; \
        prefetch [%i3+4], 1; \
        prefetch [%i2], 1; \
        prefetch [%i1+12], 1; \
        prefetch [%i0+8], 1;

! Macro CASTRAIN4
! This is an interesting macro that will probably create the write congessions
! access to the shared locations (offsets from bases have to be adjusted)
! the values of the locations are not changed, so it should not affect analysis

#define CASTRAIN4(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        set 128, tmp_reg1;\
        add %i0, tmp_reg1, tmp_reg1;\
        set 256, tmp_reg2;\
        add %i1, tmp_reg2, tmp_reg2;\
        ld [tmp_reg1], tmp_reg3;\
        ld [tmp_reg2], tmp_reg4;\
        cas [tmp_reg1], tmp_reg3, tmp_reg3;\
        cas [tmp_reg1], tmp_reg3, tmp_reg3;\
        cas [tmp_reg2], tmp_reg4, tmp_reg4;\
        cas [tmp_reg2], tmp_reg4, tmp_reg4;

! CASTRAIN8
! yet another flavor of cas train theme that actually always use shared locations
! given by the specified instance arguments for the first 4 cases
! and then follows then with another 4 to a randomized offset

#define CASTRAIN8(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
  add VA_reg, VA_offset, tmp_reg1;\
  add VA_reg, (rand&0x0ffc), tmp_reg2;\
  ld [tmp_reg1], tmp_reg3;\
  cas [tmp_reg1], tmp_reg3, tmp_reg3;\
  cas [tmp_reg1], tmp_reg3, tmp_reg3;\
  cas [tmp_reg1], tmp_reg3, tmp_reg3;\
  cas [tmp_reg1], tmp_reg3, tmp_reg3;\
  ld  [tmp_reg2], tmp_reg4;\
  cas [tmp_reg2], tmp_reg4, tmp_reg4;\
  cas [tmp_reg2], tmp_reg4, tmp_reg4;\
  cas [tmp_reg2], tmp_reg4, tmp_reg4;\
  cas [tmp_reg2], tmp_reg4, tmp_reg4;

! Macro ST_BR_ANLD_CAS
! this is meant to reproduce NG6025
! the scenario is the anulled load in the delay slot of the branch is 
! not wiped completely, which creates false RAW hazard, and the following cas
! is getting screwed
! WARNING: there is a store to the %i0+128, which can potentially be a shared 
! location. When using this macro, make sure that the vicinity of offset 128 in
! region 0 is not used

#define ST_BR_ANLD_CAS(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        set 128, tmp_reg1;\
        add %i0, tmp_reg1, tmp_reg1;\
        set rand, tmp_reg3;\
        stw tmp_reg3, [tmp_reg1];\
        ba,a 1;\
        cas [tmp_reg1], tmp_reg3, tmp_reg4;

#define ASI_BLOCK(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
        setx 0x060, tmp_reg1, tmp_reg2; \
        stxa %g0, [tmp_reg2] 0x38;

! Macro SELF_MODIFY
! do a read-unmodify-write at address pc + random[0..0x80]
! this is targetted to catch bugs due to sharing/modification
! of data between D$ and I$. (e.g. Niagara1, Bug #6372)
! 1. 0x80 chosen arbitrarily, is another number better
! 2. should we include an iflush ?
! 3. WT.MACRO.SELF_MODIFY should be given a small non-0 weight by default
! 4. Possible variation: a macro which only does a load
!    from the instruction stream instead of a load-store. 
!    (Niagara1 bug #6372 did not involve stores to instruction
!    stream, just sharing of unmodified data between I$ and D$.)
! 5. this macro needs text segment to be writable. On system runs,
!    this is achieved by using a special map file for the linker.
! - sgh, 25 may 04

#define SELF_MODIFY(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
	rd    %pc, tmp_reg0; \
	ld    [ tmp_reg0 + (rand & 0x7c)], tmp_reg1; \
	st    tmp_reg1, [ tmp_reg0 + (rand & 0x7c)] 

#define ASI_BLOCK(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
        setx 0x060, tmp_reg1, tmp_reg2; \
        stxa %g0, [tmp_reg2] 0x38;


#define ASI_BLOCK_VA_HOLE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
        setx 0x8559e06ff33bad10, tmp_reg1, tmp_reg2; \
        stxa %g0, [tmp_reg2] 0x80;
	
#define PREFETCH_VA_HOLE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        setx 0x8559e06ff33bad10, tmp_reg1, tmp_reg2; \
        prefetch [tmp_reg2], 0; \
        prefetch [tmp_reg2+4], 1; \
        prefetch [tmp_reg2+8], 2; \
        prefetch [tmp_reg2+12], 3; \
        prefetch [tmp_reg2+4], 4; \
        prefetch [tmp_reg2], 5; \
        prefetch [tmp_reg2+12], 6; \
        prefetch [tmp_reg2+8], 7;

#define LOAD_VA_HOLE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        setx 0x8559e06ff33bad10, tmp_reg1, tmp_reg2; \
        ld [tmp_reg2], tmp_reg1; \
        ld [tmp_reg2+4], tmp_reg1; \
        ld [tmp_reg2+8], tmp_reg1; \
        ld [tmp_reg2+12], tmp_reg1;



#define STORE_VA_HOLE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        setx 0x8559e06ff33bad10, tmp_reg2, tmp_reg1; \
        set rand, tmp_reg2; \
        add tmp_reg2, rand % 4096, tmp_reg3; \
        stw tmp_reg2, [tmp_reg1]; \
        stw tmp_reg2, [tmp_reg1+4]; \
        stw tmp_reg2, [tmp_reg1+8]; \
        stw tmp_reg2, [tmp_reg1+12]; \
        stw tmp_reg3, [tmp_reg1+4]; \
        stw tmp_reg3, [tmp_reg1+12]; \
        stw tmp_reg3, [tmp_reg1]; \
        stw tmp_reg3, [tmp_reg1+8];	

#define CAS_VA_HOLE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        setx 0x8559e06ff33bad10, tmp_reg3, tmp_reg1; \
        setx 0x8559e06ff33bad10, tmp_reg3, tmp_reg2; \
        add tmp_reg2, rand % 4096, tmp_reg3; \
        cas [tmp_reg1], tmp_reg3, tmp_reg3;\
        cas [tmp_reg2], tmp_reg4, tmp_reg4;

#define IDC_FLIP(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        ta 0xb5; \
		ta T_CHANGE_NONHPRIV;

! this macro produce ldda/stda to 
! ASI_BLOCK_AS_IF_USER_PRIMARY            0x16
! ASI_BLOCK_AS_IF_USER_SECONDARY          0x17
! ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE     0x1e
! ASI_BLOCK_AS_IF_USER_SECONDARY_LITTLE   0x1f
!! hardcode for now since illegal asi not working in RS
#define BLD_16(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   ldda [tmp_reg3]0x16, tmp_reg0;
#define BLD_17(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   ldda [tmp_reg3]0x17, tmp_reg0;
#define BLD_1e(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   ldda [tmp_reg3]0x1e, tmp_reg0;
#define BLD_1f(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   ldda [tmp_reg3]0x1f, tmp_reg0;

#define BST_16(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   stda tmp_reg0, [tmp_reg3]0x16;
#define BST_17(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   stda tmp_reg0, [tmp_reg3]0x17;
#define BST_1e(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   stda tmp_reg0, [tmp_reg3]0x1e;
#define BST_1f(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ta      T_CHANGE_PRIV;\
   ta      T_CHANGE_HPRIV;\
   stda tmp_reg0, [tmp_reg3]0x1f;

#define BLD_INIT_2(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ldda [tmp_reg3] (0x27 | (rand & 0xf)), tmp_reg0;
#define BST_INIT_2(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   stda tmp_reg0, [tmp_reg3] (0x27 | (rand & 0xf));
#define BLD_INIT_E(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   ldda [tmp_reg3] (0xe2 | (rand & 0xb)), tmp_reg0;
#define BST_INIT_E(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0xfff0), tmp_reg3; \
   stda tmp_reg0, [tmp_reg3] (0xe2 | (rand & 0xb));
#define PREFETCHA(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg0, tmp_reg1, tmp_reg2, tmp_reg3) \
   add  VA_reg, (VA_offset & 0x00ff), tmp_reg3; \
   prefetch [%i1], (rand & 0x1f); \
   prefetch [%i1 + ((rand >> 5) & 0x1f)], ((rand >> 5) & 0x1f); \
   prefetcha [%i1]((rand >> 5) & 0x1f), (0x0 | ((rand >> 5) & 0x1f));
#define STBYTE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        add  VA_reg, (VA_offset & 0xff00), tmp_reg1; \
        set rand, tmp_reg2; \
        stb tmp_reg2, [tmp_reg1+(rand & 0x5f)];
#define LDBYTE(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        add  VA_reg, (VA_offset & 0xff00), tmp_reg1; \
        ldub [tmp_reg1+(rand & 0x5f)], tmp_reg2;
#define STBYTE1(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        add  VA_reg, (VA_offset & 0xff00), tmp_reg1;\
		set 5200, tmp_reg2; \
		add tmp_reg2, tmp_reg1, tmp_reg1; \
		set rand, tmp_reg2; \
		stb tmp_reg2, [tmp_reg1+(rand & 0x5f)];
#define STINT(Pid, rand, my_cpu, PA_val, VA_val, VA_reg, VA_offset, tmp_reg1, tmp_reg2, tmp_reg3, tmp_reg4) \
        set rand, tmp_reg1; \
        stha  tmp_reg1,[%g0+%g0](0x73); \
        stda tmp_reg1, [%g0+%g0](0x73);
define(EN_INTERRUPTS,`
nop
')

define(DIS_INTERRUPTS,`
nop
')

define(CHECK_DISPATCH_STATUS,`
nop
')

define(CHECK_RECEIVE_STATUS,`
nop
')

define(WRITE_INTR_DATA_REGS,`
nop
')

define(INTR_SET_DISPATCH_VECTOR,`
add      %g0, $3, $4
sllx     $4, 8,  $5      ! DEST ID
add      %g0, $2, $4      ! VECTOR NUMBER
or       $5, $4, $5
mov      %i0, $4
mov      $5, %i0
ta       0x30
mov      $4, %i0
')

define(DSPCH_INTERRUPT,`
nop
')

#define REGION0_ALIAS3_O 0x0
#define REGION1_ALIAS3_O 0x20000
#define REGION2_ALIAS3_O 0x40000
#define REGION3_ALIAS3_O 0x60000
#define REGION4_ALIAS3_O 0x80000
#define REGION5_ALIAS3_O 0xa0000
#define REGION6_ALIAS3_O 0xc0000
#define REGION7_ALIAS3_O 0xe0000
#define REPLACEMENT0_ALIAS3_O 0x100000
#define REGION0_ALIAS2_O 0x200000
#define REGION1_ALIAS2_O 0x220000
#define REGION2_ALIAS2_O 0x240000
#define REGION3_ALIAS2_O 0x260000
#define REGION4_ALIAS2_O 0x280000
#define REGION5_ALIAS2_O 0x2a0000
#define REGION6_ALIAS2_O 0x2c0000
#define REGION7_ALIAS2_O 0x2e0000
#define REPLACEMENT0_ALIAS2_O 0x300000
#define REGION0_ALIAS1_O 0x400000
#define REGION1_ALIAS1_O 0x420000
#define REGION2_ALIAS1_O 0x440000
#define REGION3_ALIAS1_O 0x460000
#define REGION4_ALIAS1_O 0x480000
#define REGION5_ALIAS1_O 0x4a0000
#define REGION6_ALIAS1_O 0x4c0000
#define REGION7_ALIAS1_O 0x4e0000
#define REPLACEMENT0_ALIAS1_O 0x500000
#define REGION0_ALIAS0_O 0x600000
#define REGION1_ALIAS0_O 0x620000
#define REGION2_ALIAS0_O 0x640000
#define REGION3_ALIAS0_O 0x660000
#define REGION4_ALIAS0_O 0x680000
#define REGION5_ALIAS0_O 0x6a0000
#define REGION6_ALIAS0_O 0x6c0000
#define REGION7_ALIAS0_O 0x6e0000
#define REPLACEMENT0_ALIAS0_O 0x700000


#define USER_PAGE_CUSTOM_MAP
SECTION .MAIN TEXT_VA=0x1000000
attr_text {
	Name = .MAIN,
	VA=0x1000000,
	RA=0x130000000,
	PA=ra2pa(0x130000000,0),
part_0_ctx_nonzero_tsb_config_1,
 TTE_EP=1,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=0
	}

attr_text {
	Name = .MAIN,
	VA=0x1000000,
	RA=0x130000000,
	PA=ra2pa(0x130000000,0),
part_0_ctx_nonzero_tsb_config_0,
 TTE_EP=1,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

SECTION tsotool_unshared_data DATA_VA=0x21400000
attr_data {
	Name = tsotool_unshared_data,
	VA=0x21400000,
	RA=0x21400000,
	PA=ra2pa(0x21400000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=1,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region0_alias3_4 DATA_VA=0x6000000
attr_data {
	Name = region0_alias3_4,
	VA=0x6000000,
	RA=0x43000000,
	PA=ra2pa(0x43000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=0,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region1_alias3_4 DATA_VA=0x6020000
attr_data {
	Name = region1_alias3_4,
	VA=0x6020000,
	RA=0x43800000,
	PA=ra2pa(0x43800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region2_alias3_4 DATA_VA=0x6040000
attr_data {
	Name = region2_alias3_4,
	VA=0x6040000,
	RA=0x44000000,
	PA=ra2pa(0x44000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region3_alias3_4 DATA_VA=0x6060000
attr_data {
	Name = region3_alias3_4,
	VA=0x6060000,
	RA=0x44800000,
	PA=ra2pa(0x44800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region4_alias3_4 DATA_VA=0x6080000
attr_data {
	Name = region4_alias3_4,
	VA=0x6080000,
	RA=0x45000000,
	PA=ra2pa(0x45000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region5_alias3_4 DATA_VA=0x60a0000
attr_data {
	Name = region5_alias3_4,
	VA=0x60a0000,
	RA=0x45800000,
	PA=ra2pa(0x45800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region6_alias3_4 DATA_VA=0x60c0000
attr_data {
	Name = region6_alias3_4,
	VA=0x60c0000,
	RA=0x46000000,
	PA=ra2pa(0x46000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region7_alias3_4 DATA_VA=0x60e0000
attr_data {
	Name = region7_alias3_4,
	VA=0x60e0000,
	RA=0x46800000,
	PA=ra2pa(0x46800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement0_alias3_4 DATA_VA=0x6100000
attr_data {
	Name = replacement0_alias3_4,
	VA=0x6100000,
	RA=0x47000000,
	PA=ra2pa(0x47000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement1_alias3_4 DATA_VA=0x6120000
attr_data {
	Name = replacement1_alias3_4,
	VA=0x6120000,
	RA=0x47800000,
	PA=ra2pa(0x47800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement2_alias3_4 DATA_VA=0x6140000
attr_data {
	Name = replacement2_alias3_4,
	VA=0x6140000,
	RA=0x48000000,
	PA=ra2pa(0x48000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement3_alias3_4 DATA_VA=0x6160000
attr_data {
	Name = replacement3_alias3_4,
	VA=0x6160000,
	RA=0x48800000,
	PA=ra2pa(0x48800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement4_alias3_4 DATA_VA=0x6180000
attr_data {
	Name = replacement4_alias3_4,
	VA=0x6180000,
	RA=0x49000000,
	PA=ra2pa(0x49000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement5_alias3_4 DATA_VA=0x61a0000
attr_data {
	Name = replacement5_alias3_4,
	VA=0x61a0000,
	RA=0x49800000,
	PA=ra2pa(0x49800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement6_alias3_4 DATA_VA=0x61c0000
attr_data {
	Name = replacement6_alias3_4,
	VA=0x61c0000,
	RA=0x4a000000,
	PA=ra2pa(0x4a000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement7_alias3_4 DATA_VA=0x61e0000
attr_data {
	Name = replacement7_alias3_4,
	VA=0x61e0000,
	RA=0x4a800000,
	PA=ra2pa(0x4a800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region0_alias2_4 DATA_VA=0x6200000
attr_data {
	Name = region0_alias2_4,
	VA=0x6200000,
	RA=0x43000000,
	PA=ra2pa(0x43000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=0,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region1_alias2_4 DATA_VA=0x6220000
attr_data {
	Name = region1_alias2_4,
	VA=0x6220000,
	RA=0x43800000,
	PA=ra2pa(0x43800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region2_alias2_4 DATA_VA=0x6240000
attr_data {
	Name = region2_alias2_4,
	VA=0x6240000,
	RA=0x44000000,
	PA=ra2pa(0x44000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region3_alias2_4 DATA_VA=0x6260000
attr_data {
	Name = region3_alias2_4,
	VA=0x6260000,
	RA=0x44800000,
	PA=ra2pa(0x44800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region4_alias2_4 DATA_VA=0x6280000
attr_data {
	Name = region4_alias2_4,
	VA=0x6280000,
	RA=0x45000000,
	PA=ra2pa(0x45000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region5_alias2_4 DATA_VA=0x62a0000
attr_data {
	Name = region5_alias2_4,
	VA=0x62a0000,
	RA=0x45800000,
	PA=ra2pa(0x45800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region6_alias2_4 DATA_VA=0x62c0000
attr_data {
	Name = region6_alias2_4,
	VA=0x62c0000,
	RA=0x46000000,
	PA=ra2pa(0x46000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region7_alias2_4 DATA_VA=0x62e0000
attr_data {
	Name = region7_alias2_4,
	VA=0x62e0000,
	RA=0x46800000,
	PA=ra2pa(0x46800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement0_alias2_4 DATA_VA=0x6300000
attr_data {
	Name = replacement0_alias2_4,
	VA=0x6300000,
	RA=0x47000000,
	PA=ra2pa(0x47000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement1_alias2_4 DATA_VA=0x6320000
attr_data {
	Name = replacement1_alias2_4,
	VA=0x6320000,
	RA=0x47800000,
	PA=ra2pa(0x47800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement2_alias2_4 DATA_VA=0x6340000
attr_data {
	Name = replacement2_alias2_4,
	VA=0x6340000,
	RA=0x48000000,
	PA=ra2pa(0x48000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement3_alias2_4 DATA_VA=0x6360000
attr_data {
	Name = replacement3_alias2_4,
	VA=0x6360000,
	RA=0x48800000,
	PA=ra2pa(0x48800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement4_alias2_4 DATA_VA=0x6380000
attr_data {
	Name = replacement4_alias2_4,
	VA=0x6380000,
	RA=0x49000000,
	PA=ra2pa(0x49000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement5_alias2_4 DATA_VA=0x63a0000
attr_data {
	Name = replacement5_alias2_4,
	VA=0x63a0000,
	RA=0x49800000,
	PA=ra2pa(0x49800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement6_alias2_4 DATA_VA=0x63c0000
attr_data {
	Name = replacement6_alias2_4,
	VA=0x63c0000,
	RA=0x4a000000,
	PA=ra2pa(0x4a000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement7_alias2_4 DATA_VA=0x63e0000
attr_data {
	Name = replacement7_alias2_4,
	VA=0x63e0000,
	RA=0x4a800000,
	PA=ra2pa(0x4a800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region0_alias1_4 DATA_VA=0x6400000
attr_data {
	Name = region0_alias1_4,
	VA=0x6400000,
	RA=0x43000000,
	PA=ra2pa(0x43000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=0,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region1_alias1_4 DATA_VA=0x6420000
attr_data {
	Name = region1_alias1_4,
	VA=0x6420000,
	RA=0x43800000,
	PA=ra2pa(0x43800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region2_alias1_4 DATA_VA=0x6440000
attr_data {
	Name = region2_alias1_4,
	VA=0x6440000,
	RA=0x44000000,
	PA=ra2pa(0x44000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region3_alias1_4 DATA_VA=0x6460000
attr_data {
	Name = region3_alias1_4,
	VA=0x6460000,
	RA=0x44800000,
	PA=ra2pa(0x44800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region4_alias1_4 DATA_VA=0x6480000
attr_data {
	Name = region4_alias1_4,
	VA=0x6480000,
	RA=0x45000000,
	PA=ra2pa(0x45000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region5_alias1_4 DATA_VA=0x64a0000
attr_data {
	Name = region5_alias1_4,
	VA=0x64a0000,
	RA=0x45800000,
	PA=ra2pa(0x45800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region6_alias1_4 DATA_VA=0x64c0000
attr_data {
	Name = region6_alias1_4,
	VA=0x64c0000,
	RA=0x46000000,
	PA=ra2pa(0x46000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region7_alias1_4 DATA_VA=0x64e0000
attr_data {
	Name = region7_alias1_4,
	VA=0x64e0000,
	RA=0x46800000,
	PA=ra2pa(0x46800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement0_alias1_4 DATA_VA=0x6500000
attr_data {
	Name = replacement0_alias1_4,
	VA=0x6500000,
	RA=0x47000000,
	PA=ra2pa(0x47000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement1_alias1_4 DATA_VA=0x6520000
attr_data {
	Name = replacement1_alias1_4,
	VA=0x6520000,
	RA=0x47800000,
	PA=ra2pa(0x47800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement2_alias1_4 DATA_VA=0x6540000
attr_data {
	Name = replacement2_alias1_4,
	VA=0x6540000,
	RA=0x48000000,
	PA=ra2pa(0x48000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement3_alias1_4 DATA_VA=0x6560000
attr_data {
	Name = replacement3_alias1_4,
	VA=0x6560000,
	RA=0x48800000,
	PA=ra2pa(0x48800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement4_alias1_4 DATA_VA=0x6580000
attr_data {
	Name = replacement4_alias1_4,
	VA=0x6580000,
	RA=0x49000000,
	PA=ra2pa(0x49000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement5_alias1_4 DATA_VA=0x65a0000
attr_data {
	Name = replacement5_alias1_4,
	VA=0x65a0000,
	RA=0x49800000,
	PA=ra2pa(0x49800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement6_alias1_4 DATA_VA=0x65c0000
attr_data {
	Name = replacement6_alias1_4,
	VA=0x65c0000,
	RA=0x4a000000,
	PA=ra2pa(0x4a000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement7_alias1_4 DATA_VA=0x65e0000
attr_data {
	Name = replacement7_alias1_4,
	VA=0x65e0000,
	RA=0x4a800000,
	PA=ra2pa(0x4a800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region0_alias0 DATA_VA=0x6600000
attr_data {
	Name = region0_alias0,
	VA=0x6600000,
	RA=0x43000000,
	PA=ra2pa(0x43000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=0,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region1_alias0 DATA_VA=0x6620000
attr_data {
	Name = region1_alias0,
	VA=0x6620000,
	RA=0x43800000,
	PA=ra2pa(0x43800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region2_alias0 DATA_VA=0x6640000
attr_data {
	Name = region2_alias0,
	VA=0x6640000,
	RA=0x44000000,
	PA=ra2pa(0x44000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region3_alias0 DATA_VA=0x6660000
attr_data {
	Name = region3_alias0,
	VA=0x6660000,
	RA=0x44800000,
	PA=ra2pa(0x44800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region4_alias0 DATA_VA=0x6680000
attr_data {
	Name = region4_alias0,
	VA=0x6680000,
	RA=0x45000000,
	PA=ra2pa(0x45000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region5_alias0 DATA_VA=0x66a0000
attr_data {
	Name = region5_alias0,
	VA=0x66a0000,
	RA=0x45800000,
	PA=ra2pa(0x45800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region6_alias0 DATA_VA=0x66c0000
attr_data {
	Name = region6_alias0,
	VA=0x66c0000,
	RA=0x46000000,
	PA=ra2pa(0x46000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION region7_alias0 DATA_VA=0x66e0000
attr_data {
	Name = region7_alias0,
	VA=0x66e0000,
	RA=0x46800000,
	PA=ra2pa(0x46800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement0_alias0 DATA_VA=0x6700000
attr_data {
	Name = replacement0_alias0,
	VA=0x6700000,
	RA=0x47000000,
	PA=ra2pa(0x47000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement1_alias0 DATA_VA=0x6720000
attr_data {
	Name = replacement1_alias0,
	VA=0x6720000,
	RA=0x47800000,
	PA=ra2pa(0x47800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement2_alias0 DATA_VA=0x6740000
attr_data {
	Name = replacement2_alias0,
	VA=0x6740000,
	RA=0x48000000,
	PA=ra2pa(0x48000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement3_alias0 DATA_VA=0x6760000
attr_data {
	Name = replacement3_alias0,
	VA=0x6760000,
	RA=0x48800000,
	PA=ra2pa(0x48800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement4_alias0 DATA_VA=0x6780000
attr_data {
	Name = replacement4_alias0,
	VA=0x6780000,
	RA=0x49000000,
	PA=ra2pa(0x49000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement5_alias0 DATA_VA=0x67a0000
attr_data {
	Name = replacement5_alias0,
	VA=0x67a0000,
	RA=0x49800000,
	PA=ra2pa(0x49800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement6_alias0 DATA_VA=0x67c0000
attr_data {
	Name = replacement6_alias0,
	VA=0x67c0000,
	RA=0x4a000000,
	PA=ra2pa(0x4a000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION replacement7_alias0 DATA_VA=0x67e0000
attr_data {
	Name = replacement7_alias0,
	VA=0x67e0000,
	RA=0x4a800000,
	PA=ra2pa(0x4a800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1
	}

SECTION non_fault_area_4 DATA_VA=0x0
attr_data {
	Name = non_fault_area_4,
	VA=0x0,
	RA=0x47002000,
	PA=ra2pa(0x47002000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G=0,
	TTE_Context=PCONTEXT,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=1,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=1,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region0_alias3_0 DATA_VA=0x6000000
attr_data {
	Name = region0_alias3_0,
	VA=0x6000000,
	RA=0x43000000,
	PA=ra2pa(0x43000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=0,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region1_alias3_0 DATA_VA=0x6020000
attr_data {
	Name = region1_alias3_0,
	VA=0x6020000,
	RA=0x43800000,
	PA=ra2pa(0x43800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region2_alias3_0 DATA_VA=0x6040000
attr_data {
	Name = region2_alias3_0,
	VA=0x6040000,
	RA=0x44000000,
	PA=ra2pa(0x44000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region3_alias3_0 DATA_VA=0x6060000
attr_data {
	Name = region3_alias3_0,
	VA=0x6060000,
	RA=0x44800000,
	PA=ra2pa(0x44800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region4_alias3_0 DATA_VA=0x6080000
attr_data {
	Name = region4_alias3_0,
	VA=0x6080000,
	RA=0x45000000,
	PA=ra2pa(0x45000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region5_alias3_0 DATA_VA=0x60a0000
attr_data {
	Name = region5_alias3_0,
	VA=0x60a0000,
	RA=0x45800000,
	PA=ra2pa(0x45800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region6_alias3_0 DATA_VA=0x60c0000
attr_data {
	Name = region6_alias3_0,
	VA=0x60c0000,
	RA=0x46000000,
	PA=ra2pa(0x46000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region7_alias3_0 DATA_VA=0x60e0000
attr_data {
	Name = region7_alias3_0,
	VA=0x60e0000,
	RA=0x46800000,
	PA=ra2pa(0x46800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement0_alias3_0 DATA_VA=0x6100000
attr_data {
	Name = replacement0_alias3_0,
	VA=0x6100000,
	RA=0x47000000,
	PA=ra2pa(0x47000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement1_alias3_0 DATA_VA=0x6120000
attr_data {
	Name = replacement1_alias3_0,
	VA=0x6120000,
	RA=0x47800000,
	PA=ra2pa(0x47800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement2_alias3_0 DATA_VA=0x6140000
attr_data {
	Name = replacement2_alias3_0,
	VA=0x6140000,
	RA=0x48000000,
	PA=ra2pa(0x48000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement3_alias3_0 DATA_VA=0x6160000
attr_data {
	Name = replacement3_alias3_0,
	VA=0x6160000,
	RA=0x48800000,
	PA=ra2pa(0x48800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement4_alias3_0 DATA_VA=0x6180000
attr_data {
	Name = replacement4_alias3_0,
	VA=0x6180000,
	RA=0x49000000,
	PA=ra2pa(0x49000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement5_alias3_0 DATA_VA=0x61a0000
attr_data {
	Name = replacement5_alias3_0,
	VA=0x61a0000,
	RA=0x49800000,
	PA=ra2pa(0x49800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement6_alias3_0 DATA_VA=0x61c0000
attr_data {
	Name = replacement6_alias3_0,
	VA=0x61c0000,
	RA=0x4a000000,
	PA=ra2pa(0x4a000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement7_alias3_0 DATA_VA=0x61e0000
attr_data {
	Name = replacement7_alias3_0,
	VA=0x61e0000,
	RA=0x4a800000,
	PA=ra2pa(0x4a800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region0_alias2_0 DATA_VA=0x6200000
attr_data {
	Name = region0_alias2_0,
	VA=0x6200000,
	RA=0x43000000,
	PA=ra2pa(0x43000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=0,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region1_alias2_0 DATA_VA=0x6220000
attr_data {
	Name = region1_alias2_0,
	VA=0x6220000,
	RA=0x43800000,
	PA=ra2pa(0x43800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region2_alias2_0 DATA_VA=0x6240000
attr_data {
	Name = region2_alias2_0,
	VA=0x6240000,
	RA=0x44000000,
	PA=ra2pa(0x44000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region3_alias2_0 DATA_VA=0x6260000
attr_data {
	Name = region3_alias2_0,
	VA=0x6260000,
	RA=0x44800000,
	PA=ra2pa(0x44800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region4_alias2_0 DATA_VA=0x6280000
attr_data {
	Name = region4_alias2_0,
	VA=0x6280000,
	RA=0x45000000,
	PA=ra2pa(0x45000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region5_alias2_0 DATA_VA=0x62a0000
attr_data {
	Name = region5_alias2_0,
	VA=0x62a0000,
	RA=0x45800000,
	PA=ra2pa(0x45800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region6_alias2_0 DATA_VA=0x62c0000
attr_data {
	Name = region6_alias2_0,
	VA=0x62c0000,
	RA=0x46000000,
	PA=ra2pa(0x46000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region7_alias2_0 DATA_VA=0x62e0000
attr_data {
	Name = region7_alias2_0,
	VA=0x62e0000,
	RA=0x46800000,
	PA=ra2pa(0x46800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement0_alias2_0 DATA_VA=0x6300000
attr_data {
	Name = replacement0_alias2_0,
	VA=0x6300000,
	RA=0x47000000,
	PA=ra2pa(0x47000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement1_alias2_0 DATA_VA=0x6320000
attr_data {
	Name = replacement1_alias2_0,
	VA=0x6320000,
	RA=0x47800000,
	PA=ra2pa(0x47800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement2_alias2_0 DATA_VA=0x6340000
attr_data {
	Name = replacement2_alias2_0,
	VA=0x6340000,
	RA=0x48000000,
	PA=ra2pa(0x48000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement3_alias2_0 DATA_VA=0x6360000
attr_data {
	Name = replacement3_alias2_0,
	VA=0x6360000,
	RA=0x48800000,
	PA=ra2pa(0x48800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement4_alias2_0 DATA_VA=0x6380000
attr_data {
	Name = replacement4_alias2_0,
	VA=0x6380000,
	RA=0x49000000,
	PA=ra2pa(0x49000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement5_alias2_0 DATA_VA=0x63a0000
attr_data {
	Name = replacement5_alias2_0,
	VA=0x63a0000,
	RA=0x49800000,
	PA=ra2pa(0x49800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement6_alias2_0 DATA_VA=0x63c0000
attr_data {
	Name = replacement6_alias2_0,
	VA=0x63c0000,
	RA=0x4a000000,
	PA=ra2pa(0x4a000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement7_alias2_0 DATA_VA=0x63e0000
attr_data {
	Name = replacement7_alias2_0,
	VA=0x63e0000,
	RA=0x4a800000,
	PA=ra2pa(0x4a800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region0_alias1_0 DATA_VA=0x6400000
attr_data {
	Name = region0_alias1_0,
	VA=0x6400000,
	RA=0x43000000,
	PA=ra2pa(0x43000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=0,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region1_alias1_0 DATA_VA=0x6420000
attr_data {
	Name = region1_alias1_0,
	VA=0x6420000,
	RA=0x43800000,
	PA=ra2pa(0x43800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region2_alias1_0 DATA_VA=0x6440000
attr_data {
	Name = region2_alias1_0,
	VA=0x6440000,
	RA=0x44000000,
	PA=ra2pa(0x44000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region3_alias1_0 DATA_VA=0x6460000
attr_data {
	Name = region3_alias1_0,
	VA=0x6460000,
	RA=0x44800000,
	PA=ra2pa(0x44800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region4_alias1_0 DATA_VA=0x6480000
attr_data {
	Name = region4_alias1_0,
	VA=0x6480000,
	RA=0x45000000,
	PA=ra2pa(0x45000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region5_alias1_0 DATA_VA=0x64a0000
attr_data {
	Name = region5_alias1_0,
	VA=0x64a0000,
	RA=0x45800000,
	PA=ra2pa(0x45800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region6_alias1_0 DATA_VA=0x64c0000
attr_data {
	Name = region6_alias1_0,
	VA=0x64c0000,
	RA=0x46000000,
	PA=ra2pa(0x46000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region7_alias1_0 DATA_VA=0x64e0000
attr_data {
	Name = region7_alias1_0,
	VA=0x64e0000,
	RA=0x46800000,
	PA=ra2pa(0x46800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement0_alias1_0 DATA_VA=0x6500000
attr_data {
	Name = replacement0_alias1_0,
	VA=0x6500000,
	RA=0x47000000,
	PA=ra2pa(0x47000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement1_alias1_0 DATA_VA=0x6520000
attr_data {
	Name = replacement1_alias1_0,
	VA=0x6520000,
	RA=0x47800000,
	PA=ra2pa(0x47800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement2_alias1_0 DATA_VA=0x6540000
attr_data {
	Name = replacement2_alias1_0,
	VA=0x6540000,
	RA=0x48000000,
	PA=ra2pa(0x48000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement3_alias1_0 DATA_VA=0x6560000
attr_data {
	Name = replacement3_alias1_0,
	VA=0x6560000,
	RA=0x48800000,
	PA=ra2pa(0x48800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement4_alias1_0 DATA_VA=0x6580000
attr_data {
	Name = replacement4_alias1_0,
	VA=0x6580000,
	RA=0x49000000,
	PA=ra2pa(0x49000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement5_alias1_0 DATA_VA=0x65a0000
attr_data {
	Name = replacement5_alias1_0,
	VA=0x65a0000,
	RA=0x49800000,
	PA=ra2pa(0x49800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement6_alias1_0 DATA_VA=0x65c0000
attr_data {
	Name = replacement6_alias1_0,
	VA=0x65c0000,
	RA=0x4a000000,
	PA=ra2pa(0x4a000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement7_alias1_0 DATA_VA=0x65e0000
attr_data {
	Name = replacement7_alias1_0,
	VA=0x65e0000,
	RA=0x4a800000,
	PA=ra2pa(0x4a800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region0_alias0_0 DATA_VA=0x6600000
attr_data {
	Name = region0_alias0_0,
	VA=0x6600000,
	RA=0x43000000,
	PA=ra2pa(0x43000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=0,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region1_alias0_0 DATA_VA=0x6620000
attr_data {
	Name = region1_alias0_0,
	VA=0x6620000,
	RA=0x43800000,
	PA=ra2pa(0x43800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region2_alias0_0 DATA_VA=0x6640000
attr_data {
	Name = region2_alias0_0,
	VA=0x6640000,
	RA=0x44000000,
	PA=ra2pa(0x44000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region3_alias0_0 DATA_VA=0x6660000
attr_data {
	Name = region3_alias0_0,
	VA=0x6660000,
	RA=0x44800000,
	PA=ra2pa(0x44800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region4_alias0_0 DATA_VA=0x6680000
attr_data {
	Name = region4_alias0_0,
	VA=0x6680000,
	RA=0x45000000,
	PA=ra2pa(0x45000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region5_alias0_0 DATA_VA=0x66a0000
attr_data {
	Name = region5_alias0_0,
	VA=0x66a0000,
	RA=0x45800000,
	PA=ra2pa(0x45800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region6_alias0_0 DATA_VA=0x66c0000
attr_data {
	Name = region6_alias0_0,
	VA=0x66c0000,
	RA=0x46000000,
	PA=ra2pa(0x46000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION region7_alias0_0 DATA_VA=0x66e0000
attr_data {
	Name = region7_alias0_0,
	VA=0x66e0000,
	RA=0x46800000,
	PA=ra2pa(0x46800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement0_alias0_0 DATA_VA=0x6700000
attr_data {
	Name = replacement0_alias0_0,
	VA=0x6700000,
	RA=0x47000000,
	PA=ra2pa(0x47000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement1_alias0_0 DATA_VA=0x6720000
attr_data {
	Name = replacement1_alias0_0,
	VA=0x6720000,
	RA=0x47800000,
	PA=ra2pa(0x47800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement2_alias0_0 DATA_VA=0x6740000
attr_data {
	Name = replacement2_alias0_0,
	VA=0x6740000,
	RA=0x48000000,
	PA=ra2pa(0x48000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement3_alias0_0 DATA_VA=0x6760000
attr_data {
	Name = replacement3_alias0_0,
	VA=0x6760000,
	RA=0x48800000,
	PA=ra2pa(0x48800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement4_alias0_0 DATA_VA=0x6780000
attr_data {
	Name = replacement4_alias0_0,
	VA=0x6780000,
	RA=0x49000000,
	PA=ra2pa(0x49000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement5_alias0_0 DATA_VA=0x67a0000
attr_data {
	Name = replacement5_alias0_0,
	VA=0x67a0000,
	RA=0x49800000,
	PA=ra2pa(0x49800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement6_alias0_0 DATA_VA=0x67c0000
attr_data {
	Name = replacement6_alias0_0,
	VA=0x67c0000,
	RA=0x4a000000,
	PA=ra2pa(0x4a000000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024

SECTION replacement7_alias0_0 DATA_VA=0x67e0000
attr_data {
	Name = replacement7_alias0_0,
	VA=0x67e0000,
	RA=0x4a800000,
	PA=ra2pa(0x4a800000,0),
part_0_ctx_zero_tsb_config_2,
	TTE_G=0,
	TTE_Context=0,
	TTE_V=1,
	TTE_Size=0,
	TTE_SIZE_PTR=0,
	TTE_NFO=0,
	TTE_IE=0,
	TTE_Soft2=0,
	TTE_Diag=0,
	TTE_Soft=0,
	TTE_L=0,
	TTE_CP=1,
	TTE_CV=1,
	TTE_E=0,
	TTE_P=0,
	TTE_W=1,
	tsbonly
	}

.data
.skip 1024


!------------------------------------------------------------------------

SECTION tsotool_unshared_data
.global tsotool_unshared_data_start
.global res_buf_fp_p_0
.global res_buf_int_p_0
.global private_data_p0
.global stack_top_p0:
.global res_buf_fp_p_1
.global res_buf_int_p_1
.global private_data_p1
.global stack_top_p1:
.global res_buf_fp_p_2
.global res_buf_int_p_2
.global private_data_p2
.global stack_top_p2:
.global res_buf_fp_p_3
.global res_buf_int_p_3
.global private_data_p3
.global stack_top_p3:
.global res_buf_fp_p_4
.global res_buf_int_p_4
.global private_data_p4
.global stack_top_p4:
.global res_buf_fp_p_5
.global res_buf_int_p_5
.global private_data_p5
.global stack_top_p5:
.global res_buf_fp_p_6
.global res_buf_int_p_6
.global private_data_p6
.global stack_top_p6:
.global res_buf_fp_p_7
.global res_buf_int_p_7
.global private_data_p7
.global stack_top_p7:
.data
ALIGN_PAGE_512K
tsotool_unshared_data_start:
!-- label names of res_buf must match with extract_loads_m64.pl --
.align 64 ! for self bcopy()
res_buf_fp_p_0:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_0:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_1:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_1:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_2:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_2:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_3:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_3:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_4:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_4:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_5:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_5:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_6:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_6:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_fp_p_7:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
.align 64 ! for self bcopy()
res_buf_int_p_7:
	.skip RESULTS_BUF_SIZE_PER_CPU_RTL/2
private_data_p0:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p1:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p2:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p3:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p4:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p5:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p6:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
private_data_p7:
	.skip PRIVATE_DATA_AREA_PER_CPU_RTL
stack_top_p0:
	.skip 2048
stack_top_p1:
	.skip 2048
stack_top_p2:
	.skip 2048
stack_top_p3:
	.skip 2048
stack_top_p4:
	.skip 2048
stack_top_p5:
	.skip 2048
stack_top_p6:
	.skip 2048
stack_top_p7:
	.skip 2048
tsotool_unshared_data_end:
ALIGN_PAGE_512K
! to prevent VAs from running over from this section into shared regions

!------------------------------------------------------------------------

.seg "data"
! 8 shared memory regions, 3 alias(es) each (Alias 0 is normal VA)


SECTION region0_alias0
.global REGION0_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION0_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION0_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region1_alias0
.global REGION1_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION1_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION1_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region2_alias0
.global REGION2_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION2_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION2_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region3_alias0
.global REGION3_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION3_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION3_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region4_alias0
.global REGION4_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION4_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION4_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region5_alias0
.global REGION5_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION5_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION5_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region6_alias0
.global REGION6_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION6_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION6_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION region7_alias0
.global REGION7_ALIAS0_START
.data
ALIGN_PAGE_8K
REGION7_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REGION7_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement0_alias0
.global REPLACEMENT0_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT0_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT0_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement1_alias0
.global REPLACEMENT1_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT1_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT1_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement2_alias0
.global REPLACEMENT2_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT2_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT2_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement3_alias0
.global REPLACEMENT3_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT3_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT3_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement4_alias0
.global REPLACEMENT4_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT4_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT4_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement5_alias0
.global REPLACEMENT5_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT5_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT5_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement6_alias0
.global REPLACEMENT6_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT6_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT6_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL


SECTION replacement7_alias0
.global REPLACEMENT7_ALIAS0_START
.data
ALIGN_PAGE_8K
REPLACEMENT7_ALIAS0_START:
	.skip REGION_MAPPED_SIZE_RTL
REPLACEMENT7_ALIAS0_END:
	.skip REGION_SIZE_RTL-REGION_MAPPED_SIZE_RTL

SECTION .MAIN
.global local_trap_handlers_start
.global local_trap_handlers_end.global extern_interrupt_handler
.text
ALIGN_PAGE_8K
local_trap_handlers_start:

.align 64
extern_interrupt_handler:
stxa  %g0, [%g0]ASI_INTR_RECEIVE
retry

local_trap_handlers_end:

SECTION .MAIN
.global main
.global tsotool_text_start
.global irepl_text_start
.text
ba user_text_start
nop
ALIGN_PAGE_64K
irepl_text_start:
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
	jmpl %g1+8, %g1
	nop
	.skip 24
ALIGN_PAGE_64K
user_text_start:
ba main
nop
user_text_end:

ALIGN_PAGE_64K
tsotool_text_start:
main:
	mov     0, %o0
	mov     0, %o1
	CHECK_PROC_ID
! at this point, g1 should have CPU id (0, 1, 2, ...)
	set     REGION0_ALIAS0_START, %o0	! shared address 0
	set     REGION1_ALIAS0_START, %o1	! shared address 1
	cmp     %g1, 0x7
	be      setup_p7
	nop
	cmp     %g1, 0x6
	be      setup_p6
	nop
	cmp     %g1, 0x5
	be      setup_p5
	nop
	cmp     %g1, 0x4
	be      setup_p4
	nop
	cmp     %g1, 0x3
	be      setup_p3
	nop
	cmp     %g1, 0x2
	be      setup_p2
	nop
	cmp     %g1, 0x1
	be      setup_p1
	nop
	cmp     %g1, 0x0
	be      setup_p0
	nop
	EXIT_BAD   ! Should never reach here
	nop

setup_p0:
	setx    stack_top_p0, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_0, %g1, %o4
	setx    private_data_p0, %g1, %o5
	setx    func0, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p1:
	setx    stack_top_p1, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_1, %g1, %o4
	setx    private_data_p1, %g1, %o5
	setx    func1, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p2:
	setx    stack_top_p2, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_2, %g1, %o4
	setx    private_data_p2, %g1, %o5
	setx    func2, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p3:
	setx    stack_top_p3, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_3, %g1, %o4
	setx    private_data_p3, %g1, %o5
	setx    func3, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p4:
	setx    stack_top_p4, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_4, %g1, %o4
	setx    private_data_p4, %g1, %o5
	setx    func4, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p5:
	setx    stack_top_p5, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_5, %g1, %o4
	setx    private_data_p5, %g1, %o5
	setx    func5, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p6:
	setx    stack_top_p6, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_6, %g1, %o4
	setx    private_data_p6, %g1, %o5
	setx    func6, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop

setup_p7:
	setx    stack_top_p7, %g1, %l1
	add     %l1, 1024, %sp
	setx    res_buf_fp_p_7, %g1, %o4
	setx    private_data_p7, %g1, %o5
	setx    func7, %g1, %l4
	call    %l4
	nop
	EXIT_GOOD
	nop
#define    NO_REAL_CPUS_MINUS_1    7

!-----------------

! register usage:
! %i0 %i1 : base registers for first 2 regions
! %i2 %i3 : cache registers for 8 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %i4 holds the instructions count which is used for interrupt ordering
! %i4 holds the thread_id (OBP only) 
! %l5 holds the moving pointer for interrupt bonus data (OBP only). Conflicts with RTL/simulation usage
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func0:
! instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Reinitialize i4 to 0. i4 will be used to keep the count of analyzable node info
mov 0x0, %i4

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l6
or    %l6, %lo(0xdeadbee0), %l6
stw   %l6, [%i5]
sethi %hi(0xdeadbee1), %l6
or    %l6, %lo(0xdeadbee1), %l6
stw   %l6, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x00deade1), %l6
or    %l6, %lo(0x00deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1), %l4
or    %l4, %lo(0x1), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x3f800001), %l6
or    %l6, %lo(0x3f800001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x34000000), %l6
or    %l6, %lo(0x34000000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x5ba2^4
sethi %hi(0x5ba2), %l0
or    %l0, %lo(0x5ba2), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

BEGIN_NODES0: ! Test instruction sequence for ISTREAM 0 begins

P1: !_CAS [17] (maybe <- 0x1) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_0:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2: !_CASX [2] (maybe <- 0x2) (Int) (Loop exit)
add %i0, 8, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
mov %l4, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_0
nop

P3: !_CAS [23] (maybe <- 0x3) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_1:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 12, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_1:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_1
nop

P4: !_LD [10] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_2:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P5: !_LD [3] (Int) (Loop exit)
lduw [%i1 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_2:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_2
nop

P6: !_PREFETCH [12] (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_3:
wr %g0, 0x88, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetcha [%i2 + 0] %asi, 16

P7: !_CASX [16] (maybe <- 0x4) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_3:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_3
nop

P8: !_PREFETCH [0] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_4:
prefetch [%i0 + 0], 29
loop_exit_0_4:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_4
nop

P9: !_CASX [4] (maybe <- 0x6) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_5:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P10: !_REPLACEMENT [7] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_5:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_5
nop

P11: !_CASX [23] (maybe <- 0x8) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_6:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P12: !_CAS [7] (maybe <- 0x9) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 4, %l3
lduw [%l3], %o2
mov %o2, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %o5
or %o5, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_6:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_6
nop

P13: !_CAS [15] (maybe <- 0xa) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_7:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i3], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_7:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_7
nop

P14: !_FLUSHI [11] (Int) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_8:
flush %g0 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET14
nop
RET14:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P15: !_CASX [10] (maybe <- 0xb) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_8:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_8
nop

P16: !_CASX [13] (maybe <- 0xd) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_9:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_9:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_9
nop

P17: !_LD [22] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_10:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P18: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_10:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_10
nop

P19: !_REPLACEMENT [6] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_11:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P20: !_LD [7] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P21: !_LD [13] (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_11:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_11
nop

P22: !_CAS [16] (maybe <- 0xf) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_12:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_12:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_12
nop

P23: !_CASX [10] (maybe <- 0x10) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_13:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P24: !_REPLACEMENT [5] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+12], %l3
st %l3, [%i3+12]
add %i3, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_13:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_13
nop

P25: !_CASX [4] (maybe <- 0x12) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_14:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P26: !_CASX [6] (maybe <- 0x14) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_14:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_14
nop

P27: !_LD [8] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_15:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P28: !_LD [22] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_15:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_15
nop

P29: !_CASX [3] (maybe <- 0x16) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_16:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P30: !_REPLACEMENT [13] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_16:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_16
nop

P31: !_CASX [8] (maybe <- 0x18) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_17:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P32: !_LD [12] (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P33: !_LD [8] (Int) (Loop exit)
lduw [%i2 + 12], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_17:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_17
nop

P34: !_REPLACEMENT [0] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_18:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
loop_exit_0_18:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_18
nop

P35: !_CASX [7] (maybe <- 0x19) (Int) (Loop entry) (Branch target of P340)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_19:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
ba P36
nop

TARGET340:
ba RET340
nop


P36: !_CAS [8] (maybe <- 0x1b) (Int) (Loop exit) (CBR)
add %i3, 12, %l7
lduw [%l7], %o2
mov %o2, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l6
or %l6, %o2, %o2
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET36
nop
RET36:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_19:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_19
nop

P37: !_PREFETCH [4] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_20:
prefetch [%i1 + 4], 18
loop_exit_0_20:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_20
nop

P38: !_LD [8] (FP) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_21:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 12], %f0
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET38
nop
RET38:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_0_21:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_21
nop

P39: !_CASX [6] (maybe <- 0x1c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_22:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_22:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_22
nop

P40: !_REPLACEMENT [18] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_23:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
loop_exit_0_23:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_23
nop

P41: !_CAS [21] (maybe <- 0x1e) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_24:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%i3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P42: !_REPLACEMENT [17] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+12], %l6
st %l6, [%i2+12]
add %i2, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_24:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_24
nop

P43: !_CASX [9] (maybe <- 0x1f) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_25:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P44: !_LD [18] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P45: !_LD [0] (Int) (Loop exit) (Branch target of P38)
lduw [%i0 + 0], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_25:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_25
nop
ba P46
nop

TARGET38:
ba RET38
nop


P46: !_CAS [12] (maybe <- 0x21) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_26:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i3], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P47: !_CASX [15] (maybe <- 0x22) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i2], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_26:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_26
nop

P48: !_LD [22] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_27:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P49: !_LD [19] (Int) (Loop exit)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_27:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_27
nop

P50: !_CASX [15] (maybe <- 0x24) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_28:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_28:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_28
nop

P51: !_REPLACEMENT [16] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_29:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

P52: !_MEMBAR (Int) (Loop exit)
membar #StoreLoad
loop_exit_0_29:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_29
nop

P53: !_CASX [9] (maybe <- 0x26) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_30:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P54: !_REPLACEMENT [18] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_30:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_30
nop

P55: !_PREFETCH [18] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_31:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 2

P56: !_REPLACEMENT [9] (Int) (Loop exit)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
loop_exit_0_31:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_31
nop

P57: !_CAS [19] (maybe <- 0x28) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_32:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_32:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_32
nop

P58: !_LD [16] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_33:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P59: !_LD [15] (Int) (Loop exit)
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_33:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_33
nop

P60: !_CASX [1] (maybe <- 0x29) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_34:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P61: !_LD [20] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P62: !_LD [14] (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_34:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_34
nop

P63: !_CASX [4] (maybe <- 0x2b) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_35:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P64: !_CASX [5] (maybe <- 0x2d) (Int) (Loop exit)
!-- Aliased access: Adjusting base register for region 1 (%i1) to use alias #1
!Logical addr: 5 

sethi %hi(0x200000), %l7
sub   %i1, %l7, %i1
add %i1, 8, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
mov %l4, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5

sethi %hi(0x200000), %o5
add   %i1, %o5, %i1
!-- End Aliased access: base register for region 1 (%i1) restored
loop_exit_0_35:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_35
nop

P65: !_CAS [3] (maybe <- 0x2e) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_36:
lduw [%i1], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i1], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P66: !_REPLACEMENT [7] (Int) (Loop exit)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_36:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_36
nop

P67: !_CASX [19] (maybe <- 0x2f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_37:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_37:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_37
nop

P68: !_REPLACEMENT [19] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_38:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

P69: !_LD [23] (Int)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P70: !_LD [8] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_38:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_38
nop

P71: !_REPLACEMENT [6] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_39:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
loop_exit_0_39:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_39
nop

P72: !_LD [8] (Int) (Loop entry) (Branch target of P236)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_40:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P73
nop

TARGET236:
ba RET236
nop


P73: !_LD [18] (Int) (Loop exit)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_40:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_40
nop

P74: !_CASX [12] (maybe <- 0x31) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_41:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P75: !_REPLACEMENT [5] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+12], %l3
st %l3, [%i2+12]
add %i2, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_41:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_41
nop

P76: !_CAS [5] (maybe <- 0x33) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_42:
add %i1, 12, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P77: !_REPLACEMENT [13] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+4], %l3
st %l3, [%i3+4]
add %i3, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_42:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_42
nop

P78: !_CASX [10] (maybe <- 0x34) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_43:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P79: !_CASX [9] (maybe <- 0x36) (Int) (Loop exit)
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_43:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_43
nop

P80: !_LD [23] (FP) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_44:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 12], %f0
! 1 addresses covered

P81: !_CASX [17] (maybe <- 0x38) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_0_44:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_44
nop

P82: !_REPLACEMENT [8] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_45:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+12], %l7
st %l7, [%i3+12]
add %i3, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
loop_exit_0_45:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_45
nop

P83: !_CAS [21] (maybe <- 0x39) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_46:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i2], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_46:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_46
nop

P84: !_LD [12] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_47:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P85: !_LD [22] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_47:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_47
nop

P86: !_CAS [1] (maybe <- 0x3a) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_48:
add %i0, 4, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P87: !_CASX [21] (maybe <- 0x3b) (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l7
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i3], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_48:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_48
nop

P88: !_MEMBAR (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_49:
membar #StoreLoad

P89: !_LD [22] (Int)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P90: !_LD [19] (Int) (Loop exit)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_49:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_49
nop

P91: !_CASX [19] (maybe <- 0x3d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_50:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_50:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_50
nop

P92: !_CASX [11] (maybe <- 0x3f) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_51:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P93: !_CASX [22] (maybe <- 0x40) (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_51:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_51
nop

P94: !_CASX [17] (maybe <- 0x42) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_52:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P95: !_CAS [7] (maybe <- 0x43) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 4, %o5
lduw [%o5], %o2
mov %o2, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_52:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_52
nop

P96: !_CASX [18] (maybe <- 0x44) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_53:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_53:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_53
nop

P97: !_REPLACEMENT [19] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_54:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P98: !_REPLACEMENT [19] (Int) (Loop exit)
sethi %hi(0x20000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
loop_exit_0_54:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_54
nop

P99: !_CASX [20] (maybe <- 0x46) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_55:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_55:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_55
nop

P100: !_CASX [14] (maybe <- 0x47) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_56:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P101: !_ST [6] (maybe <- 0x48) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_56:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_56
nop

P102: !_ST [3] (maybe <- 0x49) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_57:
stw   %l4, [%i1 + 0 ]
add   %l4, 1, %l4
loop_exit_0_57:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_57
nop

P103: !_PREFETCH [12] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_58:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 16
loop_exit_0_58:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_58
nop

P104: !_FLUSHI [2] (Int) (Loop entry) (Branch target of P372)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_59:
flush %g0 
ba P105
nop

TARGET372:
ba RET372
nop


P105: !_REPLACEMENT [13] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
loop_exit_0_59:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_59
nop

P106: !_CASX [19] (maybe <- 0x4a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_60:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_60:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_60
nop

P107: !_REPLACEMENT [9] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_61:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
loop_exit_0_61:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_61
nop

P108: !_CASX [5] (maybe <- 0x4c) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_62:
add %i1, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P109: !_CASX [9] (maybe <- 0x4d) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_62:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_62
nop

P110: !_CAS [1] (maybe <- 0x4f) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_63:
add %i0, 4, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P111: !_CASX [9] (maybe <- 0x50) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %o5
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_63:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_63
nop

P112: !_CASX [8] (maybe <- 0x52) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_64:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_64:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_64
nop

P113: !_CASX [4] (maybe <- 0x53) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_65:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P114: !_CAS [12] (maybe <- 0x55) (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3], %o2
mov %o2, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l4, %l3
cas [%i3], %l6, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l6
or %l6, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_65:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_65
nop

P115: !_ST [15] (maybe <- 0x56) (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_66:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET115
nop
RET115:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P116: !_LD [2] (Int)
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P117: !_LD [9] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_66:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_66
nop

P118: !_LD [5] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_67:
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P119: !_CAS [17] (maybe <- 0x57) (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 12, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P120: !_LD [11] (Int) (Loop exit) (CBR)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET120
nop
RET120:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_67:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_67
nop

P121: !_LD [10] (FP) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_68:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 4], %f0
! 1 addresses covered

P122: !_CASX [23] (maybe <- 0x58) (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_0_68:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_68
nop

P123: !_CASX [19] (maybe <- 0x59) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_69:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P124: !_CASX [9] (maybe <- 0x5b) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_69:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_69
nop

P125: !_CASX [21] (maybe <- 0x5d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_70:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_70:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_70
nop

P126: !_LD [0] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_71:
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P127: !_LD [2] (Int) (Loop exit)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_71:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_71
nop

P128: !_CASX [1] (maybe <- 0x5f) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_72:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P129: !_CAS [2] (maybe <- 0x61) (Int) (Loop exit)
add %i0, 12, %o5
lduw [%o5], %o2
mov %o2, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_72:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_72
nop

P130: !_REPLACEMENT [12] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_73:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
loop_exit_0_73:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_73
nop

P131: !_FLUSHI [20] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_74:
flush %g0 
loop_exit_0_74:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_74
nop

P132: !_CAS [0] (maybe <- 0x62) (Int) (Loop entry) (Branch target of P142)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_75:
lduw [%i0], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i0], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
ba P133
nop

TARGET142:
ba RET142
nop


P133: !_CAS [7] (maybe <- 0x63) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 4, %l6
lduw [%l6], %o1
mov %o1, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o1(lower)
srl %o5, 0, %l3
or %l3, %o1, %o1
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_75:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_75
nop

P134: !_LD [20] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_76:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P135: !_LD [20] (Int) (Loop exit)
lduw [%i3 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_76:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_76
nop

P136: !_LD [8] (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_77:
wr %g0, 0x88, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 12] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P137: !_LD [18] (Int) (Loop exit)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_77:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_77
nop

P138: !_REPLACEMENT [13] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_78:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

P139: !_LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P140: !_LD [10] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_78:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_78
nop

P141: !_CASX [6] (maybe <- 0x64) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_79:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_79:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_79
nop

P142: !_CASX [18] (maybe <- 0x66) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_80:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET142
nop
RET142:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_80:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_80
nop

P143: !_CASX [18] (maybe <- 0x68) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_81:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P144: !_CASX [6] (maybe <- 0x6a) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_81:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_81
nop

P145: !_CASX [13] (maybe <- 0x6c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_82:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_82:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_82
nop

P146: !_CAS [0] (maybe <- 0x6e) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_83:
lduw [%i0], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i0], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_83:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_83
nop

P147: !_CAS [18] (maybe <- 0x6f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_84:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%i3], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_84:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_84
nop

P148: !_CASX [17] (maybe <- 0x70) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_85:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P149: !_ST [12] (maybe <- 0x71) (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l3
srl %l3, 8, %l3
sll %l4, 8, %l7
and %l7, %o5, %l7
or %l7, %l3, %l7
srl %l7, 16, %l3
sll %l7, 16, %l7
srl %l7, 0, %l7
or %l7, %l3, %l7
stwa   %l7, [%i3 + 0] %asi
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_85:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_85
nop

P150: !_LD [12] (FP) (Loop entry) (Branch target of P521)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_86:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 0], %f0
! 1 addresses covered
ba P151
nop

TARGET521:
ba RET521
nop


P151: !_CASX [11] (maybe <- 0x72) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_0_86:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_86
nop

P152: !_LD [22] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_87:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P153: !_LD [15] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_87:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_87
nop

P154: !_LD [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_88:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P155: !_CASX [5] (maybe <- 0x73) (Int)
add %i1, 8, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov  %l6, %l7
mov %l4, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
add  %l4, 1, %l4

P156: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_88:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_88
nop

P157: !_LD [14] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_89:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P158: !_LD [8] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_89:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_89
nop

P159: !_REPLACEMENT [8] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_90:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+12], %l3
st %l3, [%i2+12]
add %i2, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]

P160: !_REPLACEMENT [6] (Int) (Loop exit) (Branch target of P14)
sethi %hi(0x20000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
loop_exit_0_90:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_90
nop
ba P161
nop

TARGET14:
ba RET14
nop


P161: !_CASX [5] (maybe <- 0x74) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_91:
add %i1, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P162: !_LD [20] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P163: !_LD [22] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_91:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_91
nop

P164: !_CASX [19] (maybe <- 0x75) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_92:
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P165: !_LD [16] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P166: !_LD [10] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_92:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_92
nop

P167: !_CAS [0] (maybe <- 0x77) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_93:
lduw [%i0], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%i0], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P168: !_ST [11] (maybe <- 0x78) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_93:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_93
nop

P169: !_LD [0] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_94:
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P170: !_LD [22] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_94:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_94
nop

P171: !_LD [12] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_95:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P172: !_CAS [23] (maybe <- 0x79) (Int)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P173: !_LD [10] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 4] %asi, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_95:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_95
nop

P174: !_REPLACEMENT [8] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_96:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+12], %o5
st %o5, [%i3+12]
add %i3, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
loop_exit_0_96:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_96
nop

P175: !_REPLACEMENT [9] (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_97:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET175
nop
RET175:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

loop_exit_0_97:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_97
nop

P176: !_LD [12] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_98:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P177: !_CASX [4] (maybe <- 0x7a) (Int)
ldx [%i1], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%i1], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4

P178: !_LD [21] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_98:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_98
nop

P179: !_CASX [17] (maybe <- 0x7c) (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_99:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET179
nop
RET179:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P180: !_LD [14] (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P181: !_LD [7] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_99:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_99
nop

P182: !_LD [11] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_100:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P183: !_LD [20] (Int) (Loop exit)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_100:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_100
nop

P184: !_REPLACEMENT [9] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_101:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P185: !_LD [18] (Int)
sethi %hi(REGION6_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P186: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_101:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_101
nop

P187: !_REPLACEMENT [7] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_102:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+4], %l3
st %l3, [%i3+4]
add %i3, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
loop_exit_0_102:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_102
nop

P188: !_CASX [22] (maybe <- 0x7d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_103:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_103:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_103
nop

P189: !_CASX [14] (maybe <- 0x7f) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_104:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P190: !_REPLACEMENT [18] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_104:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_104
nop

P191: !_CAS [13] (maybe <- 0x80) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_105:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_105:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_105
nop

P192: !_LD [20] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_106:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P193: !_LD [0] (Int) (Loop exit)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_106:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_106
nop

P194: !_LD [6] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_107:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P195: !_CASX [18] (maybe <- 0x81) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%i2], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4

P196: !_LD [20] (Int) (Loop exit)
lduw [%i2 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_107:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_107
nop

P197: !_CASX [12] (maybe <- 0x83) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_108:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_108:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_108
nop

P198: !_CASX [22] (maybe <- 0x85) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_109:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P199: !_LD [22] (Int)
lduw [%i2 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P200: !_LD [3] (Int) (Loop exit)
lduw [%i1 + 0], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_109:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_109
nop

P201: !_ST [23] (maybe <- 0x87) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_110:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
loop_exit_0_110:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_110
nop

P202: !_LD [22] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_111:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P203: !_MEMBAR (Int)
membar #StoreLoad

P204: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_111:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_111
nop

P205: !_CASX [11] (maybe <- 0x88) (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_112:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET205
nop
RET205:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P206: !_CASX [1] (maybe <- 0x89) (Int) (Loop exit)
ldx [%i0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %o5
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i0], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_112:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_112
nop

P207: !_CASX [0] (maybe <- 0x8b) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_113:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P208: !_CASX [7] (maybe <- 0x8d) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_113:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_113
nop

P209: !_CASX [3] (maybe <- 0x8f) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_114:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P210: !_LD [18] (FP) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ld [%i2 + 0], %f0
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_0_114:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_114
nop

P211: !_LD [17] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_115:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P212: !_REPLACEMENT [15] (Int)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P213: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_115:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_115
nop

P214: !_CAS [22] (maybe <- 0x91) (Int) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_116:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET214
nop
RET214:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P215: !_LD [5] (FP) (Loop exit)
ld [%i1 + 12], %f0
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_0_116:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_116
nop

P216: !_REPLACEMENT [7] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_117:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P217: !_CASX [0] (maybe <- 0x92) (Int) (Loop exit)
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_117:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_117
nop

P218: !_ST [0] (maybe <- 0x3f800001) (FP) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_118:
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

P219: !_REPLACEMENT [15] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
loop_exit_0_118:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_118
nop

P220: !_FLUSHI [0] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_119:
flush %g0 

P221: !_LD [4] (Int)
lduw [%i1 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P222: !_LD [19] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_119:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_119
nop

P223: !_CASX [15] (maybe <- 0x94) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_120:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_120:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_120
nop

P224: !_PREFETCH [16] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_121:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 4], 31
loop_exit_0_121:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_121
nop

P225: !_LD [20] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_122:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P226: !_CASX [19] (maybe <- 0x96) (Int)
ldx [%i3], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%i3], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4

P227: !_LD [20] (Int) (Loop exit)
lduw [%i3 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_122:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_122
nop

P228: !_CASX [21] (maybe <- 0x98) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_123:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_123:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_123
nop

P229: !_CASX [9] (maybe <- 0x9a) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_124:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P230: !_CASX [6] (maybe <- 0x9c) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_124:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_124
nop

P231: !_REPLACEMENT [4] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_125:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
loop_exit_0_125:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_125
nop

P232: !_ST [4] (maybe <- 0x9e) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_126:
stw   %l4, [%i1 + 4 ]
add   %l4, 1, %l4
loop_exit_0_126:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_126
nop

P233: !_LD [17] (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_127:
wr %g0, 0x88, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 12] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P234: !_CAS [7] (maybe <- 0x9f) (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P235: !_LD [13] (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_127:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_127
nop

P236: !_CASX [0] (maybe <- 0xa0) (Int) (Loop entry) (Loop exit) (CBR) (Branch target of P179)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_128:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET236
nop
RET236:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_128:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_128
nop
ba P237
nop

TARGET179:
ba RET179
nop


P237: !_CASX [9] (maybe <- 0xa2) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_129:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P238: !_CASX [9] (maybe <- 0xa4) (Int) (Loop exit)
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_129:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_129
nop

P239: !_LD [23] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_130:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P240: !_CASX [0] (maybe <- 0xa6) (Int)
ldx [%i0], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%i0], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P241: !_LD [19] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_130:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_130
nop

P242: !_FLUSHI [14] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_131:
flush %g0 

P243: !_CASX [9] (maybe <- 0xa8) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_131:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_131
nop

P244: !_CASX [5] (maybe <- 0xaa) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_132:
add %i1, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_132:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_132
nop

P245: !_ST [10] (maybe <- 0xab) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_133:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4

P246: !_CASX [3] (maybe <- 0xac) (Int) (Loop exit)
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_133:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_133
nop

P247: !_CASX [9] (maybe <- 0xae) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_134:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_134:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_134
nop

P248: !_LD [19] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_135:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P249: !_LD [19] (FP)
ld [%i3 + 4], %f0
! 1 addresses covered

P250: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_0_135:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_135
nop

P251: !_CASX [7] (maybe <- 0xb0) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_136:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_136:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_136
nop

P252: !_CASX [19] (maybe <- 0xb2) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_137:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P253: !_LD [17] (Int) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 12] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P254: !_LD [17] (Int) (Loop exit)
lduw [%i2 + 12], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_137:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_137
nop

P255: !_CASX [11] (maybe <- 0xb4) (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_138:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
and %l4, %l6, %l3
srl %l3, 8, %l3
sll %l4, 8, %l7
and %l7, %l6, %l7
or %l7, %l3, %l7
srl %l7, 16, %l3
sll %l7, 16, %l7
srl %l7, 0, %l7
or %l7, %l3, %l7
sllx %l7, 32, %l7
wr %g0, 0x88, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l6
ldxa [%l6] %asi, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
mov  %o5, %l3
mov  %l7, %o5
casxa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_138:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_138
nop

P256: !_PREFETCH [1] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_139:
prefetch [%i0 + 4], 31
loop_exit_0_139:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_139
nop

P257: !_LD [6] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_140:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P258: !_LD [8] (Int) (Loop exit)
lduw [%i2 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_140:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_140
nop

P259: !_CASX [18] (maybe <- 0xb5) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_141:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P260: !_CAS [7] (maybe <- 0xb7) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 4, %l6
lduw [%l6], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o2(lower)
srl %o5, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_141:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_141
nop

P261: !_CASX [9] (maybe <- 0xb8) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_142:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_142:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_142
nop

P262: !_CASX [4] (maybe <- 0xba) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_143:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_143:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_143
nop

P263: !_MEMBAR (Int) (Loop entry) (Loop exit) (Branch target of P490)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_144:
membar #StoreLoad
loop_exit_0_144:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_144
nop
ba P264
nop

TARGET490:
ba RET490
nop


P264: !_LD [15] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_145:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P265: !_CAS [13] (maybe <- 0xbc) (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P266: !_LD [3] (Int) (Loop exit) (LE) (Branch target of P602)
wr %g0, 0x88, %asi
lduwa [%i1 + 0] %asi, %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_145:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_145
nop
ba P267
nop

TARGET602:
ba RET602
nop


P267: !_LD [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_146:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P268: !_LD [4] (Int) (Loop exit)
lduw [%i1 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_146:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_146
nop

P269: !_LD [22] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_147:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P270: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_147:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_147
nop

P271: !_REPLACEMENT [15] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_148:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P272: !_CASX [3] (maybe <- 0xbd) (Int) (Loop exit)
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_148:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_148
nop

P273: !_CASX [17] (maybe <- 0xbf) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_149:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_149:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_149
nop

P274: !_CASX [13] (maybe <- 0xc0) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_150:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_150:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_150
nop

P275: !_CAS [9] (maybe <- 0xc2) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_151:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%i2], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P276: !_CASX [13] (maybe <- 0xc3) (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l6
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i3], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_151:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_151
nop

P277: !_REPLACEMENT [19] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_152:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+4], %l3
st %l3, [%i2+4]
add %i2, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
loop_exit_0_152:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_152
nop

P278: !_CASX [5] (maybe <- 0xc5) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_153:
add %i1, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_153:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_153
nop

P279: !_LD [4] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_154:
lduw [%i1 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P280: !_LD [8] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_154:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_154
nop

P281: !_ST [21] (maybe <- 0xc6) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_155:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P282: !_CASX [22] (maybe <- 0xc7) (Int) (Loop exit)
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_155:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_155
nop

P283: !_FLUSHI [9] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_156:
flush %g0 
loop_exit_0_156:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_156
nop

P284: !_CASX [2] (maybe <- 0xc9) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_157:
add %i0, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P285: !_PREFETCH [6] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 23
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_157:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_157
nop

P286: !_CASX [7] (maybe <- 0xca) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_158:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET286
nop
RET286:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_158:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_158
nop

P287: !_CASX [17] (maybe <- 0xcc) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_159:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P288: !_CASX [3] (maybe <- 0xcd) (Int) (Loop exit)
ldx [%i1], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i1], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_159:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_159
nop

P289: !_CASX [16] (maybe <- 0xcf) (Int) (Loop entry) (Branch target of P120)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_160:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
ba P290
nop

TARGET120:
ba RET120
nop


P290: !_ST [16] (maybe <- 0xd1) (Int) (Loop exit)
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_160:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_160
nop

P291: !_CASX [0] (maybe <- 0xd2) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_161:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_161:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_161
nop

P292: !_LD [21] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_162:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P293: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_162:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_162
nop

P294: !_CASX [8] (maybe <- 0xd4) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_163:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_163:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_163
nop

P295: !_CASX [17] (maybe <- 0xd5) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_164:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P296: !_REPLACEMENT [2] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+12], %l7
st %l7, [%i3+12]
add %i3, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_164:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_164
nop

P297: !_ST [8] (maybe <- 0xd6) (Int) (Loop entry) (Branch target of P591)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_165:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4
ba P298
nop

TARGET591:
ba RET591
nop


P298: !_REPLACEMENT [22] (Int) (Loop exit)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+4], %l6
st %l6, [%i3+4]
add %i3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
loop_exit_0_165:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_165
nop

P299: !_CAS [0] (maybe <- 0xd7) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_166:
lduw [%i0], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%i0], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P300: !_CASX [19] (maybe <- 0xd8) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %o5
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i2], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_166:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_166
nop

P301: !_PREFETCH [7] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_167:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 4], 23
loop_exit_0_167:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_167
nop

P302: !_REPLACEMENT [20] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_168:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+12], %o5
st %o5, [%i2+12]
add %i2, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]

P303: !_CASX [15] (maybe <- 0xda) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_168:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_168
nop

P304: !_MEMBAR (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_169:
membar #StoreLoad
loop_exit_0_169:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_169
nop

P305: !_CAS [4] (maybe <- 0xdc) (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_170:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l7
srl %l7, 8, %l7
sll %l4, 8, %l3
and %l3, %o5, %l3
or %l3, %l7, %l3
srl %l3, 16, %l7
sll %l3, 16, %l3
srl %l3, 0, %l3
or %l3, %l7, %l3
wr %g0, 0x88, %asi
add %i1, 4, %o5
lduwa [%o5] %asi, %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l3, %l6
casa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P306: !_CASX [23] (maybe <- 0xdd) (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
mov %l4, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_170:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_170
nop

P307: !_CASX [2] (maybe <- 0xde) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_171:
add %i0, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_171:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_171
nop

P308: !_CASX [5] (maybe <- 0xdf) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_172:
add %i1, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P309: !_CAS [7] (maybe <- 0xe0) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %l6
lduw [%l6], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o2(lower)
srl %o5, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_172:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_172
nop

P310: !_REPLACEMENT [10] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_173:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+4], %o5
st %o5, [%i2+4]
add %i2, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
loop_exit_0_173:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_173
nop

P311: !_CAS [4] (maybe <- 0xe1) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_174:
add %i1, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_174:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_174
nop

P312: !_LD [15] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_175:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P313: !_LD [20] (Int) (Loop exit) (CBR)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET313
nop
RET313:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_175:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_175
nop

P314: !_MEMBAR (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_176:
membar #StoreLoad

P315: !_CASX [5] (maybe <- 0xe2) (Int) (Loop exit)
add %i1, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_176:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_176
nop

P316: !_CASX [22] (maybe <- 0xe3) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_177:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P317: !_MEMBAR (Int) (Loop exit)
membar #StoreLoad
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_177:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_177
nop

P318: !_LD [17] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_178:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P319: !_LD [6] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_178:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_178
nop

P320: !_CAS [21] (maybe <- 0xe5) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_179:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i2], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P321: !_CASX [7] (maybe <- 0xe6) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i3], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_179:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_179
nop

P322: !_CASX [9] (maybe <- 0xe8) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_180:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_180:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_180
nop

P323: !_LD [10] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_181:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P324: !_LD [10] (Int) (Loop exit)
lduw [%i3 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_181:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_181
nop

P325: !_CASX [11] (maybe <- 0xea) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_182:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_182:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_182
nop

P326: !_CASX [13] (maybe <- 0xeb) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_183:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_183:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_183
nop

P327: !_LD [4] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_184:
lduw [%i1 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P328: !_LD [19] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_184:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_184
nop

P329: !_CASX [1] (maybe <- 0xed) (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_185:
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
sllx %l7, 32, %l3
or %l7, %l3, %l7 
and %o5, %l7, %l3
srlx %l3, 8, %l3
sllx %o5, 8, %o5
and %o5, %l7, %o5
or %o5, %l3, %o5 
sethi %hi(0xffff0000), %l7
srlx %o5, 16, %l3
andn %l3, %l7, %l3
andn %o5, %l7, %o5
sllx %o5, 16, %o5
or %o5, %l3, %o5 
srlx %o5, 32, %l3
sllx %o5, 32, %o5
or %o5, %l3, %l3 
wr %g0, 0x88, %asi
ldxa [%i0] %asi, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
mov %l6, %l7
mov  %l3, %l6
casxa [%i0] %asi, %l7, %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_185:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_185
nop

P330: !_LD [2] (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_186:
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET330
nop
RET330:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P331: !_LD [14] (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_186:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_186
nop

P332: !_CASX [0] (maybe <- 0xef) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_187:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_187:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_187
nop

P333: !_LD [11] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_188:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P334: !_LD [21] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_188:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_188
nop

P335: !_CASX [10] (maybe <- 0xf1) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_189:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_189:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_189
nop

P336: !_ST [23] (maybe <- 0xf3) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_190:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
loop_exit_0_190:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_190
nop

P337: !_LD [4] (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_191:
wr %g0, 0x88, %asi
lduwa [%i1 + 4] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P338: !_CASX [11] (maybe <- 0xf4) (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov  %l6, %l7
mov %l4, %l6
casx [%o5], %l7, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
add  %l4, 1, %l4

P339: !_LD [8] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_191:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_191
nop

P340: !_CASX [2] (maybe <- 0xf5) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_192:
add %i0, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET340
nop
RET340:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_192:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_192
nop

P341: !_CASX [22] (maybe <- 0xf6) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_193:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_193:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_193
nop

P342: !_CASX [0] (maybe <- 0xf8) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_194:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P343: !_LD [9] (Int) (Branch target of P205)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
ba P344
nop

TARGET205:
ba RET205
nop


P344: !_LD [0] (Int) (Loop exit) (Branch target of P385)
lduw [%i0 + 0], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_194:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_194
nop
ba P345
nop

TARGET385:
ba RET385
nop


P345: !_LD [5] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_195:
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P346: !_LD [3] (Int) (Loop exit) (CBR)
lduw [%i1 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET346
nop
RET346:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_195:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_195
nop

P347: !_REPLACEMENT [15] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_196:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
loop_exit_0_196:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_196
nop

P348: !_CASX [15] (maybe <- 0xfa) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_197:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P349: !_REPLACEMENT [3] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_197:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_197
nop

P350: !_CASX [5] (maybe <- 0xfc) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_198:
add %i1, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P351: !_CASX [10] (maybe <- 0xfd) (Int) (Loop exit) (LE)
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
sllx %o5, 32, %l6
or %o5, %l6, %o5 
and %l3, %o5, %l6
srlx %l6, 8, %l6
sllx %l3, 8, %l3
and %l3, %o5, %l3
or %l3, %l6, %l3 
sethi %hi(0xffff0000), %o5
srlx %l3, 16, %l6
andn %l6, %o5, %l6
andn %l3, %o5, %l3
sllx %l3, 16, %l3
or %l3, %l6, %l3 
srlx %l3, 32, %l6
sllx %l3, 32, %l3
or %l3, %l6, %l6 
wr %g0, 0x88, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldxa [%i3] %asi, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %o5
or %o5, %o2, %o2
mov %l7, %o5
mov  %l6, %l7
casxa [%i3] %asi, %o5, %l7
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_198:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_198
nop

P352: !_CASX [9] (maybe <- 0xff) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_199:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_199:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_199
nop

P353: !_LD [16] (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_200:
wr %g0, 0x88, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduwa [%i3 + 4] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P354: !_CASX [13] (maybe <- 0x101) (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%i2], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P355: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_200:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_200
nop

P356: !_LD [6] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_201:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P357: !_ST [9] (maybe <- 0x103) (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P358: !_LD [9] (Int) (Loop exit)
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_201:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_201
nop

P359: !_MEMBAR (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_202:
membar #StoreLoad
loop_exit_0_202:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_202
nop

P360: !_ST [21] (maybe <- 0x3f800002) (FP) (Loop entry) (Loop exit) (Branch target of P620)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_203:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]
loop_exit_0_203:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_203
nop
ba P361
nop

TARGET620:
ba RET620
nop


P361: !_CASX [4] (maybe <- 0x104) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_204:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P362: !_REPLACEMENT [18] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_204:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_204
nop

P363: !_CASX [1] (maybe <- 0x106) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_205:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_205:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_205
nop

P364: !_REPLACEMENT [7] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_206:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
loop_exit_0_206:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_206
nop

P365: !_PREFETCH [12] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_207:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 22
loop_exit_0_207:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_207
nop

P366: !_LD [9] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_208:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P367: !_LD [2] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 12] %asi, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_208:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_208
nop

P368: !_LD [8] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_209:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P369: !_CAS [6] (maybe <- 0x108) (Int)
lduw [%i2], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%i2], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P370: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_209:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_209
nop

P371: !_LD [17] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_210:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P372: !_CASX [9] (maybe <- 0x109) (Int) (CBR)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%i3], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET372
nop
RET372:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P373: !_LD [16] (Int) (Loop exit)
lduw [%i2 + 4], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_210:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_210
nop

P374: !_REPLACEMENT [6] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_211:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P375: !_LD [23] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P376: !_LD [4] (Int) (Loop exit)
lduw [%i1 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_211:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_211
nop

P377: !_CASX [17] (maybe <- 0x10b) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_212:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P378: !_CASX [11] (maybe <- 0x10c) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
mov %l4, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_212:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_212
nop

P379: !_ST [15] (maybe <- 0x10d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_213:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4
loop_exit_0_213:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_213
nop

P380: !_CASX [10] (maybe <- 0x10e) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_214:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_214:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_214
nop

P381: !_REPLACEMENT [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_215:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P382: !_ST [3] (maybe <- 0x110) (Int) (Loop exit)
stw   %l4, [%i1 + 0 ]
add   %l4, 1, %l4
loop_exit_0_215:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_215
nop

P383: !_PREFETCH [3] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_216:
prefetch [%i1 + 0], 21
loop_exit_0_216:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_216
nop

P384: !_LD [14] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_217:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P385: !_LD [9] (Int) (Loop exit) (CBR)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET385
nop
RET385:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_217:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_217
nop

P386: !_ST [17] (maybe <- 0x111) (Int) (Loop entry) (Loop exit) (Branch target of P528)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_218:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
loop_exit_0_218:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_218
nop
ba P387
nop

TARGET528:
ba RET528
nop


P387: !_CASX [22] (maybe <- 0x112) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_219:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_219:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_219
nop

P388: !_CAS [10] (maybe <- 0x114) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_220:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_220:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_220
nop

P389: !_PREFETCH [3] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_221:
prefetch [%i1 + 0], 22
loop_exit_0_221:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_221
nop

P390: !_CASX [2] (maybe <- 0x115) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_222:
add %i0, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_222:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_222
nop

P391: !_REPLACEMENT [0] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_223:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
loop_exit_0_223:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_223
nop

P392: !_PREFETCH [15] (Int) (Loop entry) (Branch target of P655)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_224:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 25
ba P393
nop

TARGET655:
ba RET655
nop


P393: !_LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P394: !_LD [21] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_224:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_224
nop

P395: !_CASX [6] (maybe <- 0x116) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_225:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P396: !_LD [4] (Int) (LE) (CBR)
wr %g0, 0x88, %asi
lduwa [%i1 + 4] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET396
nop
RET396:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P397: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_225:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_225
nop

P398: !_CASX [14] (maybe <- 0x118) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_226:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_226:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_226
nop

P399: !_CASX [12] (maybe <- 0x119) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_227:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_227:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_227
nop

P400: !_CASX [3] (maybe <- 0x11b) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_228:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P401: !_CASX [17] (maybe <- 0x11d) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
mov %l4, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_228:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_228
nop

P402: !_LD [14] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_229:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P403: !_REPLACEMENT [9] (Int)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P404: !_LD [17] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_229:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_229
nop

P405: !_LD [23] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_230:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P406: !_LD [19] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_230:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_230
nop

P407: !_CASX [16] (maybe <- 0x11e) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_231:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P408: !_CASX [13] (maybe <- 0x120) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_231:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_231
nop

P409: !_LD [20] (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_232:
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduwa [%i3 + 12] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P410: !_CAS [0] (maybe <- 0x122) (Int)
lduw [%i0], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%i0], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P411: !_LD [3] (Int) (Loop exit)
lduw [%i1 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_232:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_232
nop

P412: !_CASX [10] (maybe <- 0x123) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_233:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_233:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_233
nop

P413: !_LD [8] (FP) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_234:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 12], %f0
! 1 addresses covered

P414: !_LD [23] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P415: !_LD [2] (Int) (Loop exit)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_0_234:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_234
nop

P416: !_LD [12] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_235:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P417: !_CASX [0] (maybe <- 0x125) (Int)
ldx [%i0], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%i0], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P418: !_LD [7] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_235:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_235
nop

P419: !_CAS [17] (maybe <- 0x127) (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_236:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l7
srl %l7, 8, %l7
sll %l4, 8, %l3
and %l3, %o5, %l3
or %l3, %l7, %l3
srl %l3, 16, %l7
sll %l3, 16, %l3
srl %l3, 0, %l3
or %l3, %l7, %l3
wr %g0, 0x88, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %o5
lduwa [%o5] %asi, %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l3, %l6
casa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P420: !_CASX [22] (maybe <- 0x128) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l7
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i2], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_236:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_236
nop

P421: !_CASX [18] (maybe <- 0x12a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_237:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_237:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_237
nop

P422: !_CASX [22] (maybe <- 0x12c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_238:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_238:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_238
nop

P423: !_REPLACEMENT [4] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_239:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

P424: !_REPLACEMENT [19] (Int) (Loop exit)
sethi %hi(0x20000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
loop_exit_0_239:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_239
nop

P425: !_CASX [20] (maybe <- 0x12e) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_240:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P426: !_LD [22] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P427: !_LD [2] (Int) (Loop exit) (Branch target of P330)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_240:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_240
nop
ba P428
nop

TARGET330:
ba RET330
nop


P428: !_LD [9] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_241:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P429: !_LD [11] (Int) (Loop exit)
lduw [%i2 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_241:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_241
nop

P430: !_ST [21] (maybe <- 0x12f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_242:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
loop_exit_0_242:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_242
nop

P431: !_LD [2] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_243:
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P432: !_CASX [19] (maybe <- 0x130) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%i2], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4

P433: !_LD [20] (Int) (Loop exit) (Branch target of P449)
lduw [%i2 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_243:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_243
nop
ba P434
nop

TARGET449:
ba RET449
nop


P434: !_CASX [21] (maybe <- 0x132) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_244:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P435: !_LD [5] (Int)
lduw [%i1 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P436: !_LD [13] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_244:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_244
nop

P437: !_CASX [21] (maybe <- 0x134) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_245:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P438: !_LD [3] (Int)
lduw [%i1 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P439: !_LD [19] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_245:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_245
nop

P440: !_CASX [0] (maybe <- 0x136) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_246:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_246:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_246
nop

P441: !_CASX [6] (maybe <- 0x138) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_247:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_247:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_247
nop

P442: !_CASX [16] (maybe <- 0x13a) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_248:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P443: !_CASX [18] (maybe <- 0x13c) (Int) (Loop exit) (LE)
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
sllx %o5, 32, %l6
or %o5, %l6, %o5 
and %l3, %o5, %l6
srlx %l6, 8, %l6
sllx %l3, 8, %l3
and %l3, %o5, %l3
or %l3, %l6, %l3 
sethi %hi(0xffff0000), %o5
srlx %l3, 16, %l6
andn %l6, %o5, %l6
andn %l3, %o5, %l3
sllx %l3, 16, %l3
or %l3, %l6, %l3 
srlx %l3, 32, %l6
sllx %l3, 32, %l3
or %l3, %l6, %l6 
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldxa [%i3] %asi, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %o5
or %o5, %o2, %o2
mov %l7, %o5
mov  %l6, %l7
casxa [%i3] %asi, %o5, %l7
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_248:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_248
nop

P444: !_LD [23] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_249:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P445: !_LD [2] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 12] %asi, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_249:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_249
nop

P446: !_CAS [6] (maybe <- 0x13e) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_250:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%i3], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P447: !_LD [5] (Int)
lduw [%i1 + 12], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P448: !_LD [13] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_250:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_250
nop

P449: !_CASX [5] (maybe <- 0x13f) (Int) (Loop entry) (Loop exit) (LE) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_251:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
and %l4, %l3, %o5
srl %o5, 8, %o5
sll %l4, 8, %l6
and %l6, %l3, %l6
or %l6, %o5, %l6
srl %l6, 16, %o5
sll %l6, 16, %l6
srl %l6, 0, %l6
or %l6, %o5, %l6
sllx %l6, 32, %l6
wr %g0, 0x88, %asi
add %i1, 8, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
mov  %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET449
nop
RET449:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_251:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_251
nop

P450: !_PREFETCH [18] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_252:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 0], 3
loop_exit_0_252:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_252
nop

P451: !_CAS [6] (maybe <- 0x140) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_253:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%i2], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P452: !_CASX [17] (maybe <- 0x141) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
mov %l4, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_253:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_253
nop

P453: !_CASX [13] (maybe <- 0x142) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_254:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_254:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_254
nop

P454: !_REPLACEMENT [0] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_255:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P455: !_REPLACEMENT [13] (Int) (Loop exit)
sethi %hi(0x20000), %o5
ld [%i3+4], %l6
st %l6, [%i3+4]
add %i3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
loop_exit_0_255:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_255
nop

P456: !_CASX [6] (maybe <- 0x144) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_256:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P457: !_CAS [8] (maybe <- 0x146) (Int) (Loop exit)
add %i2, 12, %l3
lduw [%l3], %o2
mov %o2, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %o5
or %o5, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_256:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_256
nop

P458: !_LD [2] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_257:
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P459: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_257:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_257
nop

P460: !_ST [8] (maybe <- 0x147) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_258:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4

P461: !_PREFETCH [22] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 4], 0
loop_exit_0_258:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_258
nop

P462: !_LD [13] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_259:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P463: !_PREFETCH [13] (Int)
prefetch [%i3 + 4], 0

P464: !_LD [21] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_259:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_259
nop

P465: !_CASX [18] (maybe <- 0x148) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_260:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P466: !_CASX [1] (maybe <- 0x14a) (Int) (Loop exit)
ldx [%i0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i0], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_260:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_260
nop

P467: !_ST [16] (maybe <- 0x14c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_261:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
loop_exit_0_261:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_261
nop

P468: !_REPLACEMENT [9] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_262:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P469: !_LD [18] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P470: !_LD [3] (Int) (Loop exit)
lduw [%i1 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_262:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_262
nop

P471: !_CASX [7] (maybe <- 0x14d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_263:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_263:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_263
nop

P472: !_CASX [19] (maybe <- 0x14f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_264:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_264:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_264
nop

P473: !_CASX [1] (maybe <- 0x151) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_265:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P474: !_LD [1] (Int)
lduw [%i0 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P475: !_LD [9] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_265:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_265
nop

P476: !_CASX [20] (maybe <- 0x153) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_266:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_266:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_266
nop

P477: !_CASX [15] (maybe <- 0x154) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_267:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_267:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_267
nop

P478: !_LD [19] (FP) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_268:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ld [%i2 + 4], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_0_268:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_268
nop

P479: !_CAS [7] (maybe <- 0x156) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_269:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P480: !_CAS [3] (maybe <- 0x157) (Int) (Loop exit)
lduw [%i1], %o1
mov %o1, %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l4, %l3
cas [%i1], %l6, %l3
! move %l3(lower) -> %o1(lower)
srl %l3, 0, %l6
or %l6, %o1, %o1
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_269:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_269
nop

P481: !_CASX [17] (maybe <- 0x158) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_270:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P482: !_CASX [18] (maybe <- 0x159) (Int) (Loop exit) (LE)
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
sllx %l7, 32, %l3
or %l7, %l3, %l7 
and %o5, %l7, %l3
srlx %l3, 8, %l3
sllx %o5, 8, %o5
and %o5, %l7, %o5
or %o5, %l3, %o5 
sethi %hi(0xffff0000), %l7
srlx %o5, 16, %l3
andn %l3, %l7, %l3
andn %o5, %l7, %o5
sllx %o5, 16, %o5
or %o5, %l3, %o5 
srlx %o5, 32, %l3
sllx %o5, 32, %o5
or %o5, %l3, %l3 
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldxa [%i3] %asi, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
mov %l6, %l7
mov  %l3, %l6
casxa [%i3] %asi, %l7, %l6
! move %l6(lower) -> %o3(upper)
sllx %l6, 32, %o3
! move %l6(upper) -> %o3(lower)
srlx %l6, 32, %l7
or %l7, %o3, %o3
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_270:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_270
nop

P483: !_CASX [3] (maybe <- 0x15b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_271:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_271:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_271
nop

P484: !_CASX [2] (maybe <- 0x15d) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_272:
add %i0, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P485: !_CASX [18] (maybe <- 0x15e) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_272:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_272
nop

P486: !_LD [3] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_273:
lduw [%i1 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P487: !_LD [18] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_273:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_273
nop

P488: !_PREFETCH [13] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_274:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS2_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 4], 30

P489: !_LD [3] (Int)
lduw [%i1 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P490: !_LD [7] (Int) (Loop exit) (CBR)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET490
nop
RET490:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_274:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_274
nop

P491: !_CASX [13] (maybe <- 0x160) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_275:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P492: !_CAS [12] (maybe <- 0x162) (Int) (Loop exit)
lduw [%i2], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %o5
cas [%i2], %l3, %o5
! move %o5(lower) -> %o2(lower)
srl %o5, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_275:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_275
nop

P493: !_CASX [0] (maybe <- 0x163) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_276:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P494: !_MEMBAR (Int) (Loop exit)
membar #StoreLoad
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_276:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_276
nop

P495: !_CASX [23] (maybe <- 0x165) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_277:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_277:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_277
nop

P496: !_CASX [2] (maybe <- 0x166) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_278:
add %i0, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P497: !_REPLACEMENT [12] (Int) (Loop exit)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_278:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_278
nop

P498: !_ST [1] (maybe <- 0x167) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_279:
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4

P499: !_LD [14] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P500: !_LD [2] (Int) (Loop exit)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_279:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_279
nop

P501: !_CAS [18] (maybe <- 0x168) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_280:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%i2], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_280:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_280
nop

P502: !_MEMBAR (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_281:
membar #StoreLoad
loop_exit_0_281:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_281
nop

P503: !_CASX [20] (maybe <- 0x169) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_282:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_282:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_282
nop

P504: !_LD [1] (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_283:
wr %g0, 0x88, %asi
lduwa [%i0 + 4] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P505: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_283:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_283
nop

P506: !_CASX [11] (maybe <- 0x16a) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_284:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P507: !_REPLACEMENT [14] (Int) (Loop exit)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+12], %l6
st %l6, [%i3+12]
add %i3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_284:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_284
nop

P508: !_CASX [11] (maybe <- 0x16b) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_285:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P509: !_REPLACEMENT [0] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_285:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_285
nop

P510: !_ST [21] (maybe <- 0x16c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_286:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4
loop_exit_0_286:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_286
nop

P511: !_REPLACEMENT [0] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_287:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
loop_exit_0_287:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_287
nop

P512: !_LD [13] (Int) (Loop entry) (Branch target of P534)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_288:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P513
nop

TARGET534:
ba RET534
nop


P513: !_LD [7] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_288:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_288
nop

P514: !_FLUSHI [10] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_289:
flush %g0 

P515: !_REPLACEMENT [23] (Int) (Loop exit) (Branch target of P648)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+12], %o5
st %o5, [%i2+12]
add %i2, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
loop_exit_0_289:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_289
nop
ba P516
nop

TARGET648:
ba RET648
nop


P516: !_CASX [13] (maybe <- 0x16d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_290:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_290:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_290
nop

P517: !_ST [19] (maybe <- 0x16f) (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_291:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET517
nop
RET517:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P518: !_CAS [20] (maybe <- 0x170) (Int) (Loop exit)
add %i2, 12, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_291:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_291
nop

P519: !_LD [7] (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_292:
wr %g0, 0x88, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduwa [%i3 + 4] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P520: !_LD [9] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 0] %asi, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_292:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_292
nop

P521: !_CASX [22] (maybe <- 0x171) (Int) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_293:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET521
nop
RET521:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P522: !_REPLACEMENT [1] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+4], %o5
st %o5, [%i2+4]
add %i2, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_293:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_293
nop

P523: !_CASX [2] (maybe <- 0x173) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_294:
add %i0, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P524: !_CASX [6] (maybe <- 0x174) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_294:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_294
nop

P525: !_ST [11] (maybe <- 0x3f800003) (FP) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_295:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 12 ]
loop_exit_0_295:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_295
nop

P526: !_CASX [4] (maybe <- 0x176) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_296:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P527: !_CASX [18] (maybe <- 0x178) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_296:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_296
nop

P528: !_CASX [5] (maybe <- 0x17a) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_297:
add %i1, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET528
nop
RET528:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_297:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_297
nop

P529: !_CAS [20] (maybe <- 0x17b) (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_298:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l7, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 12, %l7
lduwa [%l7] %asi, %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %o5, %l3
casa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P530: !_CASX [2] (maybe <- 0x17c) (Int) (Loop exit)
add %i0, 8, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
mov %l4, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_298:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_298
nop

P531: !_REPLACEMENT [12] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_299:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P532: !_CASX [7] (maybe <- 0x17d) (Int) (Loop exit) (Branch target of P396)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_299:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_299
nop
ba P533
nop

TARGET396:
ba RET396
nop


P533: !_REPLACEMENT [5] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_300:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+12], %l3
st %l3, [%i3+12]
add %i3, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
loop_exit_0_300:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_300
nop

P534: !_LD [1] (Int) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_301:
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET534
nop
RET534:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P535: !_CASX [17] (maybe <- 0x17f) (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov  %l3, %l6
mov %l4, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

P536: !_LD [21] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_301:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_301
nop

P537: !_CASX [18] (maybe <- 0x180) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_302:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P538: !_CASX [8] (maybe <- 0x182) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
mov %l4, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_302:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_302
nop

P539: !_ST [18] (maybe <- 0x183) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_303:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P540: !_REPLACEMENT [21] (Int) (Loop exit)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
loop_exit_0_303:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_303
nop

P541: !_FLUSHI [2] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_304:
flush %g0 

P542: !_LD [5] (Int)
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P543: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_304:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_304
nop

P544: !_REPLACEMENT [1] (Int) (Loop entry) (Loop exit) (Branch target of P36)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_305:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+4], %o5
st %o5, [%i2+4]
add %i2, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
loop_exit_0_305:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_305
nop
ba P545
nop

TARGET36:
ba RET36
nop


P545: !_REPLACEMENT [11] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_306:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+12], %o5
st %o5, [%i3+12]
add %i3, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]

P546: !_REPLACEMENT [11] (Int) (Loop exit)
sethi %hi(0x20000), %l3
ld [%i3+12], %l7
st %l7, [%i3+12]
add %i3, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
loop_exit_0_306:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_306
nop

P547: !_CASX [22] (maybe <- 0x184) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_307:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_307:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_307
nop

P548: !_CASX [11] (maybe <- 0x186) (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_308:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l7, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
sllx %o5, 32, %o5
wr %g0, 0x88, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l7
ldxa [%l7] %asi, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
mov  %l3, %l6
mov  %o5, %l3
casxa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_308:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_308
nop

P549: !_CAS [10] (maybe <- 0x187) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_309:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 4, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_309:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_309
nop

P550: !_CASX [20] (maybe <- 0x188) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_310:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P551: !_CASX [20] (maybe <- 0x189) (Int) (Loop exit) (Branch target of P214)
add %i3, 8, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
mov %l4, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_310:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_310
nop
ba P552
nop

TARGET214:
ba RET214
nop


P552: !_MEMBAR (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_311:
membar #StoreLoad
loop_exit_0_311:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_311
nop

P553: !_CAS [15] (maybe <- 0x18a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_312:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%i2], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_312:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_312
nop

P554: !_CASX [10] (maybe <- 0x18b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_313:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_313:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_313
nop

P555: !_ST [9] (maybe <- 0x18d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_314:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4
loop_exit_0_314:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_314
nop

P556: !_ST [22] (maybe <- 0x18e) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_315:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4

P557: !_CASX [5] (maybe <- 0x18f) (Int) (Loop exit)
add %i1, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_315:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_315
nop

P558: !_LD [8] (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_316:
wr %g0, 0x88, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 12] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P559: !_CASX [7] (maybe <- 0x190) (Int)
ldx [%i2], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%i2], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

P560: !_LD [4] (Int) (Loop exit)
lduw [%i1 + 4], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_316:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_316
nop

P561: !_LD [0] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_317:
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P562: !_PREFETCH [23] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 12], 31

P563: !_LD [10] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_317:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_317
nop

P564: !_REPLACEMENT [15] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_318:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P565: !_ST [14] (maybe <- 0x192) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4
loop_exit_0_318:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_318
nop

P566: !_LD [12] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_319:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P567: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_319:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_319
nop

P568: !_CASX [20] (maybe <- 0x193) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_320:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P569: !_LD [11] (Int) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduwa [%i3 + 12] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P570: !_LD [6] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_320:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_320
nop

P571: !_LD [1] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_321:
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P572: !_LD [9] (Int) (Loop exit) (Branch target of P175)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_321:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_321
nop
ba P573
nop

TARGET175:
ba RET175
nop


P573: !_ST [11] (maybe <- 0x3f800004) (FP) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_322:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 12 ]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET573
nop
RET573:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

loop_exit_0_322:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_322
nop

P574: !_CASX [15] (maybe <- 0x194) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_323:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_323:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_323
nop

P575: !_LD [9] (FP) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_324:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 0], %f0
! 1 addresses covered

P576: !_MEMBAR (Int) (Loop exit)
membar #StoreLoad
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_0_324:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_324
nop

P577: !_REPLACEMENT [15] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_325:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P578: !_CASX [7] (maybe <- 0x196) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_325:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_325
nop

P579: !_CASX [23] (maybe <- 0x198) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_326:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P580: !_CASX [1] (maybe <- 0x199) (Int) (Loop exit)
ldx [%i0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %o5
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i0], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_326:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_326
nop

P581: !_MEMBAR (Int) (Loop entry) (Branch target of P313)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_327:
membar #StoreLoad
ba P582
nop

TARGET313:
ba RET313
nop


P582: !_LD [12] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P583: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_327:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_327
nop

P584: !_LD [6] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_328:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P585: !_LD [14] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_328:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_328
nop

P586: !_CASX [11] (maybe <- 0x19b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_329:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_329:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_329
nop

P587: !_PREFETCH [17] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_330:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 12], 0

P588: !_LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P589: !_LD [18] (Int) (Loop exit) (Branch target of P115)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_330:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_330
nop
ba P590
nop

TARGET115:
ba RET115
nop


P590: !_CAS [0] (maybe <- 0x19c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_331:
lduw [%i0], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i0], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_331:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_331
nop

P591: !_PREFETCH [13] (Int) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_332:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 4], 21

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET591
nop
RET591:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P592: !_ST [7] (maybe <- 0x19d) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
loop_exit_0_332:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_332
nop

P593: !_CASX [21] (maybe <- 0x19e) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_333:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_333:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_333
nop

P594: !_LD [11] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_334:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P595: !_LD [19] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_334:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_334
nop

P596: !_CAS [2] (maybe <- 0x1a0) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_335:
add %i0, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_335:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_335
nop

P597: !_REPLACEMENT [21] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_336:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P598: !_CASX [7] (maybe <- 0x1a1) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_336:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_336
nop

P599: !_CAS [22] (maybe <- 0x1a3) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_337:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_337:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_337
nop

P600: !_CASX [1] (maybe <- 0x1a4) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_338:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P601: !_CASX [7] (maybe <- 0x1a6) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_338:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_338
nop

P602: !_CAS [3] (maybe <- 0x1a8) (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_339:
lduw [%i1], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%i1], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET602
nop
RET602:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P603: !_PREFETCH [1] (Int) (Loop exit)
prefetch [%i0 + 4], 4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_339:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_339
nop

P604: !_ST [4] (maybe <- 0x1a9) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_340:
stw   %l4, [%i1 + 4 ]
add   %l4, 1, %l4

P605: !_PREFETCH [15] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 0
loop_exit_0_340:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_340
nop

P606: !_CAS [7] (maybe <- 0x1aa) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_341:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_341:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_341
nop

P607: !_ST [4] (maybe <- 0x1ab) (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_342:
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l3
srl %l3, 8, %l3
sll %l4, 8, %l7
and %l7, %o5, %l7
or %l7, %l3, %l7
srl %l7, 16, %l3
sll %l7, 16, %l7
srl %l7, 0, %l7
or %l7, %l3, %l7
stwa   %l7, [%i1 + 4] %asi
add   %l4, 1, %l4

P608: !_CASX [0] (maybe <- 0x1ac) (Int) (Loop exit)
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_342:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_342
nop

P609: !_REPLACEMENT [11] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_343:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+12], %l3
st %l3, [%i2+12]
add %i2, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]

P610: !_CAS [19] (maybe <- 0x1ae) (Int) (Loop exit) (Branch target of P517)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_343:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_343
nop
ba P611
nop

TARGET517:
ba RET517
nop


P611: !_CASX [10] (maybe <- 0x1af) (Int) (Loop entry) (Loop exit) (Branch target of P286)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_344:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_344:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_344
nop
ba P612
nop

TARGET286:
ba RET286
nop


P612: !_LD [15] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_345:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P613: !_LD [18] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_345:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_345
nop

P614: !_LD [14] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_346:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P615: !_LD [2] (Int) (Loop exit)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_346:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_346
nop

P616: !_LD [0] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_347:
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P617: !_LD [3] (Int) (Loop exit)
lduw [%i1 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_347:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_347
nop

P618: !_CASX [2] (maybe <- 0x1b1) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_348:
add %i0, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P619: !_CASX [18] (maybe <- 0x1b2) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_348:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_348
nop

P620: !_CASX [12] (maybe <- 0x1b4) (Int) (Loop entry) (CBR) (Branch target of P346)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_349:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET620
nop
RET620:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P621
nop

TARGET346:
ba RET346
nop


P621: !_CASX [16] (maybe <- 0x1b6) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_349:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_349
nop

P622: !_CASX [23] (maybe <- 0x1b8) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_350:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_350:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_350
nop

P623: !_LD [6] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_351:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P624: !_LD [16] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_351:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_351
nop

P625: !_CASX [17] (maybe <- 0x1b9) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_352:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_352:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_352
nop

P626: !_CASX [1] (maybe <- 0x1ba) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_353:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P627: !_CASX [17] (maybe <- 0x1bc) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
mov %l4, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_353:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_353
nop

P628: !_ST [4] (maybe <- 0x1bd) (Int) (Loop entry) (Loop exit) (Branch target of P573)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_354:
stw   %l4, [%i1 + 4 ]
add   %l4, 1, %l4
loop_exit_0_354:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_354
nop
ba P629
nop

TARGET573:
ba RET573
nop


P629: !_CASX [18] (maybe <- 0x1be) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_355:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_355:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_355
nop

P630: !_CASX [1] (maybe <- 0x1c0) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_356:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P631: !_CASX [20] (maybe <- 0x1c2) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
mov %l4, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_356:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_356
nop

P632: !_CAS [21] (maybe <- 0x1c3) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_357:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%i2], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P633: !_ST [17] (maybe <- 0x1c4) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_357:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_357
nop

P634: !_ST [10] (maybe <- 0x1c5) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_358:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4

P635: !_LD [22] (Int) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduwa [%i3 + 4] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P636: !_LD [8] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_358:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_358
nop

P637: !_CASX [7] (maybe <- 0x1c6) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_359:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P638: !_CAS [0] (maybe <- 0x1c8) (Int) (Loop exit)
lduw [%i0], %o2
mov %o2, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %l4, %l7
cas [%i0], %o5, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %o5
or %o5, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_359:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_359
nop

P639: !_CASX [1] (maybe <- 0x1c9) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_360:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_360:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_360
nop

P640: !_CASX [2] (maybe <- 0x1cb) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_361:
add %i0, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P641: !_CASX [17] (maybe <- 0x1cc) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
mov %l4, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_0_361:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_361
nop

P642: !_PREFETCH [7] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_362:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 4], 20
loop_exit_0_362:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_362
nop

P643: !_ST [10] (maybe <- 0x1cd) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_363:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4

P644: !_LD [19] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P645: !_LD [3] (Int) (Loop exit)
lduw [%i1 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_363:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_363
nop

P646: !_CASX [11] (maybe <- 0x1ce) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_364:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_364:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_364
nop

P647: !_CASX [17] (maybe <- 0x1cf) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_365:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_365:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_365
nop

P648: !_CASX [15] (maybe <- 0x1d0) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_0_366:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET648
nop
RET648:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_366:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_366
nop

P649: !_ST [4] (maybe <- 0x1d2) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_367:
stw   %l4, [%i1 + 4 ]
add   %l4, 1, %l4
loop_exit_0_367:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_367
nop

P650: !_LD [6] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_368:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P651: !_LD [10] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_368:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_368
nop

P652: !_CASX [17] (maybe <- 0x1d3) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_369:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_369:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_369
nop

P653: !_CASX [11] (maybe <- 0x1d4) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_370:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_0_370:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_370
nop

P654: !_LD [11] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_371:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P655: !_LD [9] (Int) (Loop exit) (CBR)
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET655
nop
RET655:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_0_371:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_371
nop

P656: !_CASX [1] (maybe <- 0x1d5) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_0_372:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P657: !_LD [6] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P658: !_LD [3] (Int) (Loop exit)
lduw [%i1 + 0], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_0_372:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_0_372
nop

P659: !_MEMBAR (Int)
membar #StoreLoad

END_NODES0: ! Test instruction sequence for CPU 0 ends
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
sethi %hi(0xdead0e0f), %l7
or    %l7, %lo(0xdead0e0f), %l7
stw %l7, [%i5] 
ld [%i5], %f0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 : base registers for first 2 regions
! %i2 %i3 : cache registers for 8 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %i4 holds the instructions count which is used for interrupt ordering
! %i4 holds the thread_id (OBP only) 
! %l5 holds the moving pointer for interrupt bonus data (OBP only). Conflicts with RTL/simulation usage
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func1:
! instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Reinitialize i4 to 0. i4 will be used to keep the count of analyzable node info
mov 0x0, %i4

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l6
or    %l6, %lo(0xdeadbee0), %l6
stw   %l6, [%i5]
sethi %hi(0xdeadbee1), %l6
or    %l6, %lo(0xdeadbee1), %l6
stw   %l6, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x01deade1), %l6
or    %l6, %lo(0x01deade1), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x800001), %l4
or    %l4, %lo(0x800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x40000001), %l6
or    %l6, %lo(0x40000001), %l6
stw %l6, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x34800000), %l6
or    %l6, %lo(0x34800000), %l6
stw %l6, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x36cb^4
sethi %hi(0x36cb), %l0
or    %l0, %lo(0x36cb), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

BEGIN_NODES1: ! Test instruction sequence for ISTREAM 1 begins

P660: !_CASX [12] (maybe <- 0x800001) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_0:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_0
nop

P661: !_CASX [10] (maybe <- 0x800003) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_1:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P662: !_LD [3] (Int)
lduw [%i1 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P663: !_LD [8] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_1:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_1
nop

P664: !_REPLACEMENT [9] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_2:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P665: !_ST [22] (maybe <- 0x800005) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4
loop_exit_1_2:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_2
nop

P666: !_CASX [5] (maybe <- 0x800006) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_3:
add %i1, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P667: !_ST [21] (maybe <- 0x800007) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_3:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_3
nop

P668: !_CASX [23] (maybe <- 0x800008) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_4:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_4:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_4
nop

P669: !_LD [0] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_5:
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P670: !_LD [2] (Int) (Loop exit) (Branch target of P691)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_5:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_5
nop
ba P671
nop

TARGET691:
ba RET691
nop


P671: !_CASX [9] (maybe <- 0x800009) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_6:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P672: !_CASX [21] (maybe <- 0x80000b) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_6:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_6
nop

P673: !_REPLACEMENT [8] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_7:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+12], %l3
st %l3, [%i2+12]
add %i2, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
loop_exit_1_7:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_7
nop

P674: !_CASX [7] (maybe <- 0x80000d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_8:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_8:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_8
nop

P675: !_CASX [7] (maybe <- 0x80000f) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_9:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P676: !_REPLACEMENT [1] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+4], %l6
st %l6, [%i3+4]
add %i3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_9:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_9
nop

P677: !_LD [10] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_10:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P678: !_LD [17] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_10:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_10
nop

P679: !_LD [20] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_11:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P680: !_LD [14] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_11:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_11
nop

P681: !_LD [20] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_12:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P682: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_12:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_12
nop

P683: !_LD [21] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_13:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P684: !_REPLACEMENT [19] (Int)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P685: !_LD [14] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_13:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_13
nop

P686: !_CAS [23] (maybe <- 0x800011) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_14:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 12, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_14:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_14
nop

P687: !_LD [23] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_15:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P688: !_REPLACEMENT [10] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+4], %o5
st %o5, [%i2+4]
add %i2, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

P689: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_15:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_15
nop

P690: !_CASX [6] (maybe <- 0x800012) (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_16:
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
sllx %o5, 32, %l6
or %o5, %l6, %o5 
and %l3, %o5, %l6
srlx %l6, 8, %l6
sllx %l3, 8, %l3
and %l3, %o5, %l3
or %l3, %l6, %l3 
sethi %hi(0xffff0000), %o5
srlx %l3, 16, %l6
andn %l6, %o5, %l6
andn %l3, %o5, %l3
sllx %l3, 16, %l3
or %l3, %l6, %l3 
srlx %l3, 32, %l6
sllx %l3, 32, %l3
or %l3, %l6, %l6 
wr %g0, 0x88, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldxa [%i2] %asi, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
mov %l7, %o5
mov  %l6, %l7
casxa [%i2] %asi, %o5, %l7
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
add  %l4, 1, %l4

P691: !_PREFETCH [8] (Int) (Loop exit) (CBR)
prefetch [%i2 + 12], 1

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET691
nop
RET691:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_16:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_16
nop

P692: !_CAS [14] (maybe <- 0x800014) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_17:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P693: !_LD [12] (Int)
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P694: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_17:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_17
nop

P695: !_CASX [8] (maybe <- 0x800015) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_18:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P696: !_CASX [0] (maybe <- 0x800016) (Int) (Loop exit)
ldx [%i0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i0], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_18:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_18
nop

P697: !_LD [19] (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_19:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET697
nop
RET697:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P698: !_LD [17] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_19:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_19
nop

P699: !_LD [17] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_20:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P700: !_LD [20] (Int) (Loop exit) (CBR) (Branch target of P700)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET700
nop
RET700:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_20:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_20
nop
ba P701
nop

TARGET700:
ba RET700
nop


P701: !_LD [3] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_21:
lduw [%i1 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P702: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_21:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_21
nop

P703: !_CAS [17] (maybe <- 0x800018) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_22:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_22:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_22
nop

P704: !_LD [17] (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_23:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET704
nop
RET704:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P705: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_23:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_23
nop

P706: !_CASX [15] (maybe <- 0x800019) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_24:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_24:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_24
nop

P707: !_LD [5] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_25:
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P708: !_CAS [19] (maybe <- 0x80001b) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 4, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P709: !_LD [15] (Int) (Loop exit) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET709
nop
RET709:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_25:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_25
nop

P710: !_CASX [20] (maybe <- 0x80001c) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_26:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P711: !_REPLACEMENT [8] (Int) (Loop exit) (Branch target of P850)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+12], %l3
st %l3, [%i2+12]
add %i2, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_26:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_26
nop
ba P712
nop

TARGET850:
ba RET850
nop


P712: !_CASX [21] (maybe <- 0x80001d) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_27:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P713: !_REPLACEMENT [3] (Int) (Loop exit) (CBR)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET713
nop
RET713:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_27:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_27
nop

P714: !_CAS [4] (maybe <- 0x80001f) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_28:
add %i1, 4, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P715: !_REPLACEMENT [20] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+12], %l6
st %l6, [%i3+12]
add %i3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_28:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_28
nop

P716: !_CASX [11] (maybe <- 0x800020) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_29:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_29:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_29
nop

P717: !_CAS [11] (maybe <- 0x800021) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_30:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_30:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_30
nop

P718: !_CASX [23] (maybe <- 0x800022) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_31:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_31:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_31
nop

P719: !_LD [9] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_32:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P720: !_LD [15] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_32:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_32
nop

P721: !_CAS [15] (maybe <- 0x800023) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_33:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%i3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P722: !_CASX [11] (maybe <- 0x800024) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %o5
mov %l4, %o2
casx [%l3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_33:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_33
nop

P723: !_ST [7] (maybe <- 0x800025) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_34:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4
loop_exit_1_34:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_34
nop

P724: !_PREFETCH [4] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_35:
prefetch [%i1 + 4], 17

P725: !_REPLACEMENT [3] (Int) (Loop exit) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET725
nop
RET725:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

loop_exit_1_35:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_35
nop

P726: !_MEMBAR (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_36:
membar #StoreLoad

P727: !_LD [20] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P728: !_LD [6] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_36:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_36
nop

P729: !_CASX [12] (maybe <- 0x800026) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_37:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P730: !_LD [9] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P731: !_LD [8] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_37:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_37
nop

P732: !_LD [3] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_38:
lduw [%i1 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P733: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_38:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_38
nop

P734: !_LD [3] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_39:
lduw [%i1 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P735: !_REPLACEMENT [23] (Int)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+12], %l6
st %l6, [%i3+12]
add %i3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]

P736: !_LD [19] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_39:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_39
nop

P737: !_CASX [6] (maybe <- 0x800028) (Int) (Loop entry) (Loop exit) (LE) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_40:
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
sllx %l6, 32, %o5
or %l6, %o5, %l6 
and %l7, %l6, %o5
srlx %o5, 8, %o5
sllx %l7, 8, %l7
and %l7, %l6, %l7
or %l7, %o5, %l7 
sethi %hi(0xffff0000), %l6
srlx %l7, 16, %o5
andn %o5, %l6, %o5
andn %l7, %l6, %l7
sllx %l7, 16, %l7
or %l7, %o5, %l7 
srlx %l7, 32, %o5
sllx %l7, 32, %l7
or %l7, %o5, %o5 
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldxa [%i3] %asi, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
mov %l3, %l6
mov  %o5, %l3
casxa [%i3] %asi, %l6, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET737
nop
RET737:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_40:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_40
nop

P738: !_CASX [20] (maybe <- 0x80002a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_41:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_41:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_41
nop

P739: !_REPLACEMENT [15] (Int) (Loop entry) (Loop exit) (Branch target of P1055)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_42:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
loop_exit_1_42:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_42
nop
ba P740
nop

TARGET1055:
ba RET1055
nop


P740: !_CASX [3] (maybe <- 0x80002b) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_43:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P741: !_MEMBAR (Int) (Loop exit)
membar #StoreLoad
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_43:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_43
nop

P742: !_CASX [15] (maybe <- 0x80002d) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_44:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P743: !_ST [3] (maybe <- 0x80002f) (Int) (Loop exit)
stw   %l4, [%i1 + 0 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_44:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_44
nop

P744: !_CASX [23] (maybe <- 0x800030) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_45:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_45:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_45
nop

P745: !_ST [20] (maybe <- 0x800031) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_46:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4
loop_exit_1_46:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_46
nop

P746: !_MEMBAR (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_47:
membar #StoreLoad

P747: !_CASX [15] (maybe <- 0x800032) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_47:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_47
nop

P748: !_CAS [12] (maybe <- 0x800034) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_48:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%i2], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P749: !_ST [9] (maybe <- 0x800035) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_48:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_48
nop

P750: !_REPLACEMENT [4] (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_49:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET750
nop
RET750:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0


P751: !_REPLACEMENT [9] (Int) (Loop exit)
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
loop_exit_1_49:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_49
nop

P752: !_LD [0] (FP) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_50:
ld [%i0 + 0], %f0
! 1 addresses covered

P753: !_LD [16] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P754: !_LD [15] (Int) (Loop exit)
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_1_50:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_50
nop

P755: !_REPLACEMENT [8] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_51:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+12], %l7
st %l7, [%i2+12]
add %i2, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
loop_exit_1_51:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_51
nop

P756: !_CASX [1] (maybe <- 0x800036) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_52:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_52:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_52
nop

P757: !_CASX [12] (maybe <- 0x800038) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_53:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_53:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_53
nop

P758: !_LD [5] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_54:
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P759: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_54:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_54
nop

P760: !_REPLACEMENT [1] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_55:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

P761: !_CAS [5] (maybe <- 0x80003a) (Int) (Loop exit)
add %i1, 12, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_55:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_55
nop

P762: !_CASX [11] (maybe <- 0x80003b) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_56:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P763: !_PREFETCH [18] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 0], 4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_56:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_56
nop

P764: !_LD [16] (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_57:
wr %g0, 0x88, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduwa [%i3 + 4] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P765: !_LD [2] (Int) (Loop exit)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_57:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_57
nop

P766: !_CASX [11] (maybe <- 0x80003c) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_58:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P767: !_CASX [3] (maybe <- 0x80003d) (Int) (Loop exit)
ldx [%i1], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i1], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_58:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_58
nop

P768: !_REPLACEMENT [7] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_59:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+4], %l3
st %l3, [%i3+4]
add %i3, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]

P769: !_CASX [5] (maybe <- 0x80003f) (Int) (Loop exit)
add %i1, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_59:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_59
nop

P770: !_MEMBAR (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_60:
membar #StoreLoad

P771: !_ST [1] (maybe <- 0x800040) (Int) (Loop exit)
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4
loop_exit_1_60:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_60
nop

P772: !_LD [14] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_61:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P773: !_LD [23] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_61:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_61
nop

P774: !_REPLACEMENT [16] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_62:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
loop_exit_1_62:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_62
nop

P775: !_CAS [3] (maybe <- 0x800041) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_63:
lduw [%i1], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%i1], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P776: !_FLUSHI [4] (Int) (Loop exit)
flush %g0 
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_63:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_63
nop

P777: !_LD [13] (Int) (Loop entry) (Branch target of P1209)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_64:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P778
nop

TARGET1209:
ba RET1209
nop


P778: !_LD [16] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_64:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_64
nop

P779: !_ST [7] (maybe <- 0x800042) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_65:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4

P780: !_MEMBAR (Int) (Loop exit)
membar #StoreLoad
loop_exit_1_65:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_65
nop

P781: !_LD [12] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_66:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P782: !_LD [4] (Int) (Loop exit)
lduw [%i1 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_66:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_66
nop

P783: !_ST [2] (maybe <- 0x800043) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_67:
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

P784: !_MEMBAR (Int) (Loop exit)
membar #StoreLoad
loop_exit_1_67:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_67
nop

P785: !_REPLACEMENT [10] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_68:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+4], %l3
st %l3, [%i3+4]
add %i3, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
loop_exit_1_68:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_68
nop

P786: !_LD [1] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_69:
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P787: !_CASX [13] (maybe <- 0x800044) (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%i2], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

P788: !_LD [23] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_69:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_69
nop

P789: !_LD [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_70:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P790: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_70:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_70
nop

P791: !_CAS [6] (maybe <- 0x800046) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_71:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%i2], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P792: !_CASX [2] (maybe <- 0x800047) (Int) (Loop exit)
add %i0, 8, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
mov %l4, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_71:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_71
nop

P793: !_REPLACEMENT [11] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_72:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+12], %l3
st %l3, [%i3+12]
add %i3, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]

P794: !_REPLACEMENT [13] (Int) (Loop exit)
sethi %hi(0x20000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
loop_exit_1_72:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_72
nop

P795: !_PREFETCH [7] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_73:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 4], 2
loop_exit_1_73:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_73
nop

P796: !_CASX [3] (maybe <- 0x800048) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_74:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_74:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_74
nop

P797: !_CAS [23] (maybe <- 0x80004a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_75:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_75:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_75
nop

P798: !_CAS [22] (maybe <- 0x80004b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_76:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_76:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_76
nop

P799: !_CASX [5] (maybe <- 0x80004c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_77:
add %i1, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_77:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_77
nop

P800: !_CASX [15] (maybe <- 0x80004d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_78:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_78:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_78
nop

P801: !_LD [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_79:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P802: !_CASX [14] (maybe <- 0x80004f) (Int) (CBR)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov  %l3, %l6
mov %l4, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET802
nop
RET802:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P803: !_LD [10] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_79:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_79
nop

P804: !_CASX [15] (maybe <- 0x800050) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_80:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P805: !_ST [12] (maybe <- 0x40000001) (FP) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_80:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_80
nop

P806: !_ST [9] (maybe <- 0x800052) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_81:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
loop_exit_1_81:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_81
nop

P807: !_CAS [17] (maybe <- 0x800053) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_82:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 12, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET807
nop
RET807:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_82:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_82
nop

P808: !_CASX [6] (maybe <- 0x800054) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_83:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P809: !_LD [16] (Int) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 4] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P810: !_LD [4] (Int) (Loop exit)
lduw [%i1 + 4], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_83:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_83
nop

P811: !_LD [12] (FP) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_84:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 0], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_1_84:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_84
nop

P812: !_REPLACEMENT [23] (Int) (Loop entry) (Branch target of P823)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_85:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+12], %o5
st %o5, [%i2+12]
add %i2, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
ba P813
nop

TARGET823:
ba RET823
nop


P813: !_CASX [0] (maybe <- 0x800056) (Int) (Loop exit)
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_85:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_85
nop

P814: !_CASX [10] (maybe <- 0x800058) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_86:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_86:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_86
nop

P815: !_LD [18] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_87:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P816: !_CASX [20] (maybe <- 0x80005a) (Int)
add %i2, 8, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov  %o5, %l3
mov %l4, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4

P817: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_87:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_87
nop

P818: !_ST [21] (maybe <- 0x80005b) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_88:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P819: !_CASX [15] (maybe <- 0x80005c) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_88:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_88
nop

P820: !_REPLACEMENT [16] (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_89:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+4], %l6
st %l6, [%i3+4]
add %i3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET820
nop
RET820:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

loop_exit_1_89:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_89
nop

P821: !_CAS [22] (maybe <- 0x80005e) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_90:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_90:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_90
nop

P822: !_LD [14] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_91:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P823: !_LD [4] (Int) (Loop exit) (CBR)
lduw [%i1 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET823
nop
RET823:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_91:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_91
nop

P824: !_CASX [4] (maybe <- 0x80005f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_92:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_92:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_92
nop

P825: !_ST [1] (maybe <- 0x800061) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_93:
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4
loop_exit_1_93:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_93
nop

P826: !_CAS [18] (maybe <- 0x800062) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_94:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i2], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_94:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_94
nop

P827: !_CASX [18] (maybe <- 0x800063) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_95:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P828: !_CASX [5] (maybe <- 0x800065) (Int) (Loop exit) (LE)
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l7, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
sllx %o5, 32, %o5
wr %g0, 0x88, %asi
add %i1, 8, %l7
ldxa [%l7] %asi, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
mov  %l3, %l6
mov  %o5, %l3
casxa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_95:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_95
nop

P829: !_CASX [7] (maybe <- 0x800066) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_96:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_96:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_96
nop

P830: !_LD [13] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_97:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P831: !_LD [10] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_97:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_97
nop

P832: !_CAS [12] (maybe <- 0x800068) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_98:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i3], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_98:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_98
nop

P833: !_CASX [9] (maybe <- 0x800069) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_99:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P834: !_CASX [0] (maybe <- 0x80006b) (Int) (Loop exit)
ldx [%i0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i0], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_99:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_99
nop

P835: !_CASX [22] (maybe <- 0x80006d) (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_100:
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
sllx %l7, 32, %l3
or %l7, %l3, %l7 
and %o5, %l7, %l3
srlx %l3, 8, %l3
sllx %o5, 8, %o5
and %o5, %l7, %o5
or %o5, %l3, %o5 
sethi %hi(0xffff0000), %l7
srlx %o5, 16, %l3
andn %l3, %l7, %l3
andn %o5, %l7, %o5
sllx %o5, 16, %o5
or %o5, %l3, %o5 
srlx %o5, 32, %l3
sllx %o5, 32, %o5
or %o5, %l3, %l3 
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldxa [%i3] %asi, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
mov %l6, %l7
mov  %l3, %l6
casxa [%i3] %asi, %l7, %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
add  %l4, 1, %l4

P836: !_LD [13] (Int)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P837: !_LD [20] (Int) (Loop exit) (Branch target of P1160)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_100:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_100
nop
ba P838
nop

TARGET1160:
ba RET1160
nop


P838: !_REPLACEMENT [17] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_101:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+12], %l6
st %l6, [%i2+12]
add %i2, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
loop_exit_1_101:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_101
nop

P839: !_CAS [16] (maybe <- 0x80006f) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_102:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P840: !_LD [3] (Int)
lduw [%i1 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P841: !_LD [7] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_102:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_102
nop

P842: !_CAS [6] (maybe <- 0x800070) (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_103:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i3], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET842
nop
RET842:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P843: !_CASX [18] (maybe <- 0x800071) (Int) (Loop exit) (Branch target of P1025)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l6
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i2], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_103:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_103
nop
ba P844
nop

TARGET1025:
ba RET1025
nop


P844: !_CASX [17] (maybe <- 0x800073) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_104:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P845: !_ST [13] (maybe <- 0x800074) (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_104:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_104
nop

P846: !_LD [5] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_105:
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P847: !_LD [9] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_105:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_105
nop

P848: !_CASX [6] (maybe <- 0x800075) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_106:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_106:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_106
nop

P849: !_PREFETCH [6] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_107:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 0], 30
loop_exit_1_107:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_107
nop

P850: !_PREFETCH [2] (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_108:
prefetch [%i0 + 12], 29

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET850
nop
RET850:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

loop_exit_1_108:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_108
nop

P851: !_PREFETCH [2] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_109:
prefetch [%i0 + 12], 21
loop_exit_1_109:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_109
nop

P852: !_LD [19] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_110:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P853: !_REPLACEMENT [18] (Int)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P854: !_LD [15] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_110:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_110
nop

P855: !_LD [14] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_111:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P856: !_LD [7] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduwa [%i2 + 4] %asi, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_111:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_111
nop

P857: !_CASX [20] (maybe <- 0x800077) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_112:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_112:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_112
nop

P858: !_LD [17] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_113:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P859: !_CASX [10] (maybe <- 0x800078) (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%i3], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

P860: !_LD [7] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_113:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_113
nop

P861: !_CASX [3] (maybe <- 0x80007a) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_114:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P862: !_CASX [12] (maybe <- 0x80007c) (Int) (Loop exit) (CBR)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET862
nop
RET862:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_114:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_114
nop

P863: !_CASX [0] (maybe <- 0x80007e) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_115:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P864: !_CAS [0] (maybe <- 0x800080) (Int) (Loop exit)
lduw [%i0], %o2
mov %o2, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l4, %l6
cas [%i0], %l7, %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_115:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_115
nop

P865: !_ST [3] (maybe <- 0x800081) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_116:
stw   %l4, [%i1 + 0 ]
add   %l4, 1, %l4
loop_exit_1_116:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_116
nop

P866: !_CASX [16] (maybe <- 0x800082) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_117:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_117:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_117
nop

P867: !_CAS [18] (maybe <- 0x800084) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_118:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i3], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P868: !_LD [6] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P869: !_LD [10] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_118:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_118
nop

P870: !_CASX [20] (maybe <- 0x800085) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_119:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P871: !_CAS [16] (maybe <- 0x800086) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %l7
lduw [%l7], %o2
mov %o2, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l6
or %l6, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_119:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_119
nop

P872: !_CASX [8] (maybe <- 0x800087) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_120:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_120:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_120
nop

P873: !_ST [14] (maybe <- 0x800088) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_121:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4

P874: !_ST [12] (maybe <- 0x800089) (Int) (Loop exit)
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
loop_exit_1_121:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_121
nop

P875: !_REPLACEMENT [6] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_122:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
loop_exit_1_122:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_122
nop

P876: !_LD [3] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_123:
lduw [%i1 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P877: !_LD [3] (Int) (Loop exit)
lduw [%i1 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_123:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_123
nop

P878: !_CASX [4] (maybe <- 0x80008a) (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_124:
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
sllx %o5, 32, %l6
or %o5, %l6, %o5 
and %l3, %o5, %l6
srlx %l6, 8, %l6
sllx %l3, 8, %l3
and %l3, %o5, %l3
or %l3, %l6, %l3 
sethi %hi(0xffff0000), %o5
srlx %l3, 16, %l6
andn %l6, %o5, %l6
andn %l3, %o5, %l3
sllx %l3, 16, %l3
or %l3, %l6, %l3 
srlx %l3, 32, %l6
sllx %l3, 32, %l3
or %l3, %l6, %l6 
wr %g0, 0x88, %asi
ldxa [%i1] %asi, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
mov %l7, %o5
mov  %l6, %l7
casxa [%i1] %asi, %o5, %l7
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
add  %l4, 1, %l4

P879: !_PREFETCH [13] (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 4], 31
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_124:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_124
nop

P880: !_CAS [8] (maybe <- 0x80008c) (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_125:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
and %l4, %l6, %l3
srl %l3, 8, %l3
sll %l4, 8, %l7
and %l7, %l6, %l7
or %l7, %l3, %l7
srl %l7, 16, %l3
sll %l7, 16, %l7
srl %l7, 0, %l7
or %l7, %l3, %l7
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 12, %l6
lduwa [%l6] %asi, %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l7, %o5
casa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P881: !_REPLACEMENT [20] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+12], %l7
st %l7, [%i3+12]
add %i3, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_125:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_125
nop

P882: !_CASX [3] (maybe <- 0x80008d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_126:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_126:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_126
nop

P883: !_CASX [22] (maybe <- 0x80008f) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_127:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P884: !_REPLACEMENT [6] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_127:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_127
nop

P885: !_CASX [11] (maybe <- 0x800091) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_128:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P886: !_CASX [10] (maybe <- 0x800092) (Int) (Loop exit) (Branch target of P709)
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_128:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_128
nop
ba P887
nop

TARGET709:
ba RET709
nop


P887: !_REPLACEMENT [8] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_129:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+12], %l3
st %l3, [%i3+12]
add %i3, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
loop_exit_1_129:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_129
nop

P888: !_REPLACEMENT [14] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_130:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+12], %l3
st %l3, [%i2+12]
add %i2, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]

P889: !_CASX [3] (maybe <- 0x800094) (Int) (Loop exit)
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_130:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_130
nop

P890: !_CAS [5] (maybe <- 0x800096) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_131:
add %i1, 12, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P891: !_CASX [11] (maybe <- 0x800097) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
mov %l4, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_131:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_131
nop

P892: !_ST [4] (maybe <- 0x800098) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_132:
stw   %l4, [%i1 + 4 ]
add   %l4, 1, %l4

P893: !_ST [11] (maybe <- 0x800099) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4
loop_exit_1_132:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_132
nop

P894: !_CASX [2] (maybe <- 0x80009a) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_133:
add %i0, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P895: !_CASX [8] (maybe <- 0x80009b) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
mov %l4, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_133:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_133
nop

P896: !_CASX [2] (maybe <- 0x80009c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_134:
add %i0, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_134:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_134
nop

P897: !_REPLACEMENT [4] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_135:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P898: !_CASX [23] (maybe <- 0x80009d) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_135:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_135
nop

P899: !_REPLACEMENT [9] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_136:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
loop_exit_1_136:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_136
nop

P900: !_CAS [11] (maybe <- 0x80009e) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_137:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P901: !_REPLACEMENT [19] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_137:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_137
nop

P902: !_ST [5] (maybe <- 0x80009f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_138:
stw   %l4, [%i1 + 12 ]
add   %l4, 1, %l4
loop_exit_1_138:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_138
nop

P903: !_PREFETCH [11] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_139:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 12], 23

P904: !_CASX [17] (maybe <- 0x8000a0) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_139:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_139
nop

P905: !_LD [12] (FP) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_140:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 0], %f0
! 1 addresses covered

P906: !_CASX [19] (maybe <- 0x8000a1) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_1_140:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_140
nop

P907: !_REPLACEMENT [23] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_141:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+12], %l3
st %l3, [%i3+12]
add %i3, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
loop_exit_1_141:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_141
nop

P908: !_CASX [2] (maybe <- 0x8000a3) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_142:
add %i0, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P909: !_CASX [2] (maybe <- 0x8000a4) (Int) (Loop exit)
add %i0, 8, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
mov %l4, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_142:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_142
nop

P910: !_CASX [22] (maybe <- 0x8000a5) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_143:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P911: !_MEMBAR (Int) (Loop exit)
membar #StoreLoad
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_143:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_143
nop

P912: !_CASX [18] (maybe <- 0x8000a7) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_144:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P913: !_CAS [13] (maybe <- 0x8000a9) (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 4, %l6
lduw [%l6], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o2(lower)
srl %o5, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_144:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_144
nop

P914: !_LD [5] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_145:
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P915: !_REPLACEMENT [15] (Int) (Branch target of P1056)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
ba P916
nop

TARGET1056:
ba RET1056
nop


P916: !_LD [0] (Int) (Loop exit)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_145:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_145
nop

P917: !_REPLACEMENT [9] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_146:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P918: !_LD [7] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P919: !_LD [4] (Int) (Loop exit)
lduw [%i1 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_146:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_146
nop

P920: !_LD [2] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_147:
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P921: !_LD [22] (Int) (Loop exit) (Branch target of P1269)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_147:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_147
nop
ba P922
nop

TARGET1269:
ba RET1269
nop


P922: !_LD [23] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_148:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P923: !_CASX [6] (maybe <- 0x8000aa) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%i2], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

P924: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_148:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_148
nop

P925: !_ST [13] (maybe <- 0x8000ac) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_149:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4
loop_exit_1_149:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_149
nop

P926: !_LD [5] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_150:
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P927: !_LD [16] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_150:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_150
nop

P928: !_CASX [5] (maybe <- 0x8000ad) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_151:
add %i1, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P929: !_CASX [17] (maybe <- 0x8000ae) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l6
mov %l4, %o3
casx [%l7], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_151:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_151
nop

P930: !_LD [2] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_152:
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P931: !_LD [3] (Int) (Loop exit)
lduw [%i1 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_152:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_152
nop

P932: !_CASX [22] (maybe <- 0x8000af) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_153:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P933: !_CASX [5] (maybe <- 0x8000b1) (Int) (Loop exit)
add %i1, 8, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
mov %l4, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_153:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_153
nop

P934: !_CASX [5] (maybe <- 0x8000b2) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_154:
add %i1, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_154:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_154
nop

P935: !_LD [22] (FP) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_155:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
ld [%i3 + 4], %f0
! 1 addresses covered

P936: !_ST [7] (maybe <- 0x8000b3) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_1_155:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_155
nop

P937: !_ST [14] (maybe <- 0x8000b4) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_156:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
loop_exit_1_156:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_156
nop

P938: !_LD [16] (FP) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_157:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 4], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_1_157:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_157
nop

P939: !_LD [16] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_158:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P940: !_LD [14] (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_158:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_158
nop

P941: !_REPLACEMENT [20] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_159:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+12], %l6
st %l6, [%i3+12]
add %i3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
loop_exit_1_159:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_159
nop

P942: !_LD [21] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_160:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P943: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_160:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_160
nop

P944: !_ST [0] (maybe <- 0x8000b5) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_161:
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P945: !_CASX [0] (maybe <- 0x8000b6) (Int) (Loop exit)
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_161:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_161
nop

P946: !_CASX [0] (maybe <- 0x8000b8) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_162:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_162:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_162
nop

P947: !_REPLACEMENT [14] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_163:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+12], %o5
st %o5, [%i3+12]
add %i3, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]

P948: !_CASX [15] (maybe <- 0x8000ba) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_163:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_163
nop

P949: !_LD [4] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_164:
lduw [%i1 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P950: !_LD [10] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_164:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_164
nop

P951: !_LD [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_165:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P952: !_LD [18] (Int) (Loop exit)
lduw [%i2 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_165:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_165
nop

P953: !_CASX [6] (maybe <- 0x8000bc) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_166:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_166:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_166
nop

P954: !_ST [13] (maybe <- 0x8000be) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_167:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4

P955: !_CASX [16] (maybe <- 0x8000bf) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_167:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_167
nop

P956: !_ST [16] (maybe <- 0x8000c1) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_168:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
loop_exit_1_168:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_168
nop

P957: !_CASX [19] (maybe <- 0x8000c2) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_169:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P958: !_LD [22] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P959: !_LD [17] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_169:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_169
nop

P960: !_CASX [6] (maybe <- 0x8000c4) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_170:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P961: !_CASX [19] (maybe <- 0x8000c6) (Int) (Loop exit) (LE)
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
sllx %l6, 32, %o5
or %l6, %o5, %l6 
and %l7, %l6, %o5
srlx %o5, 8, %o5
sllx %l7, 8, %l7
and %l7, %l6, %l7
or %l7, %o5, %l7 
sethi %hi(0xffff0000), %l6
srlx %l7, 16, %o5
andn %o5, %l6, %o5
andn %l7, %l6, %l7
sllx %l7, 16, %l7
or %l7, %o5, %l7 
srlx %l7, 32, %o5
sllx %l7, 32, %l7
or %l7, %o5, %o5 
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldxa [%i3] %asi, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
! move %l3(upper) -> %o2(lower)
srlx %l3, 32, %l6
or %l6, %o2, %o2
mov %l3, %l6
mov  %o5, %l3
casxa [%i3] %asi, %l6, %l3
! move %l3(lower) -> %o3(upper)
sllx %l3, 32, %o3
! move %l3(upper) -> %o3(lower)
srlx %l3, 32, %l6
or %l6, %o3, %o3
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_170:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_170
nop

P962: !_CASX [1] (maybe <- 0x8000c8) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_171:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P963: !_REPLACEMENT [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_171:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_171
nop

P964: !_CASX [20] (maybe <- 0x8000ca) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_172:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_172:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_172
nop

P965: !_REPLACEMENT [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_173:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P966: !_CASX [17] (maybe <- 0x8000cb) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_173:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_173
nop

P967: !_REPLACEMENT [23] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_174:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+12], %l6
st %l6, [%i2+12]
add %i2, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]

P968: !_ST [16] (maybe <- 0x8000cc) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4
loop_exit_1_174:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_174
nop

P969: !_CASX [17] (maybe <- 0x8000cd) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_175:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P970: !_CASX [22] (maybe <- 0x8000ce) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_175:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_175
nop

P971: !_CASX [2] (maybe <- 0x8000d0) (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_176:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
and %l4, %l3, %o5
srl %o5, 8, %o5
sll %l4, 8, %l6
and %l6, %l3, %l6
or %l6, %o5, %l6
srl %l6, 16, %o5
sll %l6, 16, %l6
srl %l6, 0, %l6
or %l6, %o5, %l6
sllx %l6, 32, %l6
wr %g0, 0x88, %asi
add %i0, 8, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
mov  %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
add  %l4, 1, %l4

P972: !_LD [18] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P973: !_LD [6] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_176:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_176
nop

P974: !_CASX [5] (maybe <- 0x8000d1) (Int) (Loop entry) (Branch target of P1139)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_177:
add %i1, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
ba P975
nop

TARGET1139:
ba RET1139
nop


P975: !_CASX [13] (maybe <- 0x8000d2) (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_177:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_177
nop

P976: !_CASX [4] (maybe <- 0x8000d4) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_178:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P977: !_CASX [13] (maybe <- 0x8000d6) (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_178:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_178
nop

P978: !_CASX [18] (maybe <- 0x8000d8) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_179:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_179:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_179
nop

P979: !_LD [5] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_180:
!-- Aliased access: Adjusting base register for region 1 (%i1) to use alias #1
!Logical addr: 5 

sethi %hi(0x200000), %o5
sub   %i1, %o5, %i1
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P980: !_CAS [8] (maybe <- 0x8000da) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P981: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5

sethi %hi(0x200000), %l3
add   %i1, %l3, %i1
!-- End Aliased access: base register for region 1 (%i1) restored
loop_exit_1_180:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_180
nop

P982: !_REPLACEMENT [10] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_181:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+4], %o5
st %o5, [%i2+4]
add %i2, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
loop_exit_1_181:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_181
nop

P983: !_CASX [14] (maybe <- 0x8000db) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_182:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P984: !_PREFETCH [20] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 12], 23
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_182:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_182
nop

P985: !_CASX [15] (maybe <- 0x8000dc) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_183:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_183:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_183
nop

P986: !_CASX [5] (maybe <- 0x8000de) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_184:
add %i1, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_184:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_184
nop

P987: !_ST [16] (maybe <- 0x40000002) (FP) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_185:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 4 ]
loop_exit_1_185:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_185
nop

P988: !_LD [8] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_186:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P989: !_MEMBAR (Int)
membar #StoreLoad

P990: !_LD [22] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduwa [%i2 + 4] %asi, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_186:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_186
nop

P991: !_ST [0] (maybe <- 0x8000df) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_187:
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P992: !_CAS [14] (maybe <- 0x8000e0) (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_187:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_187
nop

P993: !_PREFETCH [22] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_188:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 4], 20

P994: !_PREFETCH [5] (Int) (Loop exit)
prefetch [%i1 + 12], 22
loop_exit_1_188:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_188
nop

P995: !_FLUSHI [23] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_189:
flush %g0 

P996: !_ST [11] (maybe <- 0x8000e1) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
loop_exit_1_189:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_189
nop

P997: !_LD [13] (FP) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_190:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 4], %f0
! 1 addresses covered

P998: !_CASX [4] (maybe <- 0x8000e2) (Int) (Loop exit)
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_1_190:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_190
nop

P999: !_FLUSHI [14] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_191:
flush %g0 

P1000: !_ST [17] (maybe <- 0x8000e4) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
loop_exit_1_191:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_191
nop

P1001: !_REPLACEMENT [3] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_192:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P1002: !_ST [11] (maybe <- 0x8000e5) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
loop_exit_1_192:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_192
nop

P1003: !_LD [23] (FP) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_193:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ld [%i2 + 12], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_1_193:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_193
nop

P1004: !_CAS [20] (maybe <- 0x8000e6) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_194:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P1005: !_CASX [2] (maybe <- 0x8000e7) (Int) (Loop exit)
add %i0, 8, %l3
ldx [%l3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %o5
mov %l4, %o2
casx [%l3], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_194:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_194
nop

P1006: !_CASX [0] (maybe <- 0x8000e8) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_195:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1007: !_CAS [18] (maybe <- 0x8000ea) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %o5
cas [%i2], %l3, %o5
! move %o5(lower) -> %o2(lower)
srl %o5, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_195:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_195
nop

P1008: !_REPLACEMENT [17] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_196:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+12], %o5
st %o5, [%i3+12]
add %i3, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
loop_exit_1_196:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_196
nop

P1009: !_LD [6] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_197:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1010: !_LD [8] (Int) (Loop exit)
lduw [%i2 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_197:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_197
nop

P1011: !_CAS [11] (maybe <- 0x8000eb) (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_198:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l7
srl %l7, 8, %l7
sll %l4, 8, %l3
and %l3, %o5, %l3
or %l3, %l7, %l3
srl %l3, 16, %l7
sll %l3, 16, %l3
srl %l3, 0, %l3
or %l3, %l7, %l3
wr %g0, 0x88, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %o5
lduwa [%o5] %asi, %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l3, %l6
casa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_198:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_198
nop

P1012: !_ST [13] (maybe <- 0x40000003) (FP) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_199:
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 4 ]

P1013: !_REPLACEMENT [20] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+12], %l3
st %l3, [%i3+12]
add %i3, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
loop_exit_1_199:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_199
nop

P1014: !_CASX [11] (maybe <- 0x8000ec) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_200:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_200:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_200
nop

P1015: !_LD [21] (Int) (Loop entry) (Branch target of P862)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_201:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P1016
nop

TARGET862:
ba RET862
nop


P1016: !_LD [13] (Int) (Loop exit)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_201:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_201
nop

P1017: !_CASX [18] (maybe <- 0x8000ed) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_202:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1018: !_LD [7] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1019: !_LD [19] (Int) (Loop exit)
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_202:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_202
nop

P1020: !_CASX [1] (maybe <- 0x8000ef) (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_203:
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
sllx %l6, 32, %o5
or %l6, %o5, %l6 
and %l7, %l6, %o5
srlx %o5, 8, %o5
sllx %l7, 8, %l7
and %l7, %l6, %l7
or %l7, %o5, %l7 
sethi %hi(0xffff0000), %l6
srlx %l7, 16, %o5
andn %o5, %l6, %o5
andn %l7, %l6, %l7
sllx %l7, 16, %l7
or %l7, %o5, %l7 
srlx %l7, 32, %o5
sllx %l7, 32, %l7
or %l7, %o5, %o5 
wr %g0, 0x88, %asi
ldxa [%i0] %asi, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
mov %l3, %l6
mov  %o5, %l3
casxa [%i0] %asi, %l6, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_203:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_203
nop

P1021: !_LD [3] (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_204:
wr %g0, 0x88, %asi
lduwa [%i1 + 0] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1022: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_204:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_204
nop

P1023: !_LD [9] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_205:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1024: !_CASX [2] (maybe <- 0x8000f1) (Int) (CBR)
add %i0, 8, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov  %l3, %l6
mov %l4, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1024
nop
RET1024:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1025: !_LD [12] (Int) (Loop exit) (CBR)
sethi %hi(REGION4_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1025
nop
RET1025:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_205:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_205
nop

P1026: !_ST [9] (maybe <- 0x8000f2) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_206:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1027: !_CASX [19] (maybe <- 0x8000f3) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_206:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_206
nop

P1028: !_CASX [3] (maybe <- 0x8000f5) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_207:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1029: !_CASX [17] (maybe <- 0x8000f7) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
mov %l4, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_207:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_207
nop

P1030: !_LD [6] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_208:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1031: !_LD [17] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_208:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_208
nop

P1032: !_CAS [11] (maybe <- 0x8000f8) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_209:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P1033: !_LD [15] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1034: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_209:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_209
nop

P1035: !_CAS [21] (maybe <- 0x8000f9) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_210:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%i2], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_210:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_210
nop

P1036: !_LD [2] (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_211:
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1036
nop
RET1036:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1037: !_PREFETCH [20] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 12], 1

P1038: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_211:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_211
nop

P1039: !_CASX [15] (maybe <- 0x8000fa) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_212:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_212:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_212
nop

P1040: !_PREFETCH [2] (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_213:
wr %g0, 0x88, %asi
prefetcha [%i0 + 12] %asi, 18
loop_exit_1_213:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_213
nop

P1041: !_ST [11] (maybe <- 0x8000fc) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_214:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
loop_exit_1_214:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_214
nop

P1042: !_REPLACEMENT [17] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_215:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+12], %l3
st %l3, [%i2+12]
add %i2, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]

P1043: !_CASX [13] (maybe <- 0x8000fd) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_215:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_215
nop

P1044: !_REPLACEMENT [5] (Int) (Loop entry) (Loop exit) (Branch target of P750)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_216:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+12], %l6
st %l6, [%i2+12]
add %i2, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
loop_exit_1_216:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_216
nop
ba P1045
nop

TARGET750:
ba RET750
nop


P1045: !_CASX [10] (maybe <- 0x8000ff) (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_217:
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
sllx %o5, 32, %l6
or %o5, %l6, %o5 
and %l3, %o5, %l6
srlx %l6, 8, %l6
sllx %l3, 8, %l3
and %l3, %o5, %l3
or %l3, %l6, %l3 
sethi %hi(0xffff0000), %o5
srlx %l3, 16, %l6
andn %l6, %o5, %l6
andn %l3, %o5, %l3
sllx %l3, 16, %l3
or %l3, %l6, %l3 
srlx %l3, 32, %l6
sllx %l3, 32, %l3
or %l3, %l6, %l6 
wr %g0, 0x88, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldxa [%i3] %asi, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
mov %l7, %o5
mov  %l6, %l7
casxa [%i3] %asi, %o5, %l7
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
add  %l4, 1, %l4

P1046: !_CASX [0] (maybe <- 0x800101) (Int) (Loop exit) (LE)
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
sllx %o5, 32, %l6
or %o5, %l6, %o5 
and %l3, %o5, %l6
srlx %l6, 8, %l6
sllx %l3, 8, %l3
and %l3, %o5, %l3
or %l3, %l6, %l3 
sethi %hi(0xffff0000), %o5
srlx %l3, 16, %l6
andn %l6, %o5, %l6
andn %l3, %o5, %l3
sllx %l3, 16, %l3
or %l3, %l6, %l3 
srlx %l3, 32, %l6
sllx %l3, 32, %l3
or %l3, %l6, %l6 
wr %g0, 0x88, %asi
ldxa [%i0] %asi, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
! move %l7(upper) -> %o2(lower)
srlx %l7, 32, %o5
or %o5, %o2, %o2
mov %l7, %o5
mov  %l6, %l7
casxa [%i0] %asi, %o5, %l7
! move %l7(lower) -> %o3(upper)
sllx %l7, 32, %o3
! move %l7(upper) -> %o3(lower)
srlx %l7, 32, %o5
or %o5, %o3, %o3
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_217:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_217
nop

P1047: !_LD [12] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_218:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1048: !_ST [9] (maybe <- 0x800103) (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1049: !_LD [16] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_218:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_218
nop

P1050: !_CASX [9] (maybe <- 0x800104) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_219:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_219:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_219
nop

P1051: !_CASX [21] (maybe <- 0x800106) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_220:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1052: !_MEMBAR (Int) (Loop exit)
membar #StoreLoad
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_220:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_220
nop

P1053: !_REPLACEMENT [20] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_221:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+12], %l3
st %l3, [%i3+12]
add %i3, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
loop_exit_1_221:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_221
nop

P1054: !_ST [0] (maybe <- 0x800108) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_222:
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P1055: !_CASX [1] (maybe <- 0x800109) (Int) (Loop exit) (CBR) (Branch target of P807)
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1055
nop
RET1055:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_222:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_222
nop
ba P1056
nop

TARGET807:
ba RET807
nop


P1056: !_PREFETCH [21] (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_223:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 0], 23

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1056
nop
RET1056:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

loop_exit_1_223:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_223
nop

P1057: !_CASX [0] (maybe <- 0x80010b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_224:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_224:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_224
nop

P1058: !_CASX [6] (maybe <- 0x80010d) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_225:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1059: !_CAS [3] (maybe <- 0x80010f) (Int) (Loop exit)
lduw [%i1], %o2
mov %o2, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l4, %l6
cas [%i1], %l7, %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_225:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_225
nop

P1060: !_LD [22] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_226:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1061: !_LD [2] (Int) (Loop exit)
lduw [%i0 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_226:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_226
nop

P1062: !_CAS [20] (maybe <- 0x800110) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_227:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_227:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_227
nop

P1063: !_CASX [4] (maybe <- 0x800111) (Int) (Loop entry) (Branch target of P697)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_228:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
ba P1064
nop

TARGET697:
ba RET697
nop


P1064: !_REPLACEMENT [0] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_228:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_228
nop

P1065: !_CASX [22] (maybe <- 0x800113) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_229:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_229:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_229
nop

P1066: !_REPLACEMENT [11] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_230:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+12], %l3
st %l3, [%i2+12]
add %i2, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
loop_exit_1_230:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_230
nop

P1067: !_ST [17] (maybe <- 0x800115) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_231:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
loop_exit_1_231:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_231
nop

P1068: !_ST [11] (maybe <- 0x800116) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_232:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4

P1069: !_ST [16] (maybe <- 0x800117) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4
loop_exit_1_232:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_232
nop

P1070: !_LD [10] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_233:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1071: !_REPLACEMENT [8] (Int)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+12], %l6
st %l6, [%i3+12]
add %i3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]

P1072: !_LD [0] (Int) (Loop exit)
lduw [%i0 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_233:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_233
nop

P1073: !_CASX [17] (maybe <- 0x800118) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_234:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_234:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_234
nop

P1074: !_CASX [23] (maybe <- 0x800119) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_235:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_235:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_235
nop

P1075: !_CASX [23] (maybe <- 0x80011a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_236:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_236:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_236
nop

P1076: !_CASX [13] (maybe <- 0x80011b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_237:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_237:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_237
nop

P1077: !_ST [11] (maybe <- 0x80011d) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_238:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4

P1078: !_REPLACEMENT [1] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
loop_exit_1_238:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_238
nop

P1079: !_CASX [12] (maybe <- 0x80011e) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_239:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1080: !_CASX [20] (maybe <- 0x800120) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
mov %l4, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_239:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_239
nop

P1081: !_CASX [16] (maybe <- 0x800121) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_240:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1082: !_LD [7] (Int) (Branch target of P842)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
ba P1083
nop

TARGET842:
ba RET842
nop


P1083: !_LD [0] (Int) (Loop exit)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_240:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_240
nop

P1084: !_CASX [13] (maybe <- 0x800123) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_241:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_241:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_241
nop

P1085: !_PREFETCH [4] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_242:
prefetch [%i1 + 4], 1

P1086: !_CASX [15] (maybe <- 0x800125) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_242:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_242
nop

P1087: !_ST [8] (maybe <- 0x800127) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_243:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4

P1088: !_CASX [20] (maybe <- 0x800128) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_243:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_243
nop

P1089: !_CASX [5] (maybe <- 0x800129) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_244:
add %i1, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_244:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_244
nop

P1090: !_FLUSHI [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_245:
flush %g0 

P1091: !_LD [15] (Int) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 0] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1092: !_LD [9] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_245:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_245
nop

P1093: !_PREFETCH [7] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_246:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 4], 31

P1094: !_ST [18] (maybe <- 0x80012a) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
loop_exit_1_246:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_246
nop

P1095: !_CAS [14] (maybe <- 0x80012b) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_247:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 12, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1096: !_MEMBAR (Int) (Loop exit) (Branch target of P1156)
membar #StoreLoad
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_247:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_247
nop
ba P1097
nop

TARGET1156:
ba RET1156
nop


P1097: !_FLUSHI [13] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_248:
flush %g0 
loop_exit_1_248:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_248
nop

P1098: !_LD [7] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_249:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1099: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_249:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_249
nop

P1100: !_CAS [13] (maybe <- 0x80012c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_250:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_250:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_250
nop

P1101: !_LD [6] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_251:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1102: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_251:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_251
nop

P1103: !_LD [17] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_252:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1104: !_LD [4] (Int) (Loop exit)
lduw [%i1 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_252:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_252
nop

P1105: !_CASX [12] (maybe <- 0x80012d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_253:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_253:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_253
nop

P1106: !_REPLACEMENT [14] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_254:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+12], %o5
st %o5, [%i2+12]
add %i2, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]

P1107: !_CASX [6] (maybe <- 0x80012f) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_254:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_254
nop

P1108: !_ST [18] (maybe <- 0x800131) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_255:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P1109: !_LD [12] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1110: !_LD [18] (Int) (Loop exit)
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_255:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_255
nop

P1111: !_CASX [11] (maybe <- 0x800132) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_256:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1112: !_CASX [7] (maybe <- 0x800133) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_256:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_256
nop

P1113: !_CASX [9] (maybe <- 0x800135) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_257:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_257:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_257
nop

P1114: !_LD [12] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_258:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1115: !_LD [6] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_258:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_258
nop

P1116: !_CAS [15] (maybe <- 0x800137) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_259:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%i3], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P1117: !_PREFETCH [5] (Int) (Loop exit)
prefetch [%i1 + 12], 1
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_259:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_259
nop

P1118: !_LD [21] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_260:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1119: !_LD [16] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_260:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_260
nop

P1120: !_CASX [22] (maybe <- 0x800138) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_261:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_261:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_261
nop

P1121: !_CASX [10] (maybe <- 0x80013a) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_262:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1122: !_PREFETCH [20] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetcha [%i2 + 12] %asi, 4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_262:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_262
nop

P1123: !_LD [13] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_263:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1124: !_LD [18] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_263:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_263
nop

P1125: !_CASX [12] (maybe <- 0x80013c) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_264:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1126: !_CASX [11] (maybe <- 0x80013e) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l7
mov %l4, %o3
casx [%o5], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_264:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_264
nop

P1127: !_REPLACEMENT [7] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_265:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+4], %l6
st %l6, [%i3+4]
add %i3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
loop_exit_1_265:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_265
nop

P1128: !_LD [8] (FP) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_266:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS2_O), %i2
sub %i0, %i2, %i2
ld [%i2 + 12], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_1_266:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_266
nop

P1129: !_LD [11] (Int) (Loop entry) (Branch target of P1036)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_267:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P1130
nop

TARGET1036:
ba RET1036
nop


P1130: !_CASX [19] (maybe <- 0x80013f) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%i2], %l7, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
add  %l4, 1, %l4

P1131: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_267:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_267
nop

P1132: !_LD [15] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_268:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1133: !_CAS [13] (maybe <- 0x800141) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1134: !_LD [10] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_268:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_268
nop

P1135: !_ST [1] (maybe <- 0x800142) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_269:
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4
loop_exit_1_269:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_269
nop

P1136: !_LD [12] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_270:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1137: !_CASX [12] (maybe <- 0x800143) (Int)
ldx [%i2], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%i2], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4

P1138: !_LD [13] (Int) (Loop exit)
lduw [%i2 + 4], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_270:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_270
nop

P1139: !_LD [4] (Int) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_271:
lduw [%i1 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1139
nop
RET1139:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1140: !_LD [2] (Int) (Loop exit) (Branch target of P713)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_271:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_271
nop
ba P1141
nop

TARGET713:
ba RET713
nop


P1141: !_CASX [12] (maybe <- 0x800145) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_272:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1142: !_ST [2] (maybe <- 0x800147) (Int) (Loop exit)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_272:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_272
nop

P1143: !_LD [17] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_273:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1144: !_LD [13] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_273:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_273
nop

P1145: !_CASX [12] (maybe <- 0x800148) (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_274:
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
sllx %l7, 32, %l3
or %l7, %l3, %l7 
and %o5, %l7, %l3
srlx %l3, 8, %l3
sllx %o5, 8, %o5
and %o5, %l7, %o5
or %o5, %l3, %o5 
sethi %hi(0xffff0000), %l7
srlx %o5, 16, %l3
andn %l3, %l7, %l3
andn %o5, %l7, %o5
sllx %o5, 16, %o5
or %o5, %l3, %o5 
srlx %o5, 32, %l3
sllx %o5, 32, %o5
or %o5, %l3, %l3 
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldxa [%i2] %asi, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
mov %l6, %l7
mov  %l3, %l6
casxa [%i2] %asi, %l7, %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
add  %l4, 1, %l4

P1146: !_CASX [10] (maybe <- 0x80014a) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_274:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_274
nop

P1147: !_LD [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_275:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1148: !_CASX [20] (maybe <- 0x80014c) (Int)
add %i2, 8, %l7
ldx [%l7], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov  %l3, %l6
mov %l4, %l3
casx [%l7], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

P1149: !_LD [23] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_275:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_275
nop

P1150: !_CASX [23] (maybe <- 0x80014d) (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_276:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
and %l4, %l6, %l3
srl %l3, 8, %l3
sll %l4, 8, %l7
and %l7, %l6, %l7
or %l7, %l3, %l7
srl %l7, 16, %l3
sll %l7, 16, %l7
srl %l7, 0, %l7
or %l7, %l3, %l7
sllx %l7, 32, %l7
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l6
ldxa [%l6] %asi, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
mov  %o5, %l3
mov  %l7, %o5
casxa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_276:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_276
nop

P1151: !_CASX [15] (maybe <- 0x80014e) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_277:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_277:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_277
nop

P1152: !_CAS [11] (maybe <- 0x800150) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_278:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 12, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1153: !_REPLACEMENT [7] (Int) (Loop exit)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+4], %l3
st %l3, [%i3+4]
add %i3, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_278:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_278
nop

P1154: !_LD [9] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_279:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1155: !_LD [4] (Int) (Loop exit)
lduw [%i1 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_279:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_279
nop

P1156: !_REPLACEMENT [15] (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_280:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1156
nop
RET1156:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

loop_exit_1_280:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_280
nop

P1157: !_PREFETCH [21] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_281:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 0], 21

P1158: !_CASX [4] (maybe <- 0x800151) (Int) (Loop exit)
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_281:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_281
nop

P1159: !_CASX [15] (maybe <- 0x800153) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_282:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1160: !_CASX [22] (maybe <- 0x800155) (Int) (Loop exit) (CBR)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1160
nop
RET1160:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_282:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_282
nop

P1161: !_ST [14] (maybe <- 0x800157) (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_283:
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
and %l4, %l3, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l3, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
stwa   %o5, [%i3 + 12] %asi
add   %l4, 1, %l4
loop_exit_1_283:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_283
nop

P1162: !_FLUSHI [22] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_284:
flush %g0 
loop_exit_1_284:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_284
nop

P1163: !_CASX [10] (maybe <- 0x800158) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_285:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_285:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_285
nop

P1164: !_REPLACEMENT [17] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_286:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+12], %o5
st %o5, [%i3+12]
add %i3, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]

P1165: !_LD [7] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1166: !_LD [18] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_286:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_286
nop

P1167: !_PREFETCH [11] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_287:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 12], 19

P1168: !_CASX [6] (maybe <- 0x80015a) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_287:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_287
nop

P1169: !_CAS [13] (maybe <- 0x80015c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_288:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_288:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_288
nop

P1170: !_ST [14] (maybe <- 0x80015d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_289:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
loop_exit_1_289:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_289
nop

P1171: !_CASX [7] (maybe <- 0x80015e) (Int) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_290:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1171
nop
RET1171:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1172: !_REPLACEMENT [3] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_290:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_290
nop

P1173: !_REPLACEMENT [20] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_291:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+12], %o5
st %o5, [%i2+12]
add %i2, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]

P1174: !_LD [17] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1175: !_LD [11] (Int) (Loop exit) (Branch target of P802)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_291:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_291
nop
ba P1176
nop

TARGET802:
ba RET802
nop


P1176: !_REPLACEMENT [1] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_292:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
loop_exit_1_292:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_292
nop

P1177: !_LD [7] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_293:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1178: !_LD [21] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_293:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_293
nop

P1179: !_LD [10] (Int) (Loop entry) (Branch target of P737)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_294:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P1180
nop

TARGET737:
ba RET737
nop


P1180: !_LD [10] (Int) (Loop exit)
lduw [%i2 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_294:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_294
nop

P1181: !_REPLACEMENT [11] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_295:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+12], %l6
st %l6, [%i3+12]
add %i3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
loop_exit_1_295:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_295
nop

P1182: !_CASX [11] (maybe <- 0x800160) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_296:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_296:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_296
nop

P1183: !_CASX [2] (maybe <- 0x800161) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_297:
add %i0, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_297:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_297
nop

P1184: !_CASX [5] (maybe <- 0x800162) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_298:
add %i1, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1185: !_REPLACEMENT [23] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+12], %o5
st %o5, [%i3+12]
add %i3, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_298:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_298
nop

P1186: !_CASX [7] (maybe <- 0x800163) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_299:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_299:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_299
nop

P1187: !_CAS [12] (maybe <- 0x800165) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_300:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%i3], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1188: !_CASX [5] (maybe <- 0x800166) (Int) (Loop exit) (LE)
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l7
srl %l7, 8, %l7
sll %l4, 8, %l3
and %l3, %o5, %l3
or %l3, %l7, %l3
srl %l3, 16, %l7
sll %l3, 16, %l3
srl %l3, 0, %l3
or %l3, %l7, %l3
sllx %l3, 32, %l3
wr %g0, 0x88, %asi
add %i1, 8, %o5
ldxa [%o5] %asi, %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
mov  %l6, %l7
mov  %l3, %l6
casxa [%o5] %asi, %l7, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
! move %l6(upper) -> %o2(lower)
srlx %l6, 32, %l7
or %l7, %o2, %o2
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_300:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_300
nop

P1189: !_CAS [4] (maybe <- 0x800167) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_301:
add %i1, 4, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_301:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_301
nop

P1190: !_PREFETCH [2] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_302:
prefetch [%i0 + 12], 22
loop_exit_1_302:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_302
nop

P1191: !_LD [21] (FP) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_303:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ld [%i2 + 0], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_1_303:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_303
nop

P1192: !_CAS [21] (maybe <- 0x800168) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_304:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%i3], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1193: !_REPLACEMENT [8] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+12], %l3
st %l3, [%i2+12]
add %i2, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_304:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_304
nop

P1194: !_REPLACEMENT [6] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_305:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P1195: !_CASX [22] (maybe <- 0x800169) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_305:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_305
nop

P1196: !_CASX [21] (maybe <- 0x80016b) (Int) (Loop entry) (CBR) (Branch target of P704)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_306:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1196
nop
RET1196:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

ba P1197
nop

TARGET704:
ba RET704
nop


P1197: !_CAS [1] (maybe <- 0x80016d) (Int) (Loop exit)
add %i0, 4, %l3
lduw [%l3], %o2
mov %o2, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %o5
or %o5, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_306:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_306
nop

P1198: !_CASX [15] (maybe <- 0x80016e) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_307:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_307:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_307
nop

P1199: !_LD [0] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_308:
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1200: !_CAS [9] (maybe <- 0x800170) (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%i3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1201: !_LD [18] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_308:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_308
nop

P1202: !_CASX [9] (maybe <- 0x800171) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_309:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1203: !_CAS [11] (maybe <- 0x800173) (Int) (Loop exit)
add %i3, 12, %o5
lduw [%o5], %o2
mov %o2, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_309:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_309
nop

P1204: !_CASX [14] (maybe <- 0x800174) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_310:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1205: !_LD [20] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1206: !_LD [20] (Int) (Loop exit)
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_310:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_310
nop

P1207: !_CASX [20] (maybe <- 0x800175) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_311:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_311:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_311
nop

P1208: !_CAS [5] (maybe <- 0x800176) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_312:
add %i1, 12, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P1209: !_CASX [21] (maybe <- 0x800177) (Int) (Loop exit) (CBR)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l6
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i3], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1209
nop
RET1209:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_312:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_312
nop

P1210: !_CASX [3] (maybe <- 0x800179) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_313:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_313:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_313
nop

P1211: !_LD [4] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_314:
lduw [%i1 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1212: !_LD [18] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_314:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_314
nop

P1213: !_ST [3] (maybe <- 0x80017b) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_315:
stw   %l4, [%i1 + 0 ]
add   %l4, 1, %l4

P1214: !_LD [4] (Int) (Branch target of P1171)
lduw [%i1 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P1215
nop

TARGET1171:
ba RET1171
nop


P1215: !_LD [6] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_315:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_315
nop

P1216: !_LD [22] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_316:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1217: !_LD [9] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_316:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_316
nop

P1218: !_CASX [20] (maybe <- 0x80017c) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_317:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1219: !_LD [11] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1220: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_317:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_317
nop

P1221: !_LD [0] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_318:
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1222: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_318:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_318
nop

P1223: !_CASX [12] (maybe <- 0x80017d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_319:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_319:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_319
nop

P1224: !_LD [8] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_320:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1225: !_LD [0] (Int) (Loop exit)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_320:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_320
nop

P1226: !_LD [3] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_321:
lduw [%i1 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1227: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_321:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_321
nop

P1228: !_REPLACEMENT [19] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_322:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

P1229: !_ST [23] (maybe <- 0x40000004) (FP) (Loop exit) (CBR)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS1_O), %i3
sub %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 12 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1229
nop
RET1229:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

loop_exit_1_322:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_322
nop

P1230: !_ST [10] (maybe <- 0x80017f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_323:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
loop_exit_1_323:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_323
nop

P1231: !_PREFETCH [7] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_324:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 4], 23
loop_exit_1_324:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_324
nop

P1232: !_MEMBAR (Int) (Loop entry) (Loop exit) (Branch target of P1024)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_325:
membar #StoreLoad
loop_exit_1_325:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_325
nop
ba P1233
nop

TARGET1024:
ba RET1024
nop


P1233: !_LD [13] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_326:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1234: !_CAS [10] (maybe <- 0x800180) (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1235: !_LD [21] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_326:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_326
nop

P1236: !_REPLACEMENT [9] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_327:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P1237: !_ST [5] (maybe <- 0x800181) (Int) (Loop exit) (CBR)
stw   %l4, [%i1 + 12 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1237
nop
RET1237:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

loop_exit_1_327:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_327
nop

P1238: !_LD [0] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_328:
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1239: !_REPLACEMENT [11] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+12], %o5
st %o5, [%i2+12]
add %i2, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]

P1240: !_LD [6] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_328:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_328
nop

P1241: !_CASX [22] (maybe <- 0x800182) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_329:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_329:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_329
nop

P1242: !_CASX [14] (maybe <- 0x800184) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_330:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_330:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_330
nop

P1243: !_LD [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_331:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1244: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_331:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_331
nop

P1245: !_ST [11] (maybe <- 0x40000005) (FP) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_332:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 12 ]
loop_exit_1_332:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_332
nop

P1246: !_LD [0] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_333:
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1247: !_CASX [9] (maybe <- 0x800185) (Int) (Branch target of P1252)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%i2], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4
ba P1248
nop

TARGET1252:
ba RET1252
nop


P1248: !_LD [2] (Int) (Loop exit) (CBR)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1248
nop
RET1248:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_333:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_333
nop

P1249: !_CASX [12] (maybe <- 0x800187) (Int) (Loop entry) (Branch target of P820)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_334:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
ba P1250
nop

TARGET820:
ba RET820
nop


P1250: !_CASX [15] (maybe <- 0x800189) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_334:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_334
nop

P1251: !_LD [11] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_335:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1252: !_LD [15] (Int) (Loop exit) (CBR) (Branch target of P1229)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1252
nop
RET1252:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_335:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_335
nop
ba P1253
nop

TARGET1229:
ba RET1229
nop


P1253: !_LD [6] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_336:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1254: !_LD [18] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_336:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_336
nop

P1255: !_REPLACEMENT [9] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_337:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
loop_exit_1_337:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_337
nop

P1256: !_CASX [1] (maybe <- 0x80018b) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_338:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1257: !_LD [16] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1258: !_LD [17] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
lduwa [%i2 + 12] %asi, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_338:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_338
nop

P1259: !_CASX [11] (maybe <- 0x80018d) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_339:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1260: !_CASX [0] (maybe <- 0x80018e) (Int) (Loop exit)
ldx [%i0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i0], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_339:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_339
nop

P1261: !_ST [21] (maybe <- 0x40000006) (FP) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_340:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i2
sub %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]

P1262: !_CAS [14] (maybe <- 0x800190) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_340:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_340
nop

P1263: !_REPLACEMENT [18] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_341:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
loop_exit_1_341:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_341
nop

P1264: !_REPLACEMENT [10] (Int) (Loop entry) (Branch target of P1196)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_342:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+4], %l3
st %l3, [%i3+4]
add %i3, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
ba P1265
nop

TARGET1196:
ba RET1196
nop


P1265: !_CASX [16] (maybe <- 0x800191) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_342:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_342
nop

P1266: !_REPLACEMENT [8] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_343:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+12], %l3
st %l3, [%i3+12]
add %i3, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]

P1267: !_REPLACEMENT [2] (Int) (Loop exit)
sethi %hi(0x20000), %l6
ld [%i3+12], %o5
st %o5, [%i3+12]
add %i3, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
loop_exit_1_343:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_343
nop

P1268: !_REPLACEMENT [7] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_344:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+4], %o5
st %o5, [%i2+4]
add %i2, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

P1269: !_CASX [4] (maybe <- 0x800193) (Int) (Loop exit) (CBR)
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1269
nop
RET1269:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_344:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_344
nop

P1270: !_PREFETCH [22] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_345:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 4], 23
loop_exit_1_345:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_345
nop

P1271: !_CASX [13] (maybe <- 0x800195) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_346:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1272: !_CASX [6] (maybe <- 0x800197) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %o5
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_346:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_346
nop

P1273: !_CASX [14] (maybe <- 0x800199) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_347:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1274: !_REPLACEMENT [13] (Int) (Loop exit)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_347:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_347
nop

P1275: !_REPLACEMENT [6] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_348:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
loop_exit_1_348:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_348
nop

P1276: !_CASX [13] (maybe <- 0x80019a) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_349:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1277: !_CASX [2] (maybe <- 0x80019c) (Int) (Loop exit)
add %i0, 8, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
mov %l4, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_349:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_349
nop

P1278: !_CASX [23] (maybe <- 0x80019d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_350:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_350:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_350
nop

P1279: !_CASX [5] (maybe <- 0x80019e) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_351:
add %i1, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_351:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_351
nop

P1280: !_CASX [18] (maybe <- 0x80019f) (Int) (Loop entry) (Loop exit) (Branch target of P1248)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_352:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_352:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_352
nop
ba P1281
nop

TARGET1248:
ba RET1248
nop


P1281: !_REPLACEMENT [22] (Int) (Loop entry) (Loop exit) (Branch target of P1237)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_353:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
loop_exit_1_353:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_353
nop
ba P1282
nop

TARGET1237:
ba RET1237
nop


P1282: !_LD [1] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_354:
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1283: !_LD [8] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_354:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_354
nop

P1284: !_PREFETCH [8] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_355:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 12], 1
loop_exit_1_355:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_355
nop

P1285: !_CASX [2] (maybe <- 0x8001a1) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_356:
add %i0, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_356:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_356
nop

P1286: !_LD [13] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_357:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1287: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_357:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_357
nop

P1288: !_LD [5] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_358:
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1289: !_CASX [21] (maybe <- 0x8001a2) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%i2], %l7, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
add  %l4, 1, %l4

P1290: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_358:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_358
nop

P1291: !_LD [14] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_359:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1292: !_LD [13] (Int) (Loop exit)
lduw [%i2 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_359:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_359
nop

P1293: !_CASX [9] (maybe <- 0x8001a4) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_360:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_360:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_360
nop

P1294: !_CASX [22] (maybe <- 0x8001a6) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_361:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_361:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_361
nop

P1295: !_CASX [10] (maybe <- 0x8001a8) (Int) (Loop entry) (Loop exit) (Branch target of P725)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_362:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_362:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_362
nop
ba P1296
nop

TARGET725:
ba RET725
nop


P1296: !_CASX [0] (maybe <- 0x8001aa) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_363:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_363:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_363
nop

P1297: !_CASX [14] (maybe <- 0x8001ac) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_364:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_364:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_364
nop

P1298: !_CASX [9] (maybe <- 0x8001ad) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_365:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1299: !_LD [18] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1300: !_LD [22] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_365:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_365
nop

P1301: !_ST [5] (maybe <- 0x8001af) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_366:
stw   %l4, [%i1 + 12 ]
add   %l4, 1, %l4
loop_exit_1_366:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_366
nop

P1302: !_CASX [14] (maybe <- 0x8001b0) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_367:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_367:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_367
nop

P1303: !_CASX [14] (maybe <- 0x8001b1) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_368:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_368:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_368
nop

P1304: !_CASX [4] (maybe <- 0x8001b2) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_369:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1305: !_CASX [0] (maybe <- 0x8001b4) (Int) (Loop exit)
ldx [%i0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %o5
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i0], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_1_369:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_369
nop

P1306: !_CASX [2] (maybe <- 0x8001b6) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_370:
add %i0, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_370:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_370
nop

P1307: !_LD [11] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_371:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1308: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_371:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_371
nop

P1309: !_CASX [4] (maybe <- 0x8001b7) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_372:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1310: !_CAS [2] (maybe <- 0x8001b9) (Int) (Loop exit)
add %i0, 12, %o5
lduw [%o5], %o2
mov %o2, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_1_372:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_372
nop

P1311: !_REPLACEMENT [11] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_373:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+12], %l6
st %l6, [%i3+12]
add %i3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
loop_exit_1_373:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_373
nop

P1312: !_LD [15] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_374:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1313: !_MEMBAR (Int)
membar #StoreLoad

P1314: !_LD [6] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_374:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_374
nop

P1315: !_CASX [15] (maybe <- 0x8001ba) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_375:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_375:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_375
nop

P1316: !_LD [14] (FP) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_376:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ld [%i3 + 12], %f0
! 1 addresses covered

P1317: !_CAS [13] (maybe <- 0x8001bc) (Int) (Loop exit)
add %i3, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_1_376:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_376
nop

P1318: !_CASX [18] (maybe <- 0x8001bd) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_377:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_1_377:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_377
nop

P1319: !_CAS [5] (maybe <- 0x8001bf) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_1_378:
add %i1, 12, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_378:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_378
nop

P1320: !_CAS [9] (maybe <- 0x8001c0) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_1_379:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i3], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_1_379:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_1_379
nop

P1321: !_MEMBAR (Int)
membar #StoreLoad

END_NODES1: ! Test instruction sequence for CPU 1 ends
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
sethi %hi(0xdead0e0f), %l6
or    %l6, %lo(0xdead0e0f), %l6
stw %l6, [%i5] 
ld [%i5], %f0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 : base registers for first 2 regions
! %i2 %i3 : cache registers for 8 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %i4 holds the instructions count which is used for interrupt ordering
! %i4 holds the thread_id (OBP only) 
! %l5 holds the moving pointer for interrupt bonus data (OBP only). Conflicts with RTL/simulation usage
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func2:
! instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Reinitialize i4 to 0. i4 will be used to keep the count of analyzable node info
mov 0x0, %i4

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l3
or    %l3, %lo(0xdeadbee0), %l3
stw   %l3, [%i5]
sethi %hi(0xdeadbee1), %l3
or    %l3, %lo(0xdeadbee1), %l3
stw   %l3, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x02deade1), %l3
or    %l3, %lo(0x02deade1), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1000001), %l4
or    %l4, %lo(0x1000001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x40800001), %l3
or    %l3, %lo(0x40800001), %l3
stw %l3, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x35000000), %l3
or    %l3, %lo(0x35000000), %l3
stw %l3, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x6ccd^4
sethi %hi(0x6ccd), %l0
or    %l0, %lo(0x6ccd), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

BEGIN_NODES2: ! Test instruction sequence for ISTREAM 2 begins

P1322: !_LD [19] (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_0:
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduwa [%i2 + 4] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1323: !_CASX [4] (maybe <- 0x1000001) (Int)
ldx [%i1], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%i1], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P1324: !_LD [6] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_0
nop

P1325: !_CASX [0] (maybe <- 0x1000003) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_1:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1326: !_ST [7] (maybe <- 0x1000005) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_1:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_1
nop

P1327: !_CASX [2] (maybe <- 0x1000006) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_2:
add %i0, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_2:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_2
nop

P1328: !_CASX [12] (maybe <- 0x1000007) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_3:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_3:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_3
nop

P1329: !_CASX [7] (maybe <- 0x1000009) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_4:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_4:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_4
nop

P1330: !_PREFETCH [20] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_5:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 12], 30

P1331: !_PREFETCH [14] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 12], 3
loop_exit_2_5:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_5
nop

P1332: !_CASX [5] (maybe <- 0x100000b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_6:
add %i1, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_6:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_6
nop

P1333: !_CASX [16] (maybe <- 0x100000c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_7:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_7:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_7
nop

P1334: !_CASX [23] (maybe <- 0x100000e) (Int) (Loop entry) (Loop exit) (Branch target of P1849)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_8:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_8:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_8
nop
ba P1335
nop

TARGET1849:
ba RET1849
nop


P1335: !_CASX [18] (maybe <- 0x100000f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_9:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_9:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_9
nop

P1336: !_CASX [20] (maybe <- 0x1000011) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_10:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1337: !_CASX [16] (maybe <- 0x1000012) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_10:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_10
nop

P1338: !_CASX [13] (maybe <- 0x1000014) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_11:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1339: !_CASX [20] (maybe <- 0x1000016) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
mov %l4, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_11:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_11
nop

P1340: !_CASX [2] (maybe <- 0x1000017) (Int) (Loop entry) (Loop exit) (Branch target of P1354)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_12:
add %i0, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_12:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_12
nop
ba P1341
nop

TARGET1354:
ba RET1354
nop


P1341: !_CAS [7] (maybe <- 0x1000018) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_13:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P1342: !_CASX [21] (maybe <- 0x1000019) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l6
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i3], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_13:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_13
nop

P1343: !_CAS [22] (maybe <- 0x100001b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_14:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_14:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_14
nop

P1344: !_CASX [20] (maybe <- 0x100001c) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_15:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1344
nop
RET1344:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_15:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_15
nop

P1345: !_CASX [17] (maybe <- 0x100001d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_16:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_16:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_16
nop

P1346: !_CAS [3] (maybe <- 0x100001e) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_17:
lduw [%i1], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%i1], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1347: !_ST [13] (maybe <- 0x100001f) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_17:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_17
nop

P1348: !_CAS [9] (maybe <- 0x1000020) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_18:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%i2], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1349: !_CASX [19] (maybe <- 0x1000021) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l7
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i3], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_18:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_18
nop

P1350: !_LD [21] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_19:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1351: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_19:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_19
nop

P1352: !_CAS [23] (maybe <- 0x1000023) (Int) (Loop entry) (Loop exit) (Branch target of P1587)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_20:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_20:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_20
nop
ba P1353
nop

TARGET1587:
ba RET1587
nop


P1353: !_CASX [17] (maybe <- 0x1000024) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_21:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1354: !_CAS [1] (maybe <- 0x1000025) (Int) (Loop exit) (CBR)
add %i0, 4, %l7
lduw [%l7], %o2
mov %o2, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l6
or %l6, %o2, %o2
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1354
nop
RET1354:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_21:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_21
nop

P1355: !_CASX [21] (maybe <- 0x1000026) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_22:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_22:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_22
nop

P1356: !_CASX [2] (maybe <- 0x1000028) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_23:
add %i0, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_23:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_23
nop

P1357: !_CASX [21] (maybe <- 0x1000029) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_24:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1358: !_CASX [10] (maybe <- 0x100002b) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_24:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_24
nop

P1359: !_CASX [4] (maybe <- 0x100002d) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_25:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1360: !_CASX [19] (maybe <- 0x100002f) (Int) (Loop exit) (CBR)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1360
nop
RET1360:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_25:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_25
nop

P1361: !_PREFETCH [12] (Int) (Loop entry) (Branch target of P1523)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_26:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 0], 0
ba P1362
nop

TARGET1523:
ba RET1523
nop


P1362: !_REPLACEMENT [18] (Int) (Loop exit)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
loop_exit_2_26:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_26
nop

P1363: !_ST [20] (maybe <- 0x1000031) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_27:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4

P1364: !_REPLACEMENT [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
loop_exit_2_27:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_27
nop

P1365: !_CASX [9] (maybe <- 0x1000032) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_28:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1366: !_LD [0] (Int)
lduw [%i0 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1367: !_LD [13] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_28:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_28
nop

P1368: !_CASX [10] (maybe <- 0x1000034) (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_29:
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
sllx %l3, 32, %l7
or %l3, %l7, %l3 
and %l6, %l3, %l7
srlx %l7, 8, %l7
sllx %l6, 8, %l6
and %l6, %l3, %l6
or %l6, %l7, %l6 
sethi %hi(0xffff0000), %l3
srlx %l6, 16, %l7
andn %l7, %l3, %l7
andn %l6, %l3, %l6
sllx %l6, 16, %l6
or %l6, %l7, %l6 
srlx %l6, 32, %l7
sllx %l6, 32, %l6
or %l6, %l7, %l7 
wr %g0, 0x88, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldxa [%i3] %asi, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
mov %o5, %l3
mov  %l7, %o5
casxa [%i3] %asi, %l3, %o5
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_29:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_29
nop

P1369: !_CASX [4] (maybe <- 0x1000036) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_30:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_30:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_30
nop

P1370: !_CASX [6] (maybe <- 0x1000038) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_31:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_31:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_31
nop

P1371: !_PREFETCH [1] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_32:
prefetch [%i0 + 4], 2
loop_exit_2_32:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_32
nop

P1372: !_REPLACEMENT [14] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_33:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+12], %l7
st %l7, [%i3+12]
add %i3, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]

P1373: !_CASX [8] (maybe <- 0x100003a) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_33:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_33
nop

P1374: !_ST [4] (maybe <- 0x100003b) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_34:
stw   %l4, [%i1 + 4 ]
add   %l4, 1, %l4

P1375: !_LD [15] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1376: !_LD [9] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_34:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_34
nop

P1377: !_PREFETCH [5] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_35:
prefetch [%i1 + 12], 16

P1378: !_CAS [2] (maybe <- 0x100003c) (Int) (Loop exit)
add %i0, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_35:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_35
nop

P1379: !_LD [11] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_36:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1380: !_CASX [2] (maybe <- 0x100003d) (Int) (CBR)
add %i0, 8, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov  %l7, %o5
mov %l4, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1380
nop
RET1380:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1381: !_LD [10] (Int) (Loop exit)
lduw [%i3 + 4], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_36:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_36
nop

P1382: !_ST [9] (maybe <- 0x40800001) (FP) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_37:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]
loop_exit_2_37:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_37
nop

P1383: !_ST [8] (maybe <- 0x100003e) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_38:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4

P1384: !_CASX [14] (maybe <- 0x100003f) (Int) (Loop exit) (Branch target of P1633)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_38:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_38
nop
ba P1385
nop

TARGET1633:
ba RET1633
nop


P1385: !_CASX [23] (maybe <- 0x1000040) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_39:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1386: !_ST [10] (maybe <- 0x1000041) (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_39:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_39
nop

P1387: !_CASX [23] (maybe <- 0x1000042) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_40:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_40:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_40
nop

P1388: !_CASX [20] (maybe <- 0x1000043) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_41:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1389: !_CASX [3] (maybe <- 0x1000044) (Int) (Loop exit)
ldx [%i1], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i1], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_41:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_41
nop

P1390: !_CASX [2] (maybe <- 0x1000046) (Int) (Loop entry) (Loop exit) (Branch target of P1380)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_42:
add %i0, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_42:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_42
nop
ba P1391
nop

TARGET1380:
ba RET1380
nop


P1391: !_CAS [3] (maybe <- 0x1000047) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_43:
lduw [%i1], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%i1], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P1392: !_PREFETCH [5] (Int) (Loop exit)
prefetch [%i1 + 12], 17
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_43:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_43
nop

P1393: !_MEMBAR (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_44:
membar #StoreLoad
loop_exit_2_44:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_44
nop

P1394: !_CASX [3] (maybe <- 0x1000048) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_45:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_45:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_45
nop

P1395: !_LD [14] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_46:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1396: !_CASX [16] (maybe <- 0x100004a) (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%i2], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4

P1397: !_LD [4] (Int) (Loop exit)
lduw [%i1 + 4], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_46:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_46
nop

P1398: !_LD [1] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_47:
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1399: !_CAS [17] (maybe <- 0x100004c) (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %l7
lduw [%l7], %l3
mov %l3, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
mov %l4, %o1
cas [%l7], %l6, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1400: !_LD [17] (Int) (Loop exit)
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o1(lower)
or %l7, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_47:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_47
nop

P1401: !_REPLACEMENT [10] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_48:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P1402: !_CAS [2] (maybe <- 0x100004d) (Int) (Loop exit)
add %i0, 12, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_48:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_48
nop

P1403: !_LD [19] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_49:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1404: !_LD [18] (Int) (Loop exit)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_49:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_49
nop

P1405: !_REPLACEMENT [4] (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_50:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+4], %o5
st %o5, [%i2+4]
add %i2, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1405
nop
RET1405:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

loop_exit_2_50:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_50
nop

P1406: !_LD [17] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_51:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1407: !_REPLACEMENT [16] (Int)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P1408: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_51:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_51
nop

P1409: !_LD [22] (Int) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_52:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1409
nop
RET1409:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1410: !_LD [20] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_52:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_52
nop

P1411: !_CASX [4] (maybe <- 0x100004e) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_53:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_53:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_53
nop

P1412: !_LD [22] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_54:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1413: !_CAS [2] (maybe <- 0x1000050) (Int)
add %i0, 12, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1414: !_LD [9] (Int) (Loop exit) (Branch target of P1405)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_54:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_54
nop
ba P1415
nop

TARGET1405:
ba RET1405
nop


P1415: !_ST [16] (maybe <- 0x1000051) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_55:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4

P1416: !_CASX [14] (maybe <- 0x1000052) (Int) (Loop exit) (LE)
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l7, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
sllx %o5, 32, %o5
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l7
ldxa [%l7] %asi, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
mov  %l3, %l6
mov  %o5, %l3
casxa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_55:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_55
nop

P1417: !_REPLACEMENT [3] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_56:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
loop_exit_2_56:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_56
nop

P1418: !_CASX [3] (maybe <- 0x1000053) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_57:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1419: !_CASX [21] (maybe <- 0x1000055) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_57:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_57
nop

P1420: !_LD [3] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_58:
lduw [%i1 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1421: !_LD [0] (Int) (Loop exit)
lduw [%i0 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_58:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_58
nop

P1422: !_CAS [10] (maybe <- 0x1000057) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_59:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 4, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_59:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_59
nop

P1423: !_CASX [12] (maybe <- 0x1000058) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_60:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_60:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_60
nop

P1424: !_CASX [8] (maybe <- 0x100005a) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_61:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1425: !_CASX [13] (maybe <- 0x100005b) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_61:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_61
nop

P1426: !_LD [8] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_62:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1427: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_62:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_62
nop

P1428: !_CASX [1] (maybe <- 0x100005d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_63:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_63:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_63
nop

P1429: !_CAS [2] (maybe <- 0x100005f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_64:
add %i0, 12, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_64:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_64
nop

P1430: !_CASX [8] (maybe <- 0x1000060) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_65:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1431: !_PREFETCH [5] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
prefetcha [%i1 + 12] %asi, 20
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_65:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_65
nop

P1432: !_REPLACEMENT [14] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_66:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+12], %l6
st %l6, [%i2+12]
add %i2, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
loop_exit_2_66:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_66
nop

P1433: !_REPLACEMENT [4] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_67:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+4], %l6
st %l6, [%i3+4]
add %i3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

P1434: !_CAS [4] (maybe <- 0x1000061) (Int) (Loop exit)
add %i1, 4, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_67:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_67
nop

P1435: !_LD [2] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_68:
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1436: !_LD [3] (Int) (Loop exit) (CBR)
lduw [%i1 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1436
nop
RET1436:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_68:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_68
nop

P1437: !_LD [15] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_69:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1438: !_LD [17] (Int) (Loop exit)
lduw [%i2 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_69:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_69
nop

P1439: !_CASX [7] (maybe <- 0x1000062) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_70:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1440: !_ST [21] (maybe <- 0x1000064) (Int) (Loop exit) (LE) (Branch target of P1789)
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i2
sub %i0, %i2, %i2
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l3
srl %l3, 8, %l3
sll %l4, 8, %l7
and %l7, %o5, %l7
or %l7, %l3, %l7
srl %l7, 16, %l3
sll %l7, 16, %l7
srl %l7, 0, %l7
or %l7, %l3, %l7
stwa   %l7, [%i2 + 0] %asi
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_70:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_70
nop
ba P1441
nop

TARGET1789:
ba RET1789
nop


P1441: !_REPLACEMENT [9] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_71:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P1442: !_LD [13] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1443: !_LD [13] (Int) (Loop exit)
lduw [%i2 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_71:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_71
nop

P1444: !_CASX [7] (maybe <- 0x1000065) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_72:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1444
nop
RET1444:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_72:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_72
nop

P1445: !_REPLACEMENT [15] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_73:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
loop_exit_2_73:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_73
nop

P1446: !_ST [13] (maybe <- 0x1000067) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_74:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4
loop_exit_2_74:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_74
nop

P1447: !_REPLACEMENT [20] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_75:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+12], %l7
st %l7, [%i2+12]
add %i2, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]

P1448: !_CASX [0] (maybe <- 0x1000068) (Int) (Loop exit)
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_75:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_75
nop

P1449: !_REPLACEMENT [14] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_76:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+12], %o5
st %o5, [%i3+12]
add %i3, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]

P1450: !_REPLACEMENT [1] (Int) (Loop exit)
sethi %hi(0x20000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
loop_exit_2_76:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_76
nop

P1451: !_LD [10] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_77:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1452: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_77:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_77
nop

P1453: !_LD [15] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_78:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1454: !_LD [2] (Int) (Loop exit)
lduw [%i0 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_78:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_78
nop

P1455: !_LD [1] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_79:
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1456: !_LD [10] (Int) (Loop exit) (Branch target of P1409)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_79:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_79
nop
ba P1457
nop

TARGET1409:
ba RET1409
nop


P1457: !_MEMBAR (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_80:
membar #StoreLoad
loop_exit_2_80:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_80
nop

P1458: !_CAS [18] (maybe <- 0x100006a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_81:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i3], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_81:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_81
nop

P1459: !_CASX [15] (maybe <- 0x100006b) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_82:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1460: !_REPLACEMENT [19] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_82:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_82
nop

P1461: !_LD [1] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_83:
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1462: !_LD [8] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_83:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_83
nop

P1463: !_CAS [3] (maybe <- 0x100006d) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_84:
lduw [%i1], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%i1], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1464: !_CASX [3] (maybe <- 0x100006e) (Int) (Loop exit)
ldx [%i1], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l7
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i1], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_84:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_84
nop

P1465: !_REPLACEMENT [2] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_85:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+12], %l6
st %l6, [%i3+12]
add %i3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
loop_exit_2_85:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_85
nop

P1466: !_CASX [14] (maybe <- 0x1000070) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_86:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1467: !_CASX [13] (maybe <- 0x1000071) (Int) (Loop exit)
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %o5
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_86:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_86
nop

P1468: !_ST [14] (maybe <- 0x1000073) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_87:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
loop_exit_2_87:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_87
nop

P1469: !_REPLACEMENT [20] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_88:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+12], %l7
st %l7, [%i2+12]
add %i2, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
loop_exit_2_88:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_88
nop

P1470: !_CASX [22] (maybe <- 0x1000074) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_89:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1471: !_LD [12] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1472: !_LD [20] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_89:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_89
nop

P1473: !_LD [18] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_90:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1474: !_LD [21] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_90:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_90
nop

P1475: !_CASX [3] (maybe <- 0x1000076) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_91:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_91:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_91
nop

P1476: !_CASX [20] (maybe <- 0x1000078) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_92:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_92:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_92
nop

P1477: !_LD [12] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_93:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1478: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_93:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_93
nop

P1479: !_CASX [5] (maybe <- 0x1000079) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_94:
add %i1, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1480: !_REPLACEMENT [14] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+12], %o5
st %o5, [%i2+12]
add %i2, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_94:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_94
nop

P1481: !_CASX [5] (maybe <- 0x100007a) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_95:
add %i1, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1482: !_CAS [19] (maybe <- 0x100007b) (Int) (Loop exit) (Branch target of P1749)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
add %i3, 4, %l7
lduw [%l7], %o2
mov %o2, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l6
or %l6, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_95:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_95
nop
ba P1483
nop

TARGET1749:
ba RET1749
nop


P1483: !_REPLACEMENT [21] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_96:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P1484: !_CASX [21] (maybe <- 0x100007c) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_96:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_96
nop

P1485: !_CASX [10] (maybe <- 0x100007e) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_97:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1486: !_CAS [13] (maybe <- 0x1000080) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 4, %o5
lduw [%o5], %o2
mov %o2, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_97:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_97
nop

P1487: !_ST [4] (maybe <- 0x1000081) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_98:
stw   %l4, [%i1 + 4 ]
add   %l4, 1, %l4

P1488: !_CASX [17] (maybe <- 0x1000082) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_98:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_98
nop

P1489: !_FLUSHI [20] (Int) (Loop entry) (Loop exit) (Branch target of P1856)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_99:
flush %g0 
loop_exit_2_99:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_99
nop
ba P1490
nop

TARGET1856:
ba RET1856
nop


P1490: !_LD [11] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_100:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1491: !_ST [6] (maybe <- 0x1000083) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P1492: !_LD [14] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_100:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_100
nop

P1493: !_LD [11] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_101:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1494: !_CASX [10] (maybe <- 0x1000084) (Int)
ldx [%i2], %l6
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %l6, %l7
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
casx [%i2], %l7, %l6
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
add  %l4, 1, %l4

P1495: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_101:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_101
nop

P1496: !_ST [10] (maybe <- 0x1000086) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_102:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4

P1497: !_CASX [22] (maybe <- 0x1000087) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_102:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_102
nop

P1498: !_CASX [22] (maybe <- 0x1000089) (Int) (Loop entry) (Branch target of P1961)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_103:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
ba P1499
nop

TARGET1961:
ba RET1961
nop


P1499: !_LD [5] (FP) (Loop exit)
ld [%i1 + 12], %f0
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_103:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_103
nop

P1500: !_ST [12] (maybe <- 0x40800002) (FP) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_104:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]
loop_exit_2_104:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_104
nop

P1501: !_ST [11] (maybe <- 0x100008b) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_105:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4

P1502: !_LD [16] (Int) (CBR) (Branch target of P1360)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1502
nop
RET1502:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

ba P1503
nop

TARGET1360:
ba RET1360
nop


P1503: !_LD [20] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_105:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_105
nop

P1504: !_LD [12] (FP) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_106:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ld [%i2 + 0], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_106:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_106
nop

P1505: !_LD [12] (Int) (Loop entry) (Branch target of P1951)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_107:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P1506
nop

TARGET1951:
ba RET1951
nop


P1506: !_LD [11] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 12] %asi, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_107:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_107
nop

P1507: !_LD [17] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_108:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1508: !_CAS [2] (maybe <- 0x100008c) (Int) (LE)
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
and %l4, %l3, %o5
srl %o5, 8, %o5
sll %l4, 8, %l6
and %l6, %l3, %l6
or %l6, %o5, %l6
srl %l6, 16, %o5
sll %l6, 16, %l6
srl %l6, 0, %l6
or %l6, %o5, %l6
wr %g0, 0x88, %asi
add %i0, 12, %l3
lduwa [%l3] %asi, %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l6, %o1
casa [%l3] %asi, %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1509: !_LD [23] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_108:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_108
nop

P1510: !_CASX [1] (maybe <- 0x100008d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_109:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_109:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_109
nop

P1511: !_REPLACEMENT [20] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_110:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+12], %l6
st %l6, [%i3+12]
add %i3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
loop_exit_2_110:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_110
nop

P1512: !_CASX [5] (maybe <- 0x100008f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_111:
add %i1, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_111:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_111
nop

P1513: !_REPLACEMENT [15] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_112:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
loop_exit_2_112:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_112
nop

P1514: !_ST [1] (maybe <- 0x1000090) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_113:
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4
loop_exit_2_113:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_113
nop

P1515: !_REPLACEMENT [18] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_114:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P1516: !_CASX [14] (maybe <- 0x1000091) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_114:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_114
nop

P1517: !_REPLACEMENT [15] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_115:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]

P1518: !_PREFETCH [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 0], 23
loop_exit_2_115:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_115
nop

P1519: !_LD [1] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_116:
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1520: !_LD [10] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_116:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_116
nop

P1521: !_REPLACEMENT [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_117:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+0], %l3
st %l3, [%i2+0]
add %i2, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]

P1522: !_LD [10] (Int)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1523: !_LD [18] (Int) (Loop exit) (CBR)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1523
nop
RET1523:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_117:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_117
nop

P1524: !_CASX [21] (maybe <- 0x1000092) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_118:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_118:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_118
nop

P1525: !_CAS [8] (maybe <- 0x1000094) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_119:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
add %i2, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P1526: !_LD [7] (Int)
lduw [%i2 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1527: !_LD [16] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_119:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_119
nop

P1528: !_CAS [22] (maybe <- 0x1000095) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_120:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_120:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_120
nop

P1529: !_CASX [10] (maybe <- 0x1000096) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_121:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_121:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_121
nop

P1530: !_PREFETCH [19] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_122:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 4], 1
loop_exit_2_122:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_122
nop

P1531: !_CASX [15] (maybe <- 0x1000098) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_123:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1532: !_PREFETCH [14] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 12], 27
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_123:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_123
nop

P1533: !_LD [12] (Int) (Loop entry) (Branch target of P1850)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_124:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P1534
nop

TARGET1850:
ba RET1850
nop


P1534: !_LD [3] (Int) (Loop exit)
lduw [%i1 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_124:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_124
nop

P1535: !_LD [2] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_125:
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1536: !_LD [20] (Int) (Loop exit) (Branch target of P1863)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_125:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_125
nop
ba P1537
nop

TARGET1863:
ba RET1863
nop


P1537: !_LD [5] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_126:
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1538: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_126:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_126
nop

P1539: !_REPLACEMENT [9] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_127:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
loop_exit_2_127:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_127
nop

P1540: !_CAS [8] (maybe <- 0x100009a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_128:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
add %i2, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_128:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_128
nop

P1541: !_LD [9] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_129:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1542: !_CASX [12] (maybe <- 0x100009b) (Int) (Branch target of P1818)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%i2], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4
ba P1543
nop

TARGET1818:
ba RET1818
nop


P1543: !_LD [14] (Int) (Loop exit)
lduw [%i2 + 12], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_129:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_129
nop

P1544: !_LD [15] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_130:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1545: !_LD [20] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_130:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_130
nop

P1546: !_CASX [16] (maybe <- 0x100009d) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_131:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1547: !_CASX [17] (maybe <- 0x100009f) (Int) (Loop exit)
add %i3, 8, %l3
ldx [%l3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %o5
mov %l4, %o3
casx [%l3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_131:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_131
nop

P1548: !_REPLACEMENT [6] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_132:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P1549: !_LD [21] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1550: !_LD [14] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_132:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_132
nop

P1551: !_REPLACEMENT [3] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_133:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P1552: !_ST [5] (maybe <- 0x10000a0) (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
and %l4, %l3, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l3, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
stwa   %o5, [%i1 + 12] %asi
add   %l4, 1, %l4
loop_exit_2_133:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_133
nop

P1553: !_CASX [5] (maybe <- 0x10000a1) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_134:
add %i1, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_134:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_134
nop

P1554: !_CASX [2] (maybe <- 0x10000a2) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_135:
add %i0, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_135:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_135
nop

P1555: !_CASX [15] (maybe <- 0x10000a3) (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_136:
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
sllx %l6, 32, %o5
or %l6, %o5, %l6 
and %l7, %l6, %o5
srlx %o5, 8, %o5
sllx %l7, 8, %l7
and %l7, %l6, %l7
or %l7, %o5, %l7 
sethi %hi(0xffff0000), %l6
srlx %l7, 16, %o5
andn %o5, %l6, %o5
andn %l7, %l6, %l7
sllx %l7, 16, %l7
or %l7, %o5, %l7 
srlx %l7, 32, %o5
sllx %l7, 32, %l7
or %l7, %o5, %o5 
wr %g0, 0x88, %asi
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldxa [%i2] %asi, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
mov %l3, %l6
mov  %o5, %l3
casxa [%i2] %asi, %l6, %l3
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
add  %l4, 1, %l4

P1556: !_LD [6] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1557: !_LD [21] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_136:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_136
nop

P1558: !_LD [19] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_137:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1559: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_137:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_137
nop

P1560: !_CASX [15] (maybe <- 0x10000a5) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_138:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_138:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_138
nop

P1561: !_ST [13] (maybe <- 0x10000a7) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_139:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
loop_exit_2_139:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_139
nop

P1562: !_CASX [18] (maybe <- 0x10000a8) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_140:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1563: !_ST [0] (maybe <- 0x10000aa) (Int) (Loop exit)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_140:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_140
nop

P1564: !_CASX [12] (maybe <- 0x10000ab) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_141:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_141:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_141
nop

P1565: !_LD [14] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_142:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1566: !_LD [15] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_142:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_142
nop

P1567: !_LD [15] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_143:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1568: !_MEMBAR (Int)
membar #StoreLoad

P1569: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_143:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_143
nop

P1570: !_FLUSHI [21] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_144:
flush %g0 

P1571: !_PREFETCH [1] (Int) (Loop exit)
prefetch [%i0 + 4], 26
loop_exit_2_144:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_144
nop

P1572: !_CASX [18] (maybe <- 0x10000ad) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_145:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_145:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_145
nop

P1573: !_LD [23] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_146:
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1574: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_146:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_146
nop

P1575: !_LD [18] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_147:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1576: !_CASX [23] (maybe <- 0x10000af) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION7_ALIAS3_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov  %o5, %l3
mov %l4, %o5
casx [%l6], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4

P1577: !_LD [23] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_147:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_147
nop

P1578: !_REPLACEMENT [7] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_148:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
loop_exit_2_148:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_148
nop

P1579: !_LD [22] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_149:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1580: !_LD [8] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_149:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_149
nop

P1581: !_REPLACEMENT [2] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_150:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+12], %o5
st %o5, [%i3+12]
add %i3, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]

P1582: !_LD [18] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1583: !_LD [9] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_150:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_150
nop

P1584: !_REPLACEMENT [8] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_151:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+12], %o5
st %o5, [%i2+12]
add %i2, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]

P1585: !_REPLACEMENT [0] (Int) (Loop exit)
sethi %hi(0x20000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
loop_exit_2_151:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_151
nop

P1586: !_LD [2] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_152:
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1587: !_LD [23] (Int) (Loop exit) (CBR)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1587
nop
RET1587:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_152:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_152
nop

P1588: !_LD [16] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_153:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1589: !_LD [7] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_153:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_153
nop

P1590: !_CASX [11] (maybe <- 0x10000b0) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_154:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_154:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_154
nop

P1591: !_REPLACEMENT [12] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_155:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P1592: !_CASX [2] (maybe <- 0x10000b1) (Int) (Loop exit)
add %i0, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_155:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_155
nop

P1593: !_CASX [14] (maybe <- 0x10000b2) (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_156:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
and %l4, %l6, %l3
srl %l3, 8, %l3
sll %l4, 8, %l7
and %l7, %l6, %l7
or %l7, %l3, %l7
srl %l7, 16, %l3
sll %l7, 16, %l7
srl %l7, 0, %l7
or %l7, %l3, %l7
sllx %l7, 32, %l7
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l6
ldxa [%l6] %asi, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
mov  %o5, %l3
mov  %l7, %o5
casxa [%l6] %asi, %l3, %o5
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_156:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_156
nop

P1594: !_LD [17] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_157:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1595: !_ST [18] (maybe <- 0x10000b3) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P1596: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_157:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_157
nop

P1597: !_CASX [0] (maybe <- 0x10000b4) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_158:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_158:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_158
nop

P1598: !_CASX [12] (maybe <- 0x10000b6) (Int) (Loop entry) (Loop exit) (Branch target of P1781)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_159:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_159:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_159
nop
ba P1599
nop

TARGET1781:
ba RET1781
nop


P1599: !_REPLACEMENT [12] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_160:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]

P1600: !_CASX [23] (maybe <- 0x10000b8) (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_160:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_160
nop

P1601: !_ST [11] (maybe <- 0x10000b9) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_161:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
loop_exit_2_161:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_161
nop

P1602: !_CASX [21] (maybe <- 0x10000ba) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_162:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1603: !_LD [19] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1604: !_LD [10] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_162:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_162
nop

P1605: !_ST [1] (maybe <- 0x10000bc) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_163:
stw   %l4, [%i0 + 4 ]
add   %l4, 1, %l4
loop_exit_2_163:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_163
nop

P1606: !_REPLACEMENT [19] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_164:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P1607: !_CASX [5] (maybe <- 0x10000bd) (Int) (Loop exit)
add %i1, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_164:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_164
nop

P1608: !_CASX [9] (maybe <- 0x10000be) (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_165:
sllx %l4, 32, %l6
add  %l4, 1, %l4
or   %l4, %l6, %l6
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
sllx %l3, 32, %l7
or %l3, %l7, %l3 
and %l6, %l3, %l7
srlx %l7, 8, %l7
sllx %l6, 8, %l6
and %l6, %l3, %l6
or %l6, %l7, %l6 
sethi %hi(0xffff0000), %l3
srlx %l6, 16, %l7
andn %l7, %l3, %l7
andn %l6, %l3, %l6
sllx %l6, 16, %l6
or %l6, %l7, %l6 
srlx %l6, 32, %l7
sllx %l6, 32, %l6
or %l6, %l7, %l7 
wr %g0, 0x88, %asi
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldxa [%i2] %asi, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
mov %o5, %l3
mov  %l7, %o5
casxa [%i2] %asi, %l3, %o5
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
add  %l4, 1, %l4

P1609: !_CASX [11] (maybe <- 0x10000c0) (Int) (Loop exit)
add %i2, 8, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
mov %l4, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_165:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_165
nop

P1610: !_CAS [5] (maybe <- 0x10000c1) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_166:
add %i1, 12, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_166:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_166
nop

P1611: !_CASX [19] (maybe <- 0x10000c2) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_167:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1612: !_LD [4] (FP) (Loop exit)
ld [%i1 + 4], %f0
! 1 addresses covered
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_167:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_167
nop

P1613: !_CASX [23] (maybe <- 0x10000c4) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_168:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_168:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_168
nop

P1614: !_LD [2] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_169:
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1615: !_LD [16] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_169:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_169
nop

P1616: !_REPLACEMENT [10] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_170:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+4], %o5
st %o5, [%i2+4]
add %i2, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

P1617: !_REPLACEMENT [22] (Int) (Loop exit)
sethi %hi(0x20000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
loop_exit_2_170:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_170
nop

P1618: !_LD [4] (FP) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_171:
ld [%i1 + 4], %f0
! 1 addresses covered

P1619: !_CASX [12] (maybe <- 0x10000c5) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_171:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_171
nop

P1620: !_ST [8] (maybe <- 0x10000c7) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_172:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4
loop_exit_2_172:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_172
nop

P1621: !_CASX [12] (maybe <- 0x10000c8) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_173:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_173:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_173
nop

P1622: !_PREFETCH [8] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_174:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 12], 2

P1623: !_PREFETCH [16] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 4], 4
loop_exit_2_174:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_174
nop

P1624: !_LD [21] (Int) (Loop entry) (Branch target of P1933)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_175:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P1625
nop

TARGET1933:
ba RET1933
nop


P1625: !_LD [23] (Int) (Loop exit)
lduw [%i2 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_175:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_175
nop

P1626: !_CASX [11] (maybe <- 0x10000ca) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_176:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_176:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_176
nop

P1627: !_LD [19] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_177:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1628: !_CAS [1] (maybe <- 0x10000cb) (Int)
add %i0, 4, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1629: !_LD [21] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_177:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_177
nop

P1630: !_CASX [15] (maybe <- 0x10000cc) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_178:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_178:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_178
nop

P1631: !_CASX [1] (maybe <- 0x10000ce) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_179:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_179:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_179
nop

P1632: !_CAS [22] (maybe <- 0x10000d0) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_180:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_180:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_180
nop

P1633: !_CASX [14] (maybe <- 0x10000d1) (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_181:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1633
nop
RET1633:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1634: !_LD [4] (Int)
lduw [%i1 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1635: !_LD [15] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_181:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_181
nop

P1636: !_CASX [10] (maybe <- 0x10000d2) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_182:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1637: !_CASX [15] (maybe <- 0x10000d4) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %o5
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_182:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_182
nop

P1638: !_CAS [8] (maybe <- 0x10000d6) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_183:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
add %i2, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_183:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_183
nop

P1639: !_CASX [1] (maybe <- 0x10000d7) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_184:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1640: !_CAS [17] (maybe <- 0x10000d9) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %l7
lduw [%l7], %o2
mov %o2, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l6
or %l6, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_184:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_184
nop

P1641: !_CASX [4] (maybe <- 0x10000da) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_185:
!-- Aliased access: Adjusting base register for region 1 (%i1) to use alias #1
!Logical addr: 4 

sethi %hi(0x200000), %l7
sub   %i1, %l7, %i1
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5

sethi %hi(0x200000), %o5
add   %i1, %o5, %i1
!-- End Aliased access: base register for region 1 (%i1) restored
loop_exit_2_185:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_185
nop

P1642: !_CASX [5] (maybe <- 0x10000dc) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_186:
add %i1, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_186:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_186
nop

P1643: !_REPLACEMENT [12] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_187:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
loop_exit_2_187:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_187
nop

P1644: !_ST [18] (maybe <- 0x10000dd) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_188:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1645: !_ST [14] (maybe <- 0x10000de) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4
loop_exit_2_188:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_188
nop

P1646: !_REPLACEMENT [1] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_189:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
loop_exit_2_189:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_189
nop

P1647: !_CAS [23] (maybe <- 0x10000df) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_190:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P1648: !_LD [12] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P1649: !_LD [6] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_190:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_190
nop

P1650: !_PREFETCH [14] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_191:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 12], 0
loop_exit_2_191:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_191
nop

P1651: !_CASX [3] (maybe <- 0x10000e0) (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_192:
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
sllx %l7, 32, %l3
or %l7, %l3, %l7 
and %o5, %l7, %l3
srlx %l3, 8, %l3
sllx %o5, 8, %o5
and %o5, %l7, %o5
or %o5, %l3, %o5 
sethi %hi(0xffff0000), %l7
srlx %o5, 16, %l3
andn %l3, %l7, %l3
andn %o5, %l7, %o5
sllx %o5, 16, %o5
or %o5, %l3, %o5 
srlx %o5, 32, %l3
sllx %o5, 32, %o5
or %o5, %l3, %l3 
wr %g0, 0x88, %asi
ldxa [%i1] %asi, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
mov %l6, %l7
mov  %l3, %l6
casxa [%i1] %asi, %l7, %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_192:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_192
nop

P1652: !_CAS [11] (maybe <- 0x10000e2) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_193:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 12, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P1653: !_ST [0] (maybe <- 0x10000e3) (Int) (Loop exit)
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_193:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_193
nop

P1654: !_LD [13] (FP) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_194:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ld [%i3 + 4], %f0
! 1 addresses covered

P1655: !_REPLACEMENT [14] (Int) (Loop exit)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+12], %l6
st %l6, [%i2+12]
add %i2, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_194:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_194
nop

P1656: !_CAS [22] (maybe <- 0x10000e4) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_195:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4

P1657: !_CASX [18] (maybe <- 0x10000e5) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %o5
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i2], %o5, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_195:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_195
nop

P1658: !_PREFETCH [9] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_196:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 26

P1659: !_LD [13] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1660: !_LD [0] (Int) (Loop exit)
lduw [%i0 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_196:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_196
nop

P1661: !_CAS [0] (maybe <- 0x10000e7) (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_197:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l7, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
wr %g0, 0x88, %asi
lduwa [%i0] %asi, %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %o5, %l3
casa [%i0] %asi, %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_197:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_197
nop

P1662: !_ST [3] (maybe <- 0x10000e8) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_198:
stw   %l4, [%i1 + 0 ]
add   %l4, 1, %l4

P1663: !_CASX [0] (maybe <- 0x10000e9) (Int) (Loop exit)
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_198:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_198
nop

P1664: !_CASX [23] (maybe <- 0x10000eb) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_199:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1665: !_ST [12] (maybe <- 0x10000ec) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_199:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_199
nop

P1666: !_CASX [5] (maybe <- 0x10000ed) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_200:
add %i1, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_200:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_200
nop

P1667: !_REPLACEMENT [5] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_201:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+12], %l6
st %l6, [%i3+12]
add %i3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
loop_exit_2_201:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_201
nop

P1668: !_CASX [0] (maybe <- 0x10000ee) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_202:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_202:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_202
nop

P1669: !_CASX [22] (maybe <- 0x10000f0) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_203:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1669
nop
RET1669:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_203:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_203
nop

P1670: !_CASX [3] (maybe <- 0x10000f2) (Int) (Loop entry) (Loop exit) (LE) (Branch target of P1770)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_204:
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
sllx %l7, 32, %l3
or %l7, %l3, %l7 
and %o5, %l7, %l3
srlx %l3, 8, %l3
sllx %o5, 8, %o5
and %o5, %l7, %o5
or %o5, %l3, %o5 
sethi %hi(0xffff0000), %l7
srlx %o5, 16, %l3
andn %l3, %l7, %l3
andn %o5, %l7, %o5
sllx %o5, 16, %o5
or %o5, %l3, %o5 
srlx %o5, 32, %l3
sllx %o5, 32, %o5
or %o5, %l3, %l3 
wr %g0, 0x88, %asi
ldxa [%i1] %asi, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
mov %l6, %l7
mov  %l3, %l6
casxa [%i1] %asi, %l7, %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_204:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_204
nop
ba P1671
nop

TARGET1770:
ba RET1770
nop


P1671: !_CASX [10] (maybe <- 0x10000f4) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_205:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1672: !_CASX [22] (maybe <- 0x10000f6) (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %o5
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_205:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_205
nop

P1673: !_CAS [13] (maybe <- 0x10000f8) (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_206:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 4, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1673
nop
RET1673:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1674: !_REPLACEMENT [10] (Int) (Loop exit)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+4], %o5
st %o5, [%i2+4]
add %i2, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_206:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_206
nop

P1675: !_CAS [3] (maybe <- 0x10000f9) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_207:
lduw [%i1], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%i1], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1675
nop
RET1675:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_207:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_207
nop

P1676: !_ST [4] (maybe <- 0x10000fa) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_208:
stw   %l4, [%i1 + 4 ]
add   %l4, 1, %l4

P1677: !_LD [9] (FP) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 0], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_208:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_208
nop

P1678: !_LD [6] (FP) (Loop entry) (Branch target of P1708)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_209:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
ld [%i2 + 0], %f0
! 1 addresses covered
ba P1679
nop

TARGET1708:
ba RET1708
nop


P1679: !_LD [1] (Int)
lduw [%i0 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1680: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_209:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_209
nop

P1681: !_ST [15] (maybe <- 0x10000fb) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_210:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P1682: !_CASX [8] (maybe <- 0x10000fc) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_210:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_210
nop

P1683: !_ST [21] (maybe <- 0x10000fd) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_211:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P1684: !_LD [15] (Int)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1685: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_211:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_211
nop

P1686: !_CASX [9] (maybe <- 0x10000fe) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_212:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_212:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_212
nop

P1687: !_CASX [14] (maybe <- 0x1000100) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_213:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_213:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_213
nop

P1688: !_LD [11] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_214:
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1689: !_CASX [12] (maybe <- 0x1000101) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o5
! move %o5(upper) -> %o0(lower)
srlx %o5, 32, %l3
or %l3, %o0, %o0
! move %o5(lower) -> %o1(upper)
sllx %o5, 32, %o1
mov %o5, %l3
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
casx [%i3], %l3, %o5
! move %o5(upper) -> %o1(lower)
srlx %o5, 32, %l3
or %l3, %o1, %o1
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
add  %l4, 1, %l4

P1690: !_LD [21] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_214:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_214
nop

P1691: !_LD [20] (Int) (Loop entry) (Branch target of P1344)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_215:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P1692
nop

TARGET1344:
ba RET1344
nop


P1692: !_LD [22] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_215:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_215
nop

P1693: !_CAS [13] (maybe <- 0x1000103) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_216:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 4, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_216:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_216
nop

P1694: !_REPLACEMENT [8] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_217:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+12], %o5
st %o5, [%i2+12]
add %i2, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]

P1695: !_REPLACEMENT [18] (Int) (Loop exit)
sethi %hi(0x20000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
loop_exit_2_217:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_217
nop

P1696: !_CASX [20] (maybe <- 0x1000104) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_218:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1697: !_CASX [23] (maybe <- 0x1000105) (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
mov %l4, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_218:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_218
nop

P1698: !_LD [15] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_219:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1699: !_CASX [19] (maybe <- 0x1000106) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%i2], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P1700: !_LD [9] (Int) (Loop exit)
sethi %hi(REGION3_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_219:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_219
nop

P1701: !_LD [4] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_220:
lduw [%i1 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1702: !_LD [19] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduwa [%i2 + 4] %asi, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_220:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_220
nop

P1703: !_CASX [21] (maybe <- 0x1000108) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_221:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1704: !_CASX [16] (maybe <- 0x100010a) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %o5
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_221:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_221
nop

P1705: !_LD [11] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_222:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1706: !_LD [9] (Int) (Loop exit) (CBR)
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1706
nop
RET1706:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_222:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_222
nop

P1707: !_CASX [9] (maybe <- 0x100010c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_223:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_223:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_223
nop

P1708: !_CASX [10] (maybe <- 0x100010e) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_224:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1708
nop
RET1708:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_224:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_224
nop

P1709: !_CASX [19] (maybe <- 0x1000110) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_225:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_225:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_225
nop

P1710: !_REPLACEMENT [22] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_226:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+4], %l6
st %l6, [%i3+4]
add %i3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

P1711: !_CASX [12] (maybe <- 0x1000112) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_226:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_226
nop

P1712: !_CASX [1] (maybe <- 0x1000114) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_227:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_227:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_227
nop

P1713: !_LD [15] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_228:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1714: !_REPLACEMENT [8] (Int)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+12], %l3
st %l3, [%i2+12]
add %i2, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]

P1715: !_LD [23] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_228:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_228
nop

P1716: !_CASX [15] (maybe <- 0x1000116) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_229:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1717: !_LD [14] (Int) (Branch target of P1845)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
ba P1718
nop

TARGET1845:
ba RET1845
nop


P1718: !_LD [22] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_229:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_229
nop

P1719: !_CASX [7] (maybe <- 0x1000118) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_230:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1720: !_MEMBAR (Int) (Loop exit)
membar #StoreLoad
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_230:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_230
nop

P1721: !_ST [8] (maybe <- 0x100011a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_231:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4
loop_exit_2_231:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_231
nop

P1722: !_REPLACEMENT [7] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_232:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+4], %l3
st %l3, [%i3+4]
add %i3, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]

P1723: !_LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1724: !_LD [13] (Int) (Loop exit) (Branch target of P1706)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_232:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_232
nop
ba P1725
nop

TARGET1706:
ba RET1706
nop


P1725: !_CASX [9] (maybe <- 0x100011b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_233:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_233:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_233
nop

P1726: !_CASX [6] (maybe <- 0x100011d) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_234:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1727: !_CASX [6] (maybe <- 0x100011f) (Int) (Loop exit)
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %o5
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_234:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_234
nop

P1728: !_CAS [2] (maybe <- 0x1000121) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_235:
add %i0, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_235:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_235
nop

P1729: !_CASX [21] (maybe <- 0x1000122) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_236:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1730: !_CASX [22] (maybe <- 0x1000124) (Int) (Loop exit)
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_236:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_236
nop

P1731: !_CASX [7] (maybe <- 0x1000126) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_237:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_237:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_237
nop

P1732: !_CASX [5] (maybe <- 0x1000128) (Int) (Loop entry) (Loop exit) (Branch target of P1855)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_238:
add %i1, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_238:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_238
nop
ba P1733
nop

TARGET1855:
ba RET1855
nop


P1733: !_ST [10] (maybe <- 0x1000129) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_239:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4

P1734: !_CASX [17] (maybe <- 0x100012a) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_239:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_239
nop

P1735: !_CASX [8] (maybe <- 0x100012b) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_240:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1736: !_CASX [0] (maybe <- 0x100012c) (Int) (Loop exit)
ldx [%i0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i0], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_240:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_240
nop

P1737: !_CASX [12] (maybe <- 0x100012e) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_241:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_241:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_241
nop

P1738: !_CASX [21] (maybe <- 0x1000130) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_242:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_242:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_242
nop

P1739: !_CASX [11] (maybe <- 0x1000132) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_243:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_243:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_243
nop

P1740: !_LD [13] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_244:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1741: !_LD [16] (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_244:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_244
nop

P1742: !_CAS [12] (maybe <- 0x1000133) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_245:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%i3], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P1743: !_ST [23] (maybe <- 0x40800003) (FP) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 12 ]
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_245:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_245
nop

P1744: !_CAS [17] (maybe <- 0x1000134) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_246:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_246:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_246
nop

P1745: !_CAS [7] (maybe <- 0x1000135) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_247:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1746: !_CASX [20] (maybe <- 0x1000136) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l7
mov %l4, %o2
casx [%o5], %l7, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_247:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_247
nop

P1747: !_LD [21] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_248:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1748: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_248:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_248
nop

P1749: !_REPLACEMENT [9] (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_249:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1749
nop
RET1749:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P1750: !_FLUSHI [0] (Int) (Loop exit)
flush %g0 
loop_exit_2_249:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_249
nop

P1751: !_CASX [18] (maybe <- 0x1000137) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_250:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1752: !_ST [8] (maybe <- 0x1000139) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_250:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_250
nop

P1753: !_CASX [15] (maybe <- 0x100013a) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_251:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1754: !_CAS [15] (maybe <- 0x100013c) (Int) (Loop exit)
lduw [%i2], %o2
mov %o2, %l6
! move %l6(lower) -> %o2(upper)
sllx %l6, 32, %o2
mov %l4, %l3
cas [%i2], %l6, %l3
! move %l3(lower) -> %o2(lower)
srl %l3, 0, %l6
or %l6, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_251:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_251
nop

P1755: !_CASX [12] (maybe <- 0x100013d) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_252:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1756: !_LD [11] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1757: !_LD [4] (Int) (Loop exit)
lduw [%i1 + 4], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_252:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_252
nop

P1758: !_CASX [10] (maybe <- 0x100013f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_253:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_253:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_253
nop

P1759: !_CASX [5] (maybe <- 0x1000141) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_254:
add %i1, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_254:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_254
nop

P1760: !_CASX [13] (maybe <- 0x1000142) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_255:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1761: !_CASX [16] (maybe <- 0x1000144) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_255:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_255
nop

P1762: !_CASX [21] (maybe <- 0x1000146) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_256:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_256:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_256
nop

P1763: !_CAS [12] (maybe <- 0x1000148) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_257:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%i3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_257:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_257
nop

P1764: !_CASX [1] (maybe <- 0x1000149) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_258:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1765: !_ST [21] (maybe <- 0x100014b) (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_258:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_258
nop

P1766: !_LD [0] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_259:
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1767: !_CAS [10] (maybe <- 0x100014c) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 4, %o5
lduw [%o5], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%o5], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1768: !_LD [2] (Int) (Loop exit)
lduw [%i0 + 12], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_259:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_259
nop

P1769: !_LD [5] (Int) (Loop entry) (Branch target of P1893)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_260:
!-- Aliased access: Adjusting base register for region 1 (%i1) to use alias #1
!Logical addr: 5 

sethi %hi(0x200000), %l6
sub   %i1, %l6, %i1
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P1770
nop

TARGET1893:
ba RET1893
nop


P1770: !_LD [16] (Int) (Loop exit) (CBR)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1770
nop
RET1770:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5

sethi %hi(0x200000), %o5
add   %i1, %o5, %i1
!-- End Aliased access: base register for region 1 (%i1) restored
loop_exit_2_260:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_260
nop

P1771: !_CASX [15] (maybe <- 0x100014d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_261:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_261:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_261
nop

P1772: !_CASX [21] (maybe <- 0x100014f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_262:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_262:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_262
nop

P1773: !_CAS [8] (maybe <- 0x1000151) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_263:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1774: !_REPLACEMENT [20] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+12], %l3
st %l3, [%i2+12]
add %i2, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_263:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_263
nop

P1775: !_CASX [14] (maybe <- 0x1000152) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_264:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_264:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_264
nop

P1776: !_CASX [12] (maybe <- 0x1000153) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_265:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1777: !_CAS [0] (maybe <- 0x1000155) (Int) (Loop exit)
lduw [%i0], %o2
mov %o2, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %l4, %l7
cas [%i0], %o5, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %o5
or %o5, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_265:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_265
nop

P1778: !_CASX [9] (maybe <- 0x1000156) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_266:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_266:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_266
nop

P1779: !_ST [2] (maybe <- 0x1000158) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_267:
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4
loop_exit_2_267:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_267
nop

P1780: !_ST [22] (maybe <- 0x1000159) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_268:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
loop_exit_2_268:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_268
nop

P1781: !_FLUSHI [13] (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_269:
flush %g0 

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1781
nop
RET1781:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1782: !_ST [16] (maybe <- 0x100015a) (Int) (Loop exit)
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4
loop_exit_2_269:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_269
nop

P1783: !_MEMBAR (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_270:
membar #StoreLoad

P1784: !_CASX [12] (maybe <- 0x100015b) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_270:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_270
nop

P1785: !_ST [18] (maybe <- 0x100015d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_271:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
loop_exit_2_271:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_271
nop

P1786: !_CASX [4] (maybe <- 0x100015e) (Int) (Loop entry) (Branch target of P1934)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_272:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
ba P1787
nop

TARGET1934:
ba RET1934
nop


P1787: !_REPLACEMENT [1] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+4], %l6
st %l6, [%i2+4]
add %i2, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_272:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_272
nop

P1788: !_CASX [17] (maybe <- 0x1000160) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_273:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1789: !_LD [18] (Int) (CBR)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1789
nop
RET1789:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1790: !_LD [8] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduwa [%i3 + 12] %asi, %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_273:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_273
nop

P1791: !_LD [2] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_274:
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1792: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_274:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_274
nop

P1793: !_CASX [12] (maybe <- 0x1000161) (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_275:
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
sllx %l7, 32, %l3
or %l7, %l3, %l7 
and %o5, %l7, %l3
srlx %l3, 8, %l3
sllx %o5, 8, %o5
and %o5, %l7, %o5
or %o5, %l3, %o5 
sethi %hi(0xffff0000), %l7
srlx %o5, 16, %l3
andn %l3, %l7, %l3
andn %o5, %l7, %o5
sllx %o5, 16, %o5
or %o5, %l3, %o5 
srlx %o5, 32, %l3
sllx %o5, 32, %o5
or %o5, %l3, %l3 
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldxa [%i3] %asi, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
mov %l6, %l7
mov  %l3, %l6
casxa [%i3] %asi, %l7, %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
add  %l4, 1, %l4

P1794: !_LD [6] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1795: !_LD [7] (Int) (Loop exit)
lduw [%i2 + 4], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_275:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_275
nop

P1796: !_CASX [1] (maybe <- 0x1000163) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_276:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1797: !_MEMBAR (Int) (Loop exit)
membar #StoreLoad
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_276:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_276
nop

P1798: !_CASX [15] (maybe <- 0x1000165) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_277:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_277:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_277
nop

P1799: !_CASX [8] (maybe <- 0x1000167) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_278:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_278:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_278
nop

P1800: !_CAS [18] (maybe <- 0x1000168) (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_279:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
and %l4, %o5, %l7
srl %l7, 8, %l7
sll %l4, 8, %l3
and %l3, %o5, %l3
or %l3, %l7, %l3
srl %l3, 16, %l7
sll %l3, 16, %l3
srl %l3, 0, %l3
or %l3, %l7, %l3
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduwa [%i3] %asi, %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l3, %l6
casa [%i3] %asi, %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P1801: !_FLUSHI [2] (Int) (Loop exit)
flush %g0 
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_279:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_279
nop

P1802: !_CASX [6] (maybe <- 0x1000169) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_280:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1803: !_ST [12] (maybe <- 0x100016b) (Int) (Loop exit) (Branch target of P1502)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_280:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_280
nop
ba P1804
nop

TARGET1502:
ba RET1502
nop


P1804: !_PREFETCH [3] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_281:
prefetch [%i1 + 0], 22
loop_exit_2_281:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_281
nop

P1805: !_ST [14] (maybe <- 0x100016c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_282:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4
loop_exit_2_282:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_282
nop

P1806: !_LD [21] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_283:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1807: !_LD [6] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_283:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_283
nop

P1808: !_ST [10] (maybe <- 0x100016d) (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_284:
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %o5
srl %o5, 8, %o5
sll %l4, 8, %l6
and %l6, %l7, %l6
or %l6, %o5, %l6
srl %l6, 16, %o5
sll %l6, 16, %l6
srl %l6, 0, %l6
or %l6, %o5, %l6
stwa   %l6, [%i3 + 4] %asi
add   %l4, 1, %l4

P1809: !_PREFETCH [21] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 0], 20
loop_exit_2_284:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_284
nop

P1810: !_PREFETCH [15] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_285:
sethi %hi(REGION5_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 0], 22

P1811: !_LD [12] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1812: !_LD [13] (Int) (Loop exit)
lduw [%i2 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_285:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_285
nop

P1813: !_ST [8] (maybe <- 0x100016e) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_286:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4

P1814: !_LD [22] (Int) (LE) (Branch target of P1669)
wr %g0, 0x88, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduwa [%i2 + 4] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P1815
nop

TARGET1669:
ba RET1669
nop


P1815: !_LD [6] (Int) (Loop exit)
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_286:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_286
nop

P1816: !_CASX [6] (maybe <- 0x100016f) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_287:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1817: !_PREFETCH [7] (Int) (Loop exit)
prefetch [%i3 + 4], 22
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_287:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_287
nop

P1818: !_CASX [5] (maybe <- 0x1000171) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_288:
add %i1, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1818
nop
RET1818:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_288:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_288
nop

P1819: !_REPLACEMENT [3] (Int) (Loop entry) (Branch target of P1944)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_289:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+0], %o5
st %o5, [%i2+0]
add %i2, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
ba P1820
nop

TARGET1944:
ba RET1944
nop


P1820: !_PREFETCH [14] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 12], 1
loop_exit_2_289:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_289
nop

P1821: !_LD [13] (FP) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_290:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ld [%i2 + 4], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_290:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_290
nop

P1822: !_LD [8] (Int) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_291:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1822
nop
RET1822:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1823: !_LD [8] (Int) (Loop exit)
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_291:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_291
nop

P1824: !_ST [22] (maybe <- 0x1000172) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_292:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
loop_exit_2_292:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_292
nop

P1825: !_LD [23] (FP) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_293:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ld [%i3 + 12], %f0
! 1 addresses covered

P1826: !_REPLACEMENT [5] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+12], %l7
st %l7, [%i2+12]
add %i2, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_293:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_293
nop

P1827: !_CASX [5] (maybe <- 0x1000173) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_294:
add %i1, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1828: !_CASX [6] (maybe <- 0x1000174) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_294:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_294
nop

P1829: !_CASX [9] (maybe <- 0x1000176) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_295:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_295:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_295
nop

P1830: !_PREFETCH [2] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_296:
prefetch [%i0 + 12], 0
loop_exit_2_296:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_296
nop

P1831: !_CASX [12] (maybe <- 0x1000178) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_297:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_297:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_297
nop

P1832: !_MEMBAR (Int) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_298:
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1832
nop
RET1832:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1833: !_LD [17] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1834: !_LD [22] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_298:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_298
nop

P1835: !_PREFETCH [3] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_299:
prefetch [%i1 + 0], 22

P1836: !_REPLACEMENT [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
loop_exit_2_299:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_299
nop

P1837: !_CAS [21] (maybe <- 0x100017a) (Int) (Loop entry) (Loop exit) (Branch target of P1822)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_300:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%i3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_300:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_300
nop
ba P1838
nop

TARGET1822:
ba RET1822
nop


P1838: !_CASX [23] (maybe <- 0x100017b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_301:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_301:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_301
nop

P1839: !_ST [8] (maybe <- 0x100017c) (Int) (Loop entry) (Branch target of P1980)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_302:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4
ba P1840
nop

TARGET1980:
ba RET1980
nop


P1840: !_LD [1] (Int) (LE)
wr %g0, 0x88, %asi
lduwa [%i0 + 4] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1841: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_302:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_302
nop

P1842: !_LD [2] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_303:
lduw [%i0 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1843: !_CAS [0] (maybe <- 0x100017d) (Int)
lduw [%i0], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%i0], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1844: !_LD [21] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_303:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_303
nop

P1845: !_LD [19] (Int) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_304:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1845
nop
RET1845:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1846: !_LD [19] (Int) (Loop exit)
lduw [%i3 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_304:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_304
nop

P1847: !_CASX [13] (maybe <- 0x100017e) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_305:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1848: !_LD [9] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1849: !_LD [15] (Int) (Loop exit) (CBR)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1849
nop
RET1849:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_305:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_305
nop

P1850: !_LD [16] (FP) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_306:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
ld [%i3 + 4], %f0
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1850
nop
RET1850:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_306:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_306
nop

P1851: !_ST [11] (maybe <- 0x40800004) (FP) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_307:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i2
sub %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 12 ]

P1852: !_LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1853: !_LD [18] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_307:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_307
nop

P1854: !_LD [16] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_308:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1855: !_LD [21] (Int) (Loop exit) (CBR)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1855
nop
RET1855:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_308:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_308
nop

P1856: !_CAS [18] (maybe <- 0x1000180) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_309:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%i2], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1856
nop
RET1856:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_309:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_309
nop

P1857: !_REPLACEMENT [1] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_310:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+4], %l7
st %l7, [%i3+4]
add %i3, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
loop_exit_2_310:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_310
nop

P1858: !_ST [23] (maybe <- 0x1000181) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_311:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4

P1859: !_CAS [21] (maybe <- 0x1000182) (Int) (Loop exit)
lduw [%i2], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%i2], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_311:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_311
nop

P1860: !_CASX [9] (maybe <- 0x1000183) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_312:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1861: !_ST [22] (maybe <- 0x1000185) (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_312:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_312
nop

P1862: !_CASX [5] (maybe <- 0x1000186) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_313:
add %i1, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_313:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_313
nop

P1863: !_CASX [11] (maybe <- 0x1000187) (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_314:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1863
nop
RET1863:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P1864: !_CASX [13] (maybe <- 0x1000188) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_314:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_314
nop

P1865: !_CAS [23] (maybe <- 0x100018a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_315:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_315:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_315
nop

P1866: !_LD [0] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_316:
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1867: !_LD [17] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_316:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_316
nop

P1868: !_CASX [1] (maybe <- 0x100018b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_317:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_317:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_317
nop

P1869: !_LD [4] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_318:
lduw [%i1 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1870: !_REPLACEMENT [5] (Int)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+12], %l7
st %l7, [%i3+12]
add %i3, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]

P1871: !_LD [17] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_318:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_318
nop

P1872: !_LD [9] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_319:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1873: !_LD [5] (Int) (Loop exit)
lduw [%i1 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_319:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_319
nop

P1874: !_PREFETCH [5] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_320:
prefetch [%i1 + 12], 21

P1875: !_PREFETCH [23] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
prefetch [%i2 + 12], 20
loop_exit_2_320:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_320
nop

P1876: !_CASX [5] (maybe <- 0x100018d) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_321:
add %i1, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1877: !_REPLACEMENT [15] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_321:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_321
nop

P1878: !_ST [18] (maybe <- 0x100018e) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_322:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P1879: !_PREFETCH [2] (Int) (Loop exit) (Branch target of P1832)
prefetch [%i0 + 12], 27
loop_exit_2_322:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_322
nop
ba P1880
nop

TARGET1832:
ba RET1832
nop


P1880: !_CAS [11] (maybe <- 0x100018f) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_323:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P1881: !_CASX [3] (maybe <- 0x1000190) (Int) (Loop exit)
ldx [%i1], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov %o1, %l3
sllx %l4, 32, %o2
add  %l4, 1, %l4
or   %l4, %o2, %o2
casx [%i1], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_323:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_323
nop

P1882: !_MEMBAR (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_324:
membar #StoreLoad

P1883: !_REPLACEMENT [16] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l6
ld [%i2+4], %o5
st %o5, [%i2+4]
add %i2, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
loop_exit_2_324:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_324
nop

P1884: !_REPLACEMENT [4] (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_325:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1884
nop
RET1884:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0

loop_exit_2_325:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_325
nop

P1885: !_CASX [14] (maybe <- 0x1000192) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_326:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1886: !_REPLACEMENT [17] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+12], %l3
st %l3, [%i3+12]
add %i3, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
add %o5, %l7, %o5
ld [%o5+12], %l3
st %l3, [%o5+12]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_326:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_326
nop

P1887: !_CASX [20] (maybe <- 0x1000193) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_327:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1888: !_CASX [1] (maybe <- 0x1000194) (Int) (Loop exit)
ldx [%i0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i0], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_327:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_327
nop

P1889: !_CASX [0] (maybe <- 0x1000196) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_328:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_328:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_328
nop

P1890: !_CASX [7] (maybe <- 0x1000198) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_329:
sethi %hi(REGION0_ALIAS0_O-REGION2_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1891: !_CASX [0] (maybe <- 0x100019a) (Int) (Loop exit) (Branch target of P1436)
ldx [%i0], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l3
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i0], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_329:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_329
nop
ba P1892
nop

TARGET1436:
ba RET1436
nop


P1892: !_CASX [2] (maybe <- 0x100019c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_330:
add %i0, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_330:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_330
nop

P1893: !_CAS [3] (maybe <- 0x100019d) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_331:
lduw [%i1], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%i1], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1893
nop
RET1893:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_331:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_331
nop

P1894: !_CAS [16] (maybe <- 0x100019e) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_332:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_332:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_332
nop

P1895: !_CASX [2] (maybe <- 0x100019f) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_333:
add %i0, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1896: !_REPLACEMENT [9] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_333:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_333
nop

P1897: !_LD [8] (FP) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_334:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ld [%i2 + 12], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_334:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_334
nop

P1898: !_LD [13] (FP) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_335:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ld [%i3 + 4], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_335:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_335
nop

P1899: !_LD [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_336:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1900: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_336:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_336
nop

P1901: !_ST [5] (maybe <- 0x10001a0) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_337:
stw   %l4, [%i1 + 12 ]
add   %l4, 1, %l4
loop_exit_2_337:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_337
nop

P1902: !_LD [5] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_338:
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1903: !_CASX [16] (maybe <- 0x10001a1) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%i2], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P1904: !_LD [13] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_338:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_338
nop

P1905: !_LD [6] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_339:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1906: !_CAS [8] (maybe <- 0x10001a3) (Int)
add %i2, 12, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1907: !_LD [3] (Int) (Loop exit)
lduw [%i1 + 0], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_339:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_339
nop

P1908: !_CASX [19] (maybe <- 0x10001a4) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_340:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1909: !_LD [9] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1910: !_LD [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_340:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_340
nop

P1911: !_REPLACEMENT [11] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_341:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+12], %l7
st %l7, [%i2+12]
add %i2, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]

P1912: !_REPLACEMENT [15] (Int) (Loop exit)
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
loop_exit_2_341:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_341
nop

P1913: !_CASX [14] (maybe <- 0x10001a6) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_342:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_342:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_342
nop

P1914: !_LD [10] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_343:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1915: !_LD [13] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_343:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_343
nop

P1916: !_LD [17] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_344:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1917: !_CASX [1] (maybe <- 0x10001a7) (Int) (LE)
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
sllx %o5, 32, %l6
or %o5, %l6, %o5 
and %l3, %o5, %l6
srlx %l6, 8, %l6
sllx %l3, 8, %l3
and %l3, %o5, %l3
or %l3, %l6, %l3 
sethi %hi(0xffff0000), %o5
srlx %l3, 16, %l6
andn %l6, %o5, %l6
andn %l3, %o5, %l3
sllx %l3, 16, %l3
or %l3, %l6, %l3 
srlx %l3, 32, %l6
sllx %l3, 32, %l3
or %l3, %l6, %l6 
wr %g0, 0x88, %asi
ldxa [%i0] %asi, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
! move %l7(upper) -> %o1(upper)
or %l7, %g0, %o1
mov %l7, %o5
mov  %l6, %l7
casxa [%i0] %asi, %o5, %l7
! move %l7(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srl %l7, 0, %o5
or %o5, %o1, %o1
! move %l7(upper) -> %o2(upper)
or %l7, %g0, %o2
add  %l4, 1, %l4

P1918: !_LD [20] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l3
! move %l3(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_344:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_344
nop

P1919: !_REPLACEMENT [4] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_345:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l7
ld [%i2+4], %l3
st %l3, [%i2+4]
add %i2, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
add %o5, %l7, %o5
ld [%o5+4], %l3
st %l3, [%o5+4]
loop_exit_2_345:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_345
nop

P1920: !_ST [2] (maybe <- 0x10001a9) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_346:
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4
loop_exit_2_346:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_346
nop

P1921: !_LD [4] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_347:
lduw [%i1 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1922: !_CAS [5] (maybe <- 0x10001aa) (Int)
add %i1, 12, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P1923: !_LD [10] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_347:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_347
nop

P1924: !_MEMBAR (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_348:
membar #StoreLoad
loop_exit_2_348:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_348
nop

P1925: !_CASX [14] (maybe <- 0x10001ab) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_349:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_349:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_349
nop

P1926: !_ST [9] (maybe <- 0x10001ac) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_350:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P1927: !_LD [8] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1928: !_LD [8] (Int) (Loop exit)
lduw [%i2 + 12], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_350:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_350
nop

P1929: !_CAS [20] (maybe <- 0x10001ad) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_351:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P1930: !_CAS [0] (maybe <- 0x10001ae) (Int) (Loop exit) (LE)
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l7, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
wr %g0, 0x88, %asi
lduwa [%i0] %asi, %o1
mov %o1, %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
mov %o5, %l3
casa [%i0] %asi, %l6, %l3
! move %l3(lower) -> %o1(lower)
srl %l3, 0, %l6
or %l6, %o1, %o1
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_351:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_351
nop

P1931: !_CAS [14] (maybe <- 0x10001af) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_352:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 12, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_352:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_352
nop

P1932: !_ST [15] (maybe <- 0x10001b0) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_353:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
loop_exit_2_353:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_353
nop

P1933: !_CASX [19] (maybe <- 0x10001b1) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_354:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1933
nop
RET1933:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_354:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_354
nop

P1934: !_ST [0] (maybe <- 0x40800005) (FP) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_355:
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 0 ]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1934
nop
RET1934:

! lfsr step begin
srlx %l0, 1, %l3
xnor %l3, %l0, %l3
sllx %l3, 63, %l3
or  %l3, %l0, %l0
srlx %l0, 1, %l0


P1935: !_ST [7] (maybe <- 0x10001b3) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4
loop_exit_2_355:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_355
nop

P1936: !_CAS [10] (maybe <- 0x10001b4) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_356:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P1937: !_CASX [11] (maybe <- 0x10001b5) (Int) (Loop exit)
add %i2, 8, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
mov %l4, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_356:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_356
nop

P1938: !_CASX [9] (maybe <- 0x10001b6) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_357:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1939: !_PREFETCH [17] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 12], 2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_357:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_357
nop

P1940: !_PREFETCH [16] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_358:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 4], 3

P1941: !_CASX [5] (maybe <- 0x10001b8) (Int) (Loop exit)
add %i1, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_358:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_358
nop

P1942: !_CAS [18] (maybe <- 0x10001b9) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_359:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i2], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_359:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_359
nop

P1943: !_ST [16] (maybe <- 0x10001ba) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_360:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4

P1944: !_REPLACEMENT [21] (Int) (Loop exit) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1944
nop
RET1944:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

loop_exit_2_360:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_360
nop

P1945: !_LD [11] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_361:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1946: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_361:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_361
nop

P1947: !_CASX [11] (maybe <- 0x10001bb) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_362:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1948: !_REPLACEMENT [6] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l7
ld [%i3+0], %l3
st %l3, [%i3+0]
add %i3, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
add %o5, %l7, %o5
ld [%o5+0], %l3
st %l3, [%o5+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_362:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_362
nop

P1949: !_ST [9] (maybe <- 0x40800006) (FP) (Loop entry) (Branch target of P1444)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_363:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i2
sub %i0, %i2, %i2
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i2 + 0 ]
ba P1950
nop

TARGET1444:
ba RET1444
nop


P1950: !_ST [21] (maybe <- 0x40800007) (FP) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i3 + 0 ]
loop_exit_2_363:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_363
nop

P1951: !_MEMBAR (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_364:
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1951
nop
RET1951:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

loop_exit_2_364:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_364
nop

P1952: !_CASX [2] (maybe <- 0x10001bc) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_365:
add %i0, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_365:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_365
nop

P1953: !_CASX [5] (maybe <- 0x10001bd) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_366:
add %i1, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1954: !_CASX [20] (maybe <- 0x10001be) (Int) (Loop exit) (Branch target of P1673)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
mov %l4, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_366:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_366
nop
ba P1955
nop

TARGET1673:
ba RET1673
nop


P1955: !_REPLACEMENT [22] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_367:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
loop_exit_2_367:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_367
nop

P1956: !_CASX [13] (maybe <- 0x10001bf) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_368:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_368:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_368
nop

P1957: !_CAS [11] (maybe <- 0x10001c1) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_369:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_369:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_369
nop

P1958: !_CASX [6] (maybe <- 0x10001c2) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_370:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1959: !_CAS [20] (maybe <- 0x10001c4) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %l3
lduw [%l3], %o2
mov %o2, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %o5
or %o5, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_370:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_370
nop

P1960: !_ST [15] (maybe <- 0x10001c5) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_371:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4
loop_exit_2_371:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_371
nop

P1961: !_LD [10] (FP) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_372:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i3
sub %i0, %i3, %i3
ld [%i3 + 4], %f0
! 1 addresses covered

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET1961
nop
RET1961:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_372:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_372
nop

P1962: !_CASX [17] (maybe <- 0x10001c6) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_373:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1963: !_REPLACEMENT [12] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+0], %l6
st %l6, [%i3+0]
add %i3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_373:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_373
nop

P1964: !_CASX [23] (maybe <- 0x10001c7) (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_374:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
and %l4, %l3, %o5
srl %o5, 8, %o5
sll %l4, 8, %l6
and %l6, %l3, %l6
or %l6, %o5, %l6
srl %l6, 16, %o5
sll %l6, 16, %l6
srl %l6, 0, %l6
or %l6, %o5, %l6
sllx %l6, 32, %l6
wr %g0, 0x88, %asi
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldxa [%l3] %asi, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
mov  %l7, %o5
mov  %l6, %l7
casxa [%l3] %asi, %o5, %l7
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_374:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_374
nop

P1965: !_CASX [18] (maybe <- 0x10001c8) (Int) (Loop entry) (Loop exit) (Branch target of P1884)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_375:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_375:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_375
nop
ba P1966
nop

TARGET1884:
ba RET1884
nop


P1966: !_ST [20] (maybe <- 0x10001ca) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_376:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4
loop_exit_2_376:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_376
nop

P1967: !_CASX [5] (maybe <- 0x10001cb) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_377:
add %i1, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_377:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_377
nop

P1968: !_LD [5] (FP) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_378:
ld [%i1 + 12], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_2_378:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_378
nop

P1969: !_CASX [0] (maybe <- 0x10001cc) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_379:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_379:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_379
nop

P1970: !_CASX [21] (maybe <- 0x10001ce) (Int) (Loop entry) (Loop exit) (Branch target of P1675)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_380:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_380:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_380
nop
ba P1971
nop

TARGET1675:
ba RET1675
nop


P1971: !_ST [15] (maybe <- 0x10001d0) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_381:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4
loop_exit_2_381:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_381
nop

P1972: !_CASX [8] (maybe <- 0x10001d1) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_382:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1973: !_LD [12] (Int) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduwa [%i2 + 0] %asi, %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P1974: !_LD [7] (Int) (Loop exit)
lduw [%i3 + 4], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_2_382:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_382
nop

P1975: !_CASX [14] (maybe <- 0x10001d2) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_383:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1976: !_CASX [18] (maybe <- 0x10001d3) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_2_383:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_383
nop

P1977: !_PREFETCH [1] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_384:
prefetch [%i0 + 4], 22
loop_exit_2_384:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_384
nop

P1978: !_CASX [8] (maybe <- 0x10001d5) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_385:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_2_385:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_385
nop

P1979: !_ST [21] (maybe <- 0x10001d6) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_386:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P1980: !_REPLACEMENT [6] (Int) (Loop exit) (CBR)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l3
ld [%i3+0], %l7
st %l7, [%i3+0]
add %i3, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1980
nop
RET1980:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

loop_exit_2_386:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_386
nop

P1981: !_LD [11] (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_2_387:
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduwa [%i2 + 12] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1982: !_LD [3] (Int) (Loop exit)
lduw [%i1 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_387:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_387
nop

P1983: !_LD [21] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_2_388:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1984: !_LD [15] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduwa [%i2 + 0] %asi, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_2_388:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_2_388
nop

P1985: !_MEMBAR (Int)
membar #StoreLoad

END_NODES2: ! Test instruction sequence for CPU 2 ends
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
sethi %hi(0xdead0e0f), %o5
or    %o5, %lo(0xdead0e0f), %o5
stw %o5, [%i5] 
ld [%i5], %f0
!---- flushing int results buffer----
mov %o0, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--

restore
retl
nop
!-----------------

! register usage:
! %i0 %i1 : base registers for first 2 regions
! %i2 %i3 : cache registers for 8 regions
! %i4 fixed pointer to per-cpu results area
! %l1 moving pointer to per-cpu FP results area
! %o7 moving pointer to per-cpu integer results area
! %i5 pointer to per-cpu private area
! %l0 holds lfsr, used as source of random bits 
! %l2 loop count register
! %f16 running counter for unique fp store values
! %f17 holds increment value for fp counter
! %l4 running counter for unique integer store values (increment value is always 1)
! %l5 move-to register for load values (simulation only)
! %f30 move-to register for FP values (simulation only)
! %i4 holds the instructions count which is used for interrupt ordering
! %i4 holds the thread_id (OBP only) 
! %l5 holds the moving pointer for interrupt bonus data (OBP only). Conflicts with RTL/simulation usage
! %l3 %l6 %l7 %o5 : 4 temporary registers
! %o0 %o1 %o2 %o3 %o4 : 5 integer results buffer registers
! %f0-f15 FP results buffer registers
! %f32-f47 FP block load/store registers

func3:
! instruction sequence begins
save   %sp, -192, %sp

! Force %i0-%i3 to be 64-byte aligned
add %i0, 63, %i0
andn %i0, 63, %i0

add %i1, 63, %i1
andn %i1, 63, %i1

add %i2, 63, %i2
andn %i2, 63, %i2

add %i3, 63, %i3
andn %i3, 63, %i3

add %i4, 63, %i4
andn %i4, 63, %i4

add %i5, 63, %i5
andn %i5, 63, %i5


! Initialize pointer to FP load results area
mov   %i4, %l1

! Initialize pointer to integer load results area
sethi %hi(0x80000), %o7
or    %o7, %lo(0x80000), %o7
add  %o7, %l1, %o7 

! Reinitialize i4 to 0. i4 will be used to keep the count of analyzable node info
mov 0x0, %i4

! Initialize %f0-%f62 to 0xdeadbee0deadbee1
sethi %hi(0xdeadbee0), %l7
or    %l7, %lo(0xdeadbee0), %l7
stw   %l7, [%i5]
sethi %hi(0xdeadbee1), %l7
or    %l7, %lo(0xdeadbee1), %l7
stw   %l7, [%i5+4]
ldd [%i5], %f0
fmovd %f0, %f2
fmovd %f0, %f4
fmovd %f0, %f6
fmovd %f0, %f8
fmovd %f0, %f10
fmovd %f0, %f12
fmovd %f0, %f14
fmovd %f0, %f16
fmovd %f0, %f18
fmovd %f0, %f20
fmovd %f0, %f22
fmovd %f0, %f24
fmovd %f0, %f26
fmovd %f0, %f28
fmovd %f0, %f30
fmovd %f0, %f32
fmovd %f0, %f34
fmovd %f0, %f36
fmovd %f0, %f38
fmovd %f0, %f40
fmovd %f0, %f42
fmovd %f0, %f44
fmovd %f0, %f46
fmovd %f0, %f48
fmovd %f0, %f50
fmovd %f0, %f52
fmovd %f0, %f54
fmovd %f0, %f56
fmovd %f0, %f58
fmovd %f0, %f60
fmovd %f0, %f62

! Signature for extract_loads script to start extracting load values for this stream
sethi %hi(0x03deade1), %l7
or    %l7, %lo(0x03deade1), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize running integer counter in register %l4
sethi %hi(0x1800001), %l4
or    %l4, %lo(0x1800001), %l4

! Initialize running FP counter in register %f16
sethi %hi(0x41000001), %l7
or    %l7, %lo(0x41000001), %l7
stw %l7, [%i5] 
ld [%i5], %f16

! Initialize FP counter increment value in register %f17 (constant)
sethi %hi(0x35800000), %l7
or    %l7, %lo(0x35800000), %l7
stw %l7, [%i5] 
ld [%i5], %f17 

! Initialize LFSR to 0x5b45^4
sethi %hi(0x5b45), %l0
or    %l0, %lo(0x5b45), %l0
mulx  %l0, %l0, %l0
mulx  %l0, %l0, %l0

BEGIN_NODES3: ! Test instruction sequence for ISTREAM 3 begins

P1986: !_LD [5] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_0:
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1987: !_REPLACEMENT [4] (Int)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+4], %o5
st %o5, [%i3+4]
add %i3, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]
add %l7, %l6, %l7
ld [%l7+4], %o5
st %o5, [%l7+4]

P1988: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_0:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_0
nop

P1989: !_MEMBAR (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_1:
membar #StoreLoad

P1990: !_LD [9] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P1991: !_LD [10] (Int) (Loop exit)
lduw [%i3 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_1:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_1
nop

P1992: !_ST [5] (maybe <- 0x1800001) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_2:
stw   %l4, [%i1 + 12 ]
add   %l4, 1, %l4
loop_exit_3_2:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_2
nop

P1993: !_LD [21] (Int) (Loop entry) (Branch target of P2497)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_3:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P1994
nop

TARGET2497:
ba RET2497
nop


P1994: !_LD [13] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_3:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_3
nop

P1995: !_ST [4] (maybe <- 0x1800002) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_4:
stw   %l4, [%i1 + 4 ]
add   %l4, 1, %l4
loop_exit_3_4:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_4
nop

P1996: !_CAS [6] (maybe <- 0x1800003) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_5:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%i2], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET1996
nop
RET1996:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_5:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_5
nop

P1997: !_CASX [5] (maybe <- 0x1800004) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_6:
add %i1, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P1998: !_PREFETCH [9] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 0], 17
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_6:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_6
nop

P1999: !_CASX [4] (maybe <- 0x1800005) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_7:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2000: !_PREFETCH [9] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 0], 20
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_7:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_7
nop

P2001: !_PREFETCH [0] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_8:
prefetch [%i0 + 0], 0
loop_exit_3_8:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_8
nop

P2002: !_LD [14] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_9:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2003: !_CAS [10] (maybe <- 0x1800007) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2004: !_LD [16] (Int) (Loop exit) (Branch target of P2217)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_9:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_9
nop
ba P2005
nop

TARGET2217:
ba RET2217
nop


P2005: !_CASX [10] (maybe <- 0x1800008) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_10:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2006: !_CAS [8] (maybe <- 0x180000a) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %l3
lduw [%l3], %o2
mov %o2, %o5
! move %o5(lower) -> %o2(upper)
sllx %o5, 32, %o2
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o2(lower)
srl %l7, 0, %o5
or %o5, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_10:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_10
nop

P2007: !_CAS [10] (maybe <- 0x180000b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_11:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_11:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_11
nop

P2008: !_LD [13] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_12:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2009: !_CASX [5] (maybe <- 0x180000c) (Int)
add %i1, 8, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov  %l7, %o5
mov %l4, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P2010: !_LD [15] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_12:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_12
nop

P2011: !_ST [3] (maybe <- 0x180000d) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_13:
stw   %l4, [%i1 + 0 ]
add   %l4, 1, %l4

P2012: !_CAS [21] (maybe <- 0x180000e) (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%i3], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_13:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_13
nop

P2013: !_CASX [15] (maybe <- 0x180000f) (Int) (Loop entry) (LE)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_14:
sllx %l4, 32, %o5
add  %l4, 1, %l4
or   %l4, %o5, %o5
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
sllx %l7, 32, %l3
or %l7, %l3, %l7 
and %o5, %l7, %l3
srlx %l3, 8, %l3
sllx %o5, 8, %o5
and %o5, %l7, %o5
or %o5, %l3, %o5 
sethi %hi(0xffff0000), %l7
srlx %o5, 16, %l3
andn %l3, %l7, %l3
andn %o5, %l7, %o5
sllx %o5, 16, %o5
or %o5, %l3, %o5 
srlx %o5, 32, %l3
sllx %o5, 32, %o5
or %o5, %l3, %l3 
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldxa [%i2] %asi, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
! move %l6(upper) -> %o0(lower)
srlx %l6, 32, %l7
or %l7, %o0, %o0
mov %l6, %l7
mov  %l3, %l6
casxa [%i2] %asi, %l7, %l6
! move %l6(lower) -> %o1(upper)
sllx %l6, 32, %o1
! move %l6(upper) -> %o1(lower)
srlx %l6, 32, %l7
or %l7, %o1, %o1
add  %l4, 1, %l4

P2014: !_LD [4] (Int)
lduw [%i1 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2015: !_LD [21] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_14:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_14
nop

P2016: !_ST [7] (maybe <- 0x1800011) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_15:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
loop_exit_3_15:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_15
nop

P2017: !_REPLACEMENT [4] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_16:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+4], %l6
st %l6, [%i3+4]
add %i3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]

P2018: !_CASX [1] (maybe <- 0x1800012) (Int) (Loop exit)
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_16:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_16
nop

P2019: !_PREFETCH [0] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_17:
prefetch [%i0 + 0], 17
loop_exit_3_17:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_17
nop

P2020: !_REPLACEMENT [11] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_18:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+12], %l7
st %l7, [%i2+12]
add %i2, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
loop_exit_3_18:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_18
nop

P2021: !_CASX [19] (maybe <- 0x1800014) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_19:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2022: !_REPLACEMENT [10] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_19:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_19
nop

P2023: !_LD [4] (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_20:
wr %g0, 0x88, %asi
lduwa [%i1 + 4] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2024: !_LD [16] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_20:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_20
nop

P2025: !_CASX [6] (maybe <- 0x1800016) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_21:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_21:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_21
nop

P2026: !_CAS [20] (maybe <- 0x1800018) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_22:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_22:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_22
nop

P2027: !_CASX [8] (maybe <- 0x1800019) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_23:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_23:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_23
nop

P2028: !_ST [21] (maybe <- 0x180001a) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_24:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

P2029: !_LD [21] (Int)
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2030: !_LD [0] (Int) (Loop exit)
lduw [%i0 + 0], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_24:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_24
nop

P2031: !_CASX [13] (maybe <- 0x180001b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_25:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_25:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_25
nop

P2032: !_CASX [19] (maybe <- 0x180001d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_26:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_26:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_26
nop

P2033: !_MEMBAR (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_27:
membar #StoreLoad

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2033
nop
RET2033:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

loop_exit_3_27:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_27
nop

P2034: !_REPLACEMENT [16] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_28:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]

P2035: !_CAS [5] (maybe <- 0x180001f) (Int) (Loop exit)
add %i1, 12, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_28:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_28
nop

P2036: !_CASX [22] (maybe <- 0x1800020) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_29:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2037: !_CAS [0] (maybe <- 0x1800022) (Int) (Loop exit)
lduw [%i0], %o2
mov %o2, %l3
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
mov %l4, %o5
cas [%i0], %l3, %o5
! move %o5(lower) -> %o2(lower)
srl %o5, 0, %l3
or %l3, %o2, %o2
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_29:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_29
nop

P2038: !_MEMBAR (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_30:
membar #StoreLoad
loop_exit_3_30:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_30
nop

P2039: !_PREFETCH [2] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_31:
prefetch [%i0 + 12], 20

P2040: !_LD [0] (Int)
lduw [%i0 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2041: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_31:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_31
nop

P2042: !_LD [22] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_32:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2043: !_LD [22] (Int) (Loop exit)
lduw [%i3 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_32:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_32
nop

P2044: !_MEMBAR (Int) (Loop entry) (Branch target of P2585)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_33:
membar #StoreLoad
ba P2045
nop

TARGET2585:
ba RET2585
nop


P2045: !_CASX [9] (maybe <- 0x1800023) (Int) (Loop exit) (Branch target of P2554)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_33:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_33
nop
ba P2046
nop

TARGET2554:
ba RET2554
nop


P2046: !_CAS [14] (maybe <- 0x1800025) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_34:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_34:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_34
nop

P2047: !_LD [15] (FP) (Loop entry) (Loop exit) (Branch target of P2290)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_35:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
ld [%i2 + 0], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_3_35:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_35
nop
ba P2048
nop

TARGET2290:
ba RET2290
nop


P2048: !_MEMBAR (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_36:
membar #StoreLoad
loop_exit_3_36:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_36
nop

P2049: !_ST [0] (maybe <- 0x1800026) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_37:
stw   %l4, [%i0 + 0 ]
add   %l4, 1, %l4

P2050: !_CASX [4] (maybe <- 0x1800027) (Int) (Loop exit)
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_37:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_37
nop

P2051: !_CASX [23] (maybe <- 0x1800029) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_38:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2052: !_CASX [13] (maybe <- 0x180002a) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i2], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_3_38:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_38
nop

P2053: !_LD [4] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_39:
lduw [%i1 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2054: !_LD [9] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_39:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_39
nop

P2055: !_CASX [0] (maybe <- 0x180002c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_40:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_40:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_40
nop

P2056: !_LD [23] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_41:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2057: !_CAS [12] (maybe <- 0x180002e) (Int)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3], %l6
mov %l6, %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
mov %l4, %o1
cas [%i3], %l7, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2058: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %o5
! move %o5(lower) -> %o1(lower)
or %o5, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_41:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_41
nop

P2059: !_CASX [0] (maybe <- 0x180002f) (Int) (Loop entry) (Loop exit) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_42:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2059
nop
RET2059:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_42:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_42
nop

P2060: !_CAS [13] (maybe <- 0x1800031) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_43:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_43:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_43
nop

P2061: !_CASX [13] (maybe <- 0x1800032) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_44:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2062: !_LD [4] (Int)
lduw [%i1 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2063: !_LD [17] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_44:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_44
nop

P2064: !_LD [21] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_45:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2065: !_CASX [5] (maybe <- 0x1800034) (Int)
add %i1, 8, %l3
ldx [%l3], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov  %l7, %o5
mov %l4, %l7
casx [%l3], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P2066: !_LD [4] (Int) (Loop exit)
lduw [%i1 + 4], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_45:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_45
nop

P2067: !_LD [1] (FP) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_46:
ld [%i0 + 4], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_3_46:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_46
nop

P2068: !_LD [15] (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_47:
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduwa [%i2 + 0] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2069: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_47:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_47
nop

P2070: !_CASX [5] (maybe <- 0x1800035) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_48:
add %i1, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2071: !_LD [21] (Int)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2072: !_LD [19] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_48:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_48
nop

P2073: !_ST [5] (maybe <- 0x1800036) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_49:
stw   %l4, [%i1 + 12 ]
add   %l4, 1, %l4

P2074: !_REPLACEMENT [17] (Int) (Loop exit)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+12], %l7
st %l7, [%i2+12]
add %i2, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
loop_exit_3_49:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_49
nop

P2075: !_ST [9] (maybe <- 0x1800037) (Int) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_50:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2075
nop
RET2075:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2076: !_MEMBAR (Int) (Loop exit)
membar #StoreLoad
loop_exit_3_50:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_50
nop

P2077: !_LD [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_51:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2078: !_CASX [3] (maybe <- 0x1800038) (Int)
ldx [%i1], %l7
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
mov %l7, %o5
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
casx [%i1], %o5, %l7
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
add  %l4, 1, %l4

P2079: !_LD [16] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %l3
! move %l3(lower) -> %o2(lower)
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_51:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_51
nop

P2080: !_CASX [22] (maybe <- 0x180003a) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_52:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2081: !_CAS [21] (maybe <- 0x180003c) (Int) (Loop exit) (CBR)
lduw [%i2], %o2
mov %o2, %l7
! move %l7(lower) -> %o2(upper)
sllx %l7, 32, %o2
mov %l4, %l6
cas [%i2], %l7, %l6
! move %l6(lower) -> %o2(lower)
srl %l6, 0, %l7
or %l7, %o2, %o2
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2081
nop
RET2081:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_52:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_52
nop

P2082: !_LD [15] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_53:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2083: !_LD [9] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_53:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_53
nop

P2084: !_CAS [1] (maybe <- 0x180003d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_54:
add %i0, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_54:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_54
nop

P2085: !_LD [5] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_55:
lduw [%i1 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2086: !_LD [3] (Int) (Loop exit)
lduw [%i1 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_55:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_55
nop

P2087: !_FLUSHI [21] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_56:
flush %g0 
loop_exit_3_56:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_56
nop

P2088: !_CASX [22] (maybe <- 0x180003e) (Int) (Loop entry) (Branch target of P2089)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_57:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
ba P2089
nop

TARGET2089:
ba RET2089
nop


P2089: !_ST [2] (maybe <- 0x1800040) (Int) (Loop exit) (CBR)
stw   %l4, [%i0 + 12 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2089
nop
RET2089:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_57:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_57
nop

P2090: !_CAS [20] (maybe <- 0x1800041) (Int) (Loop entry) (LE) (Branch target of P2033)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_58:
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l7
or %l7, %lo(0xff00ff00), %l7
and %l4, %l7, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l7, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS2_O), %i2
sub %i0, %i2, %i2
add %i2, 12, %l7
lduwa [%l7] %asi, %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %o5, %l3
casa [%l7] %asi, %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
ba P2091
nop

TARGET2033:
ba RET2033
nop


P2091: !_LD [16] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2092: !_LD [11] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_58:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_58
nop

P2093: !_CASX [14] (maybe <- 0x1800042) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_59:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_59:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_59
nop

P2094: !_CASX [17] (maybe <- 0x1800043) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_60:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2095: !_ST [21] (maybe <- 0x1800044) (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_60:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_60
nop

P2096: !_LD [9] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_61:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2097: !_CASX [3] (maybe <- 0x1800045) (Int)
ldx [%i1], %l3
! move %l3(upper) -> %o0(lower)
srlx %l3, 32, %l6
or %l6, %o0, %o0
! move %l3(lower) -> %o1(upper)
sllx %l3, 32, %o1
mov %l3, %l6
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
casx [%i1], %l6, %l3
! move %l3(upper) -> %o1(lower)
srlx %l3, 32, %l6
or %l6, %o1, %o1
! move %l3(lower) -> %o2(upper)
sllx %l3, 32, %o2
add  %l4, 1, %l4

P2098: !_LD [10] (Int) (Loop exit)
lduw [%i2 + 4], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_61:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_61
nop

P2099: !_PREFETCH [15] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_62:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 0], 0
loop_exit_3_62:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_62
nop

P2100: !_LD [10] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_63:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2101: !_LD [1] (Int) (Loop exit)
lduw [%i0 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_63:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_63
nop

P2102: !_CASX [6] (maybe <- 0x1800047) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_64:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_64:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_64
nop

P2103: !_CAS [1] (maybe <- 0x1800049) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_65:
add %i0, 4, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_65:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_65
nop

P2104: !_CAS [7] (maybe <- 0x180004a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_66:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 4, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_66:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_66
nop

P2105: !_LD [8] (Int) (Loop entry) (LE) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_67:
wr %g0, 0x88, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduwa [%i3 + 12] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2105
nop
RET2105:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2106: !_REPLACEMENT [12] (Int)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P2107: !_LD [15] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_67:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_67
nop

P2108: !_CASX [8] (maybe <- 0x180004b) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_68:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_68:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_68
nop

P2109: !_FLUSHI [13] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_69:
flush %g0 
loop_exit_3_69:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_69
nop

P2110: !_CASX [17] (maybe <- 0x180004c) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_70:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2111: !_REPLACEMENT [22] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+4], %l7
st %l7, [%i2+4]
add %i2, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
add %l6, %l3, %l6
ld [%l6+4], %l7
st %l7, [%l6+4]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_70:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_70
nop

P2112: !_CASX [5] (maybe <- 0x180004d) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_71:
add %i1, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2113: !_ST [18] (maybe <- 0x180004e) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_71:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_71
nop

P2114: !_CASX [17] (maybe <- 0x180004f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_72:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_72:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_72
nop

P2115: !_CASX [1] (maybe <- 0x1800050) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_73:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_73:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_73
nop

P2116: !_LD [16] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_74:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2117: !_LD [22] (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_74:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_74
nop

P2118: !_CASX [22] (maybe <- 0x1800052) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_75:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2119: !_LD [3] (Int)
lduw [%i1 + 0], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2120: !_LD [21] (Int) (Loop exit)
lduw [%i3 + 0], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_75:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_75
nop

P2121: !_CASX [4] (maybe <- 0x1800054) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_76:
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_76:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_76
nop

P2122: !_ST [16] (maybe <- 0x1800056) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_77:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4

P2123: !_CASX [22] (maybe <- 0x1800057) (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_77:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_77
nop

P2124: !_ST [10] (maybe <- 0x1800059) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_78:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4

P2125: !_LD [6] (Int) (LE)
wr %g0, 0x88, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduwa [%i3 + 0] %asi, %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2126: !_LD [19] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_78:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_78
nop

P2127: !_CASX [16] (maybe <- 0x180005a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_79:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_79:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_79
nop

P2128: !_ST [10] (maybe <- 0x180005c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_80:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 4 ]
add   %l4, 1, %l4
loop_exit_3_80:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_80
nop

P2129: !_PREFETCH [3] (Int) (Loop entry) (Loop exit) (Branch target of P2140)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_81:
prefetch [%i1 + 0], 17
loop_exit_3_81:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_81
nop
ba P2130
nop

TARGET2140:
ba RET2140
nop


P2130: !_ST [11] (maybe <- 0x180005d) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_82:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i3
sub %i0, %i3, %i3
stw   %l4, [%i3 + 12 ]
add   %l4, 1, %l4

P2131: !_PREFETCH [17] (Int) (Loop exit) (Branch target of P2105)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 12], 3
loop_exit_3_82:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_82
nop
ba P2132
nop

TARGET2105:
ba RET2105
nop


P2132: !_CASX [2] (maybe <- 0x180005e) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_83:
add %i0, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_83:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_83
nop

P2133: !_LD [16] (FP) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_84:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
ld [%i3 + 4], %f0
! 1 addresses covered

P2134: !_CASX [13] (maybe <- 0x180005f) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_3_84:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_84
nop

P2135: !_CAS [22] (maybe <- 0x1800061) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_85:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 4, %o5
lduw [%o5], %o0
mov %o0, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
mov %l4, %l6
cas [%o5], %l7, %l6
! move %l6(lower) -> %o0(lower)
srl %l6, 0, %l7
or %l7, %o0, %o0
add   %l4, 1, %l4

P2136: !_LD [6] (Int)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1

P2137: !_LD [7] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
lduwa [%i2 + 4] %asi, %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_85:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_85
nop

P2138: !_ST [3] (maybe <- 0x1800062) (Int) (Loop entry) (Branch target of P2295)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_86:
stw   %l4, [%i1 + 0 ]
add   %l4, 1, %l4
ba P2139
nop

TARGET2295:
ba RET2295
nop


P2139: !_LD [9] (Int) (Branch target of P2401)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0
ba P2140
nop

TARGET2401:
ba RET2401
nop


P2140: !_LD [2] (Int) (Loop exit) (LE) (CBR)
wr %g0, 0x88, %asi
lduwa [%i0 + 12] %asi, %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2140
nop
RET2140:

! lfsr step begin
srlx %l0, 1, %l7
xnor %l7, %l0, %l7
sllx %l7, 63, %l7
or  %l7, %l0, %l0
srlx %l0, 1, %l0

!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_86:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_86
nop

P2141: !_CASX [9] (maybe <- 0x1800063) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_87:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2142: !_LD [1] (Int)
lduw [%i0 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2143: !_LD [16] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o2(lower)
or %o5, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_87:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_87
nop

P2144: !_CASX [1] (maybe <- 0x1800065) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_88:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2145: !_CASX [4] (maybe <- 0x1800067) (Int) (Loop exit)
ldx [%i1], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l6
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i1], %l6, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_3_88:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_88
nop

P2146: !_FLUSHI [22] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_89:
flush %g0 
loop_exit_3_89:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_89
nop

P2147: !_CASX [18] (maybe <- 0x1800069) (Int) (Loop entry) (Branch target of P2431)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_90:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
ba P2148
nop

TARGET2431:
ba RET2431
nop


P2148: !_REPLACEMENT [16] (Int) (Loop exit)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
sethi %hi(0x20000), %o5
ld [%i3+4], %l6
st %l6, [%i3+4]
add %i3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
add %l3, %o5, %l3
ld [%l3+4], %l6
st %l6, [%l3+4]
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_90:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_90
nop

P2149: !_REPLACEMENT [21] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_91:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+0], %l6
st %l6, [%i2+0]
add %i2, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
add %l3, %o5, %l3
ld [%l3+0], %l6
st %l6, [%l3+0]
loop_exit_3_91:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_91
nop

P2150: !_PREFETCH [19] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_92:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 4], 24
loop_exit_3_92:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_92
nop

P2151: !_CASX [14] (maybe <- 0x180006b) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_93:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2152: !_ST [21] (maybe <- 0x180006c) (Int) (Loop exit)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 0 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_93:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_93
nop

P2153: !_CAS [21] (maybe <- 0x180006d) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_94:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%i2], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P2154: !_CASX [20] (maybe <- 0x180006e) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l3
mov %l4, %o2
casx [%l6], %l3, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_94:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_94
nop

P2155: !_CASX [1] (maybe <- 0x180006f) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_95:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_95:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_95
nop

P2156: !_CASX [19] (maybe <- 0x1800071) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_96:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_96:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_96
nop

P2157: !_LD [3] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_97:
lduw [%i1 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2158: !_PREFETCH [23] (Int)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
prefetch [%i3 + 12], 18

P2159: !_LD [23] (Int) (Loop exit)
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o0(lower)
or %l7, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_97:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_97
nop

P2160: !_CASX [11] (maybe <- 0x1800073) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_98:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_98:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_98
nop

P2161: !_LD [14] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_99:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2162: !_ST [4] (maybe <- 0x1800074) (Int)
stw   %l4, [%i1 + 4 ]
add   %l4, 1, %l4

P2163: !_LD [9] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_99:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_99
nop

P2164: !_REPLACEMENT [8] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_100:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS2_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+12], %o5
st %o5, [%i3+12]
add %i3, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
add %l7, %l6, %l7
ld [%l7+12], %o5
st %o5, [%l7+12]
loop_exit_3_100:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_100
nop

P2165: !_CASX [6] (maybe <- 0x1800075) (Int) (Loop entry) (Loop exit) (Branch target of P2577)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_101:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_101:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_101
nop
ba P2166
nop

TARGET2577:
ba RET2577
nop


P2166: !_LD [3] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_102:
lduw [%i1 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2167: !_LD [8] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
lduw [%i3 + 12], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_102:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_102
nop

P2168: !_CASX [11] (maybe <- 0x1800077) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_103:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_103:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_103
nop

P2169: !_CASX [15] (maybe <- 0x1800078) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_104:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_104:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_104
nop

P2170: !_CASX [19] (maybe <- 0x180007a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_105:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_105:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_105
nop

P2171: !_LD [2] (FP) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_106:
ld [%i0 + 12], %f0
! 1 addresses covered

P2172: !_CASX [11] (maybe <- 0x180007c) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_3_106:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_106
nop

P2173: !_CASX [10] (maybe <- 0x180007d) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_107:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS2_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2174: !_CASX [15] (maybe <- 0x180007f) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %o5
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i3], %o5, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_3_107:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_107
nop

P2175: !_REPLACEMENT [15] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_108:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]

P2176: !_ST [5] (maybe <- 0x1800081) (Int) (Loop exit)
stw   %l4, [%i1 + 12 ]
add   %l4, 1, %l4
loop_exit_3_108:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_108
nop

P2177: !_CASX [9] (maybe <- 0x1800082) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_109:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_109:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_109
nop

P2178: !_CAS [16] (maybe <- 0x1800084) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_110:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4

P2179: !_CASX [14] (maybe <- 0x1800085) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l7
ldx [%l7], %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
mov  %o1, %l6
mov %l4, %o2
casx [%l7], %l6, %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_110:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_110
nop

P2180: !_LD [6] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_111:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2181: !_ST [2] (maybe <- 0x41000001) (FP)
! preparing store val #0, next val will be in f20 
fmovs  %f16, %f20
fadds  %f16, %f17, %f16
st   %f20, [%i0 + 12 ]

P2182: !_LD [0] (Int) (Loop exit)
lduw [%i0 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_111:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_111
nop

P2183: !_LD [10] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_112:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2184: !_REPLACEMENT [5] (Int) (CBR)
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+12], %l7
st %l7, [%i2+12]
add %i2, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]
add %l6, %l3, %l6
ld [%l6+12], %l7
st %l7, [%l6+12]

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2184
nop
RET2184:

! lfsr step begin
srlx %l0, 1, %o5
xnor %o5, %l0, %o5
sllx %o5, 63, %o5
or  %o5, %l0, %l0
srlx %l0, 1, %l0


P2185: !_LD [0] (Int) (Loop exit)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_112:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_112
nop

P2186: !_CASX [20] (maybe <- 0x1800086) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_113:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_113:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_113
nop

P2187: !_LD [0] (FP) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_114:
ld [%i0 + 0], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_3_114:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_114
nop

P2188: !_CASX [18] (maybe <- 0x1800087) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_115:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i2
sub %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_115:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_115
nop

P2189: !_PREFETCH [20] (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_116:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 12], 31
loop_exit_3_116:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_116
nop

P2190: !_CAS [13] (maybe <- 0x1800089) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_117:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 4, %l3
lduw [%l3], %o0
mov %o0, %o5
! move %o5(lower) -> %o0(upper)
sllx %o5, 32, %o0
mov %l4, %l7
cas [%l3], %o5, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_117:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_117
nop

P2191: !_CASX [15] (maybe <- 0x180008a) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_118:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_118:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_118
nop

P2192: !_CASX [6] (maybe <- 0x180008c) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_119:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_119:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_119
nop

P2193: !_MEMBAR (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_120:
membar #StoreLoad
loop_exit_3_120:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_120
nop

P2194: !_CASX [6] (maybe <- 0x180008e) (Int) (Loop entry) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_121:
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
sllx %o5, 32, %l6
or %o5, %l6, %o5 
and %l3, %o5, %l6
srlx %l6, 8, %l6
sllx %l3, 8, %l3
and %l3, %o5, %l3
or %l3, %l6, %l3 
sethi %hi(0xffff0000), %o5
srlx %l3, 16, %l6
andn %l6, %o5, %l6
andn %l3, %o5, %l3
sllx %l3, 16, %l3
or %l3, %l6, %l3 
srlx %l3, 32, %l6
sllx %l3, 32, %l3
or %l3, %l6, %l6 
wr %g0, 0x88, %asi
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldxa [%i3] %asi, %l7
! move %l7(lower) -> %o0(upper)
sllx %l7, 32, %o0
! move %l7(upper) -> %o0(lower)
srlx %l7, 32, %o5
or %o5, %o0, %o0
mov %l7, %o5
mov  %l6, %l7
casxa [%i3] %asi, %o5, %l7
! move %l7(lower) -> %o1(upper)
sllx %l7, 32, %o1
! move %l7(upper) -> %o1(lower)
srlx %l7, 32, %o5
or %o5, %o1, %o1
add  %l4, 1, %l4

P2195: !_ST [11] (maybe <- 0x1800090) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS3_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_121:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_121
nop

P2196: !_CASX [11] (maybe <- 0x1800091) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_122:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS3_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_122:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_122
nop

P2197: !_REPLACEMENT [21] (Int) (Loop entry) (Loop exit) (Branch target of P2255)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_123:
sethi %hi(REPLACEMENT0_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
sethi %hi(0x20000), %l3
ld [%i2+0], %l7
st %l7, [%i2+0]
add %i2, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
add %l6, %l3, %l6
ld [%l6+0], %l7
st %l7, [%l6+0]
loop_exit_3_123:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_123
nop
ba P2198
nop

TARGET2255:
ba RET2255
nop


P2198: !_CAS [13] (maybe <- 0x1800092) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_124:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 4, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P2199: !_MEMBAR (Int) (Loop exit)
membar #StoreLoad
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_124:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_124
nop

P2200: !_ST [21] (maybe <- 0x1800093) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_125:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
stw   %l4, [%i2 + 0 ]
add   %l4, 1, %l4

P2201: !_CASX [4] (maybe <- 0x1800094) (Int) (Loop exit)
ldx [%i1], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i1], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_125:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_125
nop

P2202: !_REPLACEMENT [18] (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_126:
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS3_O), %i3
sub %i0, %i3, %i3
sethi %hi(0x20000), %l6
ld [%i3+0], %o5
st %o5, [%i3+0]
add %i3, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
add %l7, %l6, %l7
ld [%l7+0], %o5
st %o5, [%l7+0]
loop_exit_3_126:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_126
nop

P2203: !_LD [11] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_127:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2204: !_CAS [23] (maybe <- 0x1800096) (Int)
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 12, %l3
lduw [%l3], %l7
mov %l7, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
mov %l4, %o1
cas [%l3], %o5, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2205: !_LD [7] (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 4], %l3
! move %l3(lower) -> %o1(lower)
or %l3, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_127:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_127
nop

P2206: !_LD [16] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_128:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2207: !_CAS [1] (maybe <- 0x1800097) (Int)
add %i0, 4, %l6
lduw [%l6], %o5
mov %o5, %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %l4, %o1
cas [%l6], %l3, %o1
! move %o1(lower) -> %o1(upper)
sllx %o1, 32, %o1
add   %l4, 1, %l4

P2208: !_LD [20] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %l6
! move %l6(lower) -> %o1(lower)
or %l6, %o1, %o1
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_128:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_128
nop

P2209: !_PREFETCH [16] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_129:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
prefetch [%i3 + 4], 3

P2210: !_REPLACEMENT [23] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REPLACEMENT0_ALIAS1_O), %i2
sub %i0, %i2, %i2
sethi %hi(0x20000), %o5
ld [%i2+12], %l6
st %l6, [%i2+12]
add %i2, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
add %l3, %o5, %l3
ld [%l3+12], %l6
st %l6, [%l3+12]
loop_exit_3_129:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_129
nop

P2211: !_CASX [6] (maybe <- 0x1800098) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_130:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %o5
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2212: !_LD [4] (Int) (Branch target of P2260)
lduw [%i1 + 4], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2
ba P2213
nop

TARGET2260:
ba RET2260
nop


P2213: !_LD [8] (Int) (Loop exit)
lduw [%i3 + 12], %l7
! move %l7(lower) -> %o2(lower)
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_130:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_130
nop

P2214: !_CASX [7] (maybe <- 0x180009a) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_131:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2215: !_CASX [17] (maybe <- 0x180009c) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
mov %l4, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_3_131:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_131
nop

P2216: !_CASX [23] (maybe <- 0x180009d) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_132:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_132:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_132
nop

P2217: !_ST [22] (maybe <- 0x180009e) (Int) (Loop entry) (CBR)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_133:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
stw   %l4, [%i3 + 4 ]
add   %l4, 1, %l4

! cbranch
andcc %l0, 1, %g0
be,pt  %xcc, TARGET2217
nop
RET2217:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2218: !_LD [13] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2219: !_LD [0] (Int) (Loop exit)
lduw [%i0 + 0], %l6
! move %l6(lower) -> %o0(lower)
or %l6, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_133:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_133
nop

P2220: !_ST [17] (maybe <- 0x180009f) (Int) (Loop entry) (Loop exit) (LE)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_134:
wr %g0, 0x88, %asi
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i3
sub %i0, %i3, %i3
! Change single-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l3
or %l3, %lo(0xff00ff00), %l3
and %l4, %l3, %l6
srl %l6, 8, %l6
sll %l4, 8, %o5
and %o5, %l3, %o5
or %o5, %l6, %o5
srl %o5, 16, %l6
sll %o5, 16, %o5
srl %o5, 0, %o5
or %o5, %l6, %o5
stwa   %o5, [%i3 + 12] %asi
add   %l4, 1, %l4
loop_exit_3_134:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_134
nop

P2221: !_LD [17] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_135:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2222: !_CASX [4] (maybe <- 0x18000a0) (Int) (LE)
sllx %l4, 32, %l7
add  %l4, 1, %l4
or   %l4, %l7, %l7
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %l6
or %l6, %lo(0xff00ff00), %l6
sllx %l6, 32, %o5
or %l6, %o5, %l6 
and %l7, %l6, %o5
srlx %o5, 8, %o5
sllx %l7, 8, %l7
and %l7, %l6, %l7
or %l7, %o5, %l7 
sethi %hi(0xffff0000), %l6
srlx %l7, 16, %o5
andn %o5, %l6, %o5
andn %l7, %l6, %l7
sllx %l7, 16, %l7
or %l7, %o5, %l7 
srlx %l7, 32, %o5
sllx %l7, 32, %l7
or %l7, %o5, %o5 
wr %g0, 0x88, %asi
ldxa [%i1] %asi, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
! move %l3(upper) -> %o1(upper)
or %l3, %g0, %o1
mov %l3, %l6
mov  %o5, %l3
casxa [%i1] %asi, %l6, %l3
! move %l3(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srl %l3, 0, %l6
or %l6, %o1, %o1
! move %l3(upper) -> %o2(upper)
or %l3, %g0, %o2
add  %l4, 1, %l4

P2223: !_LD [4] (Int) (Loop exit)
lduw [%i1 + 4], %l7
! move %l7(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l7, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_135:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_135
nop

P2224: !_CASX [10] (maybe <- 0x18000a2) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_136:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_136:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_136
nop

P2225: !_LD [12] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_137:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2226: !_LD [20] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_137:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_137
nop

P2227: !_CASX [21] (maybe <- 0x18000a4) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_138:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
ldx [%i2], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i2], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_138:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_138
nop

P2228: !_CASX [14] (maybe <- 0x18000a6) (Int) (Loop entry) (Loop exit) (Branch target of P2296)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_139:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l3
ldx [%l3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %o5
mov %l4, %o1
casx [%l3], %o5, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_139:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_139
nop
ba P2229
nop

TARGET2296:
ba RET2296
nop


P2229: !_LD [23] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_140:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
lduw [%i2 + 12], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2230: !_LD [4] (Int) (Loop exit) (LE)
wr %g0, 0x88, %asi
lduwa [%i1 + 4] %asi, %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_140:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_140
nop

P2231: !_CAS [5] (maybe <- 0x18000a7) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_141:
add %i1, 12, %l7
lduw [%l7], %o0
mov %o0, %l6
! move %l6(lower) -> %o0(upper)
sllx %l6, 32, %o0
mov %l4, %l3
cas [%l7], %l6, %l3
! move %l3(lower) -> %o0(lower)
srl %l3, 0, %l6
or %l6, %o0, %o0
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_141:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_141
nop

P2232: !_CASX [0] (maybe <- 0x18000a8) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_142:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2233: !_LD [14] (Int)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %o2
! move %o2(lower) -> %o2(upper)
sllx %o2, 32, %o2

P2234: !_LD [2] (Int) (Loop exit)
lduw [%i0 + 12], %l6
! move %l6(lower) -> %o2(lower)
or %l6, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_142:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_142
nop

P2235: !_LD [14] (FP) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_143:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
ld [%i2 + 12], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_3_143:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_143
nop

P2236: !_CASX [1] (maybe <- 0x18000aa) (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_144:
ldx [%i0], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i0], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2237: !_CASX [8] (maybe <- 0x18000ac) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov  %o2, %l3
mov %l4, %o3
casx [%l6], %l3, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_3_144:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_144
nop

P2238: !_PREFETCH [14] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_145:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS1_O), %i2
sub %i0, %i2, %i2
prefetch [%i2 + 12], 21

P2239: !_CASX [7] (maybe <- 0x18000ad) (Int) (Loop exit)
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l6
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_145:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_145
nop

P2240: !_CASX [17] (maybe <- 0x18000af) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_146:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_146:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_146
nop

P2241: !_CASX [14] (maybe <- 0x18000b0) (Int) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_147:
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS2_O), %i3
sub %i0, %i3, %i3
add %i3, 8, %l6
ldx [%l6], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l3
mov %l4, %o1
casx [%l6], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_147:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_147
nop

P2242: !_LD [18] (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_148:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2243: !_CASX [19] (maybe <- 0x18000b1) (Int) (LE)
sllx %l4, 32, %l3
add  %l4, 1, %l4
or   %l4, %l3, %l3
! Change double-word-level endianess (big endian <-> little endian) 
sethi %hi(0xff00ff00), %o5
or %o5, %lo(0xff00ff00), %o5
sllx %o5, 32, %l6
or %o5, %l6, %o5 
and %l3, %o5, %l6
srlx %l6, 8, %l6
sllx %l3, 8, %l3
and %l3, %o5, %l3
or %l3, %l6, %l3 
sethi %hi(0xffff0000), %o5
srlx %l3, 16, %l6
andn %l6, %o5, %l6
andn %l3, %o5, %l3
sllx %l3, 16, %l3
or %l3, %l6, %l3 
srlx %l3, 32, %l6
sllx %l3, 32, %l3
or %l3, %l6, %l6 
wr %g0, 0x88, %asi
ldxa [%i2] %asi, %l7
! move %l7(lower) -> %o0(lower)
srl %l7, 0, %o5
or %o5, %o0, %o0
! move %l7(upper) -> %o1(upper)
or %l7, %g0, %o1
mov %l7, %o5
mov  %l6, %l7
casxa [%i2] %asi, %o5, %l7
! move %l7(lower) -> %o1(lower)
srlx %o1, 32, %o1
sllx %o1, 32, %o1
srl %l7, 0, %o5
or %o5, %o1, %o1
! move %l7(upper) -> %o2(upper)
or %l7, %g0, %o2
add  %l4, 1, %l4

P2244: !_LD [14] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS2_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 12], %l3
! move %l3(lower) -> %o2(lower)
srlx %o2, 32, %o2
sllx %o2, 32, %o2
or %l3, %o2, %o2
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
loop_exit_3_148:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_148
nop

P2245: !_CASX [23] (maybe <- 0x18000b3) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_149:
sethi %hi(REGION7_ALIAS0_O-REGION0_ALIAS0_O), %i2
add %i0, %i2, %i2
add %i2, 8, %o5
ldx [%o5], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l7
mov %l4, %o1
casx [%o5], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2246: !_CASX [4] (maybe <- 0x18000b4) (Int) (Loop exit)
ldx [%i1], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i1], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_3_149:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_149
nop

P2247: !_LD [5] (FP) (Loop entry) (Loop exit)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_150:
ld [%i1 + 12], %f0
! 1 addresses covered
!---- flushing fp results buffer to %f30 ----
fmovs %f0, %f30
!--
loop_exit_3_150:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_150
nop

P2248: !_CAS [11] (maybe <- 0x18000b6) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_151:
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS3_O), %i3
sub %i0, %i3, %i3
add %i3, 12, %l6
lduw [%l6], %o0
mov %o0, %l3
! move %l3(lower) -> %o0(upper)
sllx %l3, 32, %o0
mov %l4, %o5
cas [%l6], %l3, %o5
! move %o5(lower) -> %o0(lower)
srl %o5, 0, %l3
or %l3, %o0, %o0
add   %l4, 1, %l4

P2249: !_ST [14] (maybe <- 0x18000b7) (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION4_ALIAS2_O), %i2
sub %i0, %i2, %i2
stw   %l4, [%i2 + 12 ]
add   %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_151:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_151
nop

P2250: !_FLUSHI [1] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_152:
flush %g0 

P2251: !_CASX [9] (maybe <- 0x18000b8) (Int) (Loop exit) (Branch target of P2424)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS3_O), %i3
sub %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l3
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l3, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_152:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_152
nop
ba P2252
nop

TARGET2424:
ba RET2424
nop


P2252: !_CASX [17] (maybe <- 0x18000ba) (Int) (Loop entry) (Loop exit)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_153:
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
add %i2, 8, %l7
ldx [%l7], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov  %o0, %l6
mov %l4, %o1
casx [%l7], %l6, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
loop_exit_3_153:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_153
nop

P2253: !_CASX [6] (maybe <- 0x18000bb) (Int) (Loop entry)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_154:
sethi %hi(REGION2_ALIAS0_O-REGION0_ALIAS0_O), %i3
add %i0, %i3, %i3
ldx [%i3], %o0
! move %o0(upper) -> %o0(upper)
! move %o0(lower) -> %o0(lower)
mov %o0, %l7
sllx %l4, 32, %o1
add  %l4, 1, %l4
or   %l4, %o1, %o1
casx [%i3], %l7, %o1
! move %o1(upper) -> %o1(upper)
! move %o1(lower) -> %o1(lower)
add  %l4, 1, %l4

P2254: !_CASX [3] (maybe <- 0x18000bd) (Int) (Loop exit)
ldx [%i1], %o2
! move %o2(upper) -> %o2(upper)
! move %o2(lower) -> %o2(lower)
mov %o2, %l7
sllx %l4, 32, %o3
add  %l4, 1, %l4
or   %l4, %o3, %o3
casx [%i1], %l7, %o3
! move %o3(upper) -> %o3(upper)
! move %o3(lower) -> %o3(lower)
add  %l4, 1, %l4
!---- flushing int results buffer----
mov %o0, %l5
mov %o1, %l5
mov %o2, %l5
mov %o3, %l5
loop_exit_3_154:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_154
nop

P2255: !_LD [18] (Int) (Loop entry) (CBR)
sethi %hi(0x2), %l2
or %l2, %lo(0x2),  %l2
loop_entry_3_155:
sethi %hi(REGION0_ALIAS0_O-REGION6_ALIAS3_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

! cbranch
andcc %l0, 1, %g0
be,pn  %xcc, TARGET2255
nop
RET2255:

! lfsr step begin
srlx %l0, 1, %l6
xnor %l6, %l0, %l6
sllx %l6, 63, %l6
or  %l6, %l0, %l0
srlx %l0, 1, %l0


P2256: !_LD [10] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION3_ALIAS3_O), %i3
sub %i0, %i3, %i3
lduw [%i3 + 4], %o5
! move %o5(lower) -> %o0(lower)
or %o5, %o0, %o0
!---- flushing int results buffer----
mov %o0, %l5
loop_exit_3_155:
sub %l2, 1, %l2
cmp %l2, 0
bg loop_entry_3_155
nop

P2257: !_LD [4] (Int) (Loop entry)
sethi %hi(0x1), %l2
or %l2, %lo(0x1),  %l2
loop_entry_3_156:
lduw [%i1 + 4], %o0
! move %o0(lower) -> %o0(upper)
sllx %o0, 32, %o0

P2258: !_LD [15] (Int) (Loop exit)
sethi %hi(REGION0_ALIAS0_O-REGION5_ALIAS1_O), %i2
sub %i0, %i2, %i2
lduw [%i2 + 0], %l3
! move %l3(lower) -> %o0(lower)
or %l3, %o0, %o0
mov %o0, %l5
cmp %l2, 0