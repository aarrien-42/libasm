#include <stdio.h>
#include <string.h>
#include <stdlib.h>

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
	char* src_test_4 = "Large string test";

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

void print_test_results_ft_strcmp(size_t test_nb, int expected, int returned) {
	printf("  test %ld:\n", test_nb);
	printf("    Expected: %d\n", expected);
	printf("    Returned: %d\n", returned);
}

void test_ft_strcmp() {
	char* s1_test_1 = "012";
	char* s2_test_1 = "22";
	char* s1_test_2 = "";
	char* s2_test_2 = "";
	char* s1_test_3 = "1";
	char* s2_test_3 = "";
	char* s1_test_4 = "";
	char* s2_test_4 = "81";
	int return1, return2;

	print_function_test("ft_strcmp");
	// Test 1
	return1 = strcmp(s1_test_1, s2_test_1);
	return2 = ft_strcmp(s1_test_1, s2_test_1);
	print_test_results_ft_strcmp(1, return1, return2);
	// Test 2
	return1 = strcmp(s1_test_2, s2_test_2);
	return2 = ft_strcmp(s1_test_2, s2_test_2);
	print_test_results_ft_strcmp(2, return1, return2);
	// Test 3
	return1 = strcmp(s1_test_3, s2_test_3);
	return2 = ft_strcmp(s1_test_3, s2_test_3);
	print_test_results_ft_strcmp(3, return1, return2);
	// Test 4
	return1 = strcmp(s1_test_4, s2_test_4);
	return2 = ft_strcmp(s1_test_4, s2_test_4);
	print_test_results_ft_strcmp(4, return1, return2);
	// Test 5
	//return1 = strcmp(NULL, NULL);
	return2 = ft_strcmp(NULL, NULL);
	print_test_results_ft_strcmp(5, 0, return2);
}

void print_test_results_ft_strdup(size_t test_nb, char* expected, char* returned, char* original) {
	printf("  test %ld:\n", test_nb);
	printf("    Original: (%s) [%p]\n", original, original);
	printf("    Expected: (%s) [%p]\n", expected, expected);
	printf("    Result:   (%s) [%p]\n", returned, returned);
	free(expected);
	free(returned);
}

void test_ft_strdup() {
	char* r1;
	char* r2;
	char* str_test_1 = "Hello world!";
	char* str_test_2 = "";
	char* str_test_3 = "\n\r\t\b\f\'\"\\\0\v\a\?";
	char* str_test_4 = "Large string test";

	print_function_test("ft_strdup");
	// Test 1
	r1 = strdup(str_test_1);
	r2 = ft_strdup(str_test_1);
	print_test_results_ft_strdup(1, r1, r2, str_test_1);
	// Test 2
	r1 = strdup(str_test_2);
	r2 = ft_strdup(str_test_2);
	print_test_results_ft_strdup(2, r1, r2, str_test_2);
	// Test 3
	r1 = strdup(str_test_3);
	r2 = ft_strdup(str_test_3);
	print_test_results_ft_strdup(3, r1, r2, str_test_3);
	// Test 4
	r1 = strdup(str_test_4);
	r2 = ft_strdup(str_test_4);
	print_test_results_ft_strdup(4, r1, r2, str_test_4);
	// Test 5
	//r1 = strdup(NULL);
	r2 = ft_strdup(NULL);
	print_test_results_ft_strdup(5, NULL, r2, NULL);
}

#ifdef BONUS

void test_ft_atoi_base() {
	int r = ft_atoi_base("1", "01");
	printf("RETURN = (%d)\n", r);
}

#endif
