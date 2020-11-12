import labeling;

struct Formula
{
	string type;
	string literal;
	string numerator;
	string nominator;

	void operator init(string a, string b = "")
	{
		if (length(b) > 0) {
			type = "fraction";
			numerator = a;
			nominator = b;
		} else {
			type = "literal";
			literal = a;
		}
	}

	string show() {return dollar(type == "literal" ? literal : formFrac(numerator, nominator));}

	Formula dec(bool leftFlag = true)
	{
		return type == "literal"
		     ? Formula(algdec(literal))
		     : Formula(leftFlag ? numerator : algdec(numerator), algdec(nominator));
	}

	Formula minus(int i)
	{
		return type == "literal"
		     ? Formula(sminus(literal, i))
		     : Formula(sminus(numerator, i), sminus(nominator, i));
	}
}

Formula F(string a, string b = "") {return Formula(a, b);}
