//@version=3
study(title="EMA Ribbon w/200", shorttitle="EMA Ribbon", overlay=true)

dropn(src, n) =>
    na(src[n]) ? na : src

length1 = input(20, title="MA-1 period", minval=1)
length2 = input(25, title="MA-2 period", minval=1)
length3 = input(30, title="MA-3 period", minval=1)
length4 = input(35, title="MA-4 period", minval=1)
length5 = input(40, title="MA-5 period", minval=1)
length6 = input(45, title="MA-6 period", minval=1)
length7 = input(50, title="MA-7 period", minval=1)
length8 = input(55, title="MA-8 period", minval=1)
src = input(close, type=source, title="Source")
dropCandles = input(1, minval=0, title="Drop first N candles")

price = dropn(src, dropCandles)

plot(ema(price, length1), title="MA-1", color=#f5eb5d, transp=0, linewidth=2)
plot(ema(price, length2), title="MA-2", color=#f5b771, transp=0, linewidth=2)
plot(ema(price, length3), title="MA-3", color=#f5b056, transp=0, linewidth=2)
plot(ema(price, length4), title="MA-4", color=#f57b4e, transp=0, linewidth=2)
plot(ema(price, length5), title="MA-5", color=#f56d58, transp=0, linewidth=2)
plot(ema(price, length6), title="MA-6", color=#f57d51, transp=0, linewidth=2)
plot(ema(price, length7), title="MA-7", color=#f55151, transp=0, linewidth=2)
plot(ema(price, length8), title="MA-8", color=#aa2707, transp=0, linewidth=2)

long = ema(close, 200)
plot(long, color = yellow)
