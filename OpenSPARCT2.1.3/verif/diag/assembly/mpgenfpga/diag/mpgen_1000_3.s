/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1000_3.s
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
!	Niagara2 UP Random Test
!	Seed = 327141854
!	Riesling can be on
!	1 Thread, 1000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1000_3.s created on Mar 27, 2009 (14:18:54)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_1000_3 -p 1 -l 1000

#define H_HT0_Hw_Corrected_Error_0x63 hw_corrected_error_handler

#define	MAIN_PAGE_NUCLEUS_ALSO
#define	MAIN_PAGE_HV_ALSO
#define	N_CPUS	1
#define	ENABLE_T0_Fp_exception_ieee_754_0x21
#define	ENABLE_T0_Fp_exception_other_0x22
#define	ENABLE_T0_Fp_disabled_0x20
#define	ENABLE_T0_Illegal_instruction_0x10
#define	ENABLE_T1_Illegal_instruction_0x10
#define	ENABLE_HT0_Illegal_instruction_0x10
#define	ENABLE_HT1_Illegal_instruction_0x10
#define	ENABLE_T0_Clean_Window_0x24
#define	THREAD_COUNT	1
#define	THREAD_STRIDE	1
#define	SKIP_TRAPCHECK
#define USE_MPGEN_TRAPS

#include "hboot.s"

	.text
	.global	main
main:

!	Random code for Processor 0

processor_0:
	ta	T_CHANGE_PRIV
	wrpr	%g0,7,%cleanwin
	call	p0_init_memory_pointers
	wr	%g0,0x80,%asi		! Setting default asi to 80

!	Initialize the floating point registers for processor 0

	wr	%g0,0x4,%fprs		! Make sure fef is 1
	set	p0_init_freg,%g1
!	%f0  = 9c9f51e5 4ba23179 155744ec 4171f951
!	%f4  = f45267f9 965f751e 6cbd7777 9477471c
!	%f8  = 3a5d2a6b 2f4fb61c a89c24be 3b4f1702
!	%f12 = 0146d63f 71569b80 88bb0b01 0a72761c
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 45818645 0501eaf7 5caf4763 28278555
!	%f20 = 7c504b52 5cbc7420 c1e4a434 10339a82
!	%f24 = 51c3aa30 a0b84dc5 8160d2da 965c0c11
!	%f28 = 7cf116da 1db7aeeb e60468ff 206e5963
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 51690e1e 74e1a8f5 de31b9e2 946775dd
!	%f36 = 72e92e3d 4a261cfd b165be79 d3a2afb1
!	%f40 = d90080fe 3c238618 dc3713de 260db352
!	%f44 = 7126cf9b 828e0ef4 3b8ad4c6 79ab80de
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x3ccd596f0000004c,%g7,%g1 ! GSR scale =  9, align = 4
	wr	%g1,%g0,%gsr		! GSR = 3ccd596f0000004c
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%f16 = 45818645 0501eaf7, %l5 = bfe37e63a963cf70
!	Mem[0000000030041408] = eaa995d7c0b39e8f
	add	%i1,0x008,%g1
	stda	%f16,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030041408] = eaa995d74586818f
!	Mem[0000000010081420] = 354a6e52 a63026bc, %l2 = 6da35ce9, %l3 = cab64aaf
	ldd	[%i2+0x020],%l2		! %l2 = 00000000354a6e52 00000000a63026bc
!	Mem[0000000030041410] = e00530a2, %l6 = ddf155a5cd2185ba
	lduha	[%i1+%o5]0x81,%l6	! %l6 = 000000000000e005
!	%f18 = 5caf4763, %f1  = 4ba23179, %f27 = 965c0c11
	fmuls	%f18,%f1 ,%f27		! %f27 = 68de1a18
!	Mem[0000000030101410] = ef174cd7, %l7 = 74c4cbaa6fc77c9c
	ldswa	[%i4+%o5]0x89,%l7	! %l7 = ffffffffef174cd7
!	Mem[0000000010101408] = 2fa6e529, %f9  = 2f4fb61c
	lda	[%i4+%o4]0x80,%f9 	! %f9 = 2fa6e529
!	%f22 = c1e4a434 10339a82, Mem[0000000030141408] = 62bf77ca 38f9c2a2
	stda	%f22,[%i5+%o4]0x81	! Mem[0000000030141408] = c1e4a434 10339a82
!	Mem[0000000030101410] = ef174cd7, %l4 = d45d517c18498752
	lduba	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000d7
!	%f13 = 71569b80, Mem[0000000010041408] = 2d6259a1
	sta	%f13,[%i1+%o4]0x80	! Mem[0000000010041408] = 71569b80
!	Starting 10 instruction Store Burst
!	%f25 = a0b84dc5, Mem[0000000010181410] = 6932266b
	sta	%f25,[%i6+%o5]0x88	! Mem[0000000010181410] = a0b84dc5

p0_label_2:
!	Mem[00000000100c1408] = e1d5a50f, %l6 = 000000000000e005
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 00000000e1d5a50f
!	%f21 = 5cbc7420, %f24 = 51c3aa30, %f14 = 88bb0b01
	fdivs	%f21,%f24,%f14		! %f14 = 4a7690b0
!	%f19 = 28278555, Mem[0000000010081408] = eda5c957
	sta	%f19,[%i2+%o4]0x88	! Mem[0000000010081408] = 28278555
!	%l6 = 00000000e1d5a50f, Mem[0000000010081424] = a63026bc
	sth	%l6,[%i2+0x024]		! Mem[0000000010081424] = a50f26bc
!	%l1 = eaa74409cb915f4a, Mem[0000000010081400] = eb200895
	stba	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = eb20084a
!	%l4 = 000000d7, %l5 = a963cf70, Mem[0000000030081400] = ab7953b2 78288112
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000d7 a963cf70
!	%l3 = 00000000a63026bc, Mem[0000000021800080] = 7353ac45
	stb	%l3,[%o3+0x080]		! Mem[0000000021800080] = bc53ac45
!	%f2  = 155744ec, Mem[0000000010181410] = a0b84dc5
	sta	%f2 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 155744ec
!	Mem[0000000010181408] = 9f831778, %l5 = bfe37e63a963cf70
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 000000009f831778
!	Starting 10 instruction Load Burst
!	Mem[0000000010101434] = 3b61b7dc, %l4 = 00000000000000d7
	lduha	[%i4+0x034]%asi,%l4	! %l4 = 0000000000003b61

p0_label_3:
!	Mem[0000000030001400] = b9bdbe7c, %l6 = 00000000e1d5a50f
	lduha	[%i0+%g0]0x89,%l6	! %l6 = 000000000000be7c
!	Mem[0000000030081400] = a963cf70 000000d7, %l4 = 00003b61, %l5 = 9f831778
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000d7 00000000a963cf70
!	Mem[0000000030041400] = 46a2389f 78c0cd34, %l0 = 64604c25, %l1 = cb915f4a
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 0000000046a2389f 0000000078c0cd34
!	Mem[0000000021800100] = 64a95d14, %l5 = 00000000a963cf70
	lduha	[%o3+0x100]%asi,%l5	! %l5 = 00000000000064a9
!	Mem[0000000010081410] = e2d273545e1c08c6, %f14 = 4a7690b0 0a72761c
	ldd	[%i2+%o5],%f14		! %f14 = e2d27354 5e1c08c6
!	Mem[0000000010181400] = c40f900c, %l7 = ffffffffef174cd7
	ldswa	[%i6+%g0]0x88,%l7	! %l7 = ffffffffc40f900c
!	Mem[0000000010141410] = f225cffd, %l1 = 0000000078c0cd34
	lduha	[%i5+%o5]0x88,%l1	! %l1 = 000000000000cffd
!	Mem[0000000030141408] = c1e4a434, %l2 = 00000000354a6e52
	ldsba	[%i5+%o4]0x81,%l2	! %l2 = ffffffffffffffc1
!	Mem[000000001014140c] = 01ee8e9b, %f26 = 8160d2da
	ld	[%i5+0x00c],%f26	! %f26 = 01ee8e9b
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = e4b259ce, %l4 = 00000000000000d7
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 000000e4000000ff

p0_label_4:
!	Mem[00000000100c1400] = 34b5c0f9, %l7 = ffffffffc40f900c
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 00000034000000ff
!	Mem[0000000010181410] = 155744ec, %l2 = ffffffffffffffc1
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 00000000155744ec
!	%f5  = 965f751e, %f6  = 6cbd7777
	fsqrts	%f5 ,%f6 		! %f6  = 7fffffff
!	%l7 = 0000000000000034, Mem[00000000100c1400] = ffb5c0f9af0a24af
	stxa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000034
!	%l6 = 000000000000be7c, Mem[0000000010181408] = a963cf70
	stba	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 7c63cf70
!	%l7 = 0000000000000034, Mem[0000000010101410] = 1b4e9757
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 00349757
!	%l7 = 0000000000000034, Mem[0000000030041400] = 46a2389f
	stwa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000034
!	%l3 = 00000000a63026bc, Mem[0000000010041400] = fa407997ecbc572e
	stxa	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000a63026bc
!	%l6 = 000000000000be7c, Mem[0000000030181408] = 3bf3d5d6e1cdc975
	stxa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000000000be7c
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = d795a9ea, %l3 = 00000000a63026bc
	lduha	[%i1+%o4]0x89,%l3	! %l3 = 000000000000a9ea

p0_label_5:
!	Mem[0000000010001434] = 80495b49, %l7 = 0000000000000034
	ldsh	[%i0+0x036],%l7		! %l7 = 0000000000005b49
!	Mem[0000000010001438] = 9c5cea45cc92b290, %l7 = 0000000000005b49
	ldxa	[%i0+0x038]%asi,%l7	! %l7 = 9c5cea45cc92b290
!	Mem[0000000030101408] = 6ae6c6316de02c31, %f20 = 7c504b52 5cbc7420
	ldda	[%i4+%o4]0x89,%f20	! %f20 = 6ae6c631 6de02c31
!	Mem[0000000010141428] = 05a5cb8671dfe059, %l7 = 9c5cea45cc92b290
	ldxa	[%i5+0x028]%asi,%l7	! %l7 = 05a5cb8671dfe059
!	Mem[0000000010041400] = 00000000, %l5 = 00000000000064a9
	ldsba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = f11d3438, %f24 = 51c3aa30
	lda	[%i0+%o4]0x88,%f24	! %f24 = f11d3438
!	Mem[000000001010141c] = a285b2d6, %l2 = 00000000155744ec
	ldsh	[%i4+0x01e],%l2		! %l2 = ffffffffffffb2d6
!	Mem[0000000010141418] = f637b056, %f15 = 5e1c08c6
	lda	[%i5+0x018]%asi,%f15	! %f15 = f637b056
!	Mem[00000000100c1400] = 00000000, %l5 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 0c900fc4, %l2 = ffffffffffffb2d6
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 000000000c900fc4

p0_label_6:
!	Mem[000000001008143c] = d98cec74, %l7 = 71dfe059, %l4 = 000000e4
	add	%i2,0x3c,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 00000000d98cec74
!	%l0 = 0000000046a2389f, Mem[0000000030141400] = 75869a74
	stba	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 75869a9f
!	Mem[0000000010041404] = a63026bc, %l6 = 000000000000be7c
	swap	[%i1+0x004],%l6		! %l6 = 00000000a63026bc
!	%f0  = 9c9f51e5 4ba23179, Mem[0000000030081408] = 02f3c5a4 684741f6
	stda	%f0 ,[%i2+%o4]0x89	! Mem[0000000030081408] = 9c9f51e5 4ba23179
!	%l5 = 0000000000000000, Mem[0000000030101400] = d65dd1e2
	stba	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 005dd1e2
!	Mem[00000000300c1408] = cbd0b4f1, %l4 = 00000000d98cec74
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 00000000cbd0b4f1
!	%f3  = 4171f951, Mem[00000000100c1408] = 05e00000
	sta	%f3 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 4171f951
!	Mem[0000000030101410] = ef174cd7, %l7 = 05a5cb8671dfe059
	swapa	[%i4+%o5]0x89,%l7	! %l7 = 00000000ef174cd7
!	%l1 = 000000000000cffd, Mem[0000000030101410] = 59e0df71
	stha	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = cffddf71
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = 0a12992439cdbd71, %l3 = 000000000000a9ea
	ldxa	[%i1+0x020]%asi,%l3	! %l3 = 0a12992439cdbd71

p0_label_7:
!	Mem[0000000010181410] = c1ffffff, %f11 = 3b4f1702
	ld	[%i6+%o5],%f11	! %f11 = c1ffffff
!	Mem[0000000021800140] = 42fd04f1, %l3 = 0a12992439cdbd71
	ldsha	[%o3+0x140]%asi,%l3	! %l3 = 00000000000042fd
!	Mem[0000000030181408] = 0000be7c, %l6 = 00000000a63026bc
	ldsba	[%i6+%o4]0x89,%l6	! %l6 = 000000000000007c
!	Mem[0000000010081408] = 1f7cb8ad 28278555, %l2 = 0c900fc4, %l3 = 000042fd
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 0000000028278555 000000001f7cb8ad
!	Mem[0000000030101410] = 71dffdcf, %l7 = 00000000ef174cd7
	lduha	[%i4+%o5]0x89,%l7	! %l7 = 000000000000fdcf
!	Mem[0000000010001400] = 11b28999 b6976f8b 38341df1 dffc1e20
!	Mem[0000000010001410] = 674afb7e ce1743fa eddf916a e6e7ad5a
!	Mem[0000000010001420] = d0ec17a6 7181c0b2 15cf41b8 4575225b
!	Mem[0000000010001430] = 6f38db36 80495b49 9c5cea45 cc92b290
	ldda	[%i0]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010001400
!	Mem[0000000030001400] = b9bdbe7c, %l2 = 0000000028278555
	lduwa	[%i0+%g0]0x89,%l2	! %l2 = 00000000b9bdbe7c
!	Mem[0000000030101400] = 005dd1e2, %l2 = 00000000b9bdbe7c
	ldsha	[%i4+%g0]0x81,%l2	! %l2 = 000000000000005d
!	Mem[0000000010101408] = 29e5a62f, %f19 = 28278555
	lda	[%i4+%o4]0x88,%f19	! %f19 = 29e5a62f
!	Starting 10 instruction Store Burst
!	%l4 = 00000000cbd0b4f1, Mem[000000001008140c] = adb87c1f
	stw	%l4,[%i2+0x00c]		! Mem[000000001008140c] = cbd0b4f1

p0_label_8:
!	%l0 = 0000000046a2389f, Mem[0000000010101410] = 57973400
	stha	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 5797389f
!	%l7 = 000000000000fdcf, Mem[0000000010041400] = 00000000
	stba	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = cf000000
!	%l6 = 000000000000007c, Mem[0000000010041408] = 809b5671
	stba	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 809b567c
!	%l5 = 0000000000000000, Mem[0000000010101400] = 897d615d1ccf84a7
	stxa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000000
	membar	#Sync			! Added by membar checker (1)
!	%l1 = 000000000000cffd, Mem[0000000010001411] = 674afb7e
	stb	%l1,[%i0+0x011]		! Mem[0000000010001410] = 67fdfb7e
!	%l2 = 0000005d, %l3 = 1f7cb8ad, Mem[0000000030181408] = 7cbe0000 00000000
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000005d 1f7cb8ad
!	%f12 = 495b4980 36db386f, Mem[0000000010001400] = 9989b211 8b6f97b6
	stda	%f12,[%i0+%g0]0x88	! Mem[0000000010001400] = 495b4980 36db386f
!	Mem[00000000100c1408] = 4171f951, %l6 = 000000000000007c
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 00000041000000ff
!	%l4 = 00000000cbd0b4f1, Mem[0000000010041408] = 809b567c
	stha	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 809bb4f1
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 0000000000000000, %l0 = 0000000046a2389f
	ldxa	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_9:
!	Mem[0000000010181400] = ffffb2d6, %l2 = 000000000000005d
	lduwa	[%i6+%g0]0x80,%l2	! %l2 = 00000000ffffb2d6
!	Mem[0000000010141400] = 72f6bd892c9ee77b, %f24 = f11d3438 a0b84dc5
	ldda	[%i5+%g0]0x80,%f24	! %f24 = 72f6bd89 2c9ee77b
!	Mem[0000000030081410] = 780d7c5c, %l4 = 00000000cbd0b4f1
	ldsha	[%i2+%o5]0x89,%l4	! %l4 = 0000000000007c5c
!	Mem[0000000030101410] = cffddf71, %l7 = 000000000000fdcf
	lduwa	[%i4+%o5]0x81,%l7	! %l7 = 00000000cffddf71
!	Mem[0000000010001428] = 15cf41b8 4575225b, %l2 = ffffb2d6, %l3 = 1f7cb8ad
	ldd	[%i0+0x028],%l2		! %l2 = 0000000015cf41b8 000000004575225b
!	Mem[0000000010041408] = 809bb4f1, %l1 = 000000000000cffd
	ldswa	[%i1+%o4]0x88,%l1	! %l1 = ffffffff809bb4f1
!	Mem[0000000010001414] = ce1743fa, %f3  = f11d3438
	lda	[%i0+0x014]%asi,%f3 	! %f3 = ce1743fa
!	%f1  = 9989b211, %f1  = 9989b211, %f15 = 45ea5c9c
	fadds	%f1 ,%f1 ,%f15		! %f15 = 9a09b211
!	Mem[0000000010181408] = 4a39ff7a70cf637c, %l4 = 0000000000007c5c
	ldxa	[%i6+%o4]0x88,%l4	! %l4 = 4a39ff7a70cf637c
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000041, Mem[0000000010141428] = 05a5cb86, %asi = 80
	stha	%l6,[%i5+0x028]%asi	! Mem[0000000010141428] = 0041cb86

p0_label_10:
!	Mem[000000001000143d] = cc92b290, %l0 = 0000000000000000
	ldstub	[%i0+0x03d],%l0		! %l0 = 00000092000000ff
!	%l7 = 00000000cffddf71, Mem[0000000030041400] = 34000000
	stba	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 34000071
!	%f2  = 201efcdf ce1743fa, Mem[0000000010081408] = 28278555 f1b4d0cb
	stda	%f2 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 201efcdf ce1743fa
!	%f16 = 45818645 0501eaf7, %l1 = ffffffff809bb4f1
!	Mem[0000000030081418] = 3f651de1d3cf4e19
	add	%i2,0x018,%g1
	stda	%f16,[%g1+%l1]ASI_PST32_S ! Mem[0000000030081418] = 3f651de10501eaf7
!	Mem[0000000010101404] = 00000000, %l4 = 4a39ff7a70cf637c
	ldstuba	[%i4+0x004]%asi,%l4	! %l4 = 00000000000000ff
!	%f20 = 6ae6c631 6de02c31, Mem[0000000030181410] = 3efaf435 3f9e843e
	stda	%f20,[%i6+%o5]0x89	! Mem[0000000030181410] = 6ae6c631 6de02c31
!	%l6 = 00000041, %l7 = cffddf71, Mem[0000000010141400] = 72f6bd89 2c9ee77b
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000041 cffddf71
!	%l7 = 00000000cffddf71, Mem[0000000030041408] = d795a9ea
	stha	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = d795df71
!	Mem[0000000010041438] = 552859e6f9904d0b, %l7 = 00000000cffddf71, %l3 = 000000004575225b
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l7,%l3	! %l3 = 552859e6f9904d0b
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 38341df1dffc1e20, %f18 = 5caf4763 29e5a62f
	ldda	[%i0+0x008]%asi,%f18	! %f18 = 38341df1 dffc1e20

p0_label_11:
!	Mem[0000000010041400] = cf000000, %l7 = 00000000cffddf71
	ldsha	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffcf00
!	Mem[00000000100c1408] = 1376e6e351f971ff, %f4  = fa4317ce 7efb4a67
	ldda	[%i3+%o4]0x88,%f4 	! %f4  = 1376e6e3 51f971ff
!	Mem[0000000010141400] = 00000041cffddf71, %f8  = b2c08171 a617ecd0
	ldd	[%i5+%g0],%f8 		! %f8  = 00000041 cffddf71
!	Mem[00000000300c1408] = d98cec74 4689d745, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 00000000d98cec74 000000004689d745
!	Mem[0000000030001408] = 18afd200, %l7 = ffffffffffffcf00
	lduwa	[%i0+%o4]0x81,%l7	! %l7 = 0000000018afd200
!	Mem[0000000030101410] = 71dffdcf, %l6 = 0000000000000041
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = fffffffffffffdcf
!	Mem[0000000030081400] = a963cf70000000d7, %l1 = ffffffff809bb4f1
	ldxa	[%i2+%g0]0x89,%l1	! %l1 = a963cf70000000d7
!	Mem[000000001014143c] = 2bd22e08, %l6 = fffffffffffffdcf
	ldsw	[%i5+0x03c],%l6		! %l6 = 000000002bd22e08
!	Mem[0000000010001408] = 38341df1, %l2 = 0000000015cf41b8
	ldsba	[%i0+0x00b]%asi,%l2	! %l2 = fffffffffffffff1
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 38a09864, %l6 = 000000002bd22e08
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 000000a0000000ff

p0_label_12:
!	Mem[0000000030181400] = 3a2d265a, %l4 = 00000000d98cec74
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 0000003a000000ff
!	Mem[0000000030141400] = 9f9a8675, %l7 = 0000000018afd200
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 000000009f9a8675
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 0000000000000092
	setx	0x7ce9c7c07ac1982e,%g7,%l0 ! %l0 = 7ce9c7c07ac1982e
!	%l1 = a963cf70000000d7
	setx	0xca5b2607ce80f416,%g7,%l1 ! %l1 = ca5b2607ce80f416
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7ce9c7c07ac1982e
	setx	0xc0ac09102a495e1f,%g7,%l0 ! %l0 = c0ac09102a495e1f
!	%l1 = ca5b2607ce80f416
	setx	0xb635378067c0fd68,%g7,%l1 ! %l1 = b635378067c0fd68
!	%l0 = c0ac09102a495e1f, %l4 = 000000000000003a, %l7 = 000000009f9a8675
	sub	%l0,%l4,%l7		! %l7 = c0ac09102a495de5
!	%l2 = fffffffffffffff1, Mem[0000000030081410] = 780d7c5c
	stba	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 780d7cf1
!	%l0 = c0ac09102a495e1f, %l1 = b635378067c0fd68, %l0 = c0ac09102a495e1f
	andn	%l0,%l1,%l0		! %l0 = 4088081008090217
!	%l6 = 00000000000000a0, Mem[00000000100c1426] = f914d93a
	stb	%l6,[%i3+0x026]		! Mem[00000000100c1424] = f914a03a
!	%f22 = c1e4a434, Mem[0000000010181410] = c1ffffff
	sta	%f22,[%i6+%o5]0x80	! Mem[0000000010181410] = c1e4a434
!	%l0 = 4088081008090217, Mem[0000000010001431] = 6f38db36
	stb	%l0,[%i0+0x031]		! Mem[0000000010001430] = 6f17db36
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 8f818645d795df71, %f14 = 90b292cc 9a09b211
	ldda	[%i1+%o4]0x89,%f14	! %f14 = 8f818645 d795df71

p0_label_13:
!	Mem[0000000010101434] = 3b61b7dc, %l0 = 4088081008090217
	ldsw	[%i4+0x034],%l0		! %l0 = 000000003b61b7dc
!	Mem[0000000010181400] = d6b2ffff, %l2 = fffffffffffffff1
	ldswa	[%i6+%g0]0x88,%l2	! %l2 = ffffffffd6b2ffff
!	Mem[0000000021800080] = bc53ac45, %l5 = 000000004689d745
	ldub	[%o3+0x080],%l5		! %l5 = 00000000000000bc
!	Mem[0000000010141408] = 9b8eee01 4e65d5cc, %l4 = 0000003a, %l5 = 000000bc
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 000000004e65d5cc 000000009b8eee01
!	Mem[0000000020800000] = c7ca23dd, %l4 = 000000004e65d5cc
	ldsba	[%o1+0x000]%asi,%l4	! %l4 = ffffffffffffffc7
!	Mem[00000000100c1408] = ff71f951 e3e67613, %l4 = ffffffc7, %l5 = 9b8eee01
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 00000000ff71f951 00000000e3e67613
!	Mem[00000000300c1410] = 55b21996 0627173d, %l0 = 3b61b7dc, %l1 = 67c0fd68
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 0000000055b21996 000000000627173d
!	Mem[0000000010101428] = 4e8344b1df3db7a6, %f2  = 201efcdf ce1743fa
	ldd	[%i4+0x028],%f2 	! %f2  = 4e8344b1 df3db7a6
!	Mem[0000000030181400] = ff2d265a, %f19 = dffc1e20
	lda	[%i6+%g0]0x81,%f19	! %f19 = ff2d265a
!	Starting 10 instruction Store Burst
!	%l0 = 0000000055b21996, Mem[0000000010081410] = e2d27354
	stha	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 19967354

p0_label_14:
!	%l5 = 00000000e3e67613, Mem[00000000100c1410] = a59e97f1
	stha	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = a59e7613
!	Mem[0000000030081410] = f17c0d78, %l2 = ffffffffd6b2ffff
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 00000000f17c0d78
!	%l4 = ff71f951, %l5 = e3e67613, Mem[0000000010081400] = eb20084a af75c1f2
	stda	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = ff71f951 e3e67613
!	%l1 = 000000000627173d, Mem[0000000030081408] = 4ba23179
	stwa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 0627173d
!	%f10 = 5b227545 b841cf15, Mem[0000000010041408] = f1b49b80 8a7cb835
	stda	%f10,[%i1+%o4]0x80	! Mem[0000000010041408] = 5b227545 b841cf15
!	Mem[00000000300c1400] = 4a291a57, %l4 = 00000000ff71f951
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 000000004a291a57
!	%f24 = 72f6bd89 2c9ee77b, %l1 = 000000000627173d
!	Mem[0000000010001418] = eddf916ae6e7ad5a
	add	%i0,0x018,%g1
	stda	%f24,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010001418] = 7bdf9e2c89bdad5a
!	%f9  = cffddf71, %f1  = 9989b211
	fstoi	%f9 ,%f1 		! %f1  = 80000000
!	%l1 = 000000000627173d, Mem[0000000020800040] = 2a89bae8
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 173dbae8
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 19967354, %f8  = 00000041
	lda	[%i2+%o5]0x80,%f8 	! %f8 = 19967354

p0_label_15:
!	Mem[0000000010181410] = c1e4a4349b68f690, %l5 = 00000000e3e67613
	ldxa	[%i6+%o5]0x80,%l5	! %l5 = c1e4a4349b68f690
!	Mem[0000000010001408] = f11d3438, %l5 = c1e4a4349b68f690
	lduba	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000038
!	Mem[0000000030101408] = 6de02c31, %l7 = c0ac09102a495de5
	lduba	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000031
!	Mem[0000000010141400] = 41000000, %l0 = 0000000055b21996
	ldswa	[%i5+%g0]0x88,%l0	! %l0 = 0000000041000000
!	Mem[0000000010181400] = d6b2ffff, %f10 = 5b227545
	lda	[%i6+%g0]0x88,%f10	! %f10 = d6b2ffff
!	%l7 = 0000000000000031, %l6 = 00000000000000a0, %l6 = 00000000000000a0
	orn	%l7,%l6,%l6		! %l6 = ffffffffffffff7f
!	Mem[0000000010101408] = 29e5a62f, %f28 = 7cf116da
	lda	[%i4+%o4]0x88,%f28	! %f28 = 29e5a62f
!	Mem[00000000300c1410] = 9619b255, %l3 = 552859e6f9904d0b
	lduha	[%i3+%o5]0x89,%l3	! %l3 = 000000000000b255
!	Mem[0000000010041408] = 4575225b, %l7 = 0000000000000031
	lduba	[%i1+%o4]0x88,%l7	! %l7 = 000000000000005b
!	Starting 10 instruction Store Burst
!	%l4 = 4a291a57, %l5 = 00000038, Mem[0000000030001410] = ffb259ce fb574c82
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 4a291a57 00000038

p0_label_16:
!	Mem[00000000211c0000] = 38ff9864, %l4 = 000000004a291a57
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 00000038000000ff
!	%l2 = f17c0d78, %l3 = 0000b255, Mem[0000000010001400] = 6f38db36 80495b49
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = f17c0d78 0000b255
!	%l3 = 000000000000b255, Mem[00000000100c1400] = 00000000
	stba	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 55000000
