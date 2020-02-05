//
// Generated by Bluespec Compiler, version 2017.07.A (build 1da80f1, 2017-07-21)
//
// On Wed Feb  5 12:19:53 EST 2020
//
//
// Ports:
// Name                         I/O  size props
// RDY_server_reset_request_put   O     1 reg
// RDY_server_reset_response_get  O     1
// read_rs1                       O    65
// read_rs1_port2                 O    65
// read_rs2                       O    65
// CLK                            I     1 clock
// RST_N                          I     1 reset
// read_rs1_rs1                   I     5
// read_rs1_port2_rs1             I     5
// read_rs2_rs2                   I     5
// write_rd_rd                    I     5
// write_rd_rd_val                I    65
// EN_server_reset_request_put    I     1
// EN_server_reset_response_get   I     1
// EN_write_rd                    I     1
//
// Combinational paths from inputs to outputs:
//   read_rs1_rs1 -> read_rs1
//   read_rs1_port2_rs1 -> read_rs1_port2
//   read_rs2_rs2 -> read_rs2
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkGPR_RegFile(CLK,
		     RST_N,

		     EN_server_reset_request_put,
		     RDY_server_reset_request_put,

		     EN_server_reset_response_get,
		     RDY_server_reset_response_get,

		     read_rs1_rs1,
		     read_rs1,

		     read_rs1_port2_rs1,
		     read_rs1_port2,

		     read_rs2_rs2,
		     read_rs2,

		     write_rd_rd,
		     write_rd_rd_val,
		     EN_write_rd);
  input  CLK;
  input  RST_N;

  // action method server_reset_request_put
  input  EN_server_reset_request_put;
  output RDY_server_reset_request_put;

  // action method server_reset_response_get
  input  EN_server_reset_response_get;
  output RDY_server_reset_response_get;

  // value method read_rs1
  input  [4 : 0] read_rs1_rs1;
  output [64 : 0] read_rs1;

  // value method read_rs1_port2
  input  [4 : 0] read_rs1_port2_rs1;
  output [64 : 0] read_rs1_port2;

  // value method read_rs2
  input  [4 : 0] read_rs2_rs2;
  output [64 : 0] read_rs2;

  // action method write_rd
  input  [4 : 0] write_rd_rd;
  input  [64 : 0] write_rd_rd_val;
  input  EN_write_rd;

  // signals for module outputs
  wire [64 : 0] read_rs1, read_rs1_port2, read_rs2;
  wire RDY_server_reset_request_put, RDY_server_reset_response_get;

  // register rg_j
  reg [4 : 0] rg_j;
  wire [4 : 0] rg_j$D_IN;
  wire rg_j$EN;

  // register rg_state
  reg [1 : 0] rg_state;
  reg [1 : 0] rg_state$D_IN;
  wire rg_state$EN;

  // ports of submodule f_reset_rsps
  wire f_reset_rsps$CLR,
       f_reset_rsps$DEQ,
       f_reset_rsps$EMPTY_N,
       f_reset_rsps$ENQ,
       f_reset_rsps$FULL_N;

  // ports of submodule regfile
  wire [64 : 0] regfile$D_IN,
		regfile$D_OUT_1,
		regfile$D_OUT_2,
		regfile$D_OUT_3;
  wire [4 : 0] regfile$ADDR_1,
	       regfile$ADDR_2,
	       regfile$ADDR_3,
	       regfile$ADDR_4,
	       regfile$ADDR_5,
	       regfile$ADDR_IN;
  wire regfile$WE;

  // rule scheduling signals
  wire CAN_FIRE_RL_rl_reset_loop,
       CAN_FIRE_RL_rl_reset_start,
       CAN_FIRE_server_reset_request_put,
       CAN_FIRE_server_reset_response_get,
       CAN_FIRE_write_rd,
       WILL_FIRE_RL_rl_reset_loop,
       WILL_FIRE_RL_rl_reset_start,
       WILL_FIRE_server_reset_request_put,
       WILL_FIRE_server_reset_response_get,
       WILL_FIRE_write_rd;

  // inputs to muxes for submodule ports
  wire [4 : 0] MUX_rg_j$write_1__VAL_1;
  wire MUX_regfile$upd_1__SEL_1, MUX_rg_state$write_1__SEL_2;

  // action method server_reset_request_put
  assign RDY_server_reset_request_put = f_reset_rsps$FULL_N ;
  assign CAN_FIRE_server_reset_request_put = f_reset_rsps$FULL_N ;
  assign WILL_FIRE_server_reset_request_put = EN_server_reset_request_put ;

  // action method server_reset_response_get
  assign RDY_server_reset_response_get =
	     rg_state == 2'd2 && f_reset_rsps$EMPTY_N ;
  assign CAN_FIRE_server_reset_response_get =
	     rg_state == 2'd2 && f_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_server_reset_response_get = EN_server_reset_response_get ;

  // value method read_rs1
  assign read_rs1 =
	     { (read_rs1_rs1 == 5'd0) ? 64'd0 : regfile$D_OUT_3[64:1],
	       read_rs1_rs1 != 5'd0 && regfile$D_OUT_3[0] } ;

  // value method read_rs1_port2
  assign read_rs1_port2 =
	     { (read_rs1_port2_rs1 == 5'd0) ? 64'd0 : regfile$D_OUT_2[64:1],
	       read_rs1_port2_rs1 != 5'd0 && regfile$D_OUT_2[0] } ;

  // value method read_rs2
  assign read_rs2 =
	     { (read_rs2_rs2 == 5'd0) ? 64'd0 : regfile$D_OUT_1[64:1],
	       read_rs2_rs2 != 5'd0 && regfile$D_OUT_1[0] } ;

  // action method write_rd
  assign CAN_FIRE_write_rd = 1'd1 ;
  assign WILL_FIRE_write_rd = EN_write_rd ;

  // submodule f_reset_rsps
  FIFO20 #(.guarded(32'd1)) f_reset_rsps(.RST(RST_N),
					 .CLK(CLK),
					 .ENQ(f_reset_rsps$ENQ),
					 .DEQ(f_reset_rsps$DEQ),
					 .CLR(f_reset_rsps$CLR),
					 .FULL_N(f_reset_rsps$FULL_N),
					 .EMPTY_N(f_reset_rsps$EMPTY_N));

  // submodule regfile
  RegFile #(.addr_width(32'd5),
	    .data_width(32'd65),
	    .lo(5'h0),
	    .hi(5'd31)) regfile(.CLK(CLK),
				.ADDR_1(regfile$ADDR_1),
				.ADDR_2(regfile$ADDR_2),
				.ADDR_3(regfile$ADDR_3),
				.ADDR_4(regfile$ADDR_4),
				.ADDR_5(regfile$ADDR_5),
				.ADDR_IN(regfile$ADDR_IN),
				.D_IN(regfile$D_IN),
				.WE(regfile$WE),
				.D_OUT_1(regfile$D_OUT_1),
				.D_OUT_2(regfile$D_OUT_2),
				.D_OUT_3(regfile$D_OUT_3),
				.D_OUT_4(),
				.D_OUT_5());

  // rule RL_rl_reset_start
  assign CAN_FIRE_RL_rl_reset_start = rg_state == 2'd0 ;
  assign WILL_FIRE_RL_rl_reset_start = CAN_FIRE_RL_rl_reset_start ;

  // rule RL_rl_reset_loop
  assign CAN_FIRE_RL_rl_reset_loop = rg_state == 2'd1 ;
  assign WILL_FIRE_RL_rl_reset_loop =
	     CAN_FIRE_RL_rl_reset_loop && !EN_write_rd ;

  // inputs to muxes for submodule ports
  assign MUX_regfile$upd_1__SEL_1 = EN_write_rd && write_rd_rd != 5'd0 ;
  assign MUX_rg_state$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_reset_loop && rg_j == 5'd31 ;
  assign MUX_rg_j$write_1__VAL_1 = rg_j + 5'd1 ;

  // register rg_j
  assign rg_j$D_IN =
	     WILL_FIRE_RL_rl_reset_loop ? MUX_rg_j$write_1__VAL_1 : 5'd1 ;
  assign rg_j$EN = WILL_FIRE_RL_rl_reset_loop || WILL_FIRE_RL_rl_reset_start ;

  // register rg_state
  always@(EN_server_reset_request_put or
	  MUX_rg_state$write_1__SEL_2 or WILL_FIRE_RL_rl_reset_start)
  case (1'b1)
    EN_server_reset_request_put: rg_state$D_IN = 2'd0;
    MUX_rg_state$write_1__SEL_2: rg_state$D_IN = 2'd2;
    WILL_FIRE_RL_rl_reset_start: rg_state$D_IN = 2'd1;
    default: rg_state$D_IN = 2'b10 /* unspecified value */ ;
  endcase
  assign rg_state$EN =
	     WILL_FIRE_RL_rl_reset_loop && rg_j == 5'd31 ||
	     EN_server_reset_request_put ||
	     WILL_FIRE_RL_rl_reset_start ;

  // submodule f_reset_rsps
  assign f_reset_rsps$ENQ = EN_server_reset_request_put ;
  assign f_reset_rsps$DEQ = EN_server_reset_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;

  // submodule regfile
  assign regfile$ADDR_1 = read_rs2_rs2 ;
  assign regfile$ADDR_2 = read_rs1_port2_rs1 ;
  assign regfile$ADDR_3 = read_rs1_rs1 ;
  assign regfile$ADDR_4 = 5'h0 ;
  assign regfile$ADDR_5 = 5'h0 ;
  assign regfile$ADDR_IN = MUX_regfile$upd_1__SEL_1 ? write_rd_rd : rg_j ;
  assign regfile$D_IN = MUX_regfile$upd_1__SEL_1 ? write_rd_rd_val : 65'd0 ;
  assign regfile$WE =
	     EN_write_rd && write_rd_rd != 5'd0 ||
	     WILL_FIRE_RL_rl_reset_loop ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_state <= `BSV_ASSIGNMENT_DELAY 2'd0;
      end
    else
      begin
        if (rg_state$EN) rg_state <= `BSV_ASSIGNMENT_DELAY rg_state$D_IN;
      end
    if (rg_j$EN) rg_j <= `BSV_ASSIGNMENT_DELAY rg_j$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_j = 5'h0A;
    rg_state = 2'h2;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkGPR_RegFile

