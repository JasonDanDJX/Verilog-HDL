//Copyright @DENGJIXIANG
module stimulus;
  reg clock,key;
  wire red,green;
  trafficlight test(red,green,key,clock); 
  initial
  begin
  clock=1'b0;//��ʱ��
  key=1'b0;
  end
  initial
  forever
  #10 clock=~clock;
  initial
  begin
  #50 key=1'b1;//���˰���
  #1 key=1'b0;
  #50 key=1'b1;//�ڶ������˰���
  #1 key=1'b0;
  #100 key=1'b1;//���������˰���
  #1 key=1'b0;
  end
  initial
  $monitor($time,"red=%b\n,green=%b\n,key=%b\n",red,green,key);
endmodule

  
