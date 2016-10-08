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
    //开始设置，可任意设置商品价格和数量
    #10 set=1;display=0;set_quantity=4'd10;set_price=4'd5;
    #10 set=0;
    #10 set=2;set_quantity=4'd10;set_price=4'd4;
    #10 set=0;
    #10 set=3;set_quantity=4'd10;set_price=4'd3;
    #10 set=0;
    #10 set=4;set_quantity=4'd10;set_price=4'd10;
    #10 set=0;display=4'd1;
    
    //第一次购买
    #10 money=4'd10; //投币十元 
    #5 buy=4'd2;//购买商品2（即商品B）
    #10 close=1;display=0;//购买结束，退出时显示余额和商品剩余数量
    #5  close=0;display=4'd1;buy=4'd0;//若不将close，display，buy信号复位，则结果出错
   
    //第二次购买，已经设置的商品
    #10 money=4'd8;//投币八元  
    #5 buy=4'd1;//购买商品1（即商品A）
    #10 close=1;display=0;//购买结束
    #5  close=0;display=4'd1;buy=4'd0;
    #5 buy=4'd1;//购买商品1（即商品A）
    #10 close=1;display=0;//购买结束
    #5  close=0;display=4'd1;buy=4'd0;
     
  end
  initial
    $monitor($time, "reset=%d\n,clk=%d\n,set=%d\n,display=%d\n,set_quantity=%d\n,set_price=%d\n,money=%d\n,buy=%d\n,close=%d\n,goods=%d\n,balance=%d\n,priceA=%d\n,priceB=%d\n,priceC=%d\n,priceD=%d\n,quantityA=%d\n,quantityB=%d\n,quantityC=%d\n,quantityD=%d\n",
    reset,clk,set,display,set_quantity,set_price,money,buy,close,goods,balance,priceA,priceB,priceC,priceD,quantityA,quantityB,quantityC,quantityD); 
endmodule
//Copyright @DENGJIXIANG
