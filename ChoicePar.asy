import labeling;
import Formula;
import Depth;

struct ChoicePar
{
	Formula left1, left2, left, right;
	Depth depth;

	pair O;

	void operator init(Formula left1_, Formula left2_, Formula left_, Formula right_, Depth depth_ = D("0"),  pair O_ = (0, 0))
	{
		left1 = left1_;
		left2 = left2_;
		left  = left_ ;
		right = right_;
		depth = depth_;

		O = O_;
	}

	ChoicePar clone() {return ChoicePar(left1, left2, left, right, depth, O);}

	void core()
	{
		dot(O, yellow+28);
		label(depth.show(), O);
	}

	ChoicePar relocate(pair O)
	{
		ChoicePar cln = clone();
		cln.O = O;
		return cln;
	}

	ChoicePar step(pen furtherLine = solid, ChoicePar rebuilder = null)
	{
		bool inheriting = rebuilder == null;
		bool sequencer = furtherLine == dashed;

		real x = O.x;
		real y = O.y;

		pair G1 = (x - 1.1, y - 1);
		pair P1 = (x - 0.9, y - 1);
		pair GP1 = (G1 + P1) / 2;
		pair M1 = !sequencer ? (x + 1  , y - 1) : (x + 1.5, y - 1.5);

		path g1 = O--G1;
		path p1 = O--P1;
		path m1 = O--M1;

		draw(left1.show(), g1, RightSide);
		draw(left2.show(), p1, LeftSide );
		draw(!sequencer ? right.show() : "", m1, LeftSide, furtherLine);
		core();
		dot(G1, 5+green);
		dot(P1, 5+red);

		label(left.show(), GP1, 2.6S);

		return inheriting
		     ? ChoicePar(left1.dec(), left2.dec(), left.dec(), right.dec(false), depth.succ(), M1)
		     : rebuilder.relocate(M1);
	}

	ChoicePar steps(int n, bool close = true)
	{
		bool flag = false;
		ChoicePar last = this;
		for (int i = 0; i < n; ++i) {
			last = last.step();
		}
		if (close)
			last.core();
		return last;
	}
}
