
#include <stdlib.h>

class IntTuple {

	public:

		int *raw;

		IntTuple(int x = 0, int y = 0) {

			raw = (int *) malloc(sizeof(int) * 2);
			raw[0] = x;
			raw[1] = y;

		}

		~IntTuple() {

			free(raw);

		}

		int getX() {

			return raw[0];

		}

		int getY() {

			return raw[1];

		}
	
};
