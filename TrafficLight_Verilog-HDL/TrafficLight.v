//Copyright @DENGJIXIANG
module trafficlight(red,green,key,clock);
  output red,green;
  input key,clock;
  reg red,green;
  
  //״̬��          
  parameter S0=3'd0,//red=1 green=0
            S1=3'd1;//red=0 green=1
            
  reg [2:0] state;
  reg [2:0] next_state;
  
  initial
  state<=S0;
  always @(posedge clock or negedge clock)
    state<=next_state;
    
  always @(state)//����״̬����ͨ��������ת
  begin
    case(state)
      S0: begin
            red=1'b1;
            green=1'b0;
          end
      S1: begin
            red=~red;
            green=~green;
          end
    endcase
  end
  
  always @(state or key)
  begin
  case(state)
    S0: if(key)//���а������£���ʾ����Ҫ����·
        begin
          repeat(2) @(posedge clock or negedge clock);
          next_state= S1 ;
        end
        else
          next_state= S0 ;
    S1: begin
          repeat(5) @(posedge clock or negedge clock);
          next_state=S0; 
        end
    default: next_state=S0;
  endcase
end 
endmodule
//Copyright @DENGJIXIANG
