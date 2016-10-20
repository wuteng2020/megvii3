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

int * __errno_location(void)
{
    return &errno;
}
