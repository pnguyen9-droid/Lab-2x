#include <stdio.h>
#include <string.h>

extern int ham_dist(char *a, char *b);   // Assembly function with two parameters and int return type

int main()
{
    char str1[100];      // Initialize str1 and str2
    char str2[100];

    printf("Enter a string: ");          // Prompt for user input
    fgets(str1, sizeof(str1), stdin);
    str1[strcspn(str1, "\n")] = 0;       

    printf("Enter another string: ");
    fgets(str2, sizeof(str2), stdin);
    str2[strcspn(str2, "\n")] = 0;

    int result = ham_dist(str1, str2);

    printf("Hamming Distance: %d\n", result);

    return 0;
}