!	%l2 = 00000000f17c0d78, Mem[00000000201c0001] = c7f58bc8, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = c7788bc8
!	Mem[0000000010141408] = ccd5654e, %l7 = 000000000000005b
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 00000000ccd5654e
!	Mem[0000000020800040] = 173dbae8, %l0 = 0000000041000000
	ldstuba	[%o1+0x040]%asi,%l0	! %l0 = 00000017000000ff
!	%l6 = ffffff7f, %l7 = ccd5654e, Mem[0000000030141408] = 34a4e4c1 829a3310
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffff7f ccd5654e
!	%l1 = 000000000627173d, Mem[0000000010141408] = 5b000000
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 5b00173d
!	Mem[0000000010101408] = 29e5a62f, %l4 = 0000000000000038
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 0000002f000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 7cbebdb9, %l4 = 000000000000002f
	lduba	[%i0+%g0]0x81,%l4	! %l4 = 000000000000007c

p0_label_17:
!	Mem[0000000010181400] = ffffb2d666d0495f, %f10 = d6b2ffff b841cf15
	ldda	[%i6+%g0]0x80,%f10	! %f10 = ffffb2d6 66d0495f
!	Mem[0000000010081410] = 199673545e1c08c6, %l6 = ffffffffffffff7f
	ldxa	[%i2+%o5]0x80,%l6	! %l6 = 199673545e1c08c6
!	Mem[0000000010081408] = ce1743fa, %l6 = 199673545e1c08c6
	ldsha	[%i2+%o4]0x88,%l6	! %l6 = 00000000000043fa
!	Mem[0000000010181400] = ffffb2d6, %l4 = 000000000000007c
	lduw	[%i6+%g0],%l4		! %l4 = 00000000ffffb2d6
!	Mem[00000000218001c0] = bd7c1f38, %l1 = 000000000627173d
	lduha	[%o3+0x1c0]%asi,%l1	! %l1 = 000000000000bd7c
!	Mem[0000000020800000] = c7ca23dd, %l7 = 00000000ccd5654e
	lduh	[%o1+%g0],%l7		! %l7 = 000000000000c7ca
!	Mem[0000000030041408] = d795df71, %l2 = 00000000f17c0d78
	lduha	[%i1+%o4]0x89,%l2	! %l2 = 000000000000df71
!	Mem[0000000010141410] = fdcf25f2a565cc26, %f28 = 29e5a62f 1db7aeeb
	ldda	[%i5+%o5]0x80,%f28	! %f28 = fdcf25f2 a565cc26
!	Mem[00000000100c1430] = f773a6c9, %l6 = 00000000000043fa
	ldub	[%i3+0x030],%l6		! %l6 = 00000000000000f7
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000b255, Mem[000000001008141a] = f53826b1
	sth	%l3,[%i2+0x01a]		! Mem[0000000010081418] = f538b255

p0_label_18:
!	Mem[0000000010141408] = 3d17005b, %l0 = 0000000000000017
	ldstuba	[%i5+%o4]0x80,%l0	! %l0 = 0000003d000000ff
!	%f6  = 5aade7e6, Mem[0000000010181410] = c1e4a434
	sta	%f6 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 5aade7e6
!	Mem[0000000010141420] = 19fc7f679ff04a09, %l7 = 000000000000c7ca, %l0 = 000000000000003d
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = 19fc7f679ff04a09
!	%l5 = 0000000000000038, Mem[0000000030041408] = 8f818645d795df71
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000038
!	%l4 = 00000000ffffb2d6, Mem[0000000010141400] = 00000041
	stha	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = b2d60041
!	%f19 = ff2d265a, Mem[00000000100c1400] = 55000000
	sta	%f19,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff2d265a
!	Mem[0000000010081408] = fa4317ce, %l7 = 000000000000c7ca
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 000000fa000000ff
!	%f20 = 6ae6c631, Mem[0000000030101400] = 005dd1e2
	sta	%f20,[%i4+%g0]0x81	! Mem[0000000030101400] = 6ae6c631
!	Mem[0000000010141418] = f637b0563085e48d, %l7 = 00000000000000fa, %l5 = 0000000000000038
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = f637b0563085e48d
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 7cbebdb9, %l0 = 19fc7f679ff04a09
	ldswa	[%i0+%g0]0x81,%l0	! %l0 = 000000007cbebdb9

p0_label_19:
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 000000007cbebdb9
	setx	0xa525e93034d56c4a,%g7,%l0 ! %l0 = a525e93034d56c4a
!	%l1 = 000000000000bd7c
	setx	0x4e713d983922fb4c,%g7,%l1 ! %l1 = 4e713d983922fb4c
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a525e93034d56c4a
	setx	0x57704befaf434aff,%g7,%l0 ! %l0 = 57704befaf434aff
!	%l1 = 4e713d983922fb4c
	setx	0xedb93837813d3a7a,%g7,%l1 ! %l1 = edb93837813d3a7a
!	Mem[0000000010001400] = 780d7cf1, %l3 = 000000000000b255
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = fffffffffffffff1
!	Mem[00000000100c1400] = 340000005a262dff, %l7 = 00000000000000fa
	ldxa	[%i3+%g0]0x88,%l7	! %l7 = 340000005a262dff
!	Mem[0000000020800000] = c7ca23dd, %l4 = 00000000ffffb2d6
	ldsb	[%o1+%g0],%l4		! %l4 = ffffffffffffffc7
!	Mem[0000000010041410] = c55237dc, %l0 = 57704befaf434aff
	ldswa	[%i1+%o5]0x88,%l0	! %l0 = ffffffffc55237dc
!	Mem[0000000010181408] = 70cf637c, %l5 = f637b0563085e48d
	ldsha	[%i6+%o4]0x88,%l5	! %l5 = 000000000000637c
!	Mem[00000000211c0000] = ffff9864, %l2 = 000000000000df71
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010181400] = d6b2ffff, %l7 = 340000005a262dff
	ldsba	[%i6+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001400] = f17c0d78, %l7 = ffffffffffffffff
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000f1
!	Starting 10 instruction Store Burst
!	%l3 = fffffffffffffff1, imm = fffffffffffff8cd, %l6 = 00000000000000f7
	orn	%l3,-0x733,%l6		! %l6 = fffffffffffffff3

p0_label_20:
!	%f23 = 10339a82, Mem[0000000030181400] = ff2d265a
	sta	%f23,[%i6+%g0]0x81	! Mem[0000000030181400] = 10339a82
!	%f0  = 8b6f97b6, %f6  = 5aade7e6
	fcmpes	%fcc0,%f0 ,%f6 		! %fcc0 = 1
!	%f12 = 495b4980 36db386f, Mem[00000000100c1430] = f773a6c9 cbfd058d
	std	%f12,[%i3+0x030]	! Mem[00000000100c1430] = 495b4980 36db386f
!	Mem[0000000010181408] = 7c63cf70, %l6 = fffffffffffffff3
	ldstuba	[%i6+%o4]0x80,%l6	! %l6 = 0000007c000000ff
!	%l1 = edb93837813d3a7a, Mem[0000000010181428] = b55b541f, %asi = 80
	stha	%l1,[%i6+0x028]%asi	! Mem[0000000010181428] = 3a7a541f
!	Mem[0000000010101408] = ffa6e529, %l2 = 000000000000ffff
	swap	[%i4+%o4],%l2		! %l2 = 00000000ffa6e529
!	%f12 = 495b4980, Mem[0000000010001410] = 67fdfb7e
	sta	%f12,[%i0+%o5]0x80	! Mem[0000000010001410] = 495b4980
!	%l4 = ffffffffffffffc7, Mem[0000000030081408] = 3d172706
	stwa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffffc7
!	%l4 = ffffffffffffffc7, Mem[00000000201c0001] = c7788bc8, %asi = 80
	stba	%l4,[%o0+0x001]%asi	! Mem[00000000201c0000] = c7c78bc8
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 55b21996, %f2  = 4e8344b1
	lda	[%i3+%o5]0x81,%f2 	! %f2 = 55b21996

p0_label_21:
!	%f26 = 01ee8e9b, %f17 = 0501eaf7
	fcmpes	%fcc3,%f26,%f17		! %fcc3 = 1
!	Mem[0000000010141408] = 5b0017ff, %l2 = 00000000ffa6e529
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 00000000000017ff
!	Mem[0000000030081400] = a963cf70 000000d7, %l0 = c55237dc, %l1 = 813d3a7a
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000d7 00000000a963cf70
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010041400] = cf000000 0000be7c 5b227545 b841cf15
!	Mem[0000000010041410] = dc3752c5 d5a68a47 da474434 346baf2d
!	Mem[0000000010041420] = 0a129924 39cdbd71 10ad1ccd 3a121da1
!	Mem[0000000010041430] = 852520dd b69eb3ec 552859e6 f9904d0b
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[000000001010143c] = ce691cd6, %f6  = 5aade7e6
	ld	[%i4+0x03c],%f6 	! %f6 = ce691cd6
!	Mem[0000000010001400] = f17c0d78 0000b255, %l0 = 000000d7, %l1 = a963cf70
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000f17c0d78 000000000000b255
!	Mem[0000000030041400] = 71000034, %l0 = 00000000f17c0d78
	ldsba	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000071
!	Mem[0000000010041400] = cf0000000000be7c, %f0  = 8b6f97b6 80000000
	ldda	[%i1+%g0]0x80,%f0 	! %f0  = cf000000 0000be7c
!	Mem[00000000100c1400] = 34000000 5a262dff, %l2 = 000017ff, %l3 = fffffff1
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 000000005a262dff 0000000034000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (3)
!	%l6 = 0000007c, %l7 = 000000f1, Mem[0000000010041400] = cf000000 0000be7c
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000007c 000000f1

p0_label_22:
!	%l5 = 000000000000637c, Mem[0000000030081400] = d7000000
	stha	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 637c0000
!	%l2 = 000000005a262dff, Mem[0000000030001400] = b9bdbe7c
	stha	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = b9bd2dff
!	%f6  = ce691cd6 6a91dfed, Mem[0000000010081400] = 51f971ff 1376e6e3
	stda	%f6 ,[%i2+%g0]0x80	! Mem[0000000010081400] = ce691cd6 6a91dfed
!	%f6  = ce691cd6 6a91dfed, Mem[0000000030041410] = e00530a2 4a3af422
	stda	%f6 ,[%i1+%o5]0x81	! Mem[0000000030041410] = ce691cd6 6a91dfed
!	%f24 = 0a129924 39cdbd71, Mem[0000000010101418] = e7b00619 a285b2d6
	std	%f24,[%i4+0x018]	! Mem[0000000010101418] = 0a129924 39cdbd71
!	%l4 = ffffffffffffffc7, Mem[0000000010041400] = 7c000000
	stha	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 7c00ffc7
!	%l4 = ffffffc7, %l5 = 0000637c, Mem[0000000010001400] = f17c0d78 0000b255
	std	%l4,[%i0+%g0]		! Mem[0000000010001400] = ffffffc7 0000637c
!	Mem[0000000030141400] = 00d2af18, %l0 = 0000000000000071
	swapa	[%i5+%g0]0x89,%l0	! %l0 = 0000000000d2af18
!	%l6 = 000000000000007c, imm = fffffffffffffc05, %l7 = 00000000000000f1
	add	%l6,-0x3fb,%l7		! %l7 = fffffffffffffc81
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = a59e7613, %l5 = 000000000000637c
	ldswa	[%i3+%o5]0x88,%l5	! %l5 = ffffffffa59e7613

p0_label_23:
!	Mem[0000000030041400] = 34cdc078 34000071, %l0 = 00d2af18, %l1 = 0000b255
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 0000000034000071 0000000034cdc078
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010101400] = 00000000 ff000000 0000ffff 49927c04
!	Mem[0000000010101410] = 9f389757 d15dff42 0a129924 39cdbd71
!	Mem[0000000010101420] = 8dead92d 64b945aa 4e8344b1 df3db7a6
!	Mem[0000000010101430] = 2c50a665 3b61b7dc 49eae59f ce691cd6
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	%f30 = 552859e6, %f31 = f9904d0b, %f22 = da474434
	fsubs	%f30,%f31,%f22		! %f22 = 79904d0b
!	Mem[0000000030101400] = 6ae6c631, %l4 = ffffffffffffffc7
	lduba	[%i4+%g0]0x81,%l4	! %l4 = 000000000000006a
!	Mem[0000000030001410] = 571a294a, %l1 = 0000000034cdc078
	lduwa	[%i0+%o5]0x89,%l1	! %l1 = 00000000571a294a
!	%l7 = fffffffffffffc81, imm = 00000000000006a5, %l3 = 0000000034000000
	subc	%l7,0x6a5,%l3		! %l3 = fffffffffffff5dc
!	Mem[0000000010101410] = 9f389757, %l0 = 0000000034000071
	ldswa	[%i4+%o5]0x80,%l0	! %l0 = ffffffff9f389757
!	Mem[0000000010081410] = 54739619, %l5 = ffffffffa59e7613
	ldsha	[%i2+%o5]0x88,%l5	! %l5 = ffffffffffff9619
!	Mem[0000000010181414] = 9b68f690, %l3 = fffffffffffff5dc
	ldub	[%i6+0x015],%l3		! %l3 = 0000000000000068
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000006a, Mem[0000000010141400] = b2d60041
	stwa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000006a

p0_label_24:
!	%l4 = 000000000000006a, %l6 = 000000000000007c, %l6 = 000000000000007c
	add	%l4,%l6,%l6		! %l6 = 00000000000000e6
!	%l4 = 0000006a, %l5 = ffff9619, Mem[00000000100c1430] = 495b4980 36db386f
	stda	%l4,[%i3+0x030]%asi	! Mem[00000000100c1430] = 0000006a ffff9619
!	Mem[0000000010101434] = 3b61b7dc, %l7 = fffffffffffffc81
	swap	[%i4+0x034],%l7		! %l7 = 000000003b61b7dc
!	Mem[0000000010101438] = 49eae59f, %l1 = 00000000571a294a, %asi = 80
	swapa	[%i4+0x038]%asi,%l1	! %l1 = 0000000049eae59f
!	%f20 = dc3752c5, %f16 = cf000000, %f23 = 346baf2d
	fdivs	%f20,%f16,%f23		! %f23 = 4cb752c5
!	%f23 = 4cb752c5, Mem[0000000010041400] = 7c00ffc7
	sta	%f23,[%i1+%g0]0x88	! Mem[0000000010041400] = 4cb752c5
!	Mem[00000000100c1410] = a59e7613, %l7 = 000000003b61b7dc
	ldstuba	[%i3+%o5]0x88,%l7	! %l7 = 00000013000000ff
!	%l6 = 00000000000000e6, Mem[0000000010141424] = 9ff04a09
	stb	%l6,[%i5+0x024]		! Mem[0000000010141424] = e6f04a09
!	%l4 = 000000000000006a, Mem[0000000030001408] = 18afd2000cce24ee
	stxa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000000000006a
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = fdcf25f2, %l4 = 000000000000006a
	lduba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000fd

p0_label_25:
!	Mem[0000000010141408] = ff17005b, %l6 = 00000000000000e6
	lduha	[%i5+0x00a]%asi,%l6	! %l6 = 000000000000005b
!	Mem[0000000010001400] = ffffffc7, %l4 = 00000000000000fd
	ldsw	[%i0+%g0],%l4		! %l4 = ffffffffffffffc7
!	Mem[0000000030041410] = ce691cd6, %l0 = ffffffff9f389757
	lduwa	[%i1+%o5]0x81,%l0	! %l0 = 00000000ce691cd6
!	Mem[0000000010001410] = 495b4980, %l0 = 00000000ce691cd6
	ldswa	[%i0+%o5]0x80,%l0	! %l0 = 00000000495b4980
!	Mem[0000000030081408] = ffffffc7, %f21 = d5a68a47
	lda	[%i2+%o4]0x81,%f21	! %f21 = ffffffc7
!	Mem[0000000010141400] = 0000006acffddf71, %l4 = ffffffffffffffc7
	ldxa	[%i5+%g0]0x80,%l4	! %l4 = 0000006acffddf71
!	Mem[0000000010041400] = 4cb752c5, %l3 = 0000000000000068
	ldsba	[%i1+%g0]0x88,%l3	! %l3 = ffffffffffffffc5
!	Mem[00000000300c1400] = 51f971ff, %l3 = ffffffffffffffc5
	lduha	[%i3+%g0]0x81,%l3	! %l3 = 00000000000051f9
!	Mem[00000000300c1408] = d98cec74, %l1 = 0000000049eae59f
	lduwa	[%i3+%o4]0x81,%l1	! %l1 = 00000000d98cec74
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffff9619, Mem[0000000010001400] = ffffffc7
	stwa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = ffff9619

p0_label_26:
!	%l0 = 00000000495b4980, Mem[0000000030041400] = 71000034
	stwa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 495b4980
!	Mem[0000000010081400] = ce691cd6, %l7 = 0000000000000013
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ce691cd6
!	Mem[0000000010041408] = 5b227545, %l0 = 00000000495b4980
	swap	[%i1+%o4],%l0		! %l0 = 000000005b227545
!	%f22 = 79904d0b 4cb752c5, %l5 = ffffffffffff9619
!	Mem[0000000010081418] = f538b2554778f75e
	add	%i2,0x018,%g1
	stda	%f22,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010081418] = c552b74c4778f75e
!	%l5 = ffffffffffff9619, Mem[0000000010001400] = ffff9619
	stba	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 19ff9619
!	%l7 = 00000000ce691cd6, Mem[0000000030041410] = d61c69ce
	stba	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = d61c69d6
!	Mem[0000000010041408] = 495b4980, %l6 = 000000000000005b
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 00000049000000ff
!	Mem[0000000030101410] = cffddf71, %l3 = 00000000000051f9
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 00000000cffddf71
!	%l6 = 0000000000000049, Mem[0000000010081400] = 13000000
	stwa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000049
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000038, %f3  = 49927c04
	lda	[%i1+%o4]0x89,%f3 	! %f3 = 00000038

p0_label_27:
!	Mem[0000000030081408] = c7ffffff, %l3 = 00000000cffddf71
	ldsha	[%i2+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030001408] = 6a000000 00000000, %l4 = cffddf71, %l5 = ffff9619
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000 000000006a000000
!	Mem[0000000030041400] = 495b4980, %l7 = 00000000ce691cd6
	ldswa	[%i1+%g0]0x81,%l7	! %l7 = 00000000495b4980
!	Mem[0000000030041410] = d6691cd6, %f9  = 64b945aa
	lda	[%i1+%o5]0x81,%f9 	! %f9 = d6691cd6
!	Mem[0000000010181400] = ffffb2d666d0495f, %l3 = ffffffffffffffff
	ldxa	[%i6+%g0]0x80,%l3	! %l3 = ffffb2d666d0495f
!	Mem[0000000010141408] = ff17005b, %l6 = 0000000000000049
	ldswa	[%i5+%o4]0x80,%l6	! %l6 = ffffffffff17005b
!	%f5  = d15dff42, Mem[0000000030101408] = 312ce06d
	sta	%f5 ,[%i4+%o4]0x81	! Mem[0000000030101408] = d15dff42
!	Mem[0000000010101408] = 0000ffff, %l6 = ffffffffff17005b
	lduwa	[%i4+%o4]0x80,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010081408] = ce1743ff, %f8  = 8dead92d
	lda	[%i2+%o4]0x88,%f8 	! %f8 = ce1743ff
!	Starting 10 instruction Store Burst
!	%l0 = 000000005b227545, Mem[0000000030041410] = d6691cd6
	stba	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 45691cd6

p0_label_28:
!	%l1 = 00000000d98cec74, Mem[0000000010181408] = 70cf63ff
	stwa	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = d98cec74
!	%l1 = 00000000d98cec74, Mem[00000000100c1400] = ff2d265a00000034
	stxa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000d98cec74
!	%l0 = 000000005b227545, Mem[0000000030081410] = d6b2ffff
	stha	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 7545ffff
!	Mem[000000001000143c] = ccffb290, %l5 = 6a000000, %l7 = 495b4980
	add	%i0,0x3c,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 00000000ccffb290
!	%l3 = ffffb2d666d0495f, Mem[0000000010081400] = 00000049
	stba	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000005f
!	%l0 = 000000005b227545, Mem[00000000201c0000] = c7c78bc8, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 75458bc8
!	%l5 = 000000006a000000, Mem[0000000030001400] = b9bd2dff
	stwa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 6a000000
!	%l2 = 5a262dff, %l3 = 66d0495f, Mem[0000000030101400] = 31c6e66a 497e0cca
	stda	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 5a262dff 66d0495f
!	Mem[0000000010101428] = 4e8344b1, %l0 = 000000005b227545
	ldstub	[%i4+0x028],%l0		! %l0 = 0000004e000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 74ec8cd97aff394a, %f16 = cf000000 0000be7c
	ldda	[%i6+%o4]0x80,%f16	! %f16 = 74ec8cd9 7aff394a

p0_label_29:
!	Mem[0000000030081410] = 7545ffff, %l7 = 00000000ccffb290
	lduha	[%i2+%o5]0x81,%l7	! %l7 = 0000000000007545
!	Mem[0000000030181410] = 6de02c31, %l6 = 000000000000ffff
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000031
!	Mem[0000000010141420] = 19fc7f67e6f04a09, %f0  = 00000000 ff000000
	ldd	[%i5+0x020],%f0 	! %f0  = 19fc7f67 e6f04a09
!	Mem[0000000030041400] = 495b4980, %l7 = 0000000000007545
	lduwa	[%i1+%g0]0x81,%l7	! %l7 = 00000000495b4980
!	%f10 = 4e8344b1, %f8  = ce1743ff, %f13 = 3b61b7dc
	fadds	%f10,%f8 ,%f13		! %f13 = 4dde8ac6
!	Mem[0000000030001408] = 00000000, %l4 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = 75458bc8, %l3 = ffffb2d666d0495f
	ldsba	[%o0+0x001]%asi,%l3	! %l3 = 0000000000000045
!	Mem[0000000030101410] = 000051f9 6a3f9e42, %l6 = 00000031, %l7 = 495b4980
	ldda	[%i4+%o5]0x81,%l6	! %l6 = 00000000000051f9 000000006a3f9e42
!	Mem[0000000010141410] = f225cffd, %l5 = 000000006a000000
	lduwa	[%i5+%o5]0x88,%l5	! %l5 = 00000000f225cffd
!	Starting 10 instruction Store Burst
!	%l5 = 00000000f225cffd, Mem[0000000010081410] = c6081c5e54739619
	stxa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000f225cffd

p0_label_30:
!	%f29 = b69eb3ec, Mem[0000000010141434] = 8a12aa7e
	sta	%f29,[%i5+0x034]%asi	! Mem[0000000010141434] = b69eb3ec
!	Mem[0000000030181400] = 829a3310, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 00000000829a3310
!	%l5 = 00000000f225cffd, imm = 0000000000000a44, %l3 = 0000000000000045
	and	%l5,0xa44,%l3		! %l3 = 0000000000000a44
!	%l7 = 000000006a3f9e42, Mem[00000000300c1408] = 74ec8cd9
	stba	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 74ec8c42
!	%f22 = 79904d0b 4cb752c5, Mem[0000000030081410] = 7545ffff 4f46c50e
	stda	%f22,[%i2+%o5]0x81	! Mem[0000000030081410] = 79904d0b 4cb752c5
!	%l7 = 000000006a3f9e42, Mem[0000000030001400] = 0000006a
	stha	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 9e42006a
!	%l6 = 00000000000051f9, Mem[0000000030041400] = 80495b49
	stha	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 804951f9
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 000000000000004e
	setx	0x1e9caa880c5a6fdd,%g7,%l0 ! %l0 = 1e9caa880c5a6fdd
!	%l1 = 00000000d98cec74
	setx	0x1d06b948183c61f2,%g7,%l1 ! %l1 = 1d06b948183c61f2
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1e9caa880c5a6fdd
	setx	0x3237c6b03407f11b,%g7,%l0 ! %l0 = 3237c6b03407f11b
!	%l1 = 1d06b948183c61f2
	setx	0x83484e506e95bbfa,%g7,%l1 ! %l1 = 83484e506e95bbfa
!	%l5 = 00000000f225cffd, Mem[00000000300c1410] = 55b219960627173d
	stxa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000f225cffd
!	Starting 10 instruction Load Burst
!	%l6 = 000051f9, %l7 = 6a3f9e42, Mem[0000000010181408] = 74ec8cd9 7aff394a
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 000051f9 6a3f9e42

p0_label_31:
!	Mem[0000000030181408] = 0000005d, %l3 = 0000000000000a44
	lduha	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l2 = 000000005a262dff
	lduwa	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 000051f9, %f1  = e6f04a09
	ld	[%i6+%o4],%f1 	! %f1 = 000051f9
!	Mem[0000000010141408] = ff17005b, %l7 = 000000006a3f9e42
	lduba	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141410] = 1e4f13b0, %l7 = 00000000000000ff
	ldsha	[%i5+%o5]0x81,%l7	! %l7 = 0000000000001e4f
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000030041400] = f9514980 78c0cd34 38000000 00000000
!	Mem[0000000030041410] = 45691cd6 6a91dfed b465cda2 e37ed08d
!	Mem[0000000030041420] = ca828fbf 9c66431e d96f5741 46ac7556
!	Mem[0000000030041430] = a9f479cb 693c6e26 e0245a30 f98c230f
	ldda	[%i1]ASI_BLK_SL,%f16	! Block Load from 0000000030041400
!	Mem[0000000010081430] = ca36f1d4 da9b8138, %l6 = 000051f9, %l7 = 00001e4f
	ldda	[%i2+0x030]%asi,%l6	! %l6 = 00000000ca36f1d4 00000000da9b8138
!	Mem[00000000100c1408] = ff71f951, %l7 = 00000000da9b8138
	ldswa	[%i3+%o4]0x80,%l7	! %l7 = ffffffffff71f951
!	Mem[0000000010141408] = ff17005b01ee8e9b, %l0 = 3237c6b03407f11b
	ldxa	[%i5+%o4]0x80,%l0	! %l0 = ff17005b01ee8e9b
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 0b4d9079, %l1 = 83484e506e95bbfa
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 00000079000000ff

p0_label_32:
!	Mem[00000000218000c1] = d59890b0, %l1 = 0000000000000079
	ldstuba	[%o3+0x0c1]%asi,%l1	! %l1 = 00000098000000ff
!	Mem[00000000100c1410] = ff769ea5, %l1 = 0000000000000098
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010141410] = f225cffd, %l3 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 000000fd000000ff
!	Mem[0000000030101408] = 42ff5dd1, %l3 = 00000000000000fd
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 0000000042ff5dd1
!	%l7 = ffffffffff71f951, Mem[0000000010001408] = f11d3438
	stwa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = ff71f951
!	%l2 = 0000000000000000, Mem[0000000030081408] = ffffffc7
	stwa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%f6  = 0a129924, Mem[0000000010181408] = 000051f9
	sta	%f6 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 0a129924
!	Mem[00000000300c1410] = 00000000, %l4 = 00000000829a3310
	ldstuba	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1410] = ff769ea5, %l7 = ffffffffff71f951
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 00000000ff769ea5
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff4317ce, %l4 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l4	! %l4 = ffffffffff4317ce

p0_label_33:
!	Mem[0000000010141400] = 71dffdcf 6a000000, %l0 = 01ee8e9b, %l1 = 000000ff
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 000000006a000000 0000000071dffdcf
!	Mem[0000000030141400] = 71000000 47ed6337, %l2 = 00000000, %l3 = 42ff5dd1
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 0000000071000000 0000000047ed6337
!	Mem[0000000030181408] = 0000005d1f7cb8ad, %f14 = 49eae59f ce691cd6
	ldda	[%i6+%o4]0x81,%f14	! %f14 = 0000005d 1f7cb8ad
!	Mem[00000000100c1410] = 51f971ff, %l6 = 00000000ca36f1d4
	lduha	[%i3+%o5]0x88,%l6	! %l6 = 00000000000071ff
!	Mem[0000000010041408] = ff5b4980, %l4 = ffffffffff4317ce
	lduba	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l2 = 0000000071000000, immed = 00000bc4, %y  = 00000000
	sdiv	%l2,0xbc4,%l2		! %l2 = 0000000000099ab0
	mov	%l0,%y			! %y = 6a000000
