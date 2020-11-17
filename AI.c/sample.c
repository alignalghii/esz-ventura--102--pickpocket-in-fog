#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

struct Q_ {int a; int b;};
typedef struct Q_ Q;

// sequence_ $ fmap putStr $ map (\q -> "{" ++ show (numerator q) ++ ", " ++ show (denominator q) ++ "}, ") $ nub [m%n | m <- [0..12], n <- [1..12]]
Q sample[] = {
	{0, 1},
	{1, 1}, {1, 2}, {1, 3}, {1, 4}, {1, 5}, {1, 6}, {1, 7}, {1, 8}, {1, 9}, {1, 10}, {1, 11}, {1, 12},
	{2, 1}, {2, 3}, {2, 5}, {2, 7}, {2, 9}, {2, 11},
	{3, 1}, {3, 2}, {3, 4}, {3, 5}, {3, 7}, {3, 8}, {3, 10}, {3, 11},
	{4, 1}, {4, 3}, {4, 5}, {4, 7}, {4, 9}, {4, 11},
	{5, 1}, {5, 2}, {5, 3}, {5, 4}, {5, 6}, {5, 7}, {5, 8}, {5, 9}, {5, 11}, {5, 12},
	{6, 1}, {6, 5}, {6, 7}, {6, 11},
	{7, 1}, {7, 2}, {7, 3}, {7, 4}, {7, 5}, {7, 6}, {7, 8}, {7, 9}, {7, 10}, {7, 11}, {7, 12},
	{8, 1}, {8, 3}, {8, 5}, {8, 7}, {8, 9}, {8, 11},
	{9, 1}, {9, 2}, {9, 4}, {9, 5}, {9, 7}, {9, 8}, {9, 10}, {9, 11},
	{10, 1}, {10, 3}, {10, 7}, {10, 9}, {10, 11},
	{11, 1}, {11, 2}, {11, 3}, {11, 4}, {11, 5}, {11, 6}, {11, 7}, {11, 8}, {11, 9}, {11, 10}, {11, 12},
	{12, 1}, {12, 5}, {12, 7}, {12, 11}
};
int N = sizeof sample / sizeof(Q);

void sum2(void)
{
	printf("Sum of 2-powers\n");
	for (int i3 = 0; i3 < N; i3++) {
		for (int i2 = 0; i2 < N; i2++) {
			for (int i1 = 0; i1 < N; i1++) {
				for (int i0 = 0; i0 < N; i0++) {
					bool flag = true;
					for (int n = 0; n < 7 && flag; n++) {
						int sum = 0;
						for (int i = 1; i <= n; i++) {
							sum += i * i;
						}
						float q3 = (float)sample[i3].a / (float)sample[i3].b;
						float q2 = (float)sample[i2].a / (float)sample[i2].b;
						float q1 = (float)sample[i1].a / (float)sample[i1].b;
						float q0 = (float)sample[i0].a / (float)sample[i0].b;
						float val = q3*n*n*n + q2*n*n + q1*n + q0;
						float d = val - (float)sum;
						d = d >= 0 ? d : -d;
						flag = flag && d < 0.01;						
						//if (flag) printf("val: %f = %d [d=%f]\n", val, sum, d);
					}
					if (flag) {
						printf("q3 = %d/%d\n", sample[i3].a, sample[i3].b);
						printf("q2 = %d/%d\n", sample[i2].a, sample[i2].b);
						printf("q1 = %d/%d\n", sample[i1].a, sample[i1].b);
						printf("q0 = %d/%d\n", sample[i0].a, sample[i0].b);
						printf("----------\n");
					}
				}
			}
		}
	}
}

void sum3(void)
{
	printf("Sum of 3-powers\n");
	for (int i4 = 0; i4 < N; i4++) {
		for (int i3 = 0; i3 < N; i3++) {
			for (int i2 = 0; i2 < N; i2++) {
				for (int i1 = 0; i1 < N; i1++) {
					for (int i0 = 0; i0 < N; i0++) {
						bool flag = true;
						for (int n = 0; n < 7 && flag; n++) {
							int sum = 0;
							for (int i = 1; i <= n; i++) {
								sum += i * i * i;
							}
							float q4 = (float)sample[i4].a / (float)sample[i4].b;
							float q3 = (float)sample[i3].a / (float)sample[i3].b;
							float q2 = (float)sample[i2].a / (float)sample[i2].b;
							float q1 = (float)sample[i1].a / (float)sample[i1].b;
							float q0 = (float)sample[i0].a / (float)sample[i0].b;
							float val = q4*n*n*n*n + q3*n*n*n + q2*n*n + q1*n + q0;
							float d = val - (float)sum;
							d = d >= 0 ? d : -d;
							flag = flag && d < 0.01;
						}
						if (flag) {
							printf("q4 = %d/%d\n", sample[i4].a, sample[i4].b);
							printf("q3 = %d/%d\n", sample[i3].a, sample[i3].b);
							printf("q2 = %d/%d\n", sample[i2].a, sample[i2].b);
							printf("q1 = %d/%d\n", sample[i1].a, sample[i1].b);
							printf("q0 = %d/%d\n", sample[i0].a, sample[i0].b);
							printf("----------\n");
						}
					}
				}
			}
		}
	}
}

void sum4(void)
{
	printf("Sum of 4-powers\n");
	for (int i5 = 0; i5 < N; i5++) {
		for (int i4 = 0; i4 < N; i4++) {
			for (int i3 = 0; i3 < N; i3++) {
				for (int i2 = 0; i2 < N; i2++) {
					for (int i1 = 0; i1 < N; i1++) {
						for (int i0 = 0; i0 < 1; i0++) { //!!!!
							bool flag = true;
							for (int n = 0; n < 7 && flag; n++) {
								int sum = 0;
								for (int i = 1; i <= n; i++) {
									sum += i * i * i * i;
								}
								float q5 = (float)sample[i5].a / (float)sample[i5].b;
								float q4 = (float)sample[i4].a / (float)sample[i4].b;
								float q3 = (float)sample[i3].a / (float)sample[i3].b;
								float q2 = (float)sample[i2].a / (float)sample[i2].b;
								float q1 = (float)sample[i1].a / (float)sample[i1].b;
								float q0 = (float)sample[i0].a / (float)sample[i0].b;
								float val = q5*n*n*n*n*n + q4*n*n*n*n + q3*n*n*n + q2*n*n + q1*n + q0;
								float d = val - (float)sum;
								d = d >= 0 ? d : -d;
								flag = flag && d < 0.01;
							}
							if (flag) {
								printf("q5 = %d/%d\n", sample[i5].a, sample[i5].b);
								printf("q4 = %d/%d\n", sample[i4].a, sample[i4].b);
								printf("q3 = %d/%d\n", sample[i3].a, sample[i3].b);
								printf("q2 = %d/%d\n", sample[i2].a, sample[i2].b);
								printf("q1 = %d/%d\n", sample[i1].a, sample[i1].b);
								printf("q0 = %d/%d\n", sample[i0].a, sample[i0].b);
								printf("----------\n");
							}
						}
					}
				}
			}
		}
	}
}


int main(void)
{
	printf("Size of sample rationals: %d\n", N);
	sum4();
	return 0;
}
