#include <stdio.h>

/* Module 3 - Intermediate: conditionals, loops, functions */
int add(int a, int b) {
    return a + b;
}

int main(void) {
    int num;
    printf("Enter a number: ");
    if (scanf("%d", &num) != 1) { printf("Invalid input.\n"); return 1; }

    if (num > 0) printf("Positive\n");
    else printf("Non-positive\n");

    for (int i = 1; i <= 5; i++) {
        printf("%d\n", i);
    }

    printf("%d\n", add(3, 4));
    return 0;
}