!	Mem[0000000010001400] = 19ff96190000637c, %l6 = 00000000000071ff
	ldxa	[%i0+%g0]0x80,%l6	! %l6 = 19ff96190000637c
!	Mem[0000000010141408] = 9b8eee01 5b0017ff, %l6 = 0000637c, %l7 = ff769ea5
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 000000005b0017ff 000000009b8eee01
!	Mem[00000000300c1410] = ff000000, %l6 = 000000005b0017ff
	ldsba	[%i3+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l7 = 000000009b8eee01, Mem[0000000030141408] = ffffff7f
	stwa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 9b8eee01

p0_label_34:
!	Mem[0000000030041408] = 38000000, %l6 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x81,%l6	! %l6 = 00000038000000ff
!	%l5 = 00000000f225cffd, Mem[0000000021800180] = b283a31a
	sth	%l5,[%o3+0x180]		! Mem[0000000021800180] = cffda31a
!	%f8  = ce1743ff, %f13 = 4dde8ac6, %f11 = df3db7a6
	fsubs	%f8 ,%f13,%f11		! %f11 = ce8344b1
!	%l5 = 00000000f225cffd, Mem[0000000010181408] = 2499120a
	stha	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 2499cffd
!	%l5 = 00000000f225cffd, imm = 0000000000000def, %l6 = 0000000000000038
	xor	%l5,0xdef,%l6		! %l6 = 00000000f225c212
!	%f5  = d15dff42, Mem[0000000010101410] = 5797389f
	sta	%f5 ,[%i4+%o5]0x88	! Mem[0000000010101410] = d15dff42
!	%f0  = 19fc7f67 000051f9, Mem[0000000030101408] = fd000000 31c6e66a
	stda	%f0 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 19fc7f67 000051f9
!	%f15 = 1f7cb8ad, Mem[0000000030081400] = 00007c63
	sta	%f15,[%i2+%g0]0x89	! Mem[0000000030081400] = 1f7cb8ad
!	%f4  = 9f389757 d15dff42, Mem[0000000010181400] = ffffb2d6 66d0495f
	stda	%f4 ,[%i6+0x000]%asi	! Mem[0000000010181400] = 9f389757 d15dff42
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 51f971ff, %l3 = 0000000047ed6337
	ldswa	[%i3+%o5]0x88,%l3	! %l3 = 0000000051f971ff

p0_label_35:
!	Mem[00000000300c1400] = ff71f951, %l7 = 000000009b8eee01
	lduba	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000051
!	%l1 = 0000000071dffdcf, %l7 = 0000000000000051, %l3 = 0000000051f971ff
	sdivx	%l1,%l7,%l3		! %l3 = 000000000167e6b0
!	Mem[0000000021800140] = 42fd04f1, %l4 = 00000000000000ff
	ldsha	[%o3+0x140]%asi,%l4	! %l4 = 00000000000042fd
!	Mem[000000001010141c] = 39cdbd71, %l0 = 000000006a000000
	ldsba	[%i4+0x01c]%asi,%l0	! %l0 = 0000000000000039
!	Mem[0000000010081414] = 00000000, %l1 = 0000000071dffdcf
	ldsw	[%i2+0x014],%l1		! %l1 = 0000000000000000
!	Mem[0000000010081400] = 5f000000, %l6 = 00000000f225c212
	lduwa	[%i2+%g0]0x80,%l6	! %l6 = 000000005f000000
!	Mem[00000000100c1400] = 00000000, %l7 = 0000000000000051
	ldsha	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 1376e6e351f971ff, %l4 = 00000000000042fd
	ldxa	[%i3+%o4]0x88,%l4	! %l4 = 1376e6e351f971ff
!	Mem[00000000211c0000] = ffff9864, %l1 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[000000001000142c] = 4575225b, %l4 = 51f971ff, %l6 = 5f000000
	add	%i0,0x2c,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 000000004575225b

p0_label_36:
!	Mem[0000000010181408] = fdcf9924, %l7 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 00000000fdcf9924
!	%f12 = 2c50a665 4dde8ac6, Mem[0000000010141400] = 0000006a cffddf71
	stda	%f12,[%i5+%g0]0x80	! Mem[0000000010141400] = 2c50a665 4dde8ac6
!	%l1 = ffffffffffffffff, Mem[0000000010041400] = c552b74c
	stwa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffff
!	Mem[0000000030141408] = 9b8eee01, %l0 = 0000000000000039
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 000000009b8eee01
!	%f8  = ce1743ff, Mem[0000000030101400] = ff2d265a
	sta	%f8 ,[%i4+%g0]0x81	! Mem[0000000030101400] = ce1743ff
!	%l4 = 1376e6e351f971ff, Mem[0000000010141400] = c68ade4d65a6502c
	stxa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 1376e6e351f971ff
!	%f25 = bf8f82ca, Mem[0000000010141400] = ff71f951
	sta	%f25,[%i5+%g0]0x80	! Mem[0000000010141400] = bf8f82ca
!	%f25 = bf8f82ca, Mem[0000000010081408] = ff4317ce
	sta	%f25,[%i2+%o4]0x80	! Mem[0000000010081408] = bf8f82ca
!	%l2 = 0000000000099ab0, Mem[0000000030181410] = 312ce06d31c6e66a
	stxa	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000099ab0
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 51f971ffdffc1e20, %f14 = 0000005d 1f7cb8ad
	ldda	[%i0+%o4]0x80,%f14	! %f14 = 51f971ff dffc1e20

p0_label_37:
!	Mem[0000000030141408] = ccd5654e00000039, %f22 = 8dd07ee3 a2cd65b4
	ldda	[%i5+%o4]0x89,%f22	! %f22 = ccd5654e 00000039
!	Mem[0000000010101410] = d15dff42, %l4 = 1376e6e351f971ff
	ldswa	[%i4+%o5]0x88,%l4	! %l4 = ffffffffd15dff42
!	Mem[00000000300c1408] = 45d7894674ec8c42, %l5 = 00000000f225cffd
	ldxa	[%i3+%o4]0x89,%l5	! %l5 = 45d7894674ec8c42
!	Mem[00000000100c1428] = 93e2b43d, %l3 = 000000000167e6b0
	lduw	[%i3+0x028],%l3		! %l3 = 0000000093e2b43d
!	Mem[00000000218000c0] = d5ff90b0, %l6 = 000000004575225b
	ldsb	[%o3+0x0c1],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030041408] = 000000ff, %l7 = 00000000fdcf9924
	ldsba	[%i1+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081410] = fdcf25f2, %l3 = 0000000093e2b43d
	ldsha	[%i2+%o5]0x80,%l3	! %l3 = fffffffffffffdcf
!	Mem[0000000010141400] = bf8f82cae3e67613, %f10 = 4e8344b1 ce8344b1
	ldda	[%i5+%g0]0x80,%f10	! %f10 = bf8f82ca e3e67613
!	Mem[0000000010101400] = 00000000, %l6 = ffffffffffffffff
	lduha	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f22 = ccd5654e 00000039, %l7 = ffffffffffffffff
!	Mem[0000000010141408] = ff17005b01ee8e9b
	add	%i5,0x008,%g1
	stda	%f22,[%g1+%l7]ASI_PST32_P ! Mem[0000000010141408] = ccd5654e00000039

p0_label_38:
!	Mem[0000000030141400] = 71000000, %l5 = 45d7894674ec8c42
	swapa	[%i5+%g0]0x81,%l5	! %l5 = 0000000071000000
!	%l3 = fffffffffffffdcf, Mem[0000000010141410] = ffcf25f2a565cc26
	stxa	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = fffffffffffffdcf
!	Mem[0000000010001400] = 1996ff19, %l3 = fffffffffffffdcf
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 00000019000000ff
!	%l1 = ffffffffffffffff, Mem[0000000030181408] = 5d000000
	stha	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 5d00ffff
!	%f26 = 5675ac46 41576fd9, Mem[0000000010141410] = ffffffff fffffdcf
	stda	%f26,[%i5+%o5]0x80	! Mem[0000000010141410] = 5675ac46 41576fd9
!	%f3  = 00000038, Mem[0000000030001400] = 9e42006a
	sta	%f3 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000038
!	%l1 = ffffffffffffffff, Mem[0000000010041410] = c55237dc
	stba	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = c55237ff
!	%f0  = 19fc7f67 000051f9, Mem[00000000100c1408] = 51f971ff 1376e6e3
	stda	%f0 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 19fc7f67 000051f9
!	%f14 = 51f971ff dffc1e20, %l5 = 0000000071000000
!	Mem[0000000030001420] = bf7a58826cade822
	add	%i0,0x020,%g1
	stda	%f14,[%g1+%l5]ASI_PST8_S ! Mem[0000000030001420] = bf7a58826cade822
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 550cb30d3784d41a, %f18 = 00000000 00000038
	ldd	[%i3+0x018],%f18	! %f18 = 550cb30d 3784d41a

p0_label_39:
!	%l1 = ffffffffffffffff, %l0 = 000000009b8eee01, %l2 = 0000000000099ab0
	xnor	%l1,%l0,%l2		! %l2 = 000000009b8eee01
!	Mem[0000000030141410] = 56148485 b0134f1e, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 00000000b0134f1e 0000000056148485
!	Mem[0000000030081408] = 00000000, %l0 = 000000009b8eee01
	lduba	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l4 = ffffffffd15dff42
	ldsha	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800000] = c7ca23dd, %l4 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l4	! %l4 = 000000000000c7ca
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 38000000, %l0 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = bf8f82ca, %l7 = 0000000056148485
	lduwa	[%i5+%g0]0x80,%l7	! %l7 = 00000000bf8f82ca
!	Mem[0000000010101408] = 0000ffff, %l1 = ffffffffffffffff
	ldsba	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 1e4f13b0, %l2 = 000000009b8eee01
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 0000001e000000ff

p0_label_40:
!	%l0 = 0000000000000000, Mem[0000000030081400] = adb87c1f
	stha	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 00007c1f
!	Mem[0000000010181420] = 96b53316679ef63e, %l1 = 0000000000000000, %l0 = 0000000000000000
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 96b53316679ef63e
!	%f24 = 1e43669c bf8f82ca, %l6 = 00000000b0134f1e
!	Mem[0000000010001408] = 51f971ffdffc1e20
	add	%i0,0x008,%g1
	stda	%f24,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010001408] = 51f98fbf9c66431e
!	%l3 = 0000000000000019, Mem[0000000010141408] = ccd5654e
	stha	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 0019654e
!	%l1 = 0000000000000000, Mem[0000000030081400] = 1f7c0000
	stwa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%l6 = 00000000b0134f1e, imm = fffffffffffff1e4, %l3 = 0000000000000019
	xnor	%l6,-0xe1c,%l3		! %l3 = 00000000b0134105
!	%l0 = 679ef63e, %l1 = 00000000, Mem[0000000010081408] = ca828fbf 201efcdf
	stda	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 679ef63e 00000000
!	%f13 = 4dde8ac6, Mem[0000000010101410] = 42ff5dd1
	sta	%f13,[%i4+%o5]0x80	! Mem[0000000010101410] = 4dde8ac6
!	Mem[0000000010141410] = 46ac7556, %l1 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 00000056000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041418] = da474434346baf2d, %f16 = 34cdc078 804951f9
	ldda	[%i1+0x018]%asi,%f16	! %f16 = da474434 346baf2d

p0_label_41:
!	Mem[0000000030181408] = 5d00ffff, %l3 = 00000000b0134105
	ldsha	[%i6+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181410] = 5aade7e6, %l7 = 00000000bf8f82ca
	ldswa	[%i6+0x010]%asi,%l7	! %l7 = 000000005aade7e6
!	Mem[0000000030081400] = 00000000, %l5 = 0000000071000000
	lduwa	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = eddf916ad61c6945, %l7 = 000000005aade7e6
	ldxa	[%i1+%o5]0x89,%l7	! %l7 = eddf916ad61c6945
!	Mem[0000000030081408] = 00000000e5519f9c, %f2  = 0000ffff 00000038
	ldda	[%i2+%o4]0x81,%f2 	! %f2  = 00000000 e5519f9c
!	Mem[0000000010181410] = e6e7ad5a, %l7 = eddf916ad61c6945
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 0000005a000000ff
!	Mem[00000000300c1408] = 428cec74, %f10 = bf8f82ca
	lda	[%i3+%o4]0x81,%f10	! %f10 = 428cec74
!	Mem[0000000010181400] = 5797389f, %l1 = 0000000000000056
	ldsba	[%i6+%g0]0x88,%l1	! %l1 = ffffffffffffff9f
!	Mem[0000000030081400] = a963cf7000000000, %f4  = 9f389757 d15dff42
	ldda	[%i2+%g0]0x89,%f4 	! %f4  = a963cf70 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = ff000000, %l7 = 000000000000005a
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 00000000ff000000

p0_label_42:
!	%l1 = ffffffffffffff9f, Mem[0000000010101400] = 00000000
	stwa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffff9f
	membar	#Sync			! Added by membar checker (6)
!	%l0 = 96b53316679ef63e, Mem[0000000030041400] = f951498078c0cd34
	stxa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 96b53316679ef63e
!	Mem[00000000201c0001] = 75458bc8, %l3 = ffffffffffffffff
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 00000045000000ff
!	%l4 = 000000000000c7ca, Mem[00000000211c0000] = ffff9864, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = c7ca9864
!	Mem[0000000010041400] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%l2 = 000000000000001e, %l1 = ffffffffffffff9f, %l5 = 00000000000000ff
	and	%l2,%l1,%l5		! %l5 = 000000000000001e
!	%f26 = 5675ac46, Mem[0000000030041408] = ff000000
	sta	%f26,[%i1+%o4]0x81	! Mem[0000000030041408] = 5675ac46
!	%l6 = 00000000b0134f1e, Mem[0000000010081408] = 3ef69e67
	stwa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = b0134f1e
!	%l6 = b0134f1e, %l7 = ff000000, Mem[0000000010041418] = da474434 346baf2d
	std	%l6,[%i1+0x018]		! Mem[0000000010041418] = b0134f1e ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffff005d, %l1 = ffffffffffffff9f
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff

p0_label_43:
!	Mem[00000000100c1400] = 00000000d98cec74, %f0  = 19fc7f67 000051f9
	ldda	[%i3+%g0]0x80,%f0 	! %f0  = 00000000 d98cec74
!	%f11 = e3e67613, %f16 = da474434, %f18 = 550cb30d 3784d41a
	fsmuld	%f11,%f16,%f18		! %f18 = 47d66c65 de40fb80
!	Mem[00000000100c1430] = 0000006affff9619, %l6 = 00000000b0134f1e
	ldxa	[%i3+0x030]%asi,%l6	! %l6 = 0000006affff9619
!	Mem[0000000030081408] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = b0134f1e 00000000, %l0 = 679ef63e, %l1 = 00000000
	ldda	[%i2+0x008]%asi,%l0	! %l0 = 00000000b0134f1e 0000000000000000
!	Mem[0000000010181410] = ffade7e6, %l5 = 000000000000001e
	ldswa	[%i6+%o5]0x80,%l5	! %l5 = ffffffffffade7e6
!	Mem[0000000010101410] = 4dde8ac6d15dff42, %f10 = 428cec74 e3e67613
	ldda	[%i4+%o5]0x80,%f10	! %f10 = 4dde8ac6 d15dff42
!	%l3 = 0000000000000045, %l5 = ffffffffffade7e6, %l6 = 0000006affff9619
	and	%l3,%l5,%l6		! %l6 = 0000000000000044
!	Mem[0000000030181410] = 00000000, %l3 = 0000000000000045
	lduha	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ff000000, Mem[0000000010001403] = ffff9619, %asi = 80
	stba	%l7,[%i0+0x003]%asi	! Mem[0000000010001400] = ffff9600

p0_label_44:
!	Mem[00000000300c1408] = 74ec8c42, %l3 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 0000000074ec8c42
!	Mem[0000000030101400] = ff4317ce, %l7 = 00000000ff000000
	swapa	[%i4+%g0]0x89,%l7	! %l7 = 00000000ff4317ce
!	%l4 = 000000000000c7ca, Mem[0000000030081400] = 0000000070cf63a9
	stxa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000000000c7ca
!	Mem[00000000211c0001] = c7ca9864, %l0 = 00000000b0134f1e
	ldstub	[%o2+0x001],%l0		! %l0 = 000000ca000000ff
!	%f4  = a963cf70 00000000, Mem[0000000010101428] = ff8344b1 df3db7a6
	stda	%f4 ,[%i4+0x028]%asi	! Mem[0000000010101428] = a963cf70 00000000
!	%l5 = ffffffffffade7e6, Mem[0000000030181408] = 5d00ffff
	stha	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 5d00e7e6
!	%l6 = 0000000000000044, imm = 0000000000000efc, %l7 = 00000000ff4317ce
	xnor	%l6,0xefc,%l7		! %l7 = fffffffffffff147
!	Mem[0000000010001408] = 51f98fbf, %l1 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l1	! %l1 = 0000000051f98fbf
!	%l0 = 000000ca, %l1 = 51f98fbf, Mem[0000000030101400] = ff000000 66d0495f
	stda	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ca 51f98fbf
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 51f971ff, %l3 = 0000000074ec8c42
	lduba	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff

p0_label_45:
!	Mem[00000000100c1420] = 90832cf2 f914a03a, %l6 = 00000044, %l7 = fffff147
	ldd	[%i3+0x020],%l6		! %l6 = 0000000090832cf2 00000000f914a03a
!	Mem[0000000030001400] = 00000038, %l4 = 000000000000c7ca
	ldsha	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l3 = 00000000000000ff
	lduha	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l7 = 00000000f914a03a
	lduha	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = b0134f1e, %l6 = 0000000090832cf2
	ldsba	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffffb0
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 00000000000000ca
	setx	0xc6e95e6076e812cc,%g7,%l0 ! %l0 = c6e95e6076e812cc
!	%l1 = 0000000051f98fbf
	setx	0xab49a660603fdd6a,%g7,%l1 ! %l1 = ab49a660603fdd6a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c6e95e6076e812cc
	setx	0x3b565caf8e47cae0,%g7,%l0 ! %l0 = 3b565caf8e47cae0
!	%l1 = ab49a660603fdd6a
	setx	0xeecde0a029b5a21a,%g7,%l1 ! %l1 = eecde0a029b5a21a
!	Mem[0000000010041408] = 80495bff, %l2 = 000000000000001e
	lduwa	[%i1+%o4]0x88,%l2	! %l2 = 0000000080495bff
!	Mem[0000000010181404] = d15dff42, %l0 = 3b565caf8e47cae0
	ldub	[%i6+0x004],%l0		! %l0 = 00000000000000d1
!	Mem[0000000030101408] = 19fc7f67, %l1 = eecde0a029b5a21a
	lduwa	[%i4+%o4]0x81,%l1	! %l1 = 0000000019fc7f67
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000d1, Mem[0000000010001410] = 495b4980ce1743fa
	stxa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000000000d1

p0_label_46:
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 00000000000000d1
	setx	0x62708de013e71ace,%g7,%l0 ! %l0 = 62708de013e71ace
!	%l1 = 0000000019fc7f67
	setx	0xcfd11b17e0363d94,%g7,%l1 ! %l1 = cfd11b17e0363d94
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 62708de013e71ace
	setx	0x5f5bf5b8357a1921,%g7,%l0 ! %l0 = 5f5bf5b8357a1921
!	%l1 = cfd11b17e0363d94
	setx	0xb67a5117c71decd3,%g7,%l1 ! %l1 = b67a5117c71decd3
!	%l5 = ffffffffffade7e6, Mem[00000000300c1400] = 51f971ff
	stwa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffade7e6
!	Mem[0000000010001400] = ffff9600, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 00000000ffff9600
!	%f22 = ccd5654e, Mem[0000000030141408] = 39000000
	sta	%f22,[%i5+%o4]0x81	! Mem[0000000030141408] = ccd5654e
!	Mem[0000000030041400] = 1633b596, %l5 = ffffffffffade7e6
	ldstuba	[%i1+%g0]0x89,%l5	! %l5 = 00000096000000ff
!	%l0 = 5f5bf5b8357a1921, immed = 00000db6, %y  = 6a000000
	smul	%l0,0xdb6,%l2		! %l2 = 000002dd38148a76, %y = 000002dd
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 74ec8cd900000000
	stxa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000000
!	%l1 = b67a5117c71decd3, immed = fffffd68, %y  = 000002dd
	sdiv	%l1,-0x298,%l4		! %l4 = ffffffff80000000
	mov	%l0,%y			! %y = 357a1921
!	Mem[0000000030001408] = 00000000, %l2 = 000002dd38148a76
	ldstuba	[%i0+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 38000000, %l1 = b67a5117c71decd3
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_47:
!	Mem[0000000010141408] = 0019654e00000039, %f0  = 00000000 d98cec74
	ldd	[%i5+%o4],%f0 		! %f0  = 0019654e 00000039
!	Mem[00000000300c1408] = 00000000, %l3 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = 478aa6d5c55237ff, %f12 = 2c50a665 4dde8ac6
	ldda	[%i1+%o5]0x88,%f12	! %f12 = 478aa6d5 c55237ff
!	Mem[0000000030141400] = 74ec8c42, %l0 = 5f5bf5b8357a1921
	lduha	[%i5+%g0]0x81,%l0	! %l0 = 00000000000074ec
!	Mem[0000000030081408] = 00000000, %l1 = 0000000000000000
	ldsba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010081400] = 5f000000 6a91dfed b0134f1e 00000000
!	Mem[0000000010081410] = fdcf25f2 00000000 c552b74c 4778f75e
!	Mem[0000000010081420] = 354a6e52 a50f26bc c9795f9c ac151532
!	Mem[0000000010081430] = ca36f1d4 da9b8138 622d25aa d98cec74
	ldda	[%i2]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010081400
!	%l0 = 00000000000074ec, imm = 0000000000000425, %l2 = 0000000000000000
	or	%l0,0x425,%l2		! %l2 = 00000000000074ed
!	Mem[0000000030181410] = b09a090000000000, %l1 = 0000000000000000
	ldxa	[%i6+%o5]0x89,%l1	! %l1 = b09a090000000000
!	Mem[000000001018143c] = 9ea27501, %l5 = 0000000000000096
	lduw	[%i6+0x03c],%l5		! %l5 = 000000009ea27501
!	Starting 10 instruction Store Burst
!	%f28 = 266e3c69 cb79f4a9, %l5 = 000000009ea27501
!	Mem[0000000010001408] = 000000009c66431e
	add	%i0,0x008,%g1
	stda	%f28,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010001408] = a90000009c66431e

p0_label_48:
!	%f26 = 5675ac46 41576fd9, %l1 = b09a090000000000
!	Mem[0000000030041428] = d96f574146ac7556
	add	%i1,0x028,%g1
	stda	%f26,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030041428] = d96f574146ac7556
!	%f22 = ccd5654e 00000039, Mem[0000000030041408] = 46ac7556 00000000
	stda	%f22,[%i1+%o4]0x89	! Mem[0000000030041408] = ccd5654e 00000039
!	%l0 = 00000000000074ec, Mem[0000000010001410] = 00000000
	stwa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 000074ec
!	%l3 = 0000000000000000, %l2 = 00000000000074ed, %l1 = b09a090000000000
	xnor	%l3,%l2,%l1		! %l1 = ffffffffffff8b12
!	Mem[0000000021800001] = 7fb68cec, %l1 = ffffffffffff8b12
	ldstub	[%o3+0x001],%l1		! %l1 = 000000b6000000ff
!	%f16 = da474434 346baf2d, Mem[0000000030041400] = 1633b5ff 3ef69e67
	stda	%f16,[%i1+%g0]0x89	! Mem[0000000030041400] = da474434 346baf2d
!	Mem[00000000201c0000] = 75ff8bc8, %l3 = 0000000000000000
	ldstub	[%o0+%g0],%l3		! %l3 = 00000075000000ff
!	%l0 = 000074ec, %l1 = 000000b6, Mem[0000000010001408] = a9000000 9c66431e
	stda	%l0,[%i0+0x008]%asi	! Mem[0000000010001408] = 000074ec 000000b6
!	Mem[0000000030141400] = 428cec74, %l0 = 00000000000074ec
	swapa	[%i5+%g0]0x89,%l0	! %l0 = 00000000428cec74
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %l3 = 0000000000000075
	ldswa	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000

p0_label_49:
!	Mem[0000000010081400] = 5f000000, %l1 = 00000000000000b6
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 000000000000005f
!	Mem[00000000211c0000] = c7ff9864, %l2 = 00000000000074ed
	ldsh	[%o2+%g0],%l2		! %l2 = ffffffffffffc7ff
!	Mem[0000000030101400] = ca000000, %l7 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l7	! %l7 = 00000000ca000000
!	%f19 = de40fb80, %f16 = da474434, %f27 = 41576fd9
	fmuls	%f19,%f16,%f27		! %f27 = 791636eb
!	Mem[000000001010143c] = ce691cd6, %l6 = ffffffffffffffb0
	ldsb	[%i4+0x03c],%l6		! %l6 = ffffffffffffffce
!	%f20 = eddf916a, %f30 = 0f238cf9, %f22 = ccd5654e
	fdivs	%f20,%f30,%f22		! %f22 = ff800000
!	Mem[0000000010001408] = 000074ec000000b6, %f30 = 0f238cf9 305a24e0
	ldda	[%i0+%o4]0x80,%f30	! %f30 = 000074ec 000000b6
!	Mem[000000001010142c] = 00000000, %l7 = 00000000ca000000
	lduba	[%i4+0x02d]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 51f971ff, %l4 = ffffffff80000000
	ldsha	[%i3+%o5]0x88,%l4	! %l4 = 00000000000071ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010001400] = 000000000000637c
	stxa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000

p0_label_50:
!	%l6 = ffffffce, %l7 = 00000000, Mem[0000000030001400] = 00000038 b5e38baf
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffce 00000000
!	%l5 = 000000009ea27501, imm = 0000000000000559, %l2 = ffffffffffffc7ff
	and	%l5,0x559,%l2		! %l2 = 0000000000000501
!	Mem[0000000010181408] = 00000000, %l6 = ffffffffffffffce
	ldstuba	[%i6+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000020800001] = c7ca23dd, %l3 = 0000000000000000
	ldstub	[%o1+0x001],%l3		! %l3 = 000000ca000000ff
!	%l0 = 00000000428cec74, Mem[0000000010181400] = 9f389757d15dff42
	stx	%l0,[%i6+%g0]		! Mem[0000000010181400] = 00000000428cec74
	membar	#Sync			! Added by membar checker (8)
!	%l4 = 00000000000071ff, Mem[0000000010081400] = 5f000000
	stba	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000
!	Mem[0000000010081428] = c9795f9cac151532, %l0 = 00000000428cec74, %l1 = 000000000000005f
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = c9795f9cac151532
!	%l0 = 00000000428cec74, Mem[00000000201c0000] = ffff8bc8, %asi = 80
	stba	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 74ff8bc8
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000, %l1 = c9795f9cac151532
	lduha	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_51:
!	%l3 = 00000000000000ca, %l4 = 00000000000071ff, %l3 = 00000000000000ca
	xnor	%l3,%l4,%l3		! %l3 = ffffffffffff8eca
!	Mem[0000000010101410] = 4dde8ac6, %l5 = 000000009ea27501
	ldswa	[%i4+%o5]0x80,%l5	! %l5 = 000000004dde8ac6
!	Mem[0000000010041408] = ff5b4980, %l0 = 00000000428cec74
	lduwa	[%i1+%o4]0x80,%l0	! %l0 = 00000000ff5b4980
!	Mem[0000000010181424] = 679ef63e, %l6 = 0000000000000000
	swap	[%i6+0x024],%l6		! %l6 = 00000000679ef63e
!	Mem[0000000030081408] = 9c9f51e500000000, %l3 = ffffffffffff8eca
	ldxa	[%i2+%o4]0x89,%l3	! %l3 = 9c9f51e500000000
!	Mem[0000000030181400] = 00000000, %l1 = 0000000000000000
	ldsba	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = c7ff9864, %l6 = 00000000679ef63e
	ldub	[%o2+%g0],%l6		! %l6 = 00000000000000c7
!	Mem[0000000030001408] = 000000ff, %l4 = 00000000000071ff
	ldswa	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l7 = 0000000000000000, imm = 0000000000000775, %l0 = 00000000ff5b4980
	xor	%l7,0x775,%l0		! %l0 = 0000000000000775
