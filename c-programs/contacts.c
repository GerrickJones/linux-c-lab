#include <stdio.h>
#include <string.h>

/* Module 3 - Advanced task: contact list using structs and a file */
#define DATA_FILE "contacts.txt"
#define NAME_LEN 50

struct Contact {
    char name[NAME_LEN];
    int age;
};

static void clear_line(void) {
    int c;
    while ((c = getchar()) != '\n' && c != EOF) { }
}

static void add_contact(void) {
    struct Contact c;

    printf("Name: ");
    if (fgets(c.name, sizeof c.name, stdin) == NULL) return;
    c.name[strcspn(c.name, "\n")] = '\0';
    if (c.name[0] == '\0') { printf("Name cannot be empty.\n"); return; }

    printf("Age: ");
    if (scanf("%d", &c.age) != 1) {
        printf("Invalid age.\n");
        clear_line();
        return;
    }
    clear_line();

    FILE *f = fopen(DATA_FILE, "a");
    if (f == NULL) { perror("fopen"); return; }
    fprintf(f, "%s,%d\n", c.name, c.age);
    fclose(f);
    printf("Added %s (%d).\n", c.name, c.age);
}

static void view_contacts(void) {
    FILE *f = fopen(DATA_FILE, "r");
    if (f == NULL) { printf("No contacts yet.\n"); return; }

    struct Contact c;
    int count = 0;
    printf("---- Contacts ----\n");
    while (fscanf(f, " %49[^,],%d", c.name, &c.age) == 2) {
        printf("%d. %s, %d\n", ++count, c.name, c.age);
    }
    if (count == 0) printf("No contacts yet.\n");
    printf("------------------\n");
    fclose(f);
}

int main(void) {
    int choice;
    for (;;) {
        printf("\n1) Add contact\n2) View contacts\n3) Quit\nChoice: ");
        if (scanf("%d", &choice) != 1) {
            if (feof(stdin)) break;
            clear_line();
            printf("Please enter 1, 2 or 3.\n");
            continue;
        }
        clear_line();
        if (choice == 1) add_contact();
        else if (choice == 2) view_contacts();
        else if (choice == 3) break;
        else printf("Please enter 1, 2 or 3.\n");
    }
    printf("Goodbye!\n");
    return 0;
}
