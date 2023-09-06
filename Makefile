# Name of the library we'll create
NAME = libftprintf.a

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -Werror
AR = ar rcs

# Directories for source and object files
SRC_DIR = src
LIBFT_DIR = libft
OBJ_DIR = obj
INC_DIR = inc


# List of .c files
SRCS = ft_pntr_print.c ft_printf.c ft_putstr.c ft_ulltoa.c print_base.c

# Convert .c files to .o files
OBJS = $(patsubst %.c,$(OBJ_DIR)/%.o,$(filter-out $(LIBFT_DIR)/ft_printf.c,$(SRCS))) \
       $(patsubst $(LIBFT_DIR)/%.c,$(OBJ_DIR)/%.o,$(wildcard $(LIBFT_DIR)/*.c))

# Path to .c files
SRC_FILES = $(addprefix $(SRC_DIR)/,$(SRCS))

# Path to .o files
OBJ_DIR = obj
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))

# Header files
HDRS = $(wildcard $(INC_DIR)/*.h)

# Targets
all: $(NAME)

$(NAME): $(OBJS)
	@make -C libft
	@$(AR) $@ $^
	@echo "Created $@"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(HDRS)
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CFLAGS) -I$(INC_DIR) -c $< -o $@

$(OBJ_DIR)/%.o: $(LIBFT_DIR)/%.c $(HDRS)                                       
	@mkdir -p $(OBJ_DIR)                                                    
	@$(CC) $(CFLAGS) -I$(INC_DIR) -c $< -o $@

clean:
	@make -C libft clean
	@rm -rf $(OBJ_DIR)

fclean: clean
	@make -C libft fclean
	@rm -f $(NAME)

re: fclean all

# Phony targets
.PHONY: all clean fclean re


