//Copyright @DENGJIXIANG

module stimulus;
  reg [3:0] money,buy,set,display,set_quantity,set_price;
  reg reset,clk,close;
  wire [3:0] goods,balance;
  wire [3:0] priceA,priceB,priceC,priceD,quantityA,quantityB,quantityC,quantityD;
  
  shop test(reset,clk,set,display,set_quantity,set_price,money,buy,close,goods,balance,priceA,priceB,priceC,priceD,quantityA,quantityB,quantityC,quantityD);
  
   initial
  begin
    clk=1'b0;
    reset=1;
    set=0;
    display=0;
    #5 reset=0;
  end
  initial
  forever #10 clk=~clk;

  initial
  begin
    //��ʼ���ã�������������Ʒ�۸������
    #10 set=1;display=0;set_quantity=4'd10;set_price=4'd5;
    #10 set=0;
    #10 set=2;set_quantity=4'd10;set_price=4'd4;
    #10 set=0;
    #10 set=3;set_quantity=4'd10;set_price=4'd3;
    #10 set=0;
    #10 set=4;set_quantity=4'd10;set_price=4'd10;
    #10 set=0;display=4'd1;
    
    //��һ�ι���
    #10 money=4'd10; //Ͷ��ʮԪ 
    #5 buy=4'd2;//������Ʒ2������ƷB��
    #10 close=1;display=0;//����������˳�ʱ��ʾ������Ʒʣ������
    #5  close=0;display=4'd1;buy=4'd0;//������close��display��buy�źŸ�λ����������
   
    //�ڶ��ι����Ѿ����õ���Ʒ
    #10 money=4'd8;//Ͷ�Ұ�Ԫ  
    #5 buy=4'd1;//������Ʒ1������ƷA��
    #10 close=1;display=0;//�������
    #5  close=0;display=4'd1;buy=4'd0;
    #5 buy=4'd1;//������Ʒ1������ƷA��
    #10 close=1;display=0;//�������
    #5  close=0;display=4'd1;buy=4'd0;
     
  end
  initial
    $monitor($time, "reset=%d\n,clk=%d\n,set=%d\n,display=%d\n,set_quantity=%d\n,set_price=%d\n,money=%d\n,buy=%d\n,close=%d\n,goods=%d\n,balance=%d\n,priceA=%d\n,priceB=%d\n,priceC=%d\n,priceD=%d\n,quantityA=%d\n,quantityB=%d\n,quantityC=%d\n,quantityD=%d\n",
    reset,clk,set,display,set_quantity,set_price,money,buy,close,goods,balance,priceA,priceB,priceC,priceD,quantityA,quantityB,quantityC,quantityD); 
endmodule
//Copyright @DENGJIXIANG
