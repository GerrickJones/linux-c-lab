#include <stdio.h>
#include <string.h>

/* Module 3 - Advanced: arrays & pointers, strings & files, structures */
struct Person {
    char name[50];
    int age;
};

int main(void) {
    /* Arrays and pointers */
    int arr[3] = {1, 2, 3};
    int *ptr = arr;
    for (int i = 0; i < 3; i++) {
        printf("%d\n", *(ptr + i));
    }

    /* Strings and files */
    FILE *file = fopen("output.txt", "w");
    if (file == NULL) {
        perror("fopen");
        return 1;
    }
    fprintf(file, "Text\n");
    fclose(file);
    printf("Wrote output.txt\n");

    /* Structures */
    struct Person p;
    strcpy(p.name, "Alice");
    p.age = 25;
    printf("Person: %s, %d\n", p.name, p.age);
    return 0;
}