!	Starting 10 instruction Store Burst
!	%l5 = 000000004dde8ac6, Mem[0000000030041400] = 2daf6b34
	stba	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = c6af6b34

p0_label_52:
!	Mem[0000000020800040] = ff3dbae8, %l4 = 00000000000000ff
	ldstuba	[%o1+0x040]%asi,%l4	! %l4 = 000000ff000000ff
!	%f6  = 5ef77847 4cb752c5, %l1 = 0000000000000000
!	Mem[0000000030001400] = ffffffce00000000
	stda	%f6,[%i0+%l1]ASI_PST32_SL ! Mem[0000000030001400] = ffffffce00000000
!	%l4 = 00000000000000ff, Mem[0000000030001400] = ceffffff
	stha	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = ceff00ff
!	Mem[0000000010001410] = ec740000, %l0 = 0000000000000775
	swapa	[%i0+%o5]0x80,%l0	! %l0 = 00000000ec740000
!	%f5  = f225cffd, Mem[00000000100c1434] = ffff9619
	sta	%f5 ,[%i3+0x034]%asi	! Mem[00000000100c1434] = f225cffd
!	Mem[0000000010041410] = ff3752c5, %l4 = 00000000000000ff
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ff3752c5
!	Mem[0000000030081408] = 00000000, %l2 = 0000000000000501
	swapa	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[00000000300c1400] = e6e7adff
	stwa	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%f28 = 266e3c69 cb79f4a9, %l0 = 00000000ec740000
!	Mem[0000000030181420] = 97ec9bdb59ce999b
	add	%i6,0x020,%g1
	stda	%f28,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030181420] = 97ec9bdb59ce999b
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 000000ff, %l6 = 00000000000000c7
	lduba	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_53:
!	Mem[00000000100c1400] = 00000000 00000000, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030081408] = 00000501e5519f9c, %l2 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l2	! %l2 = 00000501e5519f9c
!	Mem[0000000020800040] = ff3dbae8, %l4 = 00000000ff3752c5
	lduha	[%o1+0x040]%asi,%l4	! %l4 = 000000000000ff3d
!	Mem[0000000010001438] = 9c5cea45 ccffb290, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+0x038]%asi,%l6	! %l6 = 000000009c5cea45 00000000ccffb290
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 00000000ec740000
	setx	0xc7e1d8378ceb1918,%g7,%l0 ! %l0 = c7e1d8378ceb1918
!	%l1 = 0000000000000000
	setx	0x6d491de86b0032ac,%g7,%l1 ! %l1 = 6d491de86b0032ac
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c7e1d8378ceb1918
	setx	0x420c9627be5715dc,%g7,%l0 ! %l0 = 420c9627be5715dc
!	%l1 = 6d491de86b0032ac
	setx	0x2b763b2fba8e2b15,%g7,%l1 ! %l1 = 2b763b2fba8e2b15
!	Mem[0000000030041408] = 00000039, %l3 = 9c9f51e500000000
	ldsha	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000039
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 420c9627be5715dc
	setx	0x6d5a6b30143bd425,%g7,%l0 ! %l0 = 6d5a6b30143bd425
!	%l1 = 2b763b2fba8e2b15
	setx	0x85aab1bfc6ff205e,%g7,%l1 ! %l1 = 85aab1bfc6ff205e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6d5a6b30143bd425
	setx	0x157fe047ff591927,%g7,%l0 ! %l0 = 157fe047ff591927
!	%l1 = 85aab1bfc6ff205e
	setx	0x25605e8ff51cde21,%g7,%l1 ! %l1 = 25605e8ff51cde21
!	Mem[0000000010001410] = 00000775000000d1, %f30 = 000074ec 000000b6
	ldda	[%i0+%o5]0x80,%f30	! %f30 = 00000775 000000d1
!	%l3 = 0000000000000039, imm = 0000000000000dd2, %l4 = 000000000000ff3d
	subc	%l3,0xdd2,%l4		! %l4 = fffffffffffff267
!	Starting 10 instruction Store Burst
!	%l6 = 9c5cea45, %l7 = ccffb290, Mem[0000000030081400] = 00000000 0000c7ca
	stda	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 9c5cea45 ccffb290

p0_label_54:
!	%l4 = fffffffffffff267, %l6 = 000000009c5cea45, %l7 = 00000000ccffb290
	andn	%l4,%l6,%l7		! %l7 = ffffffff63a31022
!	%l3 = 0000000000000039, Mem[0000000010181400] = 74ec8c4200000000
	stxa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000039
!	%f30 = 00000775, Mem[0000000010101408] = ffff0000
	sta	%f30,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000775
!	%f2  = 00000000 1e4f13b0, %l0 = 157fe047ff591927
!	Mem[0000000010041410] = 000000ffd5a68a47
	add	%i1,0x010,%g1
	stda	%f2,[%g1+%l0]ASI_PST16_P ! Mem[0000000010041410] = 000000001e4f13b0
!	%l4 = fffff267, %l5 = 4dde8ac6, Mem[0000000030141400] = 000074ec 3763ed47
	stda	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = fffff267 4dde8ac6
!	%f22 = ff800000 00000039, %l7 = ffffffff63a31022
!	Mem[0000000030141438] = 04b018e5843fa0ef
	add	%i5,0x038,%g1
	stda	%f22,[%g1+%l7]ASI_PST8_S ! Mem[0000000030141438] = 04b000e5843f00ef
!	%f30 = 00000775 000000d1, %l2 = 00000501e5519f9c
!	Mem[0000000010101420] = 8dead92d64b945aa
	add	%i4,0x020,%g1
	stda	%f30,[%g1+%l2]ASI_PST8_P ! Mem[0000000010101420] = 00ead975000045aa
!	Code Fragment 4
p0_fragment_8:
!	%l0 = 157fe047ff591927
	setx	0xdce60da0351c0f37,%g7,%l0 ! %l0 = dce60da0351c0f37
!	%l1 = 25605e8ff51cde21
	setx	0x0ce8830fb0b3bd87,%g7,%l1 ! %l1 = 0ce8830fb0b3bd87
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = dce60da0351c0f37
	setx	0x6a6c651060cd06b3,%g7,%l0 ! %l0 = 6a6c651060cd06b3
!	%l1 = 0ce8830fb0b3bd87
	setx	0xe8917527cfb615d0,%g7,%l1 ! %l1 = e8917527cfb615d0
!	Mem[0000000010181410] = ffade7e6, %l5 = 000000004dde8ac6
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 00000000ffade7e6
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000030081400] = 9c5cea45 ccffb290 00000501 e5519f9c
!	Mem[0000000030081410] = ff904d0b 4cb752c5 3f651de1 0501eaf7
!	Mem[0000000030081420] = 7ed4a2c8 66496288 5d552c47 d7fe9fcb
!	Mem[0000000030081430] = 199caaf3 c8c93bc1 e3f1e98b 9bc90232
	ldda	[%i2]ASI_BLK_S,%f16	! Block Load from 0000000030081400

p0_label_55:
!	Code Fragment 3
p0_fragment_9:
!	%l0 = 6a6c651060cd06b3
	setx	0x1b804247c83970af,%g7,%l0 ! %l0 = 1b804247c83970af
!	%l1 = e8917527cfb615d0
	setx	0x3e9a34a79b257fe6,%g7,%l1 ! %l1 = 3e9a34a79b257fe6
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1b804247c83970af
	setx	0x4b82b7afd7d93d6d,%g7,%l0 ! %l0 = 4b82b7afd7d93d6d
!	%l1 = 3e9a34a79b257fe6
	setx	0x1ee9ad6054864421,%g7,%l1 ! %l1 = 1ee9ad6054864421
!	Mem[00000000201c0000] = 74ff8bc8, %l5 = 00000000ffade7e6
	ldsb	[%o0+0x001],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000300c1408] = 00000000 4689d745, %l6 = 9c5cea45, %l7 = 63a31022
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000 000000004689d745
!	Mem[0000000030141400] = 67f2ffff, %l3 = 0000000000000039
	ldswa	[%i5+%g0]0x81,%l3	! %l3 = 0000000067f2ffff
!	Mem[0000000010041408] = ff5b4980, %l7 = 000000004689d745
	lduba	[%i1+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = 4e65d5cc, %l3 = 0000000067f2ffff
	lduwa	[%i5+%o4]0x89,%l3	! %l3 = 000000004e65d5cc
!	Mem[0000000030001400] = ceff00ff, %l0 = 4b82b7afd7d93d6d
	lduha	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101400] = 9fffffff, %l1 = 1ee9ad6054864421
	ldsha	[%i4+%g0]0x80,%l1	! %l1 = ffffffffffff9fff
!	Mem[0000000010041408] = ff5b4980, %l5 = ffffffffffffffff
	ldswa	[%i1+%o4]0x80,%l5	! %l5 = ffffffffff5b4980
!	Starting 10 instruction Store Burst
!	%l2 = 00000501e5519f9c, Mem[0000000030181410] = b09a0900000000ff
	stxa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000501e5519f9c

p0_label_56:
	membar	#Sync			! Added by membar checker (10)
!	%l4 = fffff267, %l5 = ff5b4980, Mem[0000000030081410] = ff904d0b 4cb752c5
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = fffff267 ff5b4980
!	Mem[00000000100c1410] = 51f971ff, %l2 = 00000501e5519f9c
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 0000000051f971ff
!	%l1 = ffffffffffff9fff, Mem[0000000010041400] = ffffffff
	stba	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffff
!	%l3 = 000000004e65d5cc, Mem[0000000010181400] = 39000000
	stwa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 4e65d5cc
!	%f3  = 1e4f13b0, Mem[0000000010041400] = ffffffff
	sta	%f3 ,[%i1+0x000]%asi	! Mem[0000000010041400] = 1e4f13b0
!	Mem[0000000030141410] = b0134fff, %l3 = 000000004e65d5cc
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000b0134fff
!	Mem[00000000300c1408] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = 0019654e00000039, %l3 = 00000000b0134fff, %l5 = ffffffffff5b4980
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l3,%l5	! %l5 = 0019654e00000039
!	%l2 = 0000000051f971ff, Mem[0000000010001408] = ec740000
	stwa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 51f971ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = dc13ea61, %l4 = fffffffffffff267
	lduwa	[%i6+0x038]%asi,%l4	! %l4 = 00000000dc13ea61

p0_label_57:
!	Mem[0000000030141400] = 67f2ffff, %l4 = 00000000dc13ea61
	ldsba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000067
!	Mem[0000000010001410] = 00000775, %l4 = 0000000000000067
	ldsha	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181414] = 9b68f690, %l2 = 0000000051f971ff
	ldsb	[%i6+0x015],%l2		! %l2 = 0000000000000068
!	Mem[0000000010081400] = eddf916a 000000ff, %l4 = 00000000, %l5 = 00000039
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff 00000000eddf916a
!	Mem[0000000010181410] = 90f6689b c68ade4d, %l0 = 00000000, %l1 = ffff9fff
	ldda	[%i6+%o5]0x88,%l0	! %l0 = 00000000c68ade4d 0000000090f6689b
!	Mem[0000000010141408] = 4e651900, %l3 = 00000000b0134fff
	lduba	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
!	%f25 = 66496288, %f24 = 7ed4a2c8, %f31 = 9bc90232
	fmuls	%f25,%f24,%f31		! %f31 = 7f800000
!	Mem[0000000010101408] = 047c924900000775, %l3 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l3	! %l3 = 047c924900000775
!	Mem[0000000030081400] = 45ea5c9c, %l7 = 00000000000000ff
	lduha	[%i2+%g0]0x89,%l7	! %l7 = 0000000000005c9c
!	Starting 10 instruction Store Burst
!	%l3 = 047c924900000775, Mem[0000000010181400] = 00000000ccd5654e
	stxa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 047c924900000775

p0_label_58:
!	Mem[0000000010041400] = 1e4f13b0, %l7 = 0000000000005c9c
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 000000001e4f13b0
!	%l4 = 00000000000000ff, Mem[0000000010141408] = 0019654e
	stha	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff654e
!	%f28 = 199caaf3, Mem[0000000010101410] = c68ade4d
	sta	%f28,[%i4+%o5]0x88	! Mem[0000000010101410] = 199caaf3
!	%l2 = 0000000000000068, Mem[0000000030101400] = 000000ca
	stwa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000068
!	Mem[0000000030041400] = c6af6b34, %l7 = 000000001e4f13b0
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 000000c6000000ff
!	%l6 = 0000000000000000, Mem[00000000100c143c] = 4083bfcb, %asi = 80
	stwa	%l6,[%i3+0x03c]%asi	! Mem[00000000100c143c] = 00000000
!	Mem[00000000201c0001] = 74ff8bc8, %l3 = 047c924900000775
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	%l5 = 00000000eddf916a, Mem[0000000030041400] = 346bafff
	stwa	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = eddf916a
!	%l4 = 00000000000000ff, Mem[0000000030141408] = 4e65d5cc
	stba	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 4e65d5ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 9c5cea45, %f24 = 7ed4a2c8
	lda	[%i2+%g0]0x81,%f24	! %f24 = 9c5cea45

p0_label_59:
!	Mem[00000000100c1400] = 00000000, %l6 = 0000000000000000
	ldsha	[%i3+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = d96f5741 46ac75ff, %l2 = 00000068, %l3 = 000000ff
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 0000000046ac75ff 00000000d96f5741
!	Mem[0000000030081410] = 67f2ffff, %l2 = 0000000046ac75ff
	ldswa	[%i2+%o5]0x89,%l2	! %l2 = 0000000067f2ffff
!	Mem[0000000030181408] = 5d00e7e6, %l6 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000e6
!	Mem[00000000201c0000] = 74ff8bc8, %l0 = 00000000c68ade4d
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000074
!	Mem[0000000010001430] = 6f17db36, %l7 = 00000000000000c6
	ldsba	[%i0+0x030]%asi,%l7	! %l7 = 000000000000006f
!	Mem[0000000010181408] = 429e3f6a000000ff, %l1 = 0000000090f6689b
	ldxa	[%i6+%o4]0x88,%l1	! %l1 = 429e3f6a000000ff
!	Mem[0000000030141410] = 4e65d5cc, %l1 = 429e3f6a000000ff
	lduha	[%i5+%o5]0x89,%l1	! %l1 = 000000000000d5cc
!	Mem[0000000030141408] = ffd5654e, %l6 = 00000000000000e6
	ldsha	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffffd5
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = fdcf25f2, %l2 = 67f2ffff, %l0 = 00000074
	add	%i2,0x10,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 00000000fdcf25f2

p0_label_60:
!	Mem[0000000030001400] = ceff00ff, %l3 = 00000000d96f5741
	ldstuba	[%i0+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%l4 = 00000000000000ff, %l3 = 00000000000000ff, %y  = 357a1921
	sdiv	%l4,%l3,%l7		! %l7 = 000000007fffffff
	mov	%l0,%y			! %y = fdcf25f2
!	%l5 = 00000000eddf916a, Mem[0000000010181408] = ff000000
	stwa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = eddf916a
!	%f18 = 00000501 e5519f9c, %l3 = 00000000000000ff
!	Mem[0000000010001418] = 7bdf9e2c89bdad5a
	add	%i0,0x018,%g1
	stda	%f18,[%g1+%l3]ASI_PST8_P ! Mem[0000000010001418] = 00000501e5519f9c
!	%l4 = 000000ff, %l5 = eddf916a, Mem[0000000030041410] = d61c6945 eddf916a
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff eddf916a
!	%l2 = 0000000067f2ffff, Mem[0000000010001430] = 6f17db3680495b49, %asi = 80
	stxa	%l2,[%i0+0x030]%asi	! Mem[0000000010001430] = 0000000067f2ffff
!	%f26 = 5d552c47 d7fe9fcb, Mem[0000000010181410] = c68ade4d 90f6689b
	stda	%f26,[%i6+%o5]0x88	! Mem[0000000010181410] = 5d552c47 d7fe9fcb
!	%l3 = 00000000000000ff, Mem[00000000300c1408] = 000000ff
	stha	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	Code Fragment 4
p0_fragment_10:
!	%l0 = 00000000fdcf25f2
	setx	0x7141a0f042bacc2b,%g7,%l0 ! %l0 = 7141a0f042bacc2b
!	%l1 = 000000000000d5cc
	setx	0x91bbf327eae9d986,%g7,%l1 ! %l1 = 91bbf327eae9d986
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7141a0f042bacc2b
	setx	0x2a49a61fce18036a,%g7,%l0 ! %l0 = 2a49a61fce18036a
!	%l1 = 91bbf327eae9d986
	setx	0xc632939f86e778df,%g7,%l1 ! %l1 = c632939f86e778df
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = 93e2b43d, %l7 = 000000007fffffff
	ldsha	[%i3+0x02a]%asi,%l7	! %l7 = ffffffffffffb43d

p0_label_61:
!	Mem[0000000030001400] = ceff00ff, %l0 = 2a49a61fce18036a
	ldsba	[%i0+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000201c0000] = 74ff8bc8, %l2 = 0000000067f2ffff
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 00000000000074ff
!	Mem[0000000010081410] = fdcf25f200000000, %l5 = 00000000eddf916a
	ldxa	[%i2+%o5]0x80,%l5	! %l5 = fdcf25f200000000
!	%l7 = ffffffffffffb43d, imm = fffffffffffff14c, %l0 = ffffffffffffffff
	sub	%l7,-0xeb4,%l0		! %l0 = ffffffffffffc2f1
!	Mem[00000000211c0000] = c7ff9864, %l2 = 00000000000074ff
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffc7ff
!	Mem[00000000100c1400] = 00000000, %l6 = ffffffffffffffd5
	lduwa	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041408] = 00000039, %l2 = ffffffffffffc7ff
	ldsba	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000039
!	Mem[0000000010001408] = 51f971ff, %l4 = 00000000000000ff
	ldsha	[%i0+%o4]0x88,%l4	! %l4 = 00000000000071ff
!	Mem[0000000030041410] = ff000000 6a91dfed, %l6 = 00000000, %l7 = ffffb43d
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 00000000ff000000 000000006a91dfed
!	Starting 10 instruction Store Burst
!	%f4  = 00000000 f225cffd, Mem[0000000010141400] = ca828fbf 1376e6e3
	stda	%f4 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 f225cffd

p0_label_62:
!	Mem[00000000300c1410] = 5a000000, %l7 = 000000006a91dfed
	swapa	[%i3+%o5]0x89,%l7	! %l7 = 000000005a000000
!	%l6 = 00000000ff000000, Mem[0000000010001400] = 00000000
	stba	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%l1 = c632939f86e778df, immd = fffffffffffff9c3, %l0  = ffffffffffffc2f1
	mulx	%l1,-0x63d,%l0		! %l0 = 967d15d36e02f8dd
!	Mem[00000000300c1408] = 000000ff, %l1 = c632939f86e778df
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%f0  = eddf916a 0000005f 00000000 1e4f13b0
!	%f4  = 00000000 f225cffd 5ef77847 4cb752c5
!	%f8  = bc260fa5 526e4a35 321515ac 9c5f79c9
!	%f12 = 38819bda d4f136ca 74ec8cd9 aa252d62
	stda	%f0,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%l1 = 00000000000000ff, Mem[0000000030141410] = ccd5654e
	stha	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 00ff654e
!	%f26 = 5d552c47 d7fe9fcb, Mem[0000000010041410] = 00000000 1e4f13b0
	stda	%f26,[%i1+%o5]0x80	! Mem[0000000010041410] = 5d552c47 d7fe9fcb
!	%l0 = 967d15d36e02f8dd, Mem[0000000030041408] = 00000039
	stha	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000f8dd
!	%f30 = e3f1e98b 7f800000, Mem[0000000030141400] = 67f2ffff c68ade4d
	stda	%f30,[%i5+%g0]0x81	! Mem[0000000030141400] = e3f1e98b 7f800000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = f10000009c5c0000, %f18 = 00000501 e5519f9c
	ldda	[%i1+%g0]0x88,%f18	! %f18 = f1000000 9c5c0000

p0_label_63:
!	Mem[0000000010041408] = 80495bff, %l2 = 0000000000000039
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 0000000000005bff
!	Mem[0000000010181404] = 49927c04, %l0 = 967d15d36e02f8dd
	ldsw	[%i6+0x004],%l0		! %l0 = 0000000049927c04
!	Mem[00000000201c0000] = 74ff8bc8, %l3 = 00000000000000ff
	lduh	[%o0+%g0],%l3		! %l3 = 00000000000074ff
!	Mem[0000000030001410] = 4a291a57, %l3 = 00000000000074ff
	ldswa	[%i0+%o5]0x81,%l3	! %l3 = 000000004a291a57
!	Mem[0000000030101410] = 000051f96a3f9e42, %f30 = e3f1e98b 7f800000
	ldda	[%i4+%o5]0x81,%f30	! %f30 = 000051f9 6a3f9e42
!	Mem[0000000010181404] = 49927c04, %l6 = 00000000ff000000
	lduh	[%i6+0x006],%l6		! %l6 = 0000000000007c04
!	Mem[0000000010141408] = 00ff654e 00000039, %l0 = 49927c04, %l1 = 000000ff
	ldda	[%i5+0x008]%asi,%l0	! %l0 = 0000000000ff654e 0000000000000039
!	Mem[0000000010101404] = ff000000, %f29 = c8c93bc1
	ld	[%i4+0x004],%f29	! %f29 = ff000000
!	Mem[00000000201c0000] = 74ff8bc8, %l3 = 000000004a291a57
	ldsb	[%o0+0x001],%l3		! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000010181410] = cb9ffed7472c555d
	stx	%l3,[%i6+%o5]		! Mem[0000000010181410] = ffffffffffffffff

p0_label_64:
!	%f24 = 9c5cea45 66496288, %l0 = 0000000000ff654e
!	Mem[0000000030181400] = 00000000a87a6333
	stda	%f24,[%i6+%l0]ASI_PST16_S ! Mem[0000000030181400] = 9c5cea4566496333
!	%f24 = 9c5cea45 66496288, %l2 = 0000000000005bff
!	Mem[0000000010081430] = ca36f1d4da9b8138
	add	%i2,0x030,%g1
	stda	%f24,[%g1+%l2]ASI_PST8_P ! Mem[0000000010081430] = 9c5cea4566496288
!	%l2 = 0000000000005bff, Mem[0000000021800000] = 7fff8cec, %asi = 80
	stha	%l2,[%o3+0x000]%asi	! Mem[0000000021800000] = 5bff8cec
!	%l4 = 00000000000071ff, Mem[0000000010181408] = eddf916a
	stwa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 000071ff
!	%l7 = 000000005a000000, Mem[000000001008141c] = 4778f75e
	stb	%l7,[%i2+0x01c]		! Mem[000000001008141c] = 0078f75e
!	%l4 = 000071ff, %l5 = 00000000, Mem[0000000030181408] = 5d00e7e6 adb87c1f
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 000071ff 00000000
	membar	#Sync			! Added by membar checker (11)
!	Mem[00000000100c1408] = f9510000, %l6 = 0000000000007c04, %asi = 80
	swapa	[%i3+0x008]%asi,%l6	! %l6 = 00000000f9510000
!	%l7 = 000000005a000000, Mem[0000000010041410] = 472c555d
	stba	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 472c5500
!	%l0 = 0000000000ff654e, Mem[0000000010081400] = 000000ff
	stha	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000654e
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00ff654e, %l5 = fdcf25f200000000
	ldsba	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000

p0_label_65:
!	Mem[00000000100c1408] = 047c0000, %l1 = 0000000000000039
	ldsha	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 9c9f51e5, %l7 = 000000005a000000
	ldsba	[%i3+%o5]0x80,%l7	! %l7 = ffffffffffffff9c
!	Mem[00000000201c0000] = 74ff8bc8, %l3 = ffffffffffffffff
	ldsba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000074
!	Mem[0000000010081400] = 4e650000, %f18 = f1000000
	lda	[%i2+%g0]0x80,%f18	! %f18 = 4e650000
!	Mem[00000000300c1410] = fdcf25f2, %l7 = ffffffffffffff9c
	ldsha	[%i3+%o5]0x81,%l7	! %l7 = fffffffffffffdcf
!	Mem[0000000010001408] = ff71f951, %l4 = 00000000000071ff
	ldsha	[%i0+%o4]0x80,%l4	! %l4 = ffffffffffffff71
!	Mem[00000000100c1408] = 047c0000, %l2 = 0000000000005bff
	ldsba	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800080] = bc53ac45, %l4 = ffffffffffffff71
	lduba	[%o3+0x081]%asi,%l4	! %l4 = 0000000000000053
!	Mem[0000000010181410] = ffffffff ffffffff, %l4 = 00000053, %l5 = 00000000
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 00000000ffffffff 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010041418] = b0134f1eff000000
	stx	%l2,[%i1+0x018]		! Mem[0000000010041418] = 0000000000000000

p0_label_66:
!	%f2  = 00000000 1e4f13b0, %l6 = 00000000f9510000
!	Mem[0000000030101430] = bbecb31ce6697db4
	add	%i4,0x030,%g1
	stda	%f2,[%g1+%l6]ASI_PST32_S ! Mem[0000000030101430] = bbecb31ce6697db4
!	%f30 = 000051f9 6a3f9e42, Mem[0000000010001410] = 75070000 d1000000
	stda	%f30,[%i0+%o5]0x88	! Mem[0000000010001410] = 000051f9 6a3f9e42
!	%f2  = 00000000 1e4f13b0, Mem[0000000010041410] = 00552c47 d7fe9fcb
	stda	%f2 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 1e4f13b0
!	Mem[0000000010041400] = 00005c9c, %l2 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000021800140] = 42fd04f1, %asi = 80
	stha	%l1,[%o3+0x140]%asi	! Mem[0000000021800140] = 000004f1
!	%f12 = 38819bda, Mem[0000000010081404] = 6a91dfed
	sta	%f12,[%i2+0x004]%asi	! Mem[0000000010081404] = 38819bda
!	Mem[00000000100c1408] = 047c0000, %l7 = fffffffffffffdcf
	swapa	[%i3+%o4]0x88,%l7	! %l7 = 00000000047c0000
!	%l3 = 0000000000000074, imm = fffffffffffff648, %l4 = 00000000ffffffff
	subc	%l3,-0x9b8,%l4		! %l4 = 0000000000000a2c
!	Mem[0000000010141433] = f3a43f4b, %l7 = 00000000047c0000
	ldstuba	[%i5+0x033]%asi,%l7	! %l7 = 0000004b000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = c7ff23dd, %l0 = 0000000000ff654e
	ldsha	[%o1+0x000]%asi,%l0	! %l0 = ffffffffffffc7ff

p0_label_67:
!	Mem[0000000030181410] = 9c9f51e5 01050000, %l2 = 00000000, %l3 = 00000074
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 000000009c9f51e5 0000000001050000
!	Mem[0000000010141400] = f225cffd, %l5 = 00000000ffffffff
	ldswa	[%i5+%g0]0x88,%l5	! %l5 = fffffffff225cffd
!	Mem[0000000010101400] = 9fffffff ff000000, %l4 = 00000a2c, %l5 = f225cffd
	ldd	[%i4+%g0],%l4		! %l4 = 000000009fffffff 00000000ff000000
!	Mem[0000000010141408] = 4e65ff00, %l5 = 00000000ff000000
	ldsba	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = b600000051f971ff, %l6 = 00000000f9510000
	ldxa	[%i0+%o4]0x88,%l6	! %l6 = b600000051f971ff
!	Mem[0000000030141410] = 561484854e65ff00, %l7 = 000000000000004b
	ldxa	[%i5+%o5]0x89,%l7	! %l7 = 561484854e65ff00
!	Mem[0000000010081400] = 0000654e, %l1 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l1	! %l1 = 000000000000004e
!	Mem[0000000030141400] = e3f1e98b7f800000, %l4 = 000000009fffffff
	ldxa	[%i5+%g0]0x81,%l4	! %l4 = e3f1e98b7f800000
!	Mem[0000000010101410] = f3aa9c19, %l1 = 000000000000004e
	ldswa	[%i4+%o5]0x80,%l1	! %l1 = fffffffff3aa9c19
!	Starting 10 instruction Store Burst
!	%l6 = 51f971ff, %l7 = 4e65ff00, Mem[0000000010141400] = fdcf25f2 00000000
	std	%l6,[%i5+%g0]		! Mem[0000000010141400] = 51f971ff 4e65ff00

