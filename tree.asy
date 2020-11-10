size(10cm, 0);

struct R
{
	pair O;
	int val;

	void operator init(pair O, int val) {this.O = O; this.val = val;}
}

R step(R r)
{
	pair O  = r.O;
	int val = r.val;
	string expect = format("$" + string(val) + "\cdot p^{%d}\left(1-p\right)$", val);

	real x = O.x;
	real y = O.y;

	pair G1 = (x - 1.1, y - 1);
	pair P1 = (x - 0.9, y - 1);
	pair GP1 = (G1 + P1) / 2;
	pair M1 = (x + 1  , y - 1);

	path g1 = O--G1;
	path p1 = O--P1;
	path m1 = O--M1;

	draw("$\frac{1-p}2$", g1, RightSide);
	draw("$\frac{1-p}2$", p1, LeftSide );
	draw("$p$", m1, LeftSide );

	dot(O, defaultpen+5);
	dot(G1, 5+green);
	dot(P1, 5+red);



	label("$" + string(r.val) + "$", O, NE);
	label(expect, GP1, 2.6S);

	R r2 = R(M1, val+1);
	return r2;
}

void step0(R r)
{
	dot(r.O, defaultpen+5);
	label(format("$%d$", r.val), r.O, NE);
}


pair O = (0, 0);
R r = R(O, 0);


R r1 = step(r );
R r2 = step(r1);
R r3 = step(r2);

step0(r3);
