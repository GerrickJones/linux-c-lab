#include <stdio.h>

/* Module 3 - Easy task: add two numbers from input */
int main(void) {
    int a, b;
    printf("Enter first number: ");
    if (scanf("%d", &a) != 1) { printf("Invalid input.\n"); return 1; }
    printf("Enter second number: ");
    if (scanf("%d", &b) != 1) { printf("Invalid input.\n"); return 1; }
    printf("Sum: %d + %d = %d\n", a, b, a + b);
    return 0;
}