p0_label_68:
!	Mem[0000000010101400] = 9fffffff, %l5 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 0000009f000000ff
!	Mem[0000000010101400] = ffffffff, %l6 = b600000051f971ff
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 00000000ffffffff
!	%f4  = 00000000 f225cffd, Mem[0000000030181408] = 000071ff 00000000
	stda	%f4 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 f225cffd
!	%f20 = ff904d0b 4cb752c5, %l5 = 000000000000009f
!	Mem[00000000100c1428] = 93e2b43da06405b6
	add	%i3,0x028,%g1
	stda	%f20,[%g1+%l5]ASI_PST16_PL ! Mem[00000000100c1428] = c552b74c0b4d90ff
!	Code Fragment 3
p0_fragment_11:
!	%l0 = ffffffffffffc7ff
	setx	0x63014b77998f9381,%g7,%l0 ! %l0 = 63014b77998f9381
!	%l1 = fffffffff3aa9c19
	setx	0x5e90e567e0b0885f,%g7,%l1 ! %l1 = 5e90e567e0b0885f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 63014b77998f9381
	setx	0x7d086ff7d40f8a73,%g7,%l0 ! %l0 = 7d086ff7d40f8a73
!	%l1 = 5e90e567e0b0885f
	setx	0x2eda0f778474c072,%g7,%l1 ! %l1 = 2eda0f778474c072
!	%f8  = bc260fa5, %f22 = 3f651de1, %f23 = 0501eaf7
	fmuls	%f8 ,%f22,%f23		! %f23 = bc149f60
!	Mem[00000000100c1408] = cffdffff, %l2 = 000000009c9f51e5, %asi = 80
	swapa	[%i3+0x008]%asi,%l2	! %l2 = 00000000cffdffff
!	%l2 = 00000000cffdffff, Mem[0000000010101410] = f3aa9c19d15dff42
	stxa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000cffdffff
!	%f24 = 9c5cea45 66496288, Mem[0000000010081400] = 4e650000 38819bda
	stda	%f24,[%i2+%g0]0x80	! Mem[0000000010081400] = 9c5cea45 66496288
!	Starting 10 instruction Load Burst
!	Mem[0000000010141414] = 41576fd9, %l5 = 000000000000009f
	ldsb	[%i5+0x014],%l5		! %l5 = 0000000000000041

p0_label_69:
!	Mem[0000000010141400] = ff71f951, %l1 = 2eda0f778474c072
	ldswa	[%i5+%g0]0x88,%l1	! %l1 = ffffffffff71f951
!	Mem[0000000010181400] = 75070000, %l0 = 7d086ff7d40f8a73
	lduba	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000075
!	Mem[00000000300c1400] = 0000005f, %f12 = 38819bda
	lda	[%i3+%g0]0x89,%f12	! %f12 = 0000005f
!	Mem[0000000030141400] = 8be9f1e3, %f19 = 9c5c0000
	lda	[%i5+%g0]0x89,%f19	! %f19 = 8be9f1e3
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010041400] = ff005c9c 000000f1 ff5b4980 b841cf15
!	Mem[0000000010041410] = 00000000 1e4f13b0 00000000 00000000
!	Mem[0000000010041420] = 0a129924 39cdbd71 10ad1ccd 3a121da1
!	Mem[0000000010041430] = 852520dd b69eb3ec 552859e6 f9904d0b
	ldda	[%i1]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010041400
!	%l6 = 00000000ffffffff, imm = fffffffffffff648, %l7 = 561484854e65ff00
	or	%l6,-0x9b8,%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010141408] = 00ff654e, %l1 = ffffffffff71f951
	lduwa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000ff654e
!	Mem[0000000030041400] = da474434 eddf916a, %l6 = ffffffff, %l7 = ffffffff
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 00000000eddf916a 00000000da474434
!	Mem[00000000300c1400] = 5f000000 6a91dfed b0134f1e 00000000
!	Mem[00000000300c1410] = fdcf25f2 00000000 c552b74c 4778f75e
!	Mem[00000000300c1420] = 354a6e52 a50f26bc c9795f9c ac151532
!	Mem[00000000300c1430] = ca36f1d4 da9b8138 622d25aa d98cec74
	ldda	[%i3]ASI_BLK_SL,%f0	! Block Load from 00000000300c1400
!	Starting 10 instruction Store Burst
!	%f23 = bc149f60, %f29 = ff000000, %f24 = 9c5cea45 66496288
	fsmuld	%f23,%f29,%f24		! %f24 = 477293ec 00000000

p0_label_70:
!	%l6 = 00000000eddf916a, Mem[0000000010001408] = ff71f951000000b6
	stxa	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000eddf916a
!	%f28 = 199caaf3, Mem[0000000030081408] = 01050000
	sta	%f28,[%i2+%o4]0x89	! Mem[0000000030081408] = 199caaf3
!	%l0 = 0000000000000075, Mem[0000000030001400] = ff00ffce
	stba	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 7500ffce
!	%l6 = eddf916a, %l7 = da474434, Mem[0000000010181410] = ffffffff ffffffff
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = eddf916a da474434
!	%l3 = 0000000001050000, Mem[0000000010081410] = f225cffd
	stwa	%l3,[%i2+%o5]0x88	! Mem[0000000010081410] = 01050000
!	%f30 = 000051f9, Mem[00000000100c1400] = 00000000
	sta	%f30,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000051f9
!	%l0 = 00000075, %l1 = 00ff654e, Mem[0000000030041400] = 6a91dfed 344447da
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000075 00ff654e
!	%l1 = 0000000000ff654e, Mem[0000000010141400] = 51f971ff
	stha	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 654e71ff
!	%f16 = 9c5cea45 ccffb290, %l3 = 0000000001050000
!	Mem[0000000030181410] = 9c9f51e501050000
	add	%i6,0x010,%g1
	stda	%f16,[%g1+%l3]ASI_PST8_S ! Mem[0000000030181410] = 9c9f51e501050000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 45ea5c9c, %l7 = 00000000da474434
	lduwa	[%i2+%g0]0x88,%l7	! %l7 = 0000000045ea5c9c

p0_label_71:
!	Mem[0000000030001400] = 7500ffce, %l5 = 0000000000000041
	ldsha	[%i0+%g0]0x81,%l5	! %l5 = 0000000000007500
!	Mem[0000000010081410] = 01050000, %f28 = 199caaf3
	lda	[%i2+%o5]0x88,%f28	! %f28 = 01050000
!	Mem[0000000010081400] = 8862496645ea5c9c, %l1 = 0000000000ff654e
	ldxa	[%i2+%g0]0x88,%l1	! %l1 = 8862496645ea5c9c
!	Mem[0000000020800040] = ff3dbae8, %l0 = 0000000000000075
	ldsh	[%o1+0x040],%l0		! %l0 = ffffffffffffff3d
!	Mem[0000000030081410] = fffff267, %l4 = e3f1e98b7f800000
	ldsba	[%i2+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	%l2 = cffdffff, %l3 = 01050000, Mem[0000000030181408] = fdcf25f2 00000000
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = cffdffff 01050000
!	Mem[0000000020800000] = c7ff23dd, %l1 = 8862496645ea5c9c
	lduba	[%o1+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[00000000211c0000] = c7ff9864, %l4 = ffffffffffffffff
	lduh	[%o2+%g0],%l4		! %l4 = 000000000000c7ff
!	Mem[0000000010101408] = 75070000, %l1 = 00000000000000ff
	ldsba	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000075
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 9c9f51e5, %l1 = 0000000000000075
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 000000009c9f51e5

p0_label_72:
!	%l0 = ffffffffffffff3d, Mem[0000000010141418] = f637b056, %asi = 80
	stwa	%l0,[%i5+0x018]%asi	! Mem[0000000010141418] = ffffff3d
!	%l7 = 0000000045ea5c9c, %l2 = 00000000cffdffff, %y  = fdcf25f2
	umul	%l7,%l2,%l5		! %l5 = 38cddf69c0dda364, %y = 38cddf69
!	%l2 = cffdffff, %l3 = 01050000, Mem[0000000010141408] = 4e65ff00 39000000
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = cffdffff 01050000
!	Mem[0000000010181400] = 00000775, %l3 = 0000000001050000
	ldstuba	[%i6+%g0]0x88,%l3	! %l3 = 00000075000000ff
!	Mem[000000001000142d] = 4575225b, %l2 = 00000000cffdffff
	ldstuba	[%i0+0x02d]%asi,%l2	! %l2 = 00000075000000ff
!	%l4 = 000000000000c7ff, Mem[0000000010141408] = fffffdcf
	sth	%l4,[%i5+%o4]		! Mem[0000000010141408] = c7fffdcf
!	%f22 = 3f651de1 bc149f60, %f20 = ff904d0b
	fdtoi	%f22,%f20		! %f20 = 00000000
!	%l2 = 00000075, %l3 = 00000075, Mem[0000000010181400] = 000007ff 047c9249
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000075 00000075
!	Mem[0000000030081400] = 45ea5c9c, %l0 = ffffffffffffff3d
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 0000000045ea5c9c
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 7507000049927c04, %f24 = 477293ec 00000000
	ldda	[%i4+%o4]0x80,%f24	! %f24 = 75070000 49927c04

p0_label_73:
!	Mem[0000000010101400] = ff71f951, %l7 = 0000000045ea5c9c
	lduba	[%i4+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = d96f5741 46ac75ff, %l4 = 0000c7ff, %l5 = c0dda364
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 0000000046ac75ff 00000000d96f5741
!	Mem[0000000010181400] = 75000000, %l6 = 00000000eddf916a
	lduba	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000075
!	Mem[0000000010081408] = 1e4f13b0, %l2 = 0000000000000075
	ldswa	[%i2+%o4]0x88,%l2	! %l2 = 000000001e4f13b0
!	Mem[00000000300c1410] = f225cffd, %l6 = 0000000000000075
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 00000000f225cffd
!	Mem[0000000010081420] = 354a6e52a50f26bc, %f6  = 5ef77847 4cb752c5
	ldd	[%i2+0x020],%f6 	! %f6  = 354a6e52 a50f26bc
!	Mem[0000000030041408] = ddf80000, %l0 = 0000000045ea5c9c
	lduba	[%i1+%o4]0x81,%l0	! %l0 = 00000000000000dd
!	Mem[0000000030181408] = fffffdcf, %f30 = 000051f9
	lda	[%i6+%o4]0x89,%f30	! %f30 = fffffdcf
!	Mem[0000000030181400] = 9c5cea45, %l5 = 00000000d96f5741
	ldsba	[%i6+%g0]0x81,%l5	! %l5 = ffffffffffffff9c
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (13)
!	%l7 = 00000000000000ff, Mem[0000000010041410] = 00000000
	stha	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff

p0_label_74:
!	Mem[000000001008143c] = d98cec74, %l7 = 00000000000000ff
	swap	[%i2+0x03c],%l7		! %l7 = 00000000d98cec74
!	Mem[0000000010181400] = 75000000, %l2 = 000000001e4f13b0
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 0000000075000000
!	Mem[0000000030081400] = 3dffffff, %l6 = 00000000f225cffd
	ldstuba	[%i2+%g0]0x81,%l6	! %l6 = 0000003d000000ff
!	%l3 = 0000000000000075, Mem[00000000300c1400] = eddf916a0000005f
	stxa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000075
!	Mem[0000000010001400] = 00000000, %l2 = 0000000075000000
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141408] = c7fffdcf, %l3 = 0000000000000075
	ldstuba	[%i5+0x008]%asi,%l3	! %l3 = 000000c7000000ff
!	Mem[0000000010001400] = 000000ff, %l6 = 000000000000003d
	swapa	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001410] = 571a294a, %l0 = 00000000000000dd
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 00000000571a294a
!	%l2 = 0000000000000000, Mem[0000000010001408] = 00000000
	stwa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 000051f9, %l2 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000

p0_label_75:
!	Mem[0000000030081400] = ffffffff, %l4 = 0000000046ac75ff
	lduba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000000000000ff, imm = 000000000000016b, %l2 = 0000000000000000
	addc	%l6,0x16b,%l2		! %l2 = 000000000000026a
!	Mem[00000000100c143c] = 00000000, %l2 = 000000000000026a
	lduha	[%i3+0x03e]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = 6a91dfed, %l4 = 00000000000000ff
	ldswa	[%i6+%o5]0x88,%l4	! %l4 = 000000006a91dfed
!	Mem[0000000010141400] = 654e71ff4e65ff00, %l3 = 00000000000000c7
	ldxa	[%i5+%g0]0x80,%l3	! %l3 = 654e71ff4e65ff00
!	Mem[0000000010001410] = 6a3f9e42, %l5 = ffffffffffffff9c
	lduba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000042
!	Mem[00000000201c0000] = 74ff8bc8, %l4 = 000000006a91dfed
	lduba	[%o0+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = b0134f1e, %l6 = 00000000000000ff
	lduba	[%i3+%o4]0x81,%l6	! %l6 = 00000000000000b0
!	Mem[00000000300c1408] = 1e4f13b0, %l2 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l2	! %l2 = ffffffffffffffb0
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 00000075, %l5 = 0000000000000042
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000075

p0_label_76:
!	%f7  = a50f26bc, Mem[0000000010001430] = 00000000
	sta	%f7 ,[%i0+0x030]%asi	! Mem[0000000010001430] = a50f26bc
!	%l0 = 00000000571a294a, Mem[00000000300c1408] = b0134f1e
	stwa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 571a294a
!	%l1 = 000000009c9f51e5, %l0 = 00000000571a294a, %l7 = 00000000d98cec74
	sub	%l1,%l0,%l7		! %l7 = 000000004585289b
!	%f30 = fffffdcf, Mem[00000000300c1400] = 00000075
	sta	%f30,[%i3+%g0]0x89	! Mem[00000000300c1400] = fffffdcf
!	%l6 = 00000000000000b0, Mem[0000000010081410] = 01050000
	stba	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 010500b0
!	%l2 = ffffffffffffffb0, imm = 0000000000000b29, %l3 = 654e71ff4e65ff00
	addc	%l2,0xb29,%l3		! %l3 = 0000000000000ad9
!	Mem[0000000010141430] = f3a43fffb69eb3ec, %l3 = 0000000000000ad9, %l1 = 000000009c9f51e5
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = f3a43fffb69eb3ec
!	%l1 = f3a43fffb69eb3ec, Mem[0000000030141400] = 8be9f1e3
	stha	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 8be9b3ec
!	%f6  = 354a6e52, Mem[000000001018140c] = 6a3f9e42
	sta	%f6 ,[%i6+0x00c]%asi	! Mem[000000001018140c] = 354a6e52
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 000000ff, %f29 = ff000000
	lda	[%i0+%o4]0x89,%f29	! %f29 = 000000ff

p0_label_77:
!	Mem[00000000201c0000] = 74ff8bc8, %l4 = 00000000000000ff
	ldub	[%o0+%g0],%l4		! %l4 = 0000000000000074
!	Mem[00000000211c0000] = c7ff9864, %l0 = 00000000571a294a
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffc7ff
!	Mem[0000000030001400] = 7500ffce, %l1 = f3a43fffb69eb3ec
	ldsha	[%i0+%g0]0x81,%l1	! %l1 = 0000000000007500
!	Mem[0000000030001400] = ceff0075, %l1 = 0000000000007500
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000075
!	Mem[0000000030041410] = 000000ff, %l7 = 000000004585289b
	lduba	[%i1+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041408] = ddf800004e65d5cc, %f24 = 75070000 49927c04
	ldda	[%i1+%o4]0x81,%f24	! %f24 = ddf80000 4e65d5cc
!	Mem[0000000030181400] = 9c5cea45, %f4  = 00000000
	lda	[%i6+%g0]0x81,%f4 	! %f4 = 9c5cea45
!	Mem[0000000030181408] = cffdffff 01050000, %l0 = ffffc7ff, %l1 = 00000075
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 00000000cffdffff 0000000001050000
!	Mem[0000000010041400] = ff005c9c, %l6 = 00000000000000b0
	lduba	[%i1+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = fffff267, %l3 = 0000000000000ad9
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 000000ff000000ff

p0_label_78:
!	%f0  = eddf916a 0000005f, %l3 = 00000000000000ff
!	Mem[0000000010101418] = 0a12992439cdbd71
	add	%i4,0x018,%g1
	stda	%f0,[%g1+%l3]ASI_PST8_P ! Mem[0000000010101418] = eddf916a0000005f
!	%l3 = 00000000000000ff, Mem[0000000030141410] = 00ff654e
	stba	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = ffff654e
!	Mem[0000000030041410] = ff000000, %l7 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010081408] = 1e4f13b0, %l1 = 0000000001050000
	swapa	[%i2+%o4]0x88,%l1	! %l1 = 000000001e4f13b0
!	%l2 = ffffffffffffffb0, Mem[0000000030001408] = ff000000
	stha	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = ffb00000
!	%l5 = 0000000000000075, Mem[00000000100c1421] = 90832cf2, %asi = 80
	stba	%l5,[%i3+0x021]%asi	! Mem[00000000100c1420] = 90752cf2
!	%l1 = 000000001e4f13b0, Mem[0000000010001432] = a50f26bc, %asi = 80
	stha	%l1,[%i0+0x032]%asi	! Mem[0000000010001430] = a50f13b0
!	%f19 = 8be9f1e3, Mem[0000000010141408] = fffffdcf
	sta	%f19,[%i5+0x008]%asi	! Mem[0000000010141408] = 8be9f1e3
!	%l3 = 00000000000000ff, Mem[00000000100c1400] = 00000000000051f9
	stxa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000 cffdffff, %l2 = ffffffb0, %l3 = 000000ff
	ldda	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000 00000000cffdffff

p0_label_79:
!	Mem[0000000010001438] = 9c5cea45ccffb290, %f18 = 4e650000 8be9f1e3
	ldd	[%i0+0x038],%f18	! %f18 = 9c5cea45 ccffb290
!	Mem[0000000030001400] = 7500ffce00000000, %f30 = fffffdcf 6a3f9e42
	ldda	[%i0+%g0]0x81,%f30	! %f30 = 7500ffce 00000000
!	Mem[0000000010101408] = 75070000, %l5 = 0000000000000075
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = 0000000000007507
!	Mem[0000000030081408] = 9c9f51e5199caaf3, %f10 = 321515ac 9c5f79c9
	ldda	[%i2+%o4]0x89,%f10	! %f10 = 9c9f51e5 199caaf3
!	Mem[0000000030041400] = 42000000, %l1 = 000000001e4f13b0
	lduba	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = 80495bff, %l6 = 00000000000000ff
	ldsba	[%i1+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001400] = 7500ffce 00000000, %l2 = 00000000, %l3 = cffdffff
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 000000007500ffce 0000000000000000
!	Mem[00000000201c0000] = 74ff8bc8, %l1 = 0000000000000000
	ldsba	[%o0+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[000000001010143c] = ce691cd6, %l5 = 0000000000007507
	ldsh	[%i4+0x03e],%l5		! %l5 = 0000000000001cd6
!	Starting 10 instruction Store Burst
!	%f16 = 9c5cea45 ccffb290, Mem[0000000010081410] = b0000501 00000000
	stda	%f16,[%i2+%o5]0x80	! Mem[0000000010081410] = 9c5cea45 ccffb290

p0_label_80:
!	Mem[0000000010101408] = 75070000, %l4 = 0000000000000074
	ldstuba	[%i4+%o4]0x80,%l4	! %l4 = 00000075000000ff
!	Mem[0000000010101408] = ff07000049927c04, %l4 = 0000000000000075, %l0 = 00000000cffdffff
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = ff07000049927c04
!	%l3 = 0000000000000000, Mem[0000000030181400] = 45ea5c9c
	stba	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 45ea5c00
!	%l2 = 000000007500ffce, Mem[00000000201c0000] = 74ff8bc8
	stb	%l2,[%o0+%g0]		! Mem[00000000201c0000] = ceff8bc8
!	Mem[0000000030141408] = 4e65d5ff, %l5 = 0000000000001cd6
	swapa	[%i5+%o4]0x89,%l5	! %l5 = 000000004e65d5ff
!	%l1 = ffffffffffffffff, %l5 = 000000004e65d5ff, %l6 = ffffffffffffffff
	and	%l1,%l5,%l6		! %l6 = 000000004e65d5ff
!	%f20 = 00000000, Mem[0000000010141408] = e3f1e98b
	sta	%f20,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l1 = ffffffffffffffff, Mem[0000000021800180] = cffda31a, %asi = 80
	stba	%l1,[%o3+0x180]%asi	! Mem[0000000021800180] = fffda31a
!	%f10 = 9c9f51e5, Mem[0000000030101408] = 19fc7f67
	sta	%f10,[%i4+%o4]0x81	! Mem[0000000030101408] = 9c9f51e5
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000030081400] = ffffffff ccffb290 f3aa9c19 e5519f9c
!	Mem[0000000030081410] = fffff267 ff5b4980 3f651de1 0501eaf7
!	Mem[0000000030081420] = 7ed4a2c8 66496288 5d552c47 d7fe9fcb
!	Mem[0000000030081430] = 199caaf3 c8c93bc1 e3f1e98b 9bc90232
	ldda	[%i2]ASI_BLK_SL,%f16	! Block Load from 0000000030081400

p0_label_81:
!	Mem[0000000030101410] = f9510000, %l4 = 0000000000000075
	lduba	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1438] = aaded28c, %l3 = 0000000000000000
	ldsw	[%i3+0x038],%l3		! %l3 = ffffffffaaded28c
!	Mem[0000000030001400] = 7500ffce00000000, %l4 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l4	! %l4 = 7500ffce00000000
!	Mem[0000000030001400] = 00000000 ceff0075, %l2 = 7500ffce, %l3 = aaded28c
	ldda	[%i0+%g0]0x89,%l2	! %l2 = 00000000ceff0075 0000000000000000
!	Mem[0000000010101410] = 00000000, %f8  = bc260fa5
	lda	[%i4+%o5]0x88,%f8 	! %f8 = 00000000
!	Mem[0000000030181410] = e5519f9c, %l3 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l3	! %l3 = 000000000000009c
!	Mem[0000000010181430] = 26f868011fb4c145, %l6 = 000000004e65d5ff
	ldxa	[%i6+0x030]%asi,%l6	! %l6 = 26f868011fb4c145
!	Mem[0000000030101410] = f9510000, %l2 = 00000000ceff0075
	lduha	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[000000001018143c] = 9ea27501, %l5 = 000000004e65d5ff
	lduw	[%i6+0x03c],%l5		! %l5 = 000000009ea27501
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 9ea27501, Mem[0000000010181418] = 863ae264 a5ce66e6
	std	%l4,[%i6+0x018]		! Mem[0000000010181418] = 00000000 9ea27501

p0_label_82:
!	Mem[0000000030181408] = cffdffff, %l5 = 000000009ea27501
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 000000cf000000ff
!	%f14 = 74ec8cd9 aa252d62, %l5 = 00000000000000cf
!	Mem[0000000010041420] = 0a12992439cdbd71
	add	%i1,0x020,%g1
	stda	%f14,[%g1+%l5]ASI_PST8_P ! Mem[0000000010041420] = 74ec9924aa252d62
!	%l2 = 00000000, %l3 = 0000009c, Mem[00000000100c1400] = ff000000 00000000
	stda	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 0000009c
!	%f4  = 9c5cea45, %f1  = 0000005f, %f13 = d4f136ca
	fdivs	%f4 ,%f1 ,%f13		! %l0 = ff07000049927c26, Unfinished, %fsr = 1000000400
!	%l1 = ffffffffffffffff, Mem[0000000010001408] = 00000000
	stwa	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff
!	%f4  = 9c5cea45 f225cffd, %l6 = 26f868011fb4c145
!	Mem[0000000030181420] = 97ec9bdb59ce999b
	add	%i6,0x020,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030181420] = fdcf25f259ce999b
!	%l6 = 26f868011fb4c145, Mem[0000000010081408] = 0000000001050000
	stxa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 26f868011fb4c145
!	%f4  = 9c5cea45 f225cffd, %f9  = 526e4a35
	fdtoi	%f4 ,%f9 		! %f9  = 00000000
!	Mem[000000001018143b] = dc13ea61, %l0 = ff07000049927c26
	ldstub	[%i6+0x03b],%l0		! %l0 = 00000061000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 000000dd, %l6 = 26f868011fb4c145
	ldswa	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000dd

p0_label_83:
!	Mem[0000000030001410] = 000000dd, %f9  = 00000000
	lda	[%i0+%o5]0x89,%f9 	! %f9 = 000000dd
!	Mem[0000000010141410] = d96f574146ac75ff, %l7 = 00000000ff000000
	ldxa	[%i5+%o5]0x88,%l7	! %l7 = d96f574146ac75ff
!	Mem[0000000030101408] = f9510000 e5519f9c, %l2 = 00000000, %l3 = 0000009c
	ldda	[%i4+%o4]0x89,%l2	! %l2 = 00000000e5519f9c 00000000f9510000
!	Mem[0000000010181408] = 000071ff, %l6 = 00000000000000dd
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 7500ffce, %l3 = 00000000f9510000
	ldsha	[%i0+%g0]0x81,%l3	! %l3 = 0000000000007500
!	Mem[0000000010181410] = eddf916a da474434, %l2 = e5519f9c, %l3 = 00007500
	ldda	[%i6+0x010]%asi,%l2	! %l2 = 00000000eddf916a 00000000da474434
!	Mem[0000000030141410] = ffff654e, %l2 = 00000000eddf916a
	lduba	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181410] = eddf916a, %l7 = d96f574146ac75ff
	lduwa	[%i6+%o5]0x80,%l7	! %l7 = 00000000eddf916a
!	Mem[0000000010081438] = 622d25aa 000000ff, %l2 = 000000ff, %l3 = da474434
	ldda	[%i2+0x038]%asi,%l2	! %l2 = 00000000622d25aa 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = ff005c9c, %l4 = 7500ffce00000000
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 000000ff000000ff

p0_label_84:
!	%f0  = eddf916a 0000005f 00000000 1e4f13b0
!	%f4  = 9c5cea45 f225cffd 354a6e52 a50f26bc
!	%f8  = 00000000 000000dd 9c9f51e5 199caaf3
!	%f12 = 38819bda d4f136ca 74ec8cd9 aa252d62
	stda	%f0,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400
!	%l2 = 00000000622d25aa, Mem[0000000010041408] = 80495bff
	stwa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 622d25aa
!	%l7 = 00000000eddf916a, Mem[0000000010081410] = 45ea5c9c
	stwa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = eddf916a
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010081410] = eddf916a, %l3 = 00000000000000ff
	swapa	[%i2+%o5]0x88,%l3	! %l3 = 00000000eddf916a
!	%l0 = 00000061, %l1 = ffffffff, Mem[0000000030081408] = b0134f1e 00000000
	stda	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000061 ffffffff
!	%l6 = 00000000, %l7 = eddf916a, Mem[0000000030141400] = 8be9b3ec 0000807f
	stda	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 eddf916a
!	%l2 = 00000000622d25aa, Mem[0000000010141400] = ff714e65
	stba	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = ff714eaa
!	Mem[0000000030101400] = 68000000, %l4 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 00000068000000ff
!	%l6 = 00000000, %l7 = eddf916a, Mem[0000000030141410] = 4e65ffff 56148485
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 eddf916a
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ff3dbae8, %l6 = 0000000000000000
	ldsh	[%o1+0x040],%l6		! %l6 = ffffffffffffff3d

p0_label_85:
!	Mem[00000000100c1408] = 00000075677ffc19, %f30 = 3202c99b 8be9f1e3
	ldda	[%i3+0x008]%asi,%f30	! %f30 = 00000075 677ffc19
!	Mem[0000000010141400] = aa4e71ff4e65ff00, %f22 = f7ea0105 e11d653f
	ldd	[%i5+%g0],%f22		! %f22 = aa4e71ff 4e65ff00
!	Mem[0000000010001410] = 6a3f9e42, %l7 = 00000000eddf916a
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000042
!	Mem[0000000010101400] = ff71f951, %l0 = 0000000000000061
	ldswa	[%i4+%g0]0x80,%l0	! %l0 = ffffffffff71f951
!	Mem[0000000010141408] = 00000000, %l0 = ffffffffff71f951
	lduwa	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800040] = ff3dbae8, %l3 = 00000000eddf916a
	lduba	[%o1+0x040]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = eddf916ada474434, %f30 = 00000075 677ffc19
	ldda	[%i6+%o5]0x80,%f30	! %f30 = eddf916a da474434
