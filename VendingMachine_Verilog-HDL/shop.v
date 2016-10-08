//Copyright @DENGJIXIANG

module shop(reset,clk,set,display,set_quantity,set_price,money,buy,close,goods,balance,priceA,priceB,priceC,priceD,quantityA,quantityB,quantityC,quantityD);
  input [3:0] money,buy,set,display,set_quantity,set_price;//投币，想要买的商品，确认设置，显示信息，设置数量，设置价格
  input reset,clk,close;//复位，时钟，购买完成退出
  output [3:0] goods,balance,priceA,priceB,priceC,priceD,quantityA,quantityB,quantityC,quantityD;//出货的商品，余额，四种商品的价格和数量

  reg [7:0] ram[0:3];//储存数组，高四位为数量，低四位为价格
  reg [3:0] counter,//硬币储存器
            balance,priceA,priceB,priceC,priceD,quantityA,quantityB,quantityC,quantityD;
  reg [3:0] goods;
  integer i;  
 
   always @*
    begin
      if(reset)//初始化
        begin
          counter=0;
          priceA=0;priceB=0;priceC=0;priceD=0;quantityA=0;quantityB=0;quantityC=0;quantityD=0;
          for(i=0;i<4;i=i+1)
              ram[i]=0;//将储存数组全部赋值0
        end

      else if(close)//购买结束，退出
        begin
          counter=0;

        end
    
      if(ram[buy-1][7:4]>=1)//验证商品是否有库存
        begin
          if(ram[buy-1][3:0]<=counter)//验证投币金额是否足够买商品
          begin
            balance=counter-ram[buy-1][3:0];//将购买后的余额实时输出
            ram[buy-1][7:4]=ram[buy-1][7:4]-1;//购买后商品的数量实时减一
            goods=buy;//输出已经购买的商品          
          end
        else
          $display("余额不足！");
        end
      else 
        $display("已售空！");
      end
      
      always @set//设置商品的价格和数量
      begin
        ram[set-1][3:0]=set_price;//将需要设置的价格存入储存数组对应set的位置，这里我在ram[set-1]中设为set-1，目的在于方便操作，例如我想设置商品1（即商品A），则set=1的商品信息存于ram[0]即储存数组的第一位
        ram[set-1][7:4]=set_quantity;//设数量，原理同上
      end
      
      always @money//投入的硬币，可投任意数量任意金额的钱
        counter=counter+money;
        
      always @display//将设置好的或者有变化的商品信息显示出来，这里我设置了四个商品，可以任意增加，但要对应ram[]储存数组的存储量
      begin
        priceA=ram[0][3:0];
        priceB=ram[1][3:0];
        priceC=ram[2][3:0];
        priceD=ram[3][3:0];
        quantityA=ram[0][7:4];
        quantityB=ram[1][7:4];
        quantityC=ram[2][7:4];
        quantityD=ram[3][7:4];
      end
      
endmodule




//Copyright @DENGJIXIANG
