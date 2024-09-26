//+------------------------------------------------------------------+
//|                                                   Empire8.mq5    |
//|                             Copyright 2017, Shcherbyna Rostyslav |
//| Prediction Indicator (not trend following),                      |
//| always step forward from price                                   |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, Shcherbyna Rostyslav"
#property link      ""
#property description "Prediction Indicator, predicts current Close at current Open"
#property description "Very usefull in range market"
#property description "added Rost Tren/Range Filter, Copyright 2018"
#property version   "8.01"

// * * * USE ONLY OPEN PRICE !!! * * *
#property indicator_applied_price PRICE_OPEN
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_plots   1

#property indicator_label1  "Empire"
#property indicator_type1   DRAW_COLOR_LINE
#property indicator_color1  clrLimeGreen,clrDarkOrange,clrGray
#property indicator_style1  STYLE_SOLID
#property indicator_width1  5
//+------------------------------------------------------------------+
//|  * * * Rost Filter Type ENUM * * *                               |
//+------------------------------------------------------------------+
enum ENUM_ROST_FILTER_TYPE
  {
   OOCC,            // OpenOpen CloseClose
   LLHH,            // LowLow HighHigh
   OHLC2,           // OO HH LL CC
   OOCC_X,          // OOCC X Period
   OHLC2_X,         // OHLC2 X Period
  };
//+------------------------------------------------------------------+
//|  * * * Rost Trend ENUM * * *                                     |
//+------------------------------------------------------------------+
enum ENUM_ROST_TREND
  {
   Range=-1,      //  Range
   Unknown=0,     //  Unknown
   Trend=1,       //  Trend
  };
//+------------------------------------------------------------------+
//|  * * *  SIGNAL ENUM * * *                                        |
//+------------------------------------------------------------------+
enum ENUM_SIGNAL
  {
   Buy=0,      //  BUY
   Sell=1,     //  SELL
   NoSignal=2, //  NoSignal
  };
//+------------------------------------------------------------------+
//|  * * * INPUT * * *                                               |
//+------------------------------------------------------------------+
input int                   _inpPeriod=2;             // Calculation period
input int                   _inpDepth=1;              // Depth
input bool                  _inpRostFilter=false;     // Rost Filter 
input ENUM_ROST_FILTER_TYPE _inpRostFilterType=OOCC;  // Filter Type
input ushort                _inpRostFilter_X=5;       // X Period in RFilter
input bool                  _inpRange=false;          // Range Signals
                                                      //
double arrMA[];
double arrColor[];
int totalBars;
double arrParabol[][25];

// * * * Rost Trend * * *
ENUM_ROST_TREND RostTrend=Unknown;
//+------------------------------------------------------------------+
//|  * * * INIT * * *                                                |
//+------------------------------------------------------------------+
int OnInit()
  {
   SetIndexBuffer(0,arrMA,INDICATOR_DATA);
   SetIndexBuffer(1,arrColor,INDICATOR_COLOR_INDEX);
   IndicatorSetString(INDICATOR_SHORTNAME,"EMP ("+(string)_inpPeriod+") "+(string)_inpDepth);

//Check Correct Params
   if((_inpDepth>10) || (_inpPeriod<1)) return(INIT_PARAMETERS_INCORRECT);

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| * * * MAIN CYCLE * * *                                           |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   totalBars=rates_total;

   int depth=(int)MathMax(MathMin(_inpDepth,25),1);
   for(int i=(int)MathMax(prev_calculated-1,1); i<rates_total; i++)
     {
      double Price=open[i];

      if(Price==EMPTY_VALUE) Price=0;

      for(int k=0; k<depth; k++)
         Price=Empire(Price,_inpPeriod,i,k);

      arrMA[i]=Price;

      // * * * HISTORY MODE * * *
      if(i>0)
        {
         arrColor[i]=NoSignal;
         //arrColor[i-1];

         //Rost Trend/Range Filter
         if(_inpRostFilter)
           {
            RostTrend=RostFilter(i,_inpRostFilterType,_inpRostFilter_X,open,high,low,close);
            if(arrMA[i]>arrMA[i-1])
              {
               arrColor[i]=(RostTrend==Trend) ? Buy:Sell;
               Sleep(1);
              }
            else if(arrMA[i]<arrMA[i-1])
              {
               arrColor[i]=(RostTrend==Trend) ? Sell:Buy;
               Sleep(1);
              }
           }
         // Without Rost Trend\Range Filter
         else
           {
            if(arrMA[i]>arrMA[i-1]) arrColor[i]=(_inpRange) ? Sell:Buy;
            else if(arrMA[i]<arrMA[i-1]) arrColor[i]=(_inpRange) ? Buy:Sell;
           }
        }
      // * * * REALTIME MODE * * *        
      else arrColor[i]=NoSignal;
     }//END OF FOR

   return(rates_total);
  }
//+------------------------------------------------------------------+
//| * * * Rost Trend\Range Filter * * *                              |
//+------------------------------------------------------------------+ 
ENUM_ROST_TREND RostFilter(const int &i,const ENUM_ROST_FILTER_TYPE &Type,const ushort &X_Period,
                           const double &open[],
                           const double &high[],
                           const double &low[],
                           const double &close[])
  {
   ENUM_ROST_TREND result=Unknown;

//Start Calculating only after first 3 Prices
   if(i<3) return(Unknown);

//Rost Filter
   switch(Type)
     {
      // For Buy Close-1 > Close-2 && Open-1 > Open-2 (and vice versa for Sell)
      case  OOCC:
         result=(((close[i-1]>close[i-2]) && (open[i-1]>open[i-2]))
                 || ((close[i-1]<close[i-2]) && (open[i-1]<open[i-2]))) ? Trend:Range;
      break;

      // For Buy High-1 > High-2 && Low-1 > Low-2  (and vice versa for Sell)
      case  LLHH:
         result=(((low[i-1]>low[i-2]) && (high[i-1]>high[i-2]))
                 || ((low[i-1]<low[i-2]) && (high[i-1]<high[i-2]))) ? Trend:Range;
      break;

      // For Buy OO HH LL CC  (and vice versa for Sell)
      case  OHLC2:
         result=(((low[i-1]>low[i-2]) && (high[i-1]>high[i-2]) && (close[i-1]>close[i-2]) && (open[i-1]>open[i-2]))
                 || ((low[i-1]<low[i-2]) && (high[i-1]<high[i-2]) && (close[i-1]<close[i-2]) && (open[i-1]<open[i-2]))
                 ) ? Trend:Range;
      break;

      // case OHLC2_X
      // break;
      // case OOCC2_X
      // break;
      // NonExisten Case
      default:return(Unknown);
      break;
     }

// Return result     
   return(result);
  }
//+------------------------------------------------------------------+
//| * * * Empire Parabolic MultiPass Average * * *                   |
//+------------------------------------------------------------------+
double Empire(const double &price,const double period,const int &r,const int &instanceNo)
  {
// * * * Linear Weighted MA * * *
   if(ArrayRange(arrParabol,0)!=totalBars) ArrayResize(arrParabol,totalBars,100000);

   arrParabol[r][instanceNo]=price;
   double sumw = period*period;
   double sum  = sumw*price;

   for(int k=1; k<period && (r-k)>=0; k++)
     {
      double weight=(period-k)*(period-k);
      sumw  += weight;
      sum   += weight*arrParabol[r-k][instanceNo];
     }
   return(sum/sumw);
  }
//+------------------------------------------------------------------+
