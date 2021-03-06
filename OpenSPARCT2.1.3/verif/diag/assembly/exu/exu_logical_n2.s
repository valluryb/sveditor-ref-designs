/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: exu_logical_n2.s
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
#define NUM_REG_CASES   9
#define NUM_IMMED_CASES 5    
   

/*******************************************************/    
#include "hboot.s"

.global main
main:
th_fork(th_main,%l0)		! start up to four threads.
	! All threads do the same thing. No need to run more than one core,
	! and no need to differentiate the threads because nobody stores
	! anything.
th_main_0:    
th_main_1:    
th_main_2:    
th_main_3:    
	!**************************
	! Operand2 as a register 
	!**************************
	set	rs2_data,%g1
	add	%g0,NUM_REG_CASES,%l3		
rs2_loop:
	ldx	[%g1],%l1
	ldx	[%g1+8],%l2
				    ! ccr set to ff, make sure all bits change
	wr	%g0,0xff,%ccr	    
	and	%l1,%l2,%l4	    
				    
       	wr	%g0,0xff,%ccr	    
	andcc	%l1,%l2,%l5	    
				    
	wr	%g0,0xff,%ccr	    
	andn	%l1,%l2,%l6	    
				    
	wr	%g0,0xff,%ccr	    
	andncc	%l1,%l2,%l7	    
				    
	wr	%g0,0xff,%ccr	    
	or	%l1,%l2,%i0
    				    
	wr	%g0,0xff,%ccr	    
	orcc	%l1,%l2,%i1

	wr	%g0,0xff,%ccr	    
	orn	%l1,%l2,%i2	    
				    
       	wr	%g0,0xff,%ccr	    
	orncc	%l1,%l2,%i3	    
				    
	wr	%g0,0xff,%ccr	    
	xor	%l1,%l2,%i4	    
				    
	wr	%g0,0xff,%ccr	    
	xorcc	%l1,%l2,%i5	    
				    
	wr	%g0,0xff,%ccr	    
	xnor	%l1,%l2,%i6
    				    
	wr	%g0,0xff,%ccr	    
	xnorcc	%l1,%l2,%i7
    
	sub	%l3,0x1,%l3
	brnz,pt	%l3,rs2_loop
	add	%g1,0x10,%g1	    ! move operand pointer

	!**************************
	! Operand2 as immediate 
	!**************************    
       
	set	immed_data,%g1
	add	%g0,NUM_IMMED_CASES,%l3
immed_loop:
	ldx	[%g1],%l1		
				    ! back to back logicals
	and	%l1,0,%l4
	or	%l1,0,%l5
	xor	%l1,0,%l6
	andcc	%l1,0,%l7	    
	orcc	%l1,0,%i0	    
	xorcc	%l1,0,%i1	    
	andn	%l1,0,%i2	    
	xnor	%l1,0,%i3	    
	orn	%l1,0,%i4	    
	xnorcc	%l1,0,%i5	    
	andncc	%l1,0,%i6	    
	orncc	%l1,0,%i7
    
	and	%l1,0x1fff,%l4
	or	%l1,0x1fff,%l5
	xor	%l1,0x1fff,%l6
	andcc	%l1,0x1fff,%l7	    
	orcc	%l1,0x1fff,%i0	    
	xorcc	%l1,0x1fff,%i1	    
	andn	%l1,0x1fff,%i2	    
	xnor	%l1,0x1fff,%i3	    
	orn	%l1,0x1fff,%i4	    
	xnorcc	%l1,0x1fff,%i5	    
	andncc	%l1,0x1fff,%i6	    
	orncc	%l1,0x1fff,%i7	
    
	and	%l1,0x1555,%l4	    ! random bit patterns
	or	%l1,0x0aaa,%l5
	xor	%l1,0x1333,%l6
	andcc	%l1,0x0ccc,%l7	    
	orcc	%l1,0x1e1e,%i0	    
	xorcc	%l1,0x0731,%i1	    
	andn	%l1,0x1c80,%i2	    
	xnor	%l1,0x00ff,%i3	    
	orn	%l1,0x1f00,%i4	    
	xnorcc	%l1,0x1f00,%i5	    
	andncc	%l1,0x1f00,%i6	    
	orncc	%l1,0x00ff,%i7	    
    
    	sub	%l3,0x1,%l3
	brnz,pt	%l3,immed_loop
	add	%g1,8,%g1	    ! move operand pointer   

good_end:   
	ta	T_GOOD_TRAP
	nop
	nop    


!==========================    
.data
.align 0x1fff+1

.global tsdata
rs2_data:                   
        .word 0x00000000, 0x00000000	! zeros and foxes
        .word 0x00000000, 0x00000000
    
	.word 0xffffffff, 0xffffffff
	.word 0xffffffff, 0xffffffff
    				    
	.word 0xffffffff, 0xffffffff
	.word 0x00000000, 0x00000000
    
	.word 0x00000000, 0x00000000
	.word 0xffffffff, 0xffffffff
        				    
        .word 0x80000000, 0x80000000	! independence of n and z bits
        .word 0x00000000, 0x00000001
    				    
        .word 0x00000000, 0x80000001
	.word 0x00000001, 0x80000000
     				    
	.word 0x80000001, 0x00000001
	.word 0x80000000, 0x00000001
				    
	.word 0x00000001, 0x00000000
	.word 0x80000001, 0x80000000
				    
	.word 0x56789abc, 0x87654320	! random number
	.word 0x9abcdef1, 0x9631246a

.global immed_data
immed_data: 
	.word 0x00000000, 0x00000000
	.word 0xffffffff, 0xffffffff
	.word 0x00000000, 0x00001555
	.word 0xffffffff, 0xffffe000
	.word 0xaaaaaaaa, 0xaaaaaaaa    

.end
