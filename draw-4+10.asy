import ChoicePar;

size(25cm, 0);

ChoicePar(F("2", "4+10"), F("2", "4+10"), F("4", "4+10"), F("10", "4+10"))
	.step(
		solid,
		ChoicePar(F("2", "4+9"), F("2", "4+9"), F("4", "4+9"), F("9", "4+9"), D("1"))
	).steps(10, false);
