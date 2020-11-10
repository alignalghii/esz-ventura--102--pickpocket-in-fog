size(10cm, 0);

string dollar(string formula) {return "$" + formula + "$";}
string dollar(int numlit) {return dollar(string(numlit));}

struct Choice
{
	pair O;
	int val;

	void operator init(pair O = (0, 0), int val = 0) {this.O = O; this.val = val;}

	void core()
	{
		dot(O, yellow+25);
		label(dollar(val), O);
	}

	Choice step()
	{
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

		core();
		dot(G1, 5+green);
		dot(P1, 5+red);

		label(expect, GP1, 2.6S);

		return Choice(M1, val+1);
	}

	void steps(int n)
	{
		bool flag = false;
		Choice last = this;
		for (int i = 0; i < n; ++i) {
			last = last.step();
		}
		last.core();
	}
}

Choice().steps(3);
