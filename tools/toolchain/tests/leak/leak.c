#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
    const char old_world[] = "Hello, world!";
    char *new_world = (char *)malloc(strlen(old_world) + 1);
    strcpy(new_world, old_world);
    puts(new_world);

    new_world = (char *)malloc(42);

    return 0;
}
