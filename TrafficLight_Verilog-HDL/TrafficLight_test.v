//Copyright @DENGJIXIANG
module stimulus;
  reg clock,key;
  wire red,green;
  trafficlight test(red,green,key,clock); 
  initial
  begin
  clock=1'b0;//计时器
  key=1'b0;
  end
  initial
  forever
  #10 clock=~clock;
  initial
  begin
  #50 key=1'b1;//有人按键
  #1 key=1'b0;
  #50 key=1'b1;//第二次有人按键
  #1 key=1'b0;
  #100 key=1'b1;//第三次有人按键
  #1 key=1'b0;
  end
  initial
  $monitor($time,"red=%b\n,green=%b\n,key=%b\n",red,green,key);
endmodule

  
