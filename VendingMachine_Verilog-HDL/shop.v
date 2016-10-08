//Copyright @DENGJIXIANG

module shop(reset,clk,set,display,set_quantity,set_price,money,buy,close,goods,balance,priceA,priceB,priceC,priceD,quantityA,quantityB,quantityC,quantityD);
  input [3:0] money,buy,set,display,set_quantity,set_price;//Ͷ�ң���Ҫ�����Ʒ��ȷ�����ã���ʾ��Ϣ���������������ü۸�
  input reset,clk,close;//��λ��ʱ�ӣ���������˳�
  output [3:0] goods,balance,priceA,priceB,priceC,priceD,quantityA,quantityB,quantityC,quantityD;//��������Ʒ����������Ʒ�ļ۸������

  reg [7:0] ram[0:3];//�������飬����λΪ����������λΪ�۸�
  reg [3:0] counter,//Ӳ�Ҵ�����
            balance,priceA,priceB,priceC,priceD,quantityA,quantityB,quantityC,quantityD;
  reg [3:0] goods;
  integer i;  
 
   always @*
    begin
      if(reset)//��ʼ��
        begin
          counter=0;
          priceA=0;priceB=0;priceC=0;priceD=0;quantityA=0;quantityB=0;quantityC=0;quantityD=0;
          for(i=0;i<4;i=i+1)
              ram[i]=0;//����������ȫ����ֵ0
        end

      else if(close)//����������˳�
        begin
          counter=0;

        end
    
      if(ram[buy-1][7:4]>=1)//��֤��Ʒ�Ƿ��п��
        begin
          if(ram[buy-1][3:0]<=counter)//��֤Ͷ�ҽ���Ƿ��㹻����Ʒ
          begin
            balance=counter-ram[buy-1][3:0];//�����������ʵʱ���
            ram[buy-1][7:4]=ram[buy-1][7:4]-1;//�������Ʒ������ʵʱ��һ
            goods=buy;//����Ѿ��������Ʒ          
          end
        else
          $display("���㣡");
        end
      else 
        $display("���ۿգ�");
      end
      
      always @set//������Ʒ�ļ۸������
      begin
        ram[set-1][3:0]=set_price;//����Ҫ���õļ۸���봢�������Ӧset��λ�ã���������ram[set-1]����Ϊset-1��Ŀ�����ڷ����������������������Ʒ1������ƷA������set=1����Ʒ��Ϣ����ram[0]����������ĵ�һλ
        ram[set-1][7:4]=set_quantity;//��������ԭ��ͬ��
      end
      
      always @money//Ͷ���Ӳ�ң���Ͷ���������������Ǯ
        counter=counter+money;
        
      always @display//�����úõĻ����б仯����Ʒ��Ϣ��ʾ�������������������ĸ���Ʒ�������������ӣ���Ҫ��Ӧram[]��������Ĵ洢��
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
