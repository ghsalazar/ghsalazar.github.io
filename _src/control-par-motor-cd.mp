input boxes;

prologues := 3;
outputformat := "svg";
outputtemplate := "%j-%c.%o";

beginfig(1);

circleit.sum1(btex $+$ etex);
boxit.ct("PI");
boxit.dv(btex $1\over {L_as + R_a}$ etex);
boxit.trq(btex $K_t$ etex);
boxit.rotor(btex $1 \over {Js + B}$ etex);
boxit.int1(btex $1\over s$ etex);
boxit.gen(btex $K_v$ etex);

sum1.w - z1 = ct.w - sum1.e = dv.w - ct.e = (7mm,0);
trq.w - dv.e = rotor.w - trq.e = (7mm,0);
z2 - rotor.e = int1.w - z2 = z3 - int1.e = (7mm,0);

trq.c - gen.c = z2 - z4 = sum1.c - z5 = (0,10mm);

drawboxed(sum1,ct,dv,trq,rotor,int1, gen);

label.lft(btex $r$ etex, z1);
dotlabel.top(btex $\Omega(s)$ etex, z2);
label.rt(btex $\Theta(s)$ etex, z3);

drawarrow z1--sum1.w;
drawarrow ct.e--dv.w;
drawarrow sum1.e--ct.w;
drawarrow dv.e--trq.w;
drawarrow trq.e--rotor.w;
drawarrow rotor.e--int1.w;
drawarrow int1.e--z3;
drawarrow z2--z4--gen.e;
drawarrow gen.w--z5--sum1.s;

endfig;

end

