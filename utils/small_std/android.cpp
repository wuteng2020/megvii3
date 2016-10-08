#include <stddef.h>

extern "C" {
    __attribute__((visibility("default")))
    char* __cxa_demangle(
            const char* mangled_name, char* buf, size_t* n, int* status) {
        if (status)
            *status = -1;
        return nullptr;
    }
}
