// parameters --
// number of matchs: __NBMATCHES__
// number of balls: 2
// delay: 2

ended(0).
terminated(0).
t_total(2).
m_total(__NBMATCHES__).

!init.

+!init : t_total(T) & .my_name(M) &
             .delete("pinger", M, NS) &
             .concat("ponger", NS, N) <-
    Time = system.time;
    .print("start at: ", Time);
    for ( .range(I,1,T) ) {
        W = math.random(2);
        .send(N, achieve, pong(W));
    }.

@lm[atomic]
+!finished : ended(I) & t_total(T) & T > I + 1 <-
    -+ended(I+1).

+!finished <-
    .send("pinger1", achieve, terminate).

@lm2[atomic]
+!terminate : terminated(I) & m_total(M) & M > I + 1 <-
    -+terminated(I+1).

+!terminate <-
    Time = system.time;
    .print("done at: ", Time);
    .stopMAS.
