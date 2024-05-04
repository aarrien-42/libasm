#ifndef TEST_H
#define TEST_H

void test_ft_strlen();
void test_ft_strcpy();
void test_ft_strcmp();
void test_ft_strdup();

#ifdef BONUS

typedef struct s_list {
	void			*data;
	struct s_list	*next;
} t_list;

// bonus tests

#endif

#endif