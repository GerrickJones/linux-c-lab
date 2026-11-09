#include <stdio.h>

/* Module 3 - Easy: Hello World, variables, and input */
int main(void) {
    printf("Hello, C!\n");

    int num = 5;
    printf("Number: %d\n", num);

    int age;
    printf("Enter your age: ");
    if (scanf("%d", &age) != 1) {
        printf("Invalid input.\n");
        return 1;
    }
    printf("Age: %d\n", age);
    return 0;
}
