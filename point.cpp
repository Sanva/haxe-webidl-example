#include <math.h>
#include "point.h"

double Point::length() {
	return sqrt(x * x + y * y);
}

void Point::mutateTuple(int vector[]) {
	vector[0] = x;
	vector[1] = y;
}
