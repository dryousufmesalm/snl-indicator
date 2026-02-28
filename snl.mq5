//+------------------------------------------------------------------+
//|                                            snl.mq5 |
//|                                    Copyright 2025, Yousuf Mesalm. |
//|  www.yousufmesalm.com | WhatsApp +201006179048 | Upwork: https://www.upwork.com/freelancers/youssefmesalm |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, Yousuf Mesalm. www.yousufmesalm.com | WhatsApp +201006179048"
#property link      "https://www.yousufmesalm.com"
#property version   "1.00"
#property indicator_chart_window
#include  <YM\Utilities\Utilities.mqh>
#include <ChartObjects\ChartObjectsLines.mqh>
input int days=40; // look back days
input int TD=22; //Time to Delete in Hours
input bool lineInBackground=true;

//Objects
CChartObjectTrend Hline;
CUtilities tools;
//+------------------------------------------------------------------+
//|  www.yousufmesalm.com | WhatsApp +201006179048 | Upwork: https://www.upwork.com/freelancers/youssefmesalm |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping

//---
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//|  www.yousufmesalm.com | WhatsApp +201006179048 | Upwork: https://www.upwork.com/freelancers/youssefmesalm |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,-1,-1);
  }
//+------------------------------------------------------------------+
//|  www.yousufmesalm.com | WhatsApp +201006179048 | Upwork: https://www.upwork.com/freelancers/youssefmesalm |
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
//---
  
   //--- If it is the first call go through all bars
   int limit=days;
   if(tools.IsNewBar(PERIOD_D1)){
   ObjectsDeleteAll(0,-1,-1);
   for(int i=limit; i>0; i--)
     {
     
      Draw(i);
      
     }
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }

//+------------------------------------------------------------------+
void Draw(int i)
  {
   datetime T=iTime(Symbol(),PERIOD_D1,i);
   double H=iHigh(Symbol(),PERIOD_D1,i);
   double L=iLow(Symbol(),PERIOD_D1,i);
   Hline.Create(0,TimeToString(T,TIME_DATE)+"0",0,T,H,TimeCurrent(),H);
   Hline.Create(0,TimeToString(T,TIME_DATE)+"1",0,T,L,TimeCurrent(),L);
   
  }
//+------------------------------------------------------------------+
