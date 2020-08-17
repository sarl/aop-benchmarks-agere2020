// parameters --
// number of matchs: __NBMATCHS__
// number of balls: __NBBALLS__
// delay: __DELAY__

ended(0).
t_total(__NBBALLS__).

!init.

+!init : t_total(T) =>
    #println("start at:");
    #println(#System.currentTimeMillis());
    N = "ponger" + #executionContext.name.replaceAll("pinger","");
    for(I in between(1,T,I)) {
          W = #math.random() * __DELAY__;
          #achieve(N, pong(W));
        }
   .

   !init.

@atomic
+!finished : ended(I) && t_total(T) =>
    if(T == I + 1) {
        #println("done at:");
        #println(#System.currentTimeMillis());
        #std.coms.exit();
    };
    -ended(I);
    +ended(I + 1)
.

