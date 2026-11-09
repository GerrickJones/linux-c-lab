#include <stdio.h>

/* Module 3 - Intermediate task: recursive factorial */
unsigned long long factorial(int n) {
    if (n <= 1) return 1;
    return (unsigned long long)n * factorial(n - 1);
}

int main(void) {
    int n;
    printf("Enter a non-negative integer: ");
    if (scanf("%d", &n) != 1 || n < 0) {
        printf("Please enter a non-negative integer.\n");
        return 1;
    }
    if (n > 20) {
        printf("Too large: 20! is the biggest value that fits.\n");
        return 1;
    }
    printf("%d! = %llu\n", n, factorial(n));
    return 0;
}
