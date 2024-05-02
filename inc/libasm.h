#ifndef LIBASM_H
#define LIBASM_H

extern size_t ft_strlen(char* str);
extern char* ft_strcpy(char *dst, const char *src);
extern int ft_strcmp(const char *s1, const char *s2);
extern size_t ft_write(int fd, char *buf, size_t nbyte);
extern size_t ft_read(int fd, const char *buf, size_t nbyte);

#endif