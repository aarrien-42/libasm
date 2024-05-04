#ifndef LIBASM_H
#define LIBASM_H

extern size_t	ft_strlen(char* str);
extern char*	ft_strcpy(char *dst, const char *src);
extern int		ft_strcmp(const char *s1, const char *s2);
extern size_t	ft_write(int fd, char *buf, size_t nbyte);
extern size_t	ft_read(int fd, const char *buf, size_t nbyte);
extern char*	ft_strdup(const char *s);

#ifdef BONUS

// C Piscine C 04:
extern int	ft_atoi_base(char *str, char *base);

// C Piscine C 12:
extern void	ft_list_push_front(t_list **begin_list, void *data);
extern int	ft_list_size(t_list *begin_list);
extern void	ft_list_sort(t_list **begin_list, int (*cmp)());
//	cmp use => (*cmp)(list_ptr->data, list_other_ptr->data);
extern void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
//	cmp use => (*cmp)(list_ptr->data, data_ref);
//	free use => (*free_fct)(list_ptr->data);

#endif

#endif