!	Mem[0000000030081408] = 61000000, %l1 = ffffffffffffffff
	ldsba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = dd00000000000038, %l7 = 0000000000000042
	ldxa	[%i0+%o5]0x81,%l7	! %l7 = dd00000000000038
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000030101410] = 000051f9
	stha	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ff51f9

p0_label_86:
!	Mem[00000000100c1408] = 00000075, %l5 = 00000000000000cf
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000075
!	%l2 = 622d25aa, %l3 = 000000ff, Mem[0000000010181410] = eddf916a da474434
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 622d25aa 000000ff
!	Mem[000000001014142c] = 71dfe059, %l7 = dd00000000000038, %asi = 80
	swapa	[%i5+0x02c]%asi,%l7	! %l7 = 0000000071dfe059
!	%l5 = 0000000000000075, Mem[00000000300c1400] = fffffdcf
	stba	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = fffffd75
!	Mem[00000000100c1410] = 9c9f51e5, %l3 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 0000009c000000ff
!	Mem[0000000010181400] = b0134f1e, %l3 = 000000000000009c
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 00000000b0134f1e
!	Mem[0000000010181408] = 000071ff, %l2 = 00000000622d25aa
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000000071ff
!	%l1 = 0000000000000000, Mem[0000000030041410] = 000000ff6a91dfed
	stxa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000000000
!	%l2 = 00000000000071ff, Mem[0000000030041410] = 00000000
	stba	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 3d000000, %l7 = 0000000071dfe059
	ldsba	[%i0+%g0]0x80,%l7	! %l7 = 000000000000003d

p0_label_87:
!	Mem[0000000030081410] = f225cffd, %l2 = 00000000000071ff
	lduwa	[%i2+%o5]0x89,%l2	! %l2 = 00000000f225cffd
!	Mem[0000000021800000] = 5bff8cec, %l7 = 000000000000003d
	lduh	[%o3+%g0],%l7		! %l7 = 0000000000005bff
!	Mem[0000000010101410] = 00000000, %l3 = 00000000b0134f1e
	ldsha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = aa252d62, %l7 = 0000000000005bff
	lduwa	[%i6+%o5]0x88,%l7	! %l7 = 00000000aa252d62
!	Mem[0000000010041408] = 15cf41b8622d25aa, %l2 = 00000000f225cffd
	ldxa	[%i1+%o4]0x88,%l2	! %l2 = 15cf41b8622d25aa
!	Mem[000000001000142c] = 45ff225b, %l7 = 00000000aa252d62
	ldswa	[%i0+0x02c]%asi,%l7	! %l7 = 0000000045ff225b
!	Mem[0000000010001410] = 000051f9 6a3f9e42, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 000000006a3f9e42 00000000000051f9
!	Mem[0000000030041408] = 0000f8dd, %l2 = 15cf41b8622d25aa
	lduba	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000dd
!	Mem[0000000010041410] = b0134f1e000000ff, %f2  = 00000000 1e4f13b0
	ldda	[%i1+%o5]0x88,%f2 	! %f2  = b0134f1e 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = aa252d62, %l6 = ffffffffffffff3d
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 00000062000000ff

p0_label_88:
!	%l3 = 0000000000000000, %l6 = 0000000000000062, %l7 = 0000000045ff225b
	or	%l3,%l6,%l7		! %l7 = 0000000000000062
!	Code Fragment 4
p0_fragment_12:
!	%l0 = 000000006a3f9e42
	setx	0xfdeb30f8677eada0,%g7,%l0 ! %l0 = fdeb30f8677eada0
!	%l1 = 00000000000051f9
	setx	0xeec739efc36d228e,%g7,%l1 ! %l1 = eec739efc36d228e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fdeb30f8677eada0
	setx	0x1be5cce8486baf54,%g7,%l0 ! %l0 = 1be5cce8486baf54
!	%l1 = eec739efc36d228e
	setx	0x931e0ef7fd9fc83f,%g7,%l1 ! %l1 = 931e0ef7fd9fc83f
!	%f20 = 80495bff, Mem[0000000010181420] = 96b53316
	st	%f20,[%i6+0x020]	! Mem[0000000010181420] = 80495bff
!	%f4  = 9c5cea45 f225cffd, Mem[0000000010141408] = 00000000 01050000
	stda	%f4 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 9c5cea45 f225cffd
!	Mem[0000000010181404] = 75000000, %l4 = 0000000000000068, %asi = 80
	swapa	[%i6+0x004]%asi,%l4	! %l4 = 0000000075000000
!	Mem[0000000030101400] = ff000000, %l0 = 1be5cce8486baf54
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	%f26 = cb9ffed7, %f24 = 88624966
	fcmps	%fcc1,%f26,%f24		! %fcc1 = 1
!	%f28 = c13bc9c8 f3aa9c19, Mem[0000000010141410] = ff75ac46 41576fd9
	stda	%f28,[%i5+%o5]0x80	! Mem[0000000010141410] = c13bc9c8 f3aa9c19
!	Mem[0000000010141410] = c13bc9c8, %l6 = 0000000000000062
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 000000c1000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ff3dbae8, %l3 = 0000000000000000
	ldsh	[%o1+0x040],%l3		! %l3 = ffffffffffffff3d

p0_label_89:
!	Mem[000000001004141c] = 00000000, %l2 = 00000000000000dd
	ldsh	[%i1+0x01c],%l2		! %l2 = 0000000000000000
!	Mem[0000000010141410] = ff3bc9c8, %f14 = 74ec8cd9
	lda	[%i5+%o5]0x80,%f14	! %f14 = ff3bc9c8
!	Mem[0000000010181400] = 680000000000009c, %l6 = 00000000000000c1
	ldxa	[%i6+%g0]0x88,%l6	! %l6 = 680000000000009c
!	Mem[0000000010101410] = 00000000, %l4 = 0000000075000000
	ldsba	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[000000001010142c] = 00000000, %l7 = 0000000000000062
	ldswa	[%i4+0x02c]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = ff000000, %l0 = 00000000000000ff
	lduwa	[%i1+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000020800040] = ff3dbae8, %l3 = ffffffffffffff3d
	lduba	[%o1+0x041]%asi,%l3	! %l3 = 000000000000003d
!	Mem[0000000010101410] = 00000000, %l0 = 00000000ff000000
	lduha	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 9c9f51e501050000, %l1 = 931e0ef7fd9fc83f
	ldxa	[%i6+%o5]0x81,%l1	! %l1 = 9c9f51e501050000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000075, Mem[0000000030181410] = 9c9f51e5
	stba	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 759f51e5

p0_label_90:
!	Mem[0000000030081408] = 00000061, %l6 = 680000000000009c
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000061
!	%f22 = aa4e71ff, %f1  = 0000005f
	fcmpes	%fcc3,%f22,%f1 		! %fcc3 = 1
!	Mem[0000000010001400] = 0000003d, %l2 = 0000000000000000
	ldsba	[%i0+%g0]0x88,%l2	! %l2 = 000000000000003d
!	%f20 = 80495bff 67f2ffff, %l2 = 000000000000003d
!	Mem[0000000010141410] = ff3bc9c8f3aa9c19
	add	%i5,0x010,%g1
	stda	%f20,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010141410] = fffff267f3aa9c19
!	%l3 = 000000000000003d, Mem[0000000030141400] = 00000000
	stwa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000003d
!	%l3 = 000000000000003d, Mem[0000000010041410] = ff000000
	stba	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 3d000000
!	%l3 = 000000000000003d, Mem[0000000010001408] = ffffffff
	stha	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = ffff003d
!	%l2 = 000000000000003d, Mem[0000000030181408] = fffdffff
	stwa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000003d
!	%l2 = 0000003d, %l3 = 0000003d, Mem[0000000030101400] = ff000000 bf8ff951
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000003d 0000003d
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = 00ead975, %l6 = 0000000000000061
	ldsw	[%i4+0x020],%l6		! %l6 = 0000000000ead975

p0_label_91:
!	Mem[00000000100c1400] = 000000000000009c, %l0 = 0000000000000000
	ldx	[%i3+%g0],%l0		! %l0 = 000000000000009c
!	Mem[0000000010081408] = 1fb4c145, %l1 = 9c9f51e501050000
	ldsha	[%i2+%o4]0x88,%l1	! %l1 = ffffffffffffc145
!	Mem[0000000010001408] = 3d00ffffeddf916a, %l4 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l4	! %l4 = 3d00ffffeddf916a
!	Mem[0000000010101400] = ff71f951 ff000000 ff070000 49927c04
!	Mem[0000000010101410] = 00000000 cffdffff eddf916a 0000005f
!	Mem[0000000010101420] = 00ead975 000045aa a963cf70 00000000
!	Mem[0000000010101430] = 2c50a665 fffffc81 571a294a ce691cd6
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Mem[0000000030181400] = 45ea5c00, %l7 = 0000000000000000
	lduba	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = ddf80000, %l0 = 000000000000009c
	ldsba	[%i1+%o4]0x81,%l0	! %l0 = ffffffffffffffdd
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000030081400] = 5f000000 6a91dfed 0000009c ffffffff
!	Mem[0000000030081410] = fdcf25f2 45ea5c9c bc260fa5 526e4a35
!	Mem[0000000030081420] = dd000000 00000000 f3aa9c19 e5519f9c
!	Mem[0000000030081430] = ca36f1d4 da9b8138 622d25aa d98cec74
	ldda	[%i2]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030081400
!	Mem[00000000300c1408] = 4a291a57, %l6 = 0000000000ead975
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000057
!	Mem[0000000030101408] = 9c9f51e5, %l2 = 000000000000003d
	lduwa	[%i4+%o4]0x81,%l2	! %l2 = 000000009c9f51e5
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = c7ff9864, %l0 = ffffffffffffffdd
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 000000ff000000ff

p0_label_92:
!	%l1 = ffffffffffffc145, Mem[0000000010001410] = 429e3f6af9510000
	stxa	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffffffffc145
!	Mem[00000000201c0001] = ceff8bc8, %l2 = 000000009c9f51e5
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000010081400] = 9c5cea45
	sth	%l2,[%i2+%g0]		! Mem[0000000010081400] = 00ffea45
!	%l1 = ffffffffffffc145, Mem[0000000010081406] = 66496288
	sth	%l1,[%i2+0x006]		! Mem[0000000010081404] = 6649c145
!	Mem[0000000010181410] = aa252d62, %l0 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 00000062000000ff
!	%l7 = 0000000000000000, Mem[0000000030041408] = ddf80000
	stba	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 00f80000
!	Mem[0000000021800041] = c871564a, %l3 = 000000000000003d
	ldstuba	[%o3+0x041]%asi,%l3	! %l3 = 00000071000000ff
!	Mem[0000000030041408] = 0000f800, %l1 = ffffffffffffc145
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081420] = 354a6e52, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x020]%asi,%l2	! %l2 = 00000000354a6e52
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 3d00ffffeddf916a, %f26 = cb9ffed7 472c555d
	ldda	[%i0+%o4]0x80,%f26	! %f26 = 3d00ffff eddf916a

p0_label_93:
!	Mem[0000000010181424] = 00000000, %l6 = 0000000000000057
	ldsba	[%i6+0x025]%asi,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000075, Mem[0000000030101410] = 00ff51f96a3f9e42
	stxa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000075
!	Mem[0000000010181410] = aa252dff, %f19 = 199caaf3
	lda	[%i6+%o5]0x88,%f19	! %f19 = aa252dff
!	Mem[0000000020800000] = c7ff23dd, %l2 = 00000000354a6e52
	lduba	[%o1+0x000]%asi,%l2	! %l2 = 00000000000000c7
!	Mem[0000000010001430] = a50f13b0 67f2ffff, %l6 = 00000000, %l7 = 00000000
	ldd	[%i0+0x030],%l6		! %l6 = 00000000a50f13b0 0000000067f2ffff
!	Mem[0000000010001400] = 0000003d, %l3 = 0000000000000071
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 0000003d000000ff
!	Mem[00000000211c0000] = c7ff9864, %l5 = 0000000000000075
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 000000000000c7ff
!	Mem[0000000030001400] = ceff0075, %l6 = 00000000a50f13b0
	lduba	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000075
!	Mem[0000000010181400] = 0000009c, %l2 = 00000000000000c7
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 000000000000009c
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 9c5c00ff, %l1 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 000000009c5c00ff

p0_label_94:
	membar	#Sync			! Added by membar checker (17)
!	%l1 = 000000009c5c00ff, Mem[0000000030081400] = 0000005f
	stba	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	%l3 = 000000000000003d, Mem[0000000010081408] = 1fb4c145
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 1fb4c13d
!	%f14 = 74ec8cd9, Mem[0000000030101408] = 9c9f51e5
	sta	%f14,[%i4+%o4]0x81	! Mem[0000000030101408] = 74ec8cd9
!	%l1 = 000000009c5c00ff, Mem[0000000030081400] = ff0000006a91dfed
	stxa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000009c5c00ff
!	Mem[0000000030181410] = e5519f75, %l6 = 0000000000000075
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 00000000e5519f75
!	%l0 = 00000062, %l1 = 9c5c00ff, Mem[0000000010181410] = ff2d25aa 000000ff
	stda	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000062 9c5c00ff
!	%f26 = 3d00ffff eddf916a, Mem[0000000030181410] = 75000000 01050000
	stda	%f26,[%i6+%o5]0x81	! Mem[0000000030181410] = 3d00ffff eddf916a
!	%l1 = 000000009c5c00ff, Mem[0000000030101400] = 3d000000
	stha	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 3d0000ff
!	%f10 = 9c9f51e5 199caaf3, Mem[0000000030141408] = d61c0000 4e65d5cc
	stda	%f10,[%i5+%o4]0x81	! Mem[0000000030141408] = 9c9f51e5 199caaf3
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = f225cffd, %l5 = 000000000000c7ff
	ldsha	[%i2+%o5]0x89,%l5	! %l5 = ffffffffffffcffd

p0_label_95:
!	Mem[00000000300c1408] = 571a294a, %l1 = 000000009c5c00ff
	lduha	[%i3+%o4]0x81,%l1	! %l1 = 000000000000571a
!	Mem[0000000010081410] = ff000000, %l4 = 3d00ffffeddf916a
	ldsb	[%i2+0x013],%l4		! %l4 = 0000000000000000
!	Mem[0000000010181404] = 00000068, %l5 = ffffffffffffcffd
	ldsh	[%i6+0x004],%l5		! %l5 = 0000000000000000
!	Mem[0000000010001400] = ff000000 00000000 3d00ffff eddf916a
!	Mem[0000000010001410] = ffffffff ffffc145 00000501 e5519f9c
!	Mem[0000000010001420] = d0ec17a6 7181c0b2 15cf41b8 45ff225b
!	Mem[0000000010001430] = a50f13b0 67f2ffff 9c5cea45 ccffb290
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[00000000100c1400] = 00000000, %l6 = 00000000e5519f75
	ldsha	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%f3  = 9c000000, %f15 = aa252d62, %f15 = aa252d62
	fadds	%f3 ,%f15,%f15		! %f15 = aa252d62
!	Mem[0000000010181410] = 00000062, %l1 = 000000000000571a
	ldsba	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101430] = 2c50a665fffffc81, %l0 = 0000000000000062
	ldxa	[%i4+0x030]%asi,%l0	! %l0 = 2c50a665fffffc81
!	Mem[0000000010181410] = 00000062, %l5 = 0000000000000000
	ldswa	[%i6+%o5]0x80,%l5	! %l5 = 0000000000000062
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = ceff0075, %l2 = 000000000000009c
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 00000075000000ff

p0_label_96:
!	%f12 = 38819bda, Mem[0000000010041408] = aa252d62
	sta	%f12,[%i1+%o4]0x80	! Mem[0000000010041408] = 38819bda
!	%f14 = 74ec8cd9 aa252d62, Mem[00000000100c1410] = ff9f51e5 2df395c3
	stda	%f14,[%i3+0x010]%asi	! Mem[00000000100c1410] = 74ec8cd9 aa252d62
!	Mem[0000000010101418] = eddf916a, %l1 = 0000000000000000, %asi = 80
	swapa	[%i4+0x018]%asi,%l1	! %l1 = 00000000eddf916a
!	%f0  = eddf916a 0000005f, Mem[0000000010081400] = 00ffea45 6649c145
	stda	%f0 ,[%i2+%g0]0x80	! Mem[0000000010081400] = eddf916a 0000005f
!	%l0 = fffffc81, %l1 = eddf916a, Mem[0000000030141408] = 9c9f51e5 199caaf3
	stda	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = fffffc81 eddf916a
!	%f2  = ffffffff 9c000000, %l3 = 000000000000003d
!	Mem[0000000030181410] = 3d00ffffeddf916a
	add	%i6,0x010,%g1
	stda	%f2,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030181410] = 0000ffffffffffff
!	Mem[0000000030081408] = 9c000000, %l0 = 2c50a665fffffc81
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000201c0001] = ceff8bc8, %l5 = 0000000000000062
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010101438] = 571a294a, %l0 = 0000000000000000
	ldstuba	[%i4+0x038]%asi,%l0	! %l0 = 00000057000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ff3dbae8, %l3 = 000000000000003d
	ldsha	[%o1+0x040]%asi,%l3	! %l3 = ffffffffffffff3d

p0_label_97:
!	Randomly selected nop
	nop
!	Mem[0000000030001408] = ffb00000, %f13 = d4f136ca
	lda	[%i0+%o4]0x81,%f13	! %f13 = ffb00000
!	Mem[000000001010140c] = 49927c04, %f14 = 74ec8cd9
	lda	[%i4+0x00c]%asi,%f14	! %f14 = 49927c04
!	Mem[0000000020800000] = c7ff23dd, %l1 = 00000000eddf916a
	ldub	[%o1+%g0],%l1		! %l1 = 00000000000000c7
!	Mem[0000000010001400] = ff000000, %l0 = 0000000000000057
	ldswa	[%i0+%g0]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010181400] = 680000000000009c, %l1 = 00000000000000c7
	ldxa	[%i6+%g0]0x88,%l1	! %l1 = 680000000000009c
!	Mem[00000000100c140c] = 677ffc19, %l4 = 0000000000000000
	ldsba	[%i3+0x00f]%asi,%l4	! %l4 = 0000000000000019
!	Mem[0000000030041410] = ff00000000000000, %f2  = ffffffff 9c000000
	ldda	[%i1+%o5]0x81,%f2 	! %f2  = ff000000 00000000
!	Mem[0000000030141410] = eddf916a00000000, %f12 = 38819bda ffb00000
	ldda	[%i5+%o5]0x89,%f12	! %f12 = eddf916a 00000000
!	Starting 10 instruction Store Burst
!	%l1 = 680000000000009c, Mem[0000000010041408] = da9b8138
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = da9b009c

p0_label_98:
!	%f14 = 49927c04 aa252d62, Mem[0000000010181410] = 62000000 ff005c9c
	stda	%f14,[%i6+%o5]0x88	! Mem[0000000010181410] = 49927c04 aa252d62
!	%l3 = ffffffffffffff3d, Mem[0000000010081410] = ff000000
	stha	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = ff3d0000
!	Mem[0000000010101414] = cffdffff, %l7 = 0000000067f2ffff
	swap	[%i4+0x014],%l7		! %l7 = 00000000cffdffff
!	Mem[0000000020800041] = ff3dbae8, %l0 = ffffffffff000000
	ldstub	[%o1+0x041],%l0		! %l0 = 0000003d000000ff
!	Mem[0000000020800040] = ffffbae8, %l6 = 0000000000000000
	ldstub	[%o1+0x040],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000010181420] = 80495bff, %l7 = 00000000cffdffff
	swap	[%i6+0x020],%l7		! %l7 = 0000000080495bff
!	Mem[0000000030141408] = fffffc81, %l7 = 0000000080495bff
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[000000001018142a] = 3a7a541f, %l3 = ffffffffffffff3d
	ldstub	[%i6+0x02a],%l3		! %l3 = 00000054000000ff
!	Mem[0000000030101410] = 00000000, %l1 = 680000000000009c
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101430] = 2c50a665, %l1 = 0000000000000000
	ldsb	[%i4+0x032],%l1		! %l1 = ffffffffffffffa6

p0_label_99:
!	Mem[0000000010001430] = a50f13b067f2ffff, %f22 = 00000501 e5519f9c
	ldd	[%i0+0x030],%f22	! %f22 = a50f13b0 67f2ffff
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010181400] = 9c000000 00000068 ff2d25aa 354a6e52
!	Mem[0000000010181410] = 622d25aa 047c9249 00000000 9ea27501
!	Mem[0000000010181420] = cffdffff 00000000 3a7aff1f 88a9ec49
!	Mem[0000000010181430] = 26f86801 1fb4c145 dc13eaff 9ea27501
	ldda	[%i6]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Mem[0000000010041410] = 3d000000, %l0 = 000000000000003d
	ldswa	[%i1+%o5]0x80,%l0	! %l0 = 000000003d000000
!	Mem[00000000300c1410] = 75000000 00000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i3+%o5]0x81,%l6	! %l6 = 0000000075000000 0000000000000000
!	Mem[00000000300c1400] = fffffd75, %l7 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000075
!	Mem[0000000030101408] = 74ec8cd9, %l7 = 0000000000000075
	ldsha	[%i4+%o4]0x81,%l7	! %l7 = 00000000000074ec
!	Mem[0000000010041400] = 00000000, %l3 = 0000000000000054
	lduwa	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%l5 = 00000000000000ff, imm = 0000000000000141, %l1 = ffffffffffffffa6
	andn	%l5,0x141,%l1		! %l1 = 00000000000000be
!	Mem[0000000030181408] = 3d000000, %l4 = 0000000000000019
	lduba	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000075, Mem[0000000030181400] = 005cea45
	stha	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 0075ea45

p0_label_100:
!	%l0 = 3d000000, %l1 = 000000be, Mem[0000000030181408] = 0000003d 01050000
	stda	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 3d000000 000000be
!	%l0 = 000000003d000000, Mem[0000000010101400] = 51f971ff
	stwa	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 3d000000
!	Mem[0000000010141400] = ff714eaa, %l5 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l5	! %l5 = 000000aa000000ff
!	Mem[0000000010141400] = ff714eff, %l4 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l4	! %l4 = 00000000ff714eff
!	%f7  = a50f26bc, Mem[0000000010101400] = 3d000000
	sta	%f7 ,[%i4+%g0]0x88	! Mem[0000000010101400] = a50f26bc
!	%f16 = 9c000000 00000068 ff2d25aa 354a6e52
!	%f20 = 622d25aa 047c9249 00000000 9ea27501
!	%f24 = cffdffff 00000000 3a7aff1f 88a9ec49
!	%f28 = 26f86801 1fb4c145 dc13eaff 9ea27501
	stda	%f16,[%i3]ASI_BLK_AIUPL	! Block Store to 00000000100c1400
!	%l1 = 00000000000000be, Mem[0000000010081428] = c9795f9c, %asi = 80
	stha	%l1,[%i2+0x028]%asi	! Mem[0000000010081428] = 00be5f9c
!	%f12 = eddf916a 00000000, %l7 = 00000000000074ec
!	Mem[0000000010001420] = d0ec17a67181c0b2
	add	%i0,0x020,%g1
	stda	%f12,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010001420] = d0ec17a67181c0b2
!	%l0 = 000000003d000000, Mem[0000000010081408] = 1fb4c13d
	stwa	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 3d000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 000007ff, %l5 = 00000000000000aa
	ldsha	[%i4+%o4]0x88,%l5	! %l5 = 00000000000007ff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	sub	%l4,0xd2a,%l1
	nop
	mulx	%l1,%l0,%l4
	nop
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0

1:	membar	#Sync			! Force all stores to complete


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000003d000000
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000000000be
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000075
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000ff714eff
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000007ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000075000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000000074ec
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x38cddf69,%g2
	rd	%y,%g3
	cmp	%g2,%g3
	bne,a	p0_failed
	mov	0x111,%g1

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be eddf916a 0000005f
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ff000000 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 9c5cea45 f225cffd
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 354a6e52 a50f26bc
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 000000dd
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 9c9f51e5 199caaf3
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be eddf916a 00000000
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 49927c04 aa252d62
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 9c000000 00000068
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ff2d25aa 354a6e52
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 622d25aa 047c9249
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 9ea27501
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be cffdffff 00000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 3a7aff1f 88a9ec49
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 26f86801 1fb4c145
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be dc13eaff 9ea27501
	bne	%xcc,p0_f30_fail
	nop

!	The test for processor 0 has passed

p0_passed:
	ta	GOOD_TRAP
	nop

p0_reg_l0_fail:
	or	%g0,0xbd0,%g1
	ba,a	p0_failed
p0_reg_l1_fail:
	or	%g0,0xbd1,%g1
	ba,a	p0_failed
p0_reg_l2_fail:
	or	%g0,0xbd2,%g1
	ba,a	p0_failed
p0_reg_l3_fail:
	or	%g0,0xbd3,%g1
	ba,a	p0_failed
p0_reg_l4_fail:
	or	%g0,0xbd4,%g1
	ba,a	p0_failed
p0_reg_l5_fail:
	or	%g0,0xbd5,%g1
	ba,a	p0_failed
p0_reg_l6_fail:
	or	%g0,0xbd6,%g1
	ba,a	p0_failed
p0_reg_l7_fail:
	or	%g0,0xbd7,%g1
	ba,a	p0_failed
p0_f0_fail:
	set	p0_temp,%g6
	mov	0xf00,%l0
	stx	%l0,[%g6]
	std	%f0,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f2_fail:
	set	p0_temp,%g6
	mov	0xf02,%l0
	stx	%l0,[%g6]
	std	%f2,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f4_fail:
	set	p0_temp,%g6
	mov	0xf04,%l0
	stx	%l0,[%g6]
	std	%f4,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f6_fail:
	set	p0_temp,%g6
	mov	0xf06,%l0
	stx	%l0,[%g6]
	std	%f6,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f8_fail:
	set	p0_temp,%g6
	mov	0xf08,%l0
	stx	%l0,[%g6]
	std	%f8,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f10_fail:
	set	p0_temp,%g6
	mov	0xf10,%l0
	stx	%l0,[%g6]
	std	%f10,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f12_fail:
	set	p0_temp,%g6
	mov	0xf12,%l0
	stx	%l0,[%g6]
	std	%f12,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f14_fail:
	set	p0_temp,%g6
	mov	0xf14,%l0
	stx	%l0,[%g6]
	std	%f14,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f16_fail:
	set	p0_temp,%g6
	mov	0xf16,%l0
	stx	%l0,[%g6]
	std	%f16,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f18_fail:
	set	p0_temp,%g6
	mov	0xf18,%l0
	stx	%l0,[%g6]
	std	%f18,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f20_fail:
	set	p0_temp,%g6
	mov	0xf20,%l0
	stx	%l0,[%g6]
	std	%f20,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f22_fail:
	set	p0_temp,%g6
	mov	0xf22,%l0
	stx	%l0,[%g6]
	std	%f22,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f24_fail:
	set	p0_temp,%g6
	mov	0xf24,%l0
	stx	%l0,[%g6]
	std	%f24,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f26_fail:
	set	p0_temp,%g6
	mov	0xf26,%l0
	stx	%l0,[%g6]
	std	%f26,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f28_fail:
	set	p0_temp,%g6
	mov	0xf28,%l0
	stx	%l0,[%g6]
	std	%f28,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP

p0_f30_fail:
	set	p0_temp,%g6
	mov	0xf30,%l0
	stx	%l0,[%g6]
	std	%f30,[%g6+8]
	stx	%fsr,[%g6+16]
	ta	BAD_TRAP


!	The test for processor 0 failed

p0_failed:
	set	p0_temp,%g6
	stx	%g1,[%g6]
	stx	%g2,[%g6+8]
	stx	%g3,[%g6+16]
	stx	%fsr,[%g6+24]
	ta	BAD_TRAP


!	The local area data for processor 0 failed

p0_local_failed:
	set	done_flags,%g5
	mov	3,%g6
	st	%g6,[%g5+0x000]		! Set processor 0 done flag

	set	p0_temp,%g6
	add	%g1,%g4,%g1
	stx	%g4,[%g6]
	stx	%g2,[%g6+8]
	stx	%g3,[%g6+16]
	st	%fsr,[%g6+24]
	ta	BAD_TRAP

