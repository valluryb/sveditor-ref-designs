// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: txfifo_unload.v
// Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
// 4150 Network Circle, Santa Clara, California 95054, U.S.A.
//
// * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; version 2 of the License.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
// 
// For the avoidance of doubt, and except that if any non-GPL license 
// choice is available it will apply instead, Sun elects to use only 
// the General Public License version 2 (GPLv2) at this time for any 
// software where a choice of GPL license versions is made 
// available with the language indicating that GPLv2 or any later version 
// may be used, or where a choice of which version of the GPL is applied is 
// otherwise unspecified. 
//
// Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
// CA 95054 USA or visit www.sun.com if you need additional information or 
// have any questions. 
// 
// ========== Copyright Header End ============================================
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : txfifo_unload.v
 * Author Name  : John Lo
 * Description  : It contains txmac read pointer management logic and 
 *                associated control logic.
 * Parent Module: tx_xmac
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

module txfifo_unload (
		 tx_clk,
		 tx_reset,
		 txfifo_g_wr_ptr_sync, 
	 	 txfifo_rd_en,
                 stfifo_rd_en,            // stfifo read enable
		 stfifo_g_wr_ptr_sync,     
      // outputs
		 // txfifo stuff
                 txfifo_unload_rdy,
                 txfifo_g_rd_ptr_txclk, // to xmac_sync.v
                 txfifo_rd_ptr_txclk,
	 	 txfifo_empty_txclk,
 		 txfifo_full_txclk,
		 // stfifo stuff
                 stfifo_g_rd_ptr_txclk,
                 stfifo_rd_ptr_txclk,
	 	 stfifo_empty_txclk,
		 stfifo_underrun_txclk
                 );
   

   input         tx_clk;
   input 	 tx_reset;
   input [4:0]	 txfifo_g_wr_ptr_sync;
   input 	 txfifo_rd_en;
   input 	 stfifo_rd_en;
   input [4:0]	 stfifo_g_wr_ptr_sync;
// outputs   
   output 	 txfifo_unload_rdy;
   output [4:0]  txfifo_g_rd_ptr_txclk;
   output [4:0]	 txfifo_rd_ptr_txclk;
   output 	 txfifo_empty_txclk;
   output 	 txfifo_full_txclk;
		 // stfifo stuff
   output [4:0]  stfifo_g_rd_ptr_txclk;
   output [4:0]  stfifo_rd_ptr_txclk;
   output 	 stfifo_empty_txclk;
   output 	 stfifo_underrun_txclk;

   wire 	 stfifo_empty_txclk,stfifo_underrun_txclk;
   
   
/* --------------- start txfifo pointer Management ------------------ */
   wire [4:0] 	 txfifo_g_rd_ptr_txclk;
   wire [4:0] 	 txfifo_rd_ptr_txclk;
   wire [4:0] 	 txfifo_wr_ptr_txclk;

// Txfifo G read Pointer, g_wr_ptr to sysclk   
g_cntr_5bit txfifo_g_rd_ptr_txclk_g_cntr_5bit(
                         .reset(tx_reset),
                         .clk(tx_clk),
                         .ce(txfifo_rd_en),
                         .g_cnt(txfifo_g_rd_ptr_txclk));

// Txfifo read Pointer
counter_X5 txfifo_rd_ptr_txclk_counter_X5(.clk(tx_clk),.clr(tx_reset),.enable(txfifo_rd_en),.count(txfifo_rd_ptr_txclk));

// Txfifo write Pointer, wr_ptr from clk   
g2b_5bit txfifo_wr_ptr_txclk_g2b_5bit(.g_cnt(txfifo_g_wr_ptr_sync),
                                      .b_cnt(txfifo_wr_ptr_txclk));

   
   wire    txfifo_full_txclk  =
           (txfifo_wr_ptr_txclk[4] == (!txfifo_rd_ptr_txclk[4])) &&
	   (txfifo_wr_ptr_txclk[3:0] == txfifo_rd_ptr_txclk[3:0]) ;

   wire    txfifo_empty_txclk =
           (txfifo_wr_ptr_txclk[4:0] == txfifo_rd_ptr_txclk[4:0]);

   // The following condition will never happen since xtlm_sm will
   // not assert txfifo_rd_en when txfifo_empty_txclk == 1.
   // Instead the txfifo_underrun_txclk is generated by xtlm_sm.
   // wire    txfifo_underrun_txclk = txfifo_rd_en & txfifo_empty_txclk;

   // vlint flag_net_has_no_load            off
   // vlint flag_dangling_net_within_module off
   wire [4:0] txfifo_empty_space_txclk =
                       (txfifo_wr_ptr_txclk[4] == txfifo_rd_ptr_txclk[4]) ?
                  16 - ({1'b0,txfifo_wr_ptr_txclk[3:0]} - {1'b0,txfifo_rd_ptr_txclk[3:0]}):
                       ({1'b0,txfifo_rd_ptr_txclk[3:0]} - {1'b0,txfifo_wr_ptr_txclk[3:0]});
   // vlint flag_dangling_net_within_module on
   // vlint flag_net_has_no_load            on

