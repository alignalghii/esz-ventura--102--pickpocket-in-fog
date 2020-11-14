import labeling;

struct Formula
{
	string type; // @TODO OOP

	string literal;
	string numerator;
	string nominator;
	string weight;

	void operator init(string a, string b = "", string q = "")
	{
		int n = stringIndicator(a) + stringIndicator(b) + stringIndicator(q);
		if (n == 1) {
			type = "literal";
			literal = a;
		}
		if (n == 2) {
			type = "fraction";
			numerator = a;
			nominator = b;
		}
		if (n == 3) {
			type = "weighted";
			numerator = a;
			nominator = b;
			weight    = q;
		}
	}

	string show() // @TODO OOP
	{
		string formula = ""; bool flag = false; // @TODO `Maybe`
		if (type == "literal" ) {flag = true; formula = literal;}
		if (type == "fraction") {flag = true; formula = formFrac(numerator, nominator);}
		if (type == "weighted") {flag = true; formula = formWeighted(numerator, nominator, weight);}
		if (!flag) abort("`Formula` type problem at `show`");
		return dollar(formula);
	}

	Formula dec(bool leftFlag = true)
	{
		if (type == "literal" ) return Formula(algdec(literal));
		if (type == "fraction") return Formula(leftFlag ? numerator : algdec(numerator), algdec(nominator));
		if (type == "weighted") return Formula(numerator, algdec(nominator), alginc(weight));
		abort("Invalid type of `Formula`");
		return null; // only to appease the typechecker
	}

	Formula minus(int i)
	{
		return type == "literal"
		     ? Formula(sminus(literal, i))
		     : Formula(sminus(numerator, i), sminus(nominator, i));
	}
}

Formula F(string a, string b = "", string q = "") {return Formula(a, b, q);}
