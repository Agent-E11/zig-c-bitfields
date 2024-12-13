#include <lib.h>

struct CValue create_c_value() {
    struct CValue v;

    v.a = 1;
    v.b = 1;
    v.c = 1;

    return v;
}
