//+------------------------------------------------------------------+
//|                                                       Empire.mq5 |
//|                             Copyright 2017, Shcherbyna Rostyslav |
//| MultiPass Parabolic Avgs + RSI                                   |
//| Shows Excellent BUY\SELL Zones                                   |
//| Was not include last bar in calculation (not redrawned)          |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, Shcherbyna Rostyslav"
#property link      ""
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   1
#property indicator_applied_price PRICE_OPEN

#property indicator_label1  "EMP"
#property indicator_type1   DRAW_COLOR_LINE
#property indicator_color1  clrLimeGreen,clrDarkOrange
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2

//---INPUT
input int              _inpPeriod = 5;       // Period (def:5)
input int              _inpDepth  = 3;       // Depth (<10)


//---Plot Buffers
double arrMA[];
double arrColor[];
//---Calculation Only
double arrParabol[][25];
//---FLAGS
bool FirstStart=true;
int total=0;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,arrMA,INDICATOR_DATA);
   SetIndexBuffer(1,arrColor,INDICATOR_COLOR_INDEX);
   IndicatorSetString(INDICATOR_SHORTNAME,(string)_inpPeriod);
//   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);
//Check Correct Params
   if((_inpDepth>10) || (_inpPeriod<2)) return(INIT_PARAMETERS_INCORRECT);

//ReInit
   FirstStart=true;

//If Ok                      
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const int begin,
                const double &price[])
  {
/*
//FIRST START
   if(FirstStart)
     {
      ArrayResize(arrParabol,rates_total);
      FirstStart=false;
     }

//Do Not Calculate Latest Bar many times
   if(prev_calculated==rates_total) return(rates_total);

//Calculate only new One Bar
   int Start=1;

//Calculate firstly all bars
   if(prev_calculated>3) Start=prev_calculated-1;
*/
   total=rates_total;
//---MAIN CALCULATION
   for(int i=(int)MathMax(prev_calculated-1,1);i<rates_total;i++)
     {
      double xPrice=price[i];
      if(xPrice==EMPTY_VALUE) xPrice=0;

      //--Calculate Parabolic in Layers
      for(int j=0;j<_inpDepth;j++)
         arrMA[i]=iEmpire(xPrice,i,j);

      //-Draw Color
      if(i>0)
        {
         arrColor[i]=arrColor[i-1];
         if(arrMA[i]>arrMA[i-1]) arrColor[i]=0;
         else if(arrMA[i]<arrMA[i-1]) arrColor[i]=1;
        }
      else arrColor[i]=0;
     }//END OF MAIN

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Empire Line                                                      |
//+------------------------------------------------------------------+
double iEmpire(const double &Price,const int &BarNo,const int &LayerNo)
  {
   if(ArrayRange(arrParabol,0)!=total) ArrayResize(arrParabol,total);
   arrParabol[BarNo][LayerNo]=Price;

   double sumw = _inpPeriod*_inpPeriod;
   double sum  = sumw*Price;

   for(int i=1; i<_inpPeriod && (BarNo-i)>=0; i++)
     {
      double weight=(_inpPeriod-i)*(_inpPeriod-i);
      sumw  += weight;
      sum   += weight*arrParabol[BarNo-i][LayerNo];
     }
   return(sum/sumw);
  }
//+------------------------------------------------------------------+
