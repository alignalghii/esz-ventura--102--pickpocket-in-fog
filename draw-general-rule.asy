import ChoicePar;

size(25cm, 0);

ChoicePar(F("a_R", "A+n"), F("a_K", "A+n"), F("A", "A+n", "0"), F("n", "A+n"))
	.steps(2, false)
	.step(
		dashed,
		ChoicePar(F("a_R", "A+n-i"), F("a_K", "A+n-i"), F("A", "A+n-i", "i"), F("n-i", "A+n-i"), D("i"))
	)
	.step()
	.step(
		dashed,
		ChoicePar(F("a_R", "A+2"), F("a_K", "A+2"), F("A", "A+2", "n-2"), F("2", "A+2"), D("n-2"))
	)
	.step()
	.step()
	.step(noline);
