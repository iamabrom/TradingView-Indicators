// author: @iamAbrom
// License: https://github.com/iamabrom/TradingView-Indicators/blob/main/LICENSE
//@version=3

study(title="MACD Crossover for Crypto", overlay=true)
fMA = input(title="Fast Moving Average", type = integer, defval = 20, minval = 7)
sMA = input(title="Slow Moving Average", type = integer, defval = 40, minval = 7)
signalLength = input(8,minval=1)

[currentMacd,_,_] = macd(close[0], fMA, sMA, signalLength)
[prevMacd,_,_] = macd(close[1], fMA, sMA, signalLength)
signal = ema(currentMacd, signalLength)

crossoverSell = cross(currentMacd, signal) and currentMacd < signal ? avg(currentMacd, signal) : na
crossoverBuy = cross(currentMacd, signal) and currentMacd > signal ? avg(currentMacd, signal) : na

plotshape(crossoverSell, title='MACDCrossoverSell', style=shape.triangledown, text='SELL', location=location.abovebar, color=red, textcolor=red, size=size.small) 
plotshape(crossoverBuy, title='MACDCrossoverBuy', style=shape.triangleup, text='BUY', location=location.belowbar, color=green, textcolor=green, size=size.small) 

alertcondition(crossoverSell, "MACD Sell Indicator", "MACD Sell Indicator (Bearish Crossover)")
alertcondition(crossoverBuy, "MACD Buy Indicator", "MACD Buy Indicator (Bullish Crossover)")
