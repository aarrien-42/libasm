# LIBRARY
NAME = libasm.a

# EXECUTABLE
TEST = test

# FOLDERS
SRC_DIR = src
ASM_DIR = asm
OBJ_DIR = obj
INC_DIR = inc
LIB_DIR = lib
BIN_DIR = bin

# FILES
ASM_FILES = ft_strlen ft_strcpy ft_strcmp ft_write ft_read ft_strdup
C_FILES = main test
SRC_FILES = $(ASM_FILES) $(C_FILES)

SRC_C = $(addprefix $(SRC_DIR)/, $(addsuffix .c, $(C_FILES)))
SRC_ASM = $(addprefix $(ASM_DIR)/, $(addsuffix .c, $(ASM_FILES)))
SRC = $(SRC_C) $(SRC_ASM)

OBJ_C = $(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(C_FILES)))
OBJ_ASM = $(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(ASM_FILES)))
OBJ = $(OBJ_C) $(OBJ_ASM)

# COMPILATION
NA = nasm
NA_FLAGS = -f elf64
CC = gcc
CFLAGS = -Wall -Wextra -Werror
LDFLAGS = -L./$(LIB_DIR) -lasm
RM = rm -rf

# COLORS
DEF_COLOR = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;31m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

# RULES

.SILENT:

all: $(BIN_DIR)/$(TEST)

print-%:
	@echo '$*=$($*)'

print-all-variables:
	@$(foreach V, $(.VARIABLES), $(info $(V) = $($(V))))

run: $(BIN_DIR)/$(TEST)
	clear
	./$(BIN_DIR)/$(TEST)

# Test executable creation
$(BIN_DIR)/$(TEST): $(OBJ) $(LIB_DIR)/$(NAME) | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $(OBJ_C) $(LDFLAGS) -no-pie
	echo "$(YELLOW)Test program compiled!$(DEF_COLOR)"

# Object compilation
$(OBJ_DIR)/%.o: $(ASM_DIR)/%.s | $(OBJ_DIR)
	printf "$(MAGENTA)Compiling ASM:$(BLUE) $< $(DEF_COLOR)"
	$(NA) $(NA_FLAGS) $< -o $@
	echo "$(GREEN)OK$(DEF_COLOR)"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	printf "$(MAGENTA)Compiling C:$(BLUE) $< $(DEF_COLOR)"
	$(CC) $(CFLAGS) -c $< -I $(INC_DIR) -o $@
	echo "$(GREEN)OK$(DEF_COLOR)"

# Library creation
$(LIB_DIR)/$(NAME): $(OBJ_ASM) | $(LIB_DIR)
	ar rcs $@ $(OBJ_ASM)

# Temporal folder creation
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(LIB_DIR):
	mkdir -p $(LIB_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

clean:
	$(RM) $(OBJ_DIR) $(LIB_DIR)

fclean: clean
	$(RM) $(BIN_DIR)

re: fclean all

.PHONY: all run clean fclean re