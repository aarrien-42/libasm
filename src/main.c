#include <stdio.h>
#include <string.h>

#include "libasm.h"

void print_function_test(const char* str) {
	printf("TEST %s:\n", str);
}

void print_test_results(size_t test_nb, size_t expected, size_t returned) {
	printf("  test %ld:\n", test_nb);
	printf("    Expected: %ld\n", expected);
	printf("    Returned: %ld\n", returned);
}

void test_ft_strlen() {
	size_t expected, returned;
	char* str_test_1 = "Hello world!";
	char* str_test_2 = "";
	char* str_test_3 = "\n \r \t \b \f \' \" \\ \0 \v \a \?";

	print_function_test("ft_strlen");
	// Test 1
	expected = strlen(str_test_1);
	returned = ft_strlen(str_test_1);
	print_test_results(1, expected, returned);
	// Test 2
	expected = strlen(str_test_2);
	returned = ft_strlen(str_test_2);
	print_test_results(2, expected, returned);
	// Test 3
	expected = strlen(str_test_3);
	returned = ft_strlen(str_test_3);
	print_test_results(3, expected, returned);
	// Test 4
	returned = ft_strlen(NULL);
	print_test_results(4, 0, returned);
}

int main() {
	test_ft_strlen();
	return 0;
}