p0_selfmod_failed:
	ba	p0_failed
	mov	0xabc,%g1

p0_branch_failed:
	mov	0xbbb,%g1
	rd	%ccr,%g2
	ba	p0_failed
	mov	0x0,%g3

p0_trap1e:
	and	%l7,%l1,%l2
	orn	%l7,%l3,%l6
	fcmps	%fcc3,%f12,%f0 
	fstoi	%f5 ,%f9 
	done

p0_trap1o:
	and	%l7,%l1,%l2
	orn	%l7,%l3,%l6
	fcmps	%fcc3,%f12,%f0 
	fstoi	%f5 ,%f9 
	done


p0_trap2e:
	fdivs	%f6 ,%f3 ,%f15
	swapa	[%i1+%o4]ASI_AS_IF_USER_PRIMARY,%l2	! Mem[0000000010041408]
	sdivx	%l2,%l7,%l0
	or	%l7,0x7b2,%l2
	fitos	%f14,%f2 
	ldsha	[%i3+%o4]ASI_AS_IF_USER_PRIMARY,%l3	! Mem[00000000100c1408]
	sdivx	%l2,-0x9fe,%l5
	done

p0_trap2o:
	fdivs	%f6 ,%f3 ,%f15
	swapa	[%o1+%i4]ASI_AS_IF_USER_PRIMARY,%l2	! Mem[0000000010041408]
	sdivx	%l2,%l7,%l0
	or	%l7,0x7b2,%l2
	fitos	%f14,%f2 
	ldsha	[%o3+%i4]ASI_AS_IF_USER_PRIMARY,%l3	! Mem[00000000100c1408]
	sdivx	%l2,-0x9fe,%l5
	done


p0_trap3e:
	and	%l2,0x86f,%l4
	xnor	%l6,%l4,%l6
	or	%l7,%l1,%l5
	sub	%l0,0xd25,%l4
	andn	%l6,-0x507,%l2
	xnor	%l2,-0xe6c,%l7
	xor	%l3,0x3be,%l6
	done

p0_trap3o:
	and	%l2,0x86f,%l4
	xnor	%l6,%l4,%l6
	or	%l7,%l1,%l5
	sub	%l0,0xd25,%l4
	andn	%l6,-0x507,%l2
	xnor	%l2,-0xe6c,%l7
	xor	%l3,0x3be,%l6
	done

!	Cross Processor Interrupt Handler

cross_intr_handler:
	membar	#Sync
!	Identify the recipient of the interrupt
	mov	0x10,%g1		! VA of Core ID Register
	ldxa	[%g1]ASI_CMP_CORE_ID,%g1
	and	%g1,0x3f,%g4		! Extract Core ID in %g4
	sll	%g4,2,%g1		! Index into intr receive array
	set	received_xintr,%g2	! Pointer to receive counters
	lduw	[%g2+%g1],%g3		! Get receive count
	inc	%g3			! Incement by 1
	st	%g3,[%g2+%g1]		! Update receive count
!	Reset busy bit interrupts and return
	mov	0x40,%g1		! Busy bit
	stxa	%g1,[%g0]ASI_INTR_RECEIVE ! Clear the busy bit
	membar	#Sync
	retry

inst_access_handler:
	done 

	.align	256
data_access_handler:
1:	done

p0_init_memory_pointers:
	set	p0_init_registers,%g1
	mov	%g0,%g2
	mov	%g0,%g3
	mov	%g0,%g4
	mov	%g0,%g5
	mov	%g0,%g6
	mov	%g0,%g7

!	Initialize memory pointers for window 0
	set	p0_local0_start,%i0
	set	p0_local1_start,%i1
	set	p0_local2_start,%i2
	set	p0_local3_start,%i3
	set	p0_local4_start,%i4
	set	p0_local5_start,%i5
	set	p0_local6_start,%i6
	clr	%i7
!	Init Local Registers in Window 0
	ldx	[%g1+0x000],%l0		! %l0 = 90e12fcc64604c25
	ldx	[%g1+0x008],%l1		! %l1 = eaa74409cb915f4a
	ldx	[%g1+0x010],%l2		! %l2 = 889d2cce6da35ce9
	ldx	[%g1+0x018],%l3		! %l3 = 732cc952cab64aaf
	ldx	[%g1+0x020],%l4		! %l4 = d45d517c18498752
	ldx	[%g1+0x028],%l5		! %l5 = bfe37e63a963cf70
	ldx	[%g1+0x030],%l6		! %l6 = ddf155a5cd2185ba
	ldx	[%g1+0x038],%l7		! %l7 = 74c4cbaa6fc77c9c

!	Initialize the output register of window 0

	set	share0_start,%o0
	set	share1_start,%o1
	set	share2_start,%o2
	set	share3_start,%o3
	mov	0x08,%o4
	mov	0x10,%o5
	mov	0x18,%o6

	retl
	nop

user_text_end:
	.seg	"text"
	.align	0x2000
user_near0_start:
p0_near_0_le:
	fadds	%f10,%f9 ,%f9 
	fdivs	%f14,%f11,%f2 
	or	%l0,0x9ad,%l3
	orn	%l1,-0xe76,%l4
	swap	[%i6+0x038],%l6		! Mem[0000000010181438]
	orn	%l0,%l3,%l7
	jmpl	%o7,%g0
	smul	%l2,-0x99f,%l2
p0_near_0_he:
	orn	%l0,%l4,%l3
	and	%l2,0x86f,%l4
	fdtos	%f18,%f17
	fsqrts	%f28,%f23
	jmpl	%o7,%g0
	fadds	%f29,%f17,%f31
near0_b2b_h:
	xnor	%l4,%l0,%l5
	jmpl	%o7,%g0
	fsqrts	%f19,%f24
near0_b2b_l:
	andn	%l6,%l1,%l2
	jmpl	%o7,%g0
	andn	%l0,0x9c2,%l0
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	addc	%l4,%l0,%l7
	fstoi	%f14,%f10
	fsqrts	%f2 ,%f10
	and	%l5,%l5,%l5
	fcmps	%fcc2,%f1 ,%f9 
	andn	%l0,%l1,%l6
	xnor	%l6,-0xdc2,%l7
	jmpl	%o7,%g0
	umul	%l3,%l3,%l5
p0_near_1_he:
	fsubs	%f26,%f31,%f21
	fdivs	%f20,%f29,%f18
	fmuls	%f27,%f18,%f19
	std	%l0,[%i0+0x038]		! Mem[0000000010001438]
	fsubs	%f24,%f21,%f24
	jmpl	%o7,%g0
	or	%l3,0x8fc,%l1
near1_b2b_h:
	fdivs	%f24,%f31,%f20
	fcmps	%fcc2,%f19,%f20
	xor	%l0,0xff8,%l6
	jmpl	%o7,%g0
	orn	%l6,0x67c,%l2
near1_b2b_l:
	addc	%l5,-0x25d,%l2
	xnor	%l1,%l4,%l4
	xor	%l1,%l7,%l6
	jmpl	%o7,%g0
	fcmps	%fcc0,%f6 ,%f9 
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	jmpl	%o7,%g0
	andn	%l3,%l5,%l4
	jmpl	%o7,%g0
	nop
p0_near_2_he:
	fsqrts	%f22,%f28
	fsubs	%f20,%f25,%f17
	or	%l2,0xc36,%l1
	xnor	%l3,0xe08,%l5
	jmpl	%o7,%g0
	sub	%l4,-0xf16,%l7
near2_b2b_h:
	add	%l2,-0x522,%l2
	and	%l5,%l6,%l4
	andn	%l4,0x963,%l7
	smul	%l1,%l0,%l7
	mulx	%l5,%l6,%l3
	jmpl	%o7,%g0
	add	%l7,-0xde4,%l1
near2_b2b_l:
	mulx	%l2,%l2,%l6
	fitos	%f10,%f9 
	subc	%l5,0x8ba,%l2
	addc	%l6,%l0,%l2
	sdivx	%l6,0x14f,%l6
	jmpl	%o7,%g0
	add	%l5,-0x2db,%l6
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	fsubs	%f5 ,%f9 ,%f5 
	fsubs	%f13,%f4 ,%f4 
	jmpl	%o7,%g0
	smul	%l1,0xf22,%l7
p0_near_3_he:
	xnor	%l6,%l6,%l0
	fcmps	%fcc0,%f18,%f29
	fsubs	%f20,%f28,%f17
	fmuls	%f26,%f17,%f19
	mulx	%l3,%l1,%l6
	fcmps	%fcc2,%f19,%f16
	jmpl	%o7,%g0
	andn	%l3,%l5,%l4
near3_b2b_h:
	fcmps	%fcc0,%f22,%f24
	add	%l6,0x954,%l6
	fsqrts	%f25,%f16
	jmpl	%o7,%g0
	fdivs	%f19,%f22,%f27
near3_b2b_l:
	xor	%l5,%l4,%l6
	or	%l1,0xdc9,%l5
	sub	%l7,0x036,%l1
	jmpl	%o7,%g0
	fcmps	%fcc2,%f15,%f13
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	smul	%l1,%l4,%l6
	std	%l4,[%i4+0x028]		! Mem[0000000010101428]
	lduh	[%i5+0x02e],%l3		! Mem[000000001014142e]
	fmuls	%f11,%f6 ,%f9 
	jmpl	%o7,%g0
	stb	%l7,[%i0+0x023]		! Mem[0000000010001423]
p0_far_0_lem:
	smul	%l1,%l4,%l6
	membar	#Sync
	std	%l4,[%i4+0x028]		! Mem[0000000010101428]
	lduh	[%i5+0x02e],%l3		! Mem[000000001014142e]
	fmuls	%f11,%f6 ,%f9 
	membar	#Sync
	jmpl	%o7,%g0
	stb	%l7,[%i0+0x023]		! Mem[0000000010001423]
p0_far_0_he:
	andn	%l6,%l0,%l6
	fmuls	%f18,%f17,%f18
	fitod	%f29,%f24
	add	%l2,-0xc0b,%l7
	udivx	%l4,0x283,%l2
	xnor	%l4,%l6,%l3
	fmuls	%f27,%f26,%f19
	jmpl	%o7,%g0
	stb	%l5,[%i3+0x023]		! Mem[00000000100c1423]
p0_far_0_hem:
	andn	%l6,%l0,%l6
	fmuls	%f18,%f17,%f18
	fitod	%f29,%f24
	add	%l2,-0xc0b,%l7
	udivx	%l4,0x283,%l2
	xnor	%l4,%l6,%l3
	fmuls	%f27,%f26,%f19
	membar	#Sync
	jmpl	%o7,%g0
	stb	%l5,[%i3+0x023]		! Mem[00000000100c1423]
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	or	%l4,%l7,%l0
	jmpl	%o7,%g0
	xnor	%l7,%l2,%l2
far0_b2b_l:
	add	%l2,%l6,%l0
	jmpl	%o7,%g0
	subc	%l1,0x694,%l7
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fdivs	%f0 ,%f2 ,%f9 
	udivx	%l0,%l4,%l5
	fdivs	%f15,%f10,%f15
	or	%l2,-0x5e8,%l7
	udivx	%l5,-0x54c,%l6
	smul	%l4,%l1,%l3
	andn	%l5,%l5,%l5
	jmpl	%o7,%g0
	mulx	%l1,0x3ef,%l4
p0_far_1_lem:
	fdivs	%f0 ,%f2 ,%f9 
	udivx	%l0,%l4,%l5
	fdivs	%f15,%f10,%f15
	or	%l2,-0x5e8,%l7
	udivx	%l5,-0x54c,%l6
	smul	%l4,%l1,%l3
	andn	%l5,%l5,%l5
	jmpl	%o7,%g0
	mulx	%l1,0x3ef,%l4
p0_far_1_he:
	xor	%l5,-0x4f4,%l1
	xor	%l2,-0x12e,%l1
	mulx	%l7,-0xcd4,%l1
	mulx	%l7,-0x2c9,%l0
	orn	%l1,%l5,%l5
	sub	%l0,%l6,%l5
	jmpl	%o7,%g0
	udivx	%l5,-0xd97,%l7
p0_far_1_hem:
	xor	%l5,-0x4f4,%l1
	xor	%l2,-0x12e,%l1
	mulx	%l7,-0xcd4,%l1
	mulx	%l7,-0x2c9,%l0
	orn	%l1,%l5,%l5
	sub	%l0,%l6,%l5
	jmpl	%o7,%g0
	udivx	%l5,-0xd97,%l7
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	fadds	%f22,%f25,%f22
	sub	%l1,%l3,%l6
	mulx	%l2,-0x026,%l1
	udivx	%l7,-0x9ef,%l5
	sdivx	%l2,0x24f,%l7
	jmpl	%o7,%g0
	xnor	%l5,%l4,%l2
far1_b2b_l:
	sdivx	%l0,%l3,%l7
	and	%l3,0x621,%l7
	and	%l0,%l7,%l6
	fsubs	%f10,%f4 ,%f7 
	mulx	%l2,%l4,%l3
	jmpl	%o7,%g0
	sdivx	%l2,%l7,%l2
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	sdivx	%l0,%l6,%l6
	udivx	%l6,%l4,%l6
	mulx	%l0,0x37d,%l6
	stw	%l4,[%i6+0x010]		! Mem[0000000010181410]
	addc	%l1,%l6,%l2
	andn	%l3,%l1,%l6
	fmuls	%f10,%f9 ,%f12
	jmpl	%o7,%g0
	add	%l4,%l7,%l1
p0_far_2_lem:
	sdivx	%l0,%l6,%l6
	udivx	%l6,%l4,%l6
	mulx	%l0,0x37d,%l6
	membar	#Sync
	stw	%l4,[%i6+0x010]		! Mem[0000000010181410]
	addc	%l1,%l6,%l2
	andn	%l3,%l1,%l6
	fmuls	%f10,%f9 ,%f12
	jmpl	%o7,%g0
	add	%l4,%l7,%l1
p0_far_2_he:
	subc	%l6,-0x9f8,%l0
	and	%l6,0x8b6,%l1
	sdivx	%l6,0xee7,%l2
	sdivx	%l3,0x037,%l6
	smul	%l7,0xe85,%l6
	jmpl	%o7,%g0
	addc	%l4,-0x6b0,%l3
p0_far_2_hem:
	subc	%l6,-0x9f8,%l0
	and	%l6,0x8b6,%l1
	sdivx	%l6,0xee7,%l2
	sdivx	%l3,0x037,%l6
	smul	%l7,0xe85,%l6
	jmpl	%o7,%g0
	addc	%l4,-0x6b0,%l3
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fmuls	%f19,%f20,%f16
	nop
	fitod	%f19,%f18
	fdivs	%f19,%f24,%f27
	or	%l2,%l3,%l2
	add	%l5,%l7,%l4
	orn	%l5,-0x727,%l7
	jmpl	%o7,%g0
	sub	%l6,%l6,%l4
far2_b2b_l:
	umul	%l4,%l5,%l4
	fsubs	%f2 ,%f15,%f13
	xor	%l3,-0xda8,%l1
	orn	%l6,0x29f,%l1
	fsubs	%f2 ,%f10,%f15
	orn	%l1,%l0,%l0
	umul	%l2,0xed6,%l2
	jmpl	%o7,%g0
	mulx	%l6,0x059,%l7
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	or	%l4,-0xdb5,%l6
	mulx	%l3,0x113,%l7
	jmpl	%o7,%g0
	ldstub	[%o3+0x140],%l4		! Mem[0000000021800140]
p0_far_3_lem:
	or	%l4,-0xdb5,%l6
	mulx	%l3,0x113,%l7
	jmpl	%o7,%g0
	ldstub	[%o3+0x140],%l4		! Mem[0000000021800140]
p0_far_3_he:
	fcmps	%fcc0,%f16,%f28
	jmpl	%o7,%g0
	umul	%l7,-0xeea,%l6
p0_far_3_hem:
	fcmps	%fcc0,%f16,%f28
	jmpl	%o7,%g0
	umul	%l7,-0xeea,%l6
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	addc	%l7,%l2,%l2
	addc	%l4,%l5,%l6
	add	%l5,%l3,%l6
	fadds	%f19,%f25,%f18
	subc	%l5,0x169,%l3
	andn	%l4,%l5,%l4
	fadds	%f27,%f27,%f22
	jmpl	%o7,%g0
	xor	%l0,%l2,%l4
far3_b2b_l:
	subc	%l3,%l4,%l2
	mulx	%l7,0xdc6,%l0
	andn	%l3,-0x4e1,%l5
	smul	%l1,0xdf8,%l6
	sub	%l6,%l1,%l3
	fadds	%f13,%f15,%f10
	sub	%l2,-0x6e2,%l5
	jmpl	%o7,%g0
	udivx	%l2,-0xea0,%l4
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	subc	%l5,0xe7a,%l6
	fsubs	%f9 ,%f9 ,%f14
	addc	%l3,%l2,%l2
	sub	%l3,%l2,%l5
	and	%l2,%l6,%l7
	add	%l7,0xcd1,%l7
	jmpl	%g6+8,%g0
	and	%l6,-0x4f4,%l7
p0_call_0_le:
	addc	%l2,%l7,%l5
	xnor	%l1,-0xa87,%l4
	fadds	%f13,%f9 ,%f9 
	retl
	sdivx	%l2,0xfa3,%l5
p0_jmpl_0_lo:
	subc	%l5,0xe7a,%l6
	fsubs	%f9 ,%f9 ,%f14
	addc	%l3,%l2,%l2
	sub	%l3,%l2,%l5
	and	%l2,%l6,%l7
	add	%l7,0xcd1,%l7
	jmpl	%g6+8,%g0
	and	%l6,-0x4f4,%l7
p0_call_0_lo:
	addc	%l2,%l7,%l5
	xnor	%l1,-0xa87,%l4
	fadds	%f13,%f9 ,%f9 
	retl
	sdivx	%l2,0xfa3,%l5
p0_jmpl_0_he:
	subc	%l3,%l0,%l5
	fsubs	%f26,%f16,%f28
	jmpl	%g6+8,%g0
	xor	%l1,%l2,%l6
p0_call_0_he:
	retl
	sdivx	%l4,%l7,%l2
p0_jmpl_0_ho:
	subc	%l3,%l0,%l5
	fsubs	%f26,%f16,%f28
	jmpl	%g6+8,%g0
	xor	%l1,%l2,%l6
p0_call_0_ho:
	retl
	sdivx	%l4,%l7,%l2
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	smul	%l7,%l3,%l1
	umul	%l7,%l2,%l4
	jmpl	%g6+8,%g0
	ldsb	[%i6+0x038],%l4		! Mem[0000000010181438]
p0_call_1_le:
	umul	%l0,%l1,%l6
	xnor	%l0,-0xf98,%l3
	fadds	%f5 ,%f14,%f6 
	retl
	sub	%l2,%l4,%l3
p0_jmpl_1_lo:
	smul	%l7,%l3,%l1
	umul	%l7,%l2,%l4
	jmpl	%g6+8,%g0
	ldsb	[%o6+0x038],%l4		! Mem[0000000010181438]
p0_call_1_lo:
	umul	%l0,%l1,%l6
	xnor	%l0,-0xf98,%l3
	fadds	%f5 ,%f14,%f6 
	retl
	sub	%l2,%l4,%l3
p0_jmpl_1_he:
	fcmps	%fcc2,%f22,%f31
	jmpl	%g6+8,%g0
	subc	%l2,%l4,%l4
p0_call_1_he:
	subc	%l6,0x696,%l6
	retl
	sdivx	%l4,%l6,%l1
p0_jmpl_1_ho:
	fcmps	%fcc2,%f22,%f31
	jmpl	%g6+8,%g0
	subc	%l2,%l4,%l4
p0_call_1_ho:
	subc	%l6,0x696,%l6
	retl
	sdivx	%l4,%l6,%l1
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	fdtos	%f10,%f5 
	subc	%l1,0x581,%l0
	fcmps	%fcc1,%f0 ,%f9 
	smul	%l3,%l5,%l6
	jmpl	%g6+8,%g0
	fmuls	%f9 ,%f12,%f14
p0_call_2_le:
	addc	%l1,-0xce0,%l1
	xnor	%l4,%l7,%l4
	fsubs	%f13,%f13,%f15
	mulx	%l4,-0xf0b,%l6
	sdivx	%l2,0x0c9,%l7
	addc	%l4,%l7,%l5
	mulx	%l1,-0xcc6,%l2
	retl
	andn	%l0,0x93a,%l4
p0_jmpl_2_lo:
	fdtos	%f10,%f5 
	subc	%l1,0x581,%l0
	fcmps	%fcc1,%f0 ,%f9 
	smul	%l3,%l5,%l6
	jmpl	%g6+8,%g0
	fmuls	%f9 ,%f12,%f14
p0_call_2_lo:
	addc	%l1,-0xce0,%l1
	xnor	%l4,%l7,%l4
	fsubs	%f13,%f13,%f15
	mulx	%l4,-0xf0b,%l6
	sdivx	%l2,0x0c9,%l7
	addc	%l4,%l7,%l5
	mulx	%l1,-0xcc6,%l2
	retl
	andn	%l0,0x93a,%l4
p0_jmpl_2_he:
	fadds	%f28,%f23,%f22
	fdivs	%f29,%f26,%f21
	addc	%l0,-0xb7f,%l5
	subc	%l0,%l6,%l6
	xor	%l6,-0x3ea,%l7
	mulx	%l2,0xf64,%l5
	jmpl	%g6+8,%g0
	fsqrts	%f28,%f20
p0_call_2_he:
	subc	%l0,0xf8d,%l0
	umul	%l2,0x470,%l3
	sub	%l3,%l0,%l0
	retl
	mulx	%l1,-0x0ba,%l2
p0_jmpl_2_ho:
	fadds	%f28,%f23,%f22
	fdivs	%f29,%f26,%f21
	addc	%l0,-0xb7f,%l5
	subc	%l0,%l6,%l6
	xor	%l6,-0x3ea,%l7
	mulx	%l2,0xf64,%l5
	jmpl	%g6+8,%g0
	fsqrts	%f28,%f20
p0_call_2_ho:
	subc	%l0,0xf8d,%l0
	umul	%l2,0x470,%l3
	sub	%l3,%l0,%l0
	retl
	mulx	%l1,-0x0ba,%l2
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	mulx	%l3,-0x76c,%l4
	or	%l0,-0xc7c,%l4
	sub	%l4,0xfa9,%l3
	jmpl	%g6+8,%g0
	fstod	%f5 ,%f10
p0_call_3_le:
	mulx	%l5,0x787,%l5
	xor	%l6,%l1,%l4
	sdivx	%l7,%l1,%l2
	andn	%l2,-0x47f,%l0
	retl
	umul	%l2,-0xae5,%l2
p0_jmpl_3_lo:
	mulx	%l3,-0x76c,%l4
	or	%l0,-0xc7c,%l4
	sub	%l4,0xfa9,%l3
	jmpl	%g6+8,%g0
	fstod	%f5 ,%f10
p0_call_3_lo:
	mulx	%l5,0x787,%l5
	xor	%l6,%l1,%l4
	sdivx	%l7,%l1,%l2
	andn	%l2,-0x47f,%l0
	retl
	umul	%l2,-0xae5,%l2
p0_jmpl_3_he:
	addc	%l0,-0x683,%l1
	fmuls	%f25,%f21,%f24
	fsqrts	%f23,%f16
	jmpl	%g6+8,%g0
	mulx	%l0,%l5,%l7
p0_call_3_he:
	or	%l1,-0x29c,%l7
	xor	%l2,0xd21,%l4
	sub	%l0,%l6,%l0
	retl
	std	%l4,[%i1+0x030]		! Mem[0000000010041430]
p0_jmpl_3_ho:
	addc	%l0,-0x683,%l1
	fmuls	%f25,%f21,%f24
	fsqrts	%f23,%f16
	jmpl	%g6+8,%g0
	mulx	%l0,%l5,%l7
p0_call_3_ho:
	or	%l1,-0x29c,%l7
	xor	%l2,0xd21,%l4
	sub	%l0,%l6,%l0
	retl
	std	%l4,[%o1+0x030]		! Mem[0000000010041430]
user_jump3_end:

	.seg	"data"
	.align	0x2000
user_data_start:
done_flags:
	.word	0
	.align	8
done_count:
	.word	0,0
Start_Flags:
	.word	0,0,0,0
Finish_Flag:
	.word	0,0
	.align	8
num_processors:
	.word	1
num_agents:
	.word	0
no_membar:
	.word	0
max_ireg:
	.word	8,0
max_freg:
	.word	32,0
	.align	64
p0_temp:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p0_debug:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p0_fsr:
	.word	0x00000000,0x00000000
	.align	8
p0_loop_cnt:
	.word	1,0
max_windows:
	.word	1,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0

	.align	8
p0_init_registers:
	.word	0x90e12fcc,0x64604c25		! Init value for %l0
	.word	0xeaa74409,0xcb915f4a		! Init value for %l1
	.word	0x889d2cce,0x6da35ce9		! Init value for %l2
	.word	0x732cc952,0xcab64aaf		! Init value for %l3
	.word	0xd45d517c,0x18498752		! Init value for %l4
	.word	0xbfe37e63,0xa963cf70		! Init value for %l5
	.word	0xddf155a5,0xcd2185ba		! Init value for %l6
	.word	0x74c4cbaa,0x6fc77c9c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x9c9f51e5,0x4ba23179		! Init value for %f0 
	.word	0x155744ec,0x4171f951		! Init value for %f2 
	.word	0xf45267f9,0x965f751e		! Init value for %f4 
	.word	0x6cbd7777,0x9477471c		! Init value for %f6 
	.word	0x3a5d2a6b,0x2f4fb61c		! Init value for %f8 
	.word	0xa89c24be,0x3b4f1702		! Init value for %f10
	.word	0x0146d63f,0x71569b80		! Init value for %f12
	.word	0x88bb0b01,0x0a72761c		! Init value for %f14
	.word	0x45818645,0x0501eaf7		! Init value for %f16
	.word	0x5caf4763,0x28278555		! Init value for %f18
	.word	0x7c504b52,0x5cbc7420		! Init value for %f20
	.word	0xc1e4a434,0x10339a82		! Init value for %f22
	.word	0x51c3aa30,0xa0b84dc5		! Init value for %f24
	.word	0x8160d2da,0x965c0c11		! Init value for %f26
	.word	0x7cf116da,0x1db7aeeb		! Init value for %f28
	.word	0xe60468ff,0x206e5963		! Init value for %f30
	.word	0x51690e1e,0x74e1a8f5		! Init value for %f32
	.word	0xde31b9e2,0x946775dd		! Init value for %f34
	.word	0x72e92e3d,0x4a261cfd		! Init value for %f36
	.word	0xb165be79,0xd3a2afb1		! Init value for %f38
	.word	0xd90080fe,0x3c238618		! Init value for %f40
	.word	0xdc3713de,0x260db352		! Init value for %f42
	.word	0x7126cf9b,0x828e0ef4		! Init value for %f44
	.word	0x3b8ad4c6,0x79ab80de		! Init value for %f46
	.word	0xcb2806b1,0x13da5c65
	.word	0xcb86b79d,0x71b57ec7
	.word	0x47e2fa3f,0xbf0fbc2c
	.word	0xcc495544,0x54baabc2
	.word	0x5876af74,0xabb88a5b
	.word	0xfbe6a543,0x12e08f2a
	.word	0x6641454b,0x1f631059
	.word	0x087e6b76,0x20118f55
p0_share_mask:
	.word	0xffff0000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
p0_expected_registers:
	.word	0x00000000,0x3d000000
	.word	0x00000000,0x000000be
	.word	0x00000000,0x00000075
	.word	0x00000000,0x00000000
	.word	0x00000000,0xff714eff
	.word	0x00000000,0x000007ff
	.word	0x00000000,0x75000000
	.word	0x00000000,0x000074ec
p0_expected_fp_regs:
	.word	0xeddf916a,0x0000005f
	.word	0xff000000,0x00000000
	.word	0x9c5cea45,0xf225cffd
	.word	0x354a6e52,0xa50f26bc
	.word	0x00000000,0x000000dd
	.word	0x9c9f51e5,0x199caaf3
	.word	0xeddf916a,0x00000000
	.word	0x49927c04,0xaa252d62
	.word	0x9c000000,0x00000068
	.word	0xff2d25aa,0x354a6e52
	.word	0x622d25aa,0x047c9249
	.word	0x00000000,0x9ea27501
	.word	0xcffdffff,0x00000000
	.word	0x3a7aff1f,0x88a9ec49
	.word	0x26f86801,0x1fb4c145
	.word	0xdc13eaff,0x9ea27501
	.word	0x00000011,0x00000400		! %fsr = 0000001100000400
