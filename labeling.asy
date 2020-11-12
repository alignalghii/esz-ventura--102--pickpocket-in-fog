string dollar(string formula) {return "$" + formula + "$";}
string dollar(int numlit) {return dollar(string(numlit));}

string texArg(string a) {return "{" + a + "}";}

string formFrac(string num, string nom) {return "\frac" + texArg(num) + texArg(nom);}

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
string at0(string s, int i) {return substr(s, i, 1);}
string at1(string s, int i) {return at0(s, i-1);}
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
