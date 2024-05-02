#include <stdio.h>
#include <string.h>

#include "libasm.h"

void print_function_test(const char* str) {
	printf("\nTEST %s:\n", str);
}

void print_test_results_ft_strlen(size_t test_nb, size_t expected, size_t returned) {
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
	print_test_results_ft_strlen(1, expected, returned);
	// Test 2
	expected = strlen(str_test_2);
	returned = ft_strlen(str_test_2);
	print_test_results_ft_strlen(2, expected, returned);
	// Test 3
	expected = strlen(str_test_3);
	returned = ft_strlen(str_test_3);
	print_test_results_ft_strlen(3, expected, returned);
	// Test 4
	returned = ft_strlen(NULL);
	print_test_results_ft_strlen(4, 0, returned);
}

void print_test_results_ft_strcpy(size_t test_nb, char* dst_expected, char* dst_returned, char* ret_expected, char* ret_returned) {
	printf("  test %ld:\n", test_nb);
	printf("    Expected: dst = [%s] ret = [%s]\n", dst_expected, ret_expected);
	printf("    Returned: dst = [%s] ret = [%s]\n", dst_returned, ret_returned);
}

void test_ft_strcpy() {
	char dst_expected[15], dst_returned[15];
	char* ret_expected;
	char* ret_returned;
	char* src_test_1 = "Hello world!";
	char* src_test_2 = "";
	char* src_test_3 = "\n\r\t\b\f\'\"\\\0\v\a\?";
	char* src_test_4 = "Large string doesn't fit";

	print_function_test("ft_strcpy");
	// Test 1
	ret_expected = strcpy(dst_expected, src_test_1);
	ret_returned = ft_strcpy(dst_returned, src_test_1);
	print_test_results_ft_strcpy(1, dst_expected, dst_returned, ret_expected, ret_returned);
	// Test 2
	ret_expected = strcpy(dst_expected, src_test_2);
	ret_returned = ft_strcpy(dst_returned, src_test_2);
	print_test_results_ft_strcpy(2, dst_expected, dst_returned, ret_expected, ret_returned);
	// Test 3
	ret_expected = strcpy(dst_expected, src_test_3);
	ret_returned = ft_strcpy(dst_returned, src_test_3);
	print_test_results_ft_strcpy(3, dst_expected, dst_returned, ret_expected, ret_returned);
	// Test 4
	//ret_expected = strcpy(dst_expected, src_test_4);
	ret_returned = ft_strcpy(dst_returned, src_test_4);
	print_test_results_ft_strcpy(4, dst_expected, dst_returned, ret_expected, ret_returned);
	// Test 5
	//ret_expected = strcpy(dst_expected, NULL);
	ret_returned = ft_strcpy(dst_returned, NULL);
	print_test_results_ft_strcpy(5, dst_expected, dst_returned, NULL, ret_returned);
}

int main() {
	test_ft_strlen();
	test_ft_strcpy();
	return 0;
}