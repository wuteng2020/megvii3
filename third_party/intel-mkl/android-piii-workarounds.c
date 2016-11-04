#include <stdio.h>
#include <errno.h>

#if defined(stderr)
#pragma push_macro("stderr")
#undef stderr

FILE *stderr =

#pragma pop_macro("stderr")
               stderr;
#endif

#if defined(stdout)
#pragma push_macro("stdout")
#undef stdout

FILE *stdout =

#pragma pop_macro("stdout")
               stdout;
#endif

volatile int * __errno_location(void)
{
    return &errno;
}

void *catopen(const char *name, int flag)
{
    /*errno = EACCES*/;
    return (void*)(-1);
}

void *catgets(void *catalog, int setno, int msgno, void *message)
{
    return message;
}

typedef struct dl_tls_index
{
    unsigned long int ti_module;
    unsigned long int ti_offset;
} tls_index;

void *
__attribute__ ((__regparm__ (1)))
___tls_get_addr (tls_index *ti)
{
    return 0;
}