//   wire [4:0] txfifo_full_space_txclk  = 16 - txfifo_empty_space_txclk;
   wire [4:0] txfifo_full_space_txclk =
                       (txfifo_wr_ptr_txclk[4] == txfifo_rd_ptr_txclk[4]) ?
                       ({1'b0,txfifo_wr_ptr_txclk[3:0]} - {1'b0,txfifo_rd_ptr_txclk[3:0]}):
                  16 - ({1'b0,txfifo_rd_ptr_txclk[3:0]} - {1'b0,txfifo_wr_ptr_txclk[3:0]});

// It is necessary to have TXFIFO_UNLOAD_THRESHOLD value so that
// txfifo won't pre-maturely dry out
   parameter  TXFIFO_UNLOAD_THRESHOLD = 5'h02;
   wire       txfifo_reach_threshold = 
                 txfifo_full_space_txclk > TXFIFO_UNLOAD_THRESHOLD;
   wire       txfifo_unload_rdy      = txfifo_reach_threshold | 
                                      (~stfifo_empty_txclk);

// wire       txfifo_unload_rdy = ~txfifo_empty_txclk;
   
/* --------------- end of txfifo pointer Management ----------------- */

/* --------------- start stfifo pointer Management ------------------ */
// stfifo G read Pointer g_rd_ptr to sysclk
   wire [4:0] stfifo_g_rd_ptr_txclk;
   wire [4:0] stfifo_rd_ptr_txclk;
   wire [4:0] stfifo_wr_ptr_txclk;
   
g_cntr_5bit stfifo_g_rd_ptr_txclk_g_cntr_5bit(
                         .reset(tx_reset),
                         .clk(tx_clk),
                         .ce(stfifo_rd_en),
                         .g_cnt(stfifo_g_rd_ptr_txclk));

// stfifo Read Pointer
counter_X5 stfifo_rd_ptr_txclk_counter_X5(.clk(tx_clk),.clr(tx_reset),.enable(stfifo_rd_en),.count(stfifo_rd_ptr_txclk));

// synopsys translate_off
// diag
   wire [4:0] txfifo_rd_ptr_txclk_from_g2b;
   wire [4:0] stfifo_rd_ptr_txclk_from_g2b;
   reg 	      txfifo_rd_ptr_err;
   reg 	      stfifo_rd_ptr_err;

   g2b_5bit   txfifo_g2b_5bit(.g_cnt(txfifo_g_rd_ptr_txclk),.b_cnt(txfifo_rd_ptr_txclk_from_g2b));
   g2b_5bit   stfifo_g2b_5bit(.g_cnt(stfifo_g_rd_ptr_txclk),.b_cnt(stfifo_rd_ptr_txclk_from_g2b));
   always @ (posedge tx_clk)
     begin
        txfifo_rd_ptr_err <= txfifo_rd_ptr_txclk_from_g2b != txfifo_rd_ptr_txclk;
        stfifo_rd_ptr_err <= stfifo_rd_ptr_txclk_from_g2b != stfifo_rd_ptr_txclk;
     end

   always @ (txfifo_rd_ptr_err or stfifo_rd_ptr_err)
     if (~tx_reset)
       $display("\n (* ERROR:  at sim time = %d,txfifo_rd_ptr_err = %b,stfifo_rd_ptr_err = %b  *) \n",$time,txfifo_rd_ptr_err,stfifo_rd_ptr_err);
     else ;
// synopsys translate_on
    
   
// stfifo Write Pointer
g2b_5bit stfifo_wr_ptr_txclk_g2b_5bit(.g_cnt(stfifo_g_wr_ptr_sync),
                         .b_cnt(stfifo_wr_ptr_txclk));

   assign  stfifo_empty_txclk =
                  (stfifo_wr_ptr_txclk[4:0] == stfifo_rd_ptr_txclk[4:0]);

   assign  stfifo_underrun_txclk = stfifo_empty_txclk & stfifo_rd_en;

/* --------------- end of stfifo pointer pointer Management --------- */


endmodule // txfifo_unload

   
   
   
   
   

   