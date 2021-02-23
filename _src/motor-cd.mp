input boxes;

prologues := 3;
outputformat := "svg";
outputtemplate := "%j-%c.%o";

beginfig(1);

circleit.msum(btex $+$ etex);
boxit.mdev(btex $1\over {L_as + R_a}$ etex);
boxit.mtorq(btex $K_t$ etex);
boxit.rotor(btex $1 \over {Js + B}$ etex);
boxit.int1(btex $1\over s$ etex);
boxit.gen(btex $K_v$ etex);

msum.w - z1 = mdev.w - msum.e = (7mm,0);
mtorq.w - mdev.e = rotor.w - mtorq.e = (7mm,0);
z2 - rotor.e = z3 - z2 = (7mm,0);

mtorq.c - gen.c = z2 - z4 = msum.c - z5 = (0,10mm);

drawboxed(msum,mdev,mtorq,rotor, gen);

label.top(btex $V_a$ etex, z1);
dotlabel.top(btex $\Omega(s)$ etex, z2);


drawarrow z1--msum.w;
drawarrow msum.e--mdev.w;
drawarrow mdev.e--mtorq.w;
drawarrow mtorq.e--rotor.w;
drawarrow rotor.e--z3;
drawarrow z2--z4--gen.e;
drawarrow gen.w--z5--msum.s;

endfig;

end

