import ChoicePar;

size(25cm, 0);

ChoicePar(F("2", "14"), F("2", "14"), F("4", "14"), F("10", "14"))
	.step(
		solid,
		ChoicePar(F("2", "13"), F("2", "13"), F("4", "13"), F("9", "13"), D("1"))
	)
	.steps(3, false)	
	.step(
		solid,
		ChoicePar(F("2", "9"), F("2", "9"), F("4", "9"), F("5", "9"), D("5"))
	)
	.steps(6, false);
