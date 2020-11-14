string at0(string s, int i) {return substr(s, i, 1);}
string at1(string s, int i) {return at0(s, i-1);}

string      enclose(string beg, string end, string core) {return beg + core + end;}
string symbsenclose(string symbpair, string core)
{
	return enclose(
		at1(symbpair, 1),
		at1(symbpair, 2),
		core
	);
}

string dollar(string formula) {return symbsenclose('$$', formula);}
string dollar(int numlit) {return dollar(string(numlit));}

bool contains(string whole, string sub) {return find(whole, sub) >= 0;}
string texArg(string a) {return symbsenclose('{}', a);}
bool isSum(string s) {return contains(s, '+') || contains(s, '-');}
string offerParentheses(string s) {return isSum(s) ? symbsenclose('()', s) : s;}


string formFrac    (string num, string nom)              {return "\frac" + texArg(num) + texArg(nom);}
string formWeighted(string num, string nom, string wght) {return formFrac(num, nom) + '\cdot ' + offerParentheses(wght);}

pen noline = linetype(new real[] {0, 10});

string delFrom(string s, string d) {return replace(s, d, '');}
string unzero(string s)
{
	s = delFrom(s, '+0');
	s = delFrom(s, '+ 0');
	s = delFrom(s, '-0');
	s = delFrom(s, '- 0');
	return s;
}

string sdec(string a) {return a + " - 1";}
string sinc(string a) {return a + " + 1";}

string sminus(string a, int i) {return a + " - " + string(i);}
string last(string s) {return at1(s, length(s));}
int lastDigit(string s) {return hex(last(s));}
string chopLast(string s) {return substr(s, 0, length(s)-1);}
string succLastDigit(string s)
{
	int d = lastDigit(s);
	return string(
		find(s, '-') < 0 ? d+1 : d-1
	);
}
string predLastDigit(string s)
{
	int d = lastDigit(s);
	return string(
		find(s, '-') < 0 ? d-1 : d+1
	);
}
string incLastDigit(string s) {return unzero(chopLast(s) + succLastDigit(s));}
string decLastDigit(string s) {return unzero(chopLast(s) + predLastDigit(s));}

bool isDigit(string d) {return "0" <= d && d <= "9";}
bool isDigital(string s) {int n = length(s); return n > 0 && isDigit(at1(s, n));}
int toInt(string a) {return hex(a);}

string alginc(string a) {return isDigital(a) ? incLastDigit(a) :  sinc(a);}
string algdec(string a)
{
	return isDigital(a)
             ? decLastDigit(a)
	     : sdec(a);
}

string algplus(string s, int n)
{
	for (int i = 0; i < n; ++i)
		s = alginc(s);
	return s;
}

string algminus(string s, int n)
{
	for (int i = 0; i < n; ++i)
		s = algdec(s);
	return s;
}

int stringIndicator(string s) {return length(s) > 0 ? 1 : 0;}
