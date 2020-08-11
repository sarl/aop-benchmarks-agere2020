agents(500).
tokens(250).
token_value(50000).

!init.

+!init : agents(W) && tokens(T) && token_value(V) =>
    #println("start at:");
    #println(#System.currentTimeMillis());
    +not_done(T);
    for(I in between(1,T,I)) {
          J = #std.math.round(I * ( W / T ));
          #achieve("thread"+J,token(V));
        }
   .

@atomic
+!done : not_done(T) =>
    if(T == 1) {
        #println("done at:");
        #println(#System.currentTimeMillis());
        #std.coms.exit();
    };
    -not_done(T);
    +not_done(T - 1)
.
