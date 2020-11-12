import labeling;

struct Depth
{
	string index;

	void operator init(string i) {index = i;}

	string show() {return dollar(index);}

	Depth succ() {return Depth(alginc(index));}
}

Depth D(string i) {return Depth(i);}
