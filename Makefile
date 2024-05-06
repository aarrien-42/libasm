# LIBRARY
NAME = libasm.a

# EXECUTABLE
TEST = test

# FOLDERS
SRC_DIR = src
ASM_DIR = src/asm
OBJ_DIR = obj
INC_DIR = inc
LIB_DIR = lib
BIN_DIR = bin

# FILES
ASM_FILES = ft_strlen ft_strcpy ft_strcmp ft_write ft_read ft_strdup
ASM_BONUS_FILES = ft_atoi_base ft_list_push_front ft_list_size ft_list_sort ft_list_remove_if
C_FILES = main test
SRC_FILES = $(ASM_FILES) $(C_FILES)

SRC_C = $(addprefix $(SRC_DIR)/, $(addsuffix .c, $(C_FILES)))
SRC_ASM = $(addprefix $(ASM_DIR)/, $(addsuffix .c, $(ASM_FILES)))
SRC_BONUS_ASM = $(addprefix $(ASM_DIR)/, $(addsuffix .c, $(ASM_BONUS_FILES)))

OBJ_C = $(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(C_FILES)))
OBJ_ASM = $(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(ASM_FILES)))
OBJ_BONUS_ASM = $(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(ASM_BONUS_FILES)))
OBJ_MANDATORY = $(OBJ_C) $(OBJ_ASM)
OBJ_BONUS = $(OBJ_C) $(OBJ_BONUS_ASM)

# COMPILATION
NA = nasm
NA_FLAGS = -f elf64 -g
CC = gcc
CFLAGS = -Wall -Wextra -Werror -static
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

info:
	echo " |------------------------------------------------------------------------------------|"
	echo " |          $(BLUE)CMD$(DEF_COLOR)          |                         $(BLUE)DESCRIPTION$(DEF_COLOR)                        |"
	echo " |------------------------------------------------------------------------------------|"
	echo " | $(GREEN)make$(DEF_COLOR)                  | Show information                                           |"
	echo " | $(GREEN)make test$(DEF_COLOR)             | Build and run the tests with mandatory functions           |"
	echo " | $(GREEN)make test_bonus$(DEF_COLOR)       | Build and run the tests with mandatory and bonus functions |"
	echo " | $(GREEN)make run$(DEF_COLOR)              | Run the executable                                         |"
	echo " | $(GREEN)make clean$(DEF_COLOR)            | Remove object files and libraries                          |"
	echo " | $(GREEN)make fclean$(DEF_COLOR)           | Remove object files, libraries, and executables            |"
	echo " | $(GREEN)make re$(DEF_COLOR)               | Perform a clean rebuild                                    |"
	echo " -------------------------------------------------------------------------------------|"

all: info

print-%:
	echo '$*=$($*)'

print-all-variables:
	$(foreach V, $(.VARIABLES), $(info $(V) = $($(V))))

test: clean mandatory run

test_bonus: clean bonus run

# Run executable file if exists
run:
	if [ -e "$(BIN_DIR)/$(TEST)" ]; then \
		./$(BIN_DIR)/$(TEST); \
	else \
		echo "Executable does not exist"; \
	fi

# Test executable creation
mandatory: $(OBJ_MANDATORY) $(NAME) | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $(BIN_DIR)/$(TEST) $(OBJ_C) $(LDFLAGS)
	echo "$(YELLOW)Test program compiled!$(DEF_COLOR)"

bonus: CFLAGS += -DBONUS=1  # Add the BONUS flag to CFLAGS
bonus: $(OBJ_BONUS) bonus_lib | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $(BIN_DIR)/$(TEST) $(OBJ_C) $(LDFLAGS)
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
$(NAME): $(OBJ_ASM) | $(LIB_DIR)
	ar rcs $(LIB_DIR)/$(NAME) $(OBJ_ASM)

bonus_lib: $(OBJ_ASM) $(OBJ_BONUS_ASM) | $(LIB_DIR)
	ar rcs $(LIB_DIR)/$(NAME) $(OBJ_ASM) $(OBJ_BONUS_ASM)

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

.PHONY: info all mandatory bonus mandatory_lib bonus_lib test test_bonus run clean fclean re