p0_local0_expect:
	.word	0xff000000,0x00000000
	.word	0x3d00ffff,0xeddf916a
	.word	0xffffffff,0xffffc145
	.word	0x00000501,0xe5519f9c
	.word	0xd0ec17a6,0x7181c0b2
	.word	0x15cf41b8,0x45ff225b
	.word	0xa50f13b0,0x67f2ffff
	.word	0x9c5cea45,0xccffb290
p0_local0_sec_expect:
	.word	0xff00ffce,0x00000000
	.word	0xffb00000,0x0000006a
	.word	0xdd000000,0x00000038
	.word	0x084265c0,0xa3bbe685
	.word	0xbf7a5882,0x6cade822
	.word	0xb4a7a153,0x0a0cf791
	.word	0xf3c577dd,0x934a720a
	.word	0xacf5782a,0x44b76721
p0_local1_expect:
	.word	0x00000000,0x000000f1
	.word	0x9c009bda,0xb841cf15
	.word	0x3d000000,0x1e4f13b0
	.word	0x00000000,0x00000000
	.word	0x74ec9924,0xaa252d62
	.word	0x10ad1ccd,0x3a121da1
	.word	0x852520dd,0xb69eb3ec
	.word	0x552859e6,0xf9904d0b
p0_local1_sec_expect:
	.word	0x00000042,0x00ff654e
	.word	0xfff80000,0x4e65d5cc
	.word	0xff000000,0x00000000
	.word	0xb465cda2,0xe37ed08d
	.word	0xca828fbf,0x9c66431e
	.word	0xd96f5741,0x46ac7556
	.word	0xa9f479cb,0x693c6e26
	.word	0xe0245a30,0xf98c230f
p0_local2_expect:
	.word	0xeddf916a,0x0000005f
	.word	0x0000003d,0x0168f826
	.word	0xff3d0000,0xccffb290
	.word	0xc552b74c,0x0078f75e
	.word	0x000000ff,0xa50f26bc
	.word	0x00be5f9c,0xac151532
	.word	0x9c5cea45,0x66496288
	.word	0x622d25aa,0x000000ff
p0_local2_sec_expect:
	.word	0x00000000,0x9c5c00ff
	.word	0xff00009c,0xffffffff
	.word	0xfdcf25f2,0x45ea5c9c
	.word	0xbc260fa5,0x526e4a35
	.word	0xdd000000,0x00000000
	.word	0xf3aa9c19,0xe5519f9c
	.word	0xca36f1d4,0xda9b8138
	.word	0x622d25aa,0xd98cec74
p0_local3_expect:
	.word	0x68000000,0x0000009c
	.word	0x526e4a35,0xaa252dff
	.word	0x49927c04,0xaa252d62
	.word	0x0175a29e,0x00000000
	.word	0x00000000,0xfffffdcf
	.word	0x49eca988,0x1fff7a3a
	.word	0x45c1b41f,0x0168f826
	.word	0x0175a29e,0xffea13dc
p0_local3_sec_expect:
	.word	0x75fdffff,0x00000000
	.word	0x571a294a,0x00000000
	.word	0x75000000,0x00000000
	.word	0xc552b74c,0x4778f75e
	.word	0x354a6e52,0xa50f26bc
	.word	0xc9795f9c,0xac151532
	.word	0xca36f1d4,0xda9b8138
	.word	0x622d25aa,0xd98cec74
p0_local4_expect:
	.word	0xbc260fa5,0xff000000
	.word	0xff070000,0x49927c04
	.word	0x00000000,0x67f2ffff
	.word	0x00000000,0x0000005f
	.word	0x00ead975,0x000045aa
	.word	0xa963cf70,0x00000000
	.word	0x2c50a665,0xfffffc81
	.word	0xff1a294a,0xce691cd6
p0_local4_sec_expect:
	.word	0xff00003d,0x0000003d
	.word	0x74ec8cd9,0x000051f9
	.word	0xff000000,0x00000075
	.word	0x3194f8a7,0x75402b7b
	.word	0x70f36f21,0x911ee259
	.word	0xfb3d8db6,0xca169a02
	.word	0xbbecb31c,0xe6697db4
	.word	0xaba922ed,0x9e57f737
p0_local5_expect:
	.word	0x00000000,0x4e65ff00
	.word	0xfdcf25f2,0x45ea5c9c
	.word	0xfffff267,0xf3aa9c19
	.word	0xffffff3d,0x3085e48d
	.word	0x19fc7f67,0xe6f04a09
	.word	0x0041cb86,0x00000038
	.word	0xf3a43fff,0xb69eb3ec
	.word	0x730cc897,0x2bd22e08
p0_local5_sec_expect:
	.word	0x0000003d,0x6a91dfed
	.word	0xfffffc81,0xeddf916a
	.word	0x00000000,0x6a91dfed
	.word	0xcc0055ca,0xadab00de
	.word	0x95a2f3aa,0xb0756930
	.word	0x39a00634,0x9d83e7d2
	.word	0xad20ddd7,0x655115d7
	.word	0x04b000e5,0x843f00ef
p0_local6_expect:
	.word	0x9c000000,0x00000068
	.word	0xff2d25aa,0x354a6e52
	.word	0x622d25aa,0x047c9249
	.word	0x00000000,0x9ea27501
	.word	0xcffdffff,0x00000000
	.word	0x3a7aff1f,0x88a9ec49
	.word	0x26f86801,0x1fb4c145
	.word	0xdc13eaff,0x9ea27501
p0_local6_sec_expect:
	.word	0x0075ea45,0x66496333
	.word	0x3d000000,0x000000be
	.word	0x0000ffff,0xffffffff
	.word	0x8dd48a3a,0xc439f7b0
	.word	0xfdcf25f2,0x59ce999b
	.word	0x87c3e0be,0x87ec8251
	.word	0xccc15b25,0xdd475866
	.word	0x39107e4a,0x374d724b
share0_expect:
	.word	0xceff8bc8,0x6757a0f6
	.word	0x5781f35c,0xbe65db94
	.word	0x6c8cb1bd,0x8270cc7c
	.word	0x76d40958,0x079b5f48
	.word	0xe0b5e75a,0xf9d424ae
	.word	0x35dc9ac7,0xde808c18
	.word	0x8dfb2275,0x31ce3e33
	.word	0xffe03725,0x0fdd7403
share1_expect:
	.word	0xc7ff23dd,0x25830dd7
	.word	0xb677e1cb,0xfa573fb3
	.word	0x673f10df,0x20a20a80
	.word	0x0b7e14fb,0x1198ea4b
	.word	0x2717cfeb,0xfe0f57ae
	.word	0xee1d65d8,0x54e63d60
	.word	0xdc4c4284,0x8349738c
	.word	0x60e2bd12,0xb463de17
	.word	0xffffbae8,0x2c726e69
	.word	0x50bd1d39,0x752cba1d
	.word	0xfe04dc6c,0x9893c8d0
	.word	0x73702e46,0x11edd3bd
	.word	0x1e5698f4,0x2a900ac4
	.word	0x3711fc71,0x2d582699
	.word	0x4c165278,0x4df9105f
	.word	0x79165894,0x73090d7a
share2_expect:
	.word	0xc7ff9864,0x09f2be10
	.word	0xc1aa5241,0x4be244f6
	.word	0xbd6bfccb,0x97590215
	.word	0xfc0445a1,0xff354f22
	.word	0x9087b3be,0x4d9bec01
	.word	0xb01d542b,0x9ee8d765
	.word	0x5a83ee9f,0x4856fc8e
	.word	0xc06d087a,0x8730968f
share3_expect:
	.word	0x5bff8cec,0x013d5d9c
	.word	0x3dd02bcd,0x6506bc1b
	.word	0x0f85e4b8,0x366f7289
	.word	0xc22b7bc3,0x75d0680e
	.word	0x462baef3,0xb059f0f2
	.word	0xc470daa9,0x6e0fed02
	.word	0x7070d35c,0x48e6a73b
	.word	0xf3a70178,0x2aa64b35
	.word	0xc8ff564a,0xf9a695d2
	.word	0x60a67803,0x15273c90
	.word	0xf473a01e,0xeba2d2b4
	.word	0x52925ba6,0x1b825a23
	.word	0x113fbed1,0xabf185b7
	.word	0x29e847ed,0x3031d4e2
	.word	0x76c0bbc9,0xbe4c64df
	.word	0xfc27f987,0xed271307
	.word	0xbc53ac45,0x69ffe12a
	.word	0x6dbe9ec7,0xd2141883
	.word	0xc49fe454,0x772cfd46
	.word	0x7b1a9279,0xa7aaebf3
	.word	0xee59b83f,0xef1bebe4
	.word	0xbf970944,0x584f5df5
	.word	0x0abeb683,0xc1f104f0
	.word	0xe77bffc9,0x568f535d
	.word	0xd5ff90b0,0x3efadd57
	.word	0x9a9719e1,0xba03533c
	.word	0xde71f5f2,0xd03bac10
	.word	0xb368338d,0xe0f65b16
	.word	0x05cb1d6f,0xddc166d9
	.word	0x5af14601,0x4111bca1
	.word	0xe2eb3f03,0x312bd290
	.word	0x5ffefa28,0xdc240f5c
	.word	0x64a95d14,0xe1fceb90
	.word	0x4022a88e,0x6419808b
	.word	0x29616e70,0x8bf4724d
	.word	0x69304760,0xa3e83789
	.word	0x894aa69e,0x7c5f4722
	.word	0x63e28091,0x33ae2f05
	.word	0x46414ef5,0x9c08f421
	.word	0xed37d562,0x206d9b77
	.word	0x000004f1,0xd212aaeb
	.word	0xa952a6f4,0x2c262320
	.word	0x1618dc53,0x29181e61
	.word	0x1b9c3a91,0xdfaf4222
	.word	0xdbefc0ad,0x5ba074cf
	.word	0xb40ac4a8,0x20b56893
	.word	0xf27ccfc9,0x3070d15c
	.word	0x1b9fef72,0x09bcd9e1
	.word	0xfffda31a,0xf1353502
	.word	0x409f6d24,0xa5800b93
	.word	0x1c9fe310,0x8ac9dd8a
	.word	0xbd281f40,0x57c2bad1
	.word	0x631118b0,0xfd0c2e8c
	.word	0x321c6055,0xb53ec7b7
	.word	0x61b51ef3,0x0c5c044a
	.word	0x0fea7846,0xc84736e8
	.word	0xbd7c1f38,0x0156918f
	.word	0x81c9ad0e,0x4d9221f3
	.word	0xa7179b58,0x674d68c0
	.word	0xa2fcb429,0x57db3e85
	.word	0x73688911,0x83780293
	.word	0x42cc9710,0x44448005
	.word	0x094371bd,0x2a9e21a9
	.word	0xdfa9317a,0xb017e4c3
p0_invalidate_semaphore:
	.word	0
!	Data for Cross Processor Interrupt
	.align	8
received_xintr:
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0
p0_dispatch_retry:
	.word	0,0
p0_xintr_data:
	.word	0x00000000,0x00000001
	.word	0xf7884298,0x0ac5b373
	.word	0x00000000,0x00000002
	.word	0x7c3bfe08,0x03327991
	.word	0x00000000,0x00000003
	.word	0xe4b645f7,0xc3d47ac2
	.word	0x00000000,0x00000004
	.word	0xcb7cf927,0xd78c71b7
	.word	0x00000000,0x00000005
	.word	0x7f9f7ef7,0x8191d1cf
	.word	0x00000000,0x00000006
	.word	0xfa11ccdf,0x98d7a30c
	.word	0x00000000,0x00000007
	.word	0x5d051498,0x47d056f1
	.word	0x00000000,0x00000008
	.word	0x59c1c5d8,0x5302c05a
	.align	8
p0_xintr_expected:
	.word	0
	.align	64
xintr_data_ptrs:
	.word	p0_xintr_data
	.align	8
p0_xintr_db:
	.skip	512
p0_xintr_retry_count:
	.word	0,0
p0_reset_cnt:
	.word	0
	.align	8
p0_ec_timing_ctrl:
	.word	0,0
p0_ec_control:
	.word	0,0
p0_mcu_shadow:
	.skip	80
user_data_end:


SECTION	.p0_local0	DATA_VA=0x000800000

attr_data {
	Name = .p0_local0,
	VA = 0x0000000000800000,
	RA = 0x0000000010000000,
	PA = ra2pa(0x0000000010000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local0_start
p0_local0_begin:
	.skip	0x1400
p0_local0_start:
	.word	0x11b28999,0xb6976f8b,0x38341df1,0xdffc1e20
	.word	0x674afb7e,0xce1743fa,0xeddf916a,0xe6e7ad5a
	.word	0xd0ec17a6,0x7181c0b2,0x15cf41b8,0x4575225b
	.word	0x6f38db36,0x80495b49,0x9c5cea45,0xcc92b290
p0_local0_end:

SECTION	.p0_local0_sec	DATA_VA=0x000800000

attr_data {
	Name = .p0_local0_sec,
	VA = 0x0000000000800000,
	RA = 0x0000000030000000,
	PA = ra2pa(0x0000000030000000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local0_sec_start
p0_local0_sec_begin:
	.skip	0x1400
p0_local0_sec_start:
	.word	0x7cbebdb9,0xb5e38baf,0x18afd200,0x0cce24ee
	.word	0xe4b259ce,0xfb574c82,0x084265c0,0xa3bbe685
	.word	0xbf7a5882,0x6cade822,0xb4a7a153,0x0a0cf791
	.word	0xf3c577dd,0x934a720a,0xacf5782a,0x44b76721
p0_local0_sec_end:

SECTION	.p0_local1	DATA_VA=0x000802000

attr_data {
	Name = .p0_local1,
	VA = 0x0000000000802000,
	RA = 0x0000000010040000,
	PA = ra2pa(0x0000000010040000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local1_start
p0_local1_begin:
	.skip	0x1400
p0_local1_start:
	.word	0xfa407997,0xecbc572e,0x2d6259a1,0x8a7cb835
	.word	0xdc3752c5,0xd5a68a47,0xda474434,0x346baf2d
	.word	0x0a129924,0x39cdbd71,0x10ad1ccd,0x3a121da1
	.word	0x852520dd,0xb69eb3ec,0x552859e6,0xf9904d0b
p0_local1_end:

SECTION	.p0_local1_sec	DATA_VA=0x000802000

attr_data {
	Name = .p0_local1_sec,
	VA = 0x0000000000802000,
	RA = 0x0000000030040000,
	PA = ra2pa(0x0000000030040000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local1_sec_start
p0_local1_sec_begin:
	.skip	0x1400
p0_local1_sec_start:
	.word	0x46a2389f,0x78c0cd34,0xeaa995d7,0xc0b39e8f
	.word	0xe00530a2,0x4a3af422,0xb465cda2,0xe37ed08d
	.word	0xca828fbf,0x9c66431e,0xd96f5741,0x46ac7556
	.word	0xa9f479cb,0x693c6e26,0xe0245a30,0xf98c230f
p0_local1_sec_end:

SECTION	.p0_local2	DATA_VA=0x000804000

attr_data {
	Name = .p0_local2,
	VA = 0x0000000000804000,
	RA = 0x0000000010080000,
	PA = ra2pa(0x0000000010080000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local2_start
p0_local2_begin:
	.skip	0x1400
p0_local2_start:
	.word	0x950820eb,0xf2c175af,0x57c9a5ed,0xadb87c1f
	.word	0xe2d27354,0x5e1c08c6,0xf53826b1,0x4778f75e
	.word	0x354a6e52,0xa63026bc,0xc9795f9c,0xac151532
	.word	0xca36f1d4,0xda9b8138,0x622d25aa,0xd98cec74
p0_local2_end:

SECTION	.p0_local2_sec	DATA_VA=0x000804000

attr_data {
	Name = .p0_local2_sec,
	VA = 0x0000000000804000,
	RA = 0x0000000030080000,
	PA = ra2pa(0x0000000030080000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local2_sec_start
p0_local2_sec_begin:
	.skip	0x1400
p0_local2_sec_start:
	.word	0xb25379ab,0x12812878,0xa4c5f302,0xf6414768
	.word	0x5c7c0d78,0x4f46c50e,0x3f651de1,0xd3cf4e19
	.word	0x7ed4a2c8,0x66496288,0x5d552c47,0xd7fe9fcb
	.word	0x199caaf3,0xc8c93bc1,0xe3f1e98b,0x9bc90232
p0_local2_sec_end:

SECTION	.p0_local3	DATA_VA=0x000806000

attr_data {
	Name = .p0_local3,
	VA = 0x0000000000806000,
	RA = 0x00000000100c0000,
	PA = ra2pa(0x00000000100c0000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local3_start
p0_local3_begin:
	.skip	0x1400
p0_local3_start:
	.word	0x34b5c0f9,0xaf0a24af,0x0fa5d5e1,0xe3e67613
	.word	0xf1979ea5,0x2df395c3,0x550cb30d,0x3784d41a
	.word	0x90832cf2,0xf914d93a,0x93e2b43d,0xa06405b6
	.word	0xf773a6c9,0xcbfd058d,0xaaded28c,0x4083bfcb
p0_local3_end:

SECTION	.p0_local3_sec	DATA_VA=0x000806000

attr_data {
	Name = .p0_local3_sec,
	VA = 0x0000000000806000,
	RA = 0x00000000300c0000,
	PA = ra2pa(0x00000000300c0000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local3_sec_start
p0_local3_sec_begin:
	.skip	0x1400
p0_local3_sec_start:
	.word	0x571a294a,0x1d46ffe2,0xcbd0b4f1,0x4689d745
	.word	0x55b21996,0x0627173d,0xdca1b526,0x2129fdd8
	.word	0x0cac2eba,0x7eb4b8f2,0x7a5a5858,0x0f2edb27
	.word	0xae856c3f,0x5d8924f6,0x1a933013,0x7ecd4ef2
p0_local3_sec_end:

SECTION	.p0_local4	DATA_VA=0x000808000

attr_data {
	Name = .p0_local4,
	VA = 0x0000000000808000,
	RA = 0x0000000010100000,
	PA = ra2pa(0x0000000010100000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local4_start
p0_local4_begin:
	.skip	0x1400
p0_local4_start:
	.word	0xa784cf1c,0x5d617d89,0x2fa6e529,0x49927c04
	.word	0x1b4e9757,0xd15dff42,0xe7b00619,0xa285b2d6
	.word	0x8dead92d,0x64b945aa,0x4e8344b1,0xdf3db7a6
	.word	0x2c50a665,0x3b61b7dc,0x49eae59f,0xce691cd6
p0_local4_end:

SECTION	.p0_local4_sec	DATA_VA=0x000808000

attr_data {
	Name = .p0_local4_sec,
	VA = 0x0000000000808000,
	RA = 0x0000000030100000,
	PA = ra2pa(0x0000000030100000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local4_sec_start
p0_local4_sec_begin:
	.skip	0x1400
p0_local4_sec_start:
	.word	0xd65dd1e2,0xca0c7e49,0x312ce06d,0x31c6e66a
	.word	0xd74c17ef,0x6a3f9e42,0x3194f8a7,0x75402b7b
	.word	0x70f36f21,0x911ee259,0xfb3d8db6,0xca169a02
	.word	0xbbecb31c,0xe6697db4,0xaba922ed,0x9e57f737
p0_local4_sec_end:

SECTION	.p0_local5	DATA_VA=0x00080a000

attr_data {
	Name = .p0_local5,
	VA = 0x000000000080a000,
	RA = 0x0000000010140000,
	PA = ra2pa(0x0000000010140000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local5_start
p0_local5_begin:
	.skip	0x1400
p0_local5_start:
	.word	0x72f6bd89,0x2c9ee77b,0xccd5654e,0x01ee8e9b
	.word	0xfdcf25f2,0xa565cc26,0xf637b056,0x3085e48d
	.word	0x19fc7f67,0x9ff04a09,0x05a5cb86,0x71dfe059
	.word	0xf3a43f4b,0x8a12aa7e,0x730cc897,0x2bd22e08
p0_local5_end:

SECTION	.p0_local5_sec	DATA_VA=0x00080a000

attr_data {
	Name = .p0_local5_sec,
	VA = 0x000000000080a000,
	RA = 0x0000000030140000,
	PA = ra2pa(0x0000000030140000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local5_sec_start
p0_local5_sec_begin:
	.skip	0x1400
p0_local5_sec_start:
	.word	0x749a8675,0x47ed6337,0x62bf77ca,0x38f9c2a2
	.word	0x1e4f13b0,0x85841456,0xcc0055ca,0xadab00de
	.word	0x95a2f3aa,0xb0756930,0x39a00634,0x9d83e7d2
	.word	0xad20ddd7,0x655115d7,0x04b018e5,0x843fa0ef
p0_local5_sec_end:

SECTION	.p0_local6	DATA_VA=0x00080c000

attr_data {
	Name = .p0_local6,
	VA = 0x000000000080c000,
	RA = 0x0000000010180000,
	PA = ra2pa(0x0000000010180000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local6_start
p0_local6_begin:
	.skip	0x1400
p0_local6_start:
	.word	0x0c900fc4,0x66d0495f,0x9f831778,0x7aff394a
	.word	0x6b263269,0x9b68f690,0x863ae264,0xa5ce66e6
	.word	0x96b53316,0x679ef63e,0xb55b541f,0x88a9ec49
	.word	0x26f86801,0x1fb4c145,0xdc13ea61,0x9ea27501
p0_local6_end:

SECTION	.p0_local6_sec	DATA_VA=0x00080c000

attr_data {
	Name = .p0_local6_sec,
	VA = 0x000000000080c000,
	RA = 0x0000000030180000,
	PA = ra2pa(0x0000000030180000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=SCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	p0_local6_sec_start
p0_local6_sec_begin:
	.skip	0x1400
p0_local6_sec_start:
	.word	0x3a2d265a,0xa87a6333,0x75c9cde1,0xd6d5f33b
	.word	0x35f4fa3e,0x3e849e3f,0x8dd48a3a,0xc439f7b0
	.word	0x97ec9bdb,0x59ce999b,0x87c3e0be,0x87ec8251
	.word	0xccc15b25,0xdd475866,0x39107e4a,0x374d724b
p0_local6_sec_end:

SECTION	.share0	DATA_VA=0x00080e000

attr_data {
	Name = .share0,
	VA = 0x000000000080e000,
	RA = 0x00000000201c0000,
	PA = ra2pa(0x00000000201c0000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	share0_start
share0_begin:
share0_start:
	.word	0xc7f58bc8,0x6757a0f6,0x5781f35c,0xbe65db94
	.word	0x6c8cb1bd,0x8270cc7c,0x76d40958,0x079b5f48
	.word	0xe0b5e75a,0xf9d424ae,0x35dc9ac7,0xde808c18
	.word	0x8dfb2275,0x31ce3e33,0xffe03725,0x0fdd7403
share0_end:

SECTION	.share1	DATA_VA=0x000810000

attr_data {
	Name = .share1,
	VA = 0x0000000000810000,
	RA = 0x0000000020800000,
	PA = ra2pa(0x0000000020800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	share1_start
share1_begin:
share1_start:
	.word	0xc7ca23dd,0x25830dd7,0xb677e1cb,0xfa573fb3
	.word	0x673f10df,0x20a20a80,0x0b7e14fb,0x1198ea4b
	.word	0x2717cfeb,0xfe0f57ae,0xee1d65d8,0x54e63d60
	.word	0xdc4c4284,0x8349738c,0x60e2bd12,0xb463de17
	.word	0x2a89bae8,0x2c726e69,0x50bd1d39,0x752cba1d
	.word	0xfe04dc6c,0x9893c8d0,0x73702e46,0x11edd3bd
	.word	0x1e5698f4,0x2a900ac4,0x3711fc71,0x2d582699
	.word	0x4c165278,0x4df9105f,0x79165894,0x73090d7a
share1_end:

SECTION	.share2	DATA_VA=0x000812000

attr_data {
	Name = .share2,
	VA = 0x0000000000812000,
	RA = 0x00000000211c0000,
	PA = ra2pa(0x00000000211c0000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	share2_start
share2_begin:
share2_start:
	.word	0x38a09864,0x09f2be10,0xc1aa5241,0x4be244f6
	.word	0xbd6bfccb,0x97590215,0xfc0445a1,0xff354f22
	.word	0x9087b3be,0x4d9bec01,0xb01d542b,0x9ee8d765
	.word	0x5a83ee9f,0x4856fc8e,0xc06d087a,0x8730968f
share2_end:

SECTION	.share3	DATA_VA=0x000814000

attr_data {
	Name = .share3,
	VA = 0x0000000000814000,
	RA = 0x0000000021800000,
	PA = ra2pa(0x0000000021800000,0),
	part_0_ctx_nonzero_tsb_config_0,
	TTE_Context=PCONTEXT,
	TTE_Size=0, TTE_NFO=0, TTE_IE=0,
	TTE_Diag=0, TTE_L=0, TTE_EP=1,
	TTE_CP=1, TTE_E=0, TTE_P=0, TTE_W=1,
	TTE_V=1, TTE_SW0=0, TTE_SW1=0, TTE_X=0
}

	.data
	.seg	"data"
	.align	0x2000
	.global	share3_start
share3_begin:
share3_start:
	.word	0x7fb68cec,0x013d5d9c,0x3dd02bcd,0x6506bc1b
	.word	0x0f85e4b8,0x366f7289,0xc22b7bc3,0x75d0680e
	.word	0x462baef3,0xb059f0f2,0xc470daa9,0x6e0fed02
	.word	0x7070d35c,0x48e6a73b,0xf3a70178,0x2aa64b35
	.word	0xc871564a,0xf9a695d2,0x60a67803,0x15273c90
	.word	0xf473a01e,0xeba2d2b4,0x52925ba6,0x1b825a23
	.word	0x113fbed1,0xabf185b7,0x29e847ed,0x3031d4e2
	.word	0x76c0bbc9,0xbe4c64df,0xfc27f987,0xed271307
	.word	0x7353ac45,0x69ffe12a,0x6dbe9ec7,0xd2141883
	.word	0xc49fe454,0x772cfd46,0x7b1a9279,0xa7aaebf3
	.word	0xee59b83f,0xef1bebe4,0xbf970944,0x584f5df5
	.word	0x0abeb683,0xc1f104f0,0xe77bffc9,0x568f535d
	.word	0xd59890b0,0x3efadd57,0x9a9719e1,0xba03533c
	.word	0xde71f5f2,0xd03bac10,0xb368338d,0xe0f65b16
	.word	0x05cb1d6f,0xddc166d9,0x5af14601,0x4111bca1
	.word	0xe2eb3f03,0x312bd290,0x5ffefa28,0xdc240f5c
	.word	0x64a95d14,0xe1fceb90,0x4022a88e,0x6419808b
	.word	0x29616e70,0x8bf4724d,0x69304760,0xa3e83789
	.word	0x894aa69e,0x7c5f4722,0x63e28091,0x33ae2f05
	.word	0x46414ef5,0x9c08f421,0xed37d562,0x206d9b77
	.word	0x42fd04f1,0xd212aaeb,0xa952a6f4,0x2c262320
	.word	0x1618dc53,0x29181e61,0x1b9c3a91,0xdfaf4222
	.word	0xdbefc0ad,0x5ba074cf,0xb40ac4a8,0x20b56893
	.word	0xf27ccfc9,0x3070d15c,0x1b9fef72,0x09bcd9e1
	.word	0xb283a31a,0xf1353502,0x409f6d24,0xa5800b93
	.word	0x1c9fe310,0x8ac9dd8a,0xbd281f40,0x57c2bad1
	.word	0x631118b0,0xfd0c2e8c,0x321c6055,0xb53ec7b7
	.word	0x61b51ef3,0x0c5c044a,0x0fea7846,0xc84736e8
	.word	0xbd7c1f38,0x0156918f,0x81c9ad0e,0x4d9221f3
	.word	0xa7179b58,0x674d68c0,0xa2fcb429,0x57db3e85
	.word	0x73688911,0x83780293,0x42cc9710,0x44448005
	.word	0x094371bd,0x2a9e21a9,0xdfa9317a,0xb017e4c3
share3_end: