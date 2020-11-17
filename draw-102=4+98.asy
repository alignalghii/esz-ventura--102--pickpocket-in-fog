import ChoicePar;

size(15cm, 0);

ChoicePar(F("2", "102"), F("2", "102"), F("4", "102"), F("98", "102"))
	.steps(2)
	.step(
		solid,
		ChoicePar(F("2", "99"), F("2", "99"), F("4", "99"), F("95", "99"), D("3"))
	)
	.steps(5);
