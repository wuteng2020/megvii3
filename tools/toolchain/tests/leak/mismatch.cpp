#include <memory>
#include <cstring>
#include <cstdlib>

int main()
{
    const char old_world[] = "Hello, world!";
    char *new_world = new char[strlen(old_world) + 1];
    strcpy(new_world, old_world);
    free(new_world);

    return 0;
}
