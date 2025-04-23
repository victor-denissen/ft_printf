# === Config ===
NAME     = libftprintf.a
SRC_DIR  = src
OBJ_DIR  = obj
INC_DIR  = inc
LIBFT_DIR = libft
LIBFT_A   = $(LIBFT_DIR)/libft.a

SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(SRCS:%.c=$(OBJ_DIR)/%.o)

CC     = cc
CFLAGS = -Wall -Wextra -Werror -I$(INC_DIR) -I$(LIBFT_DIR)/header
AR     = ar rcs

# === Default ===
all: submodule $(LIBFT_A) $(NAME)

# === Ensure libft is initialized and up to date ===
submodule:
	git submodule update --init --recursive
	git submodule update --remote --merge --recursive

# === Build libft ===
$(LIBFT_A):
	$(MAKE) -C $(LIBFT_DIR)

# === Build printf lib ===
$(NAME): $(OBJS)
	$(AR) $@ $^ $(LIBFT_A)

# === Compile rule ===
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# === Debug build ===
debug: CFLAGS += -g
debug: re

# === Cleaning ===
clean:
	rm -rf $(OBJ_DIR)
	$(MAKE) -C $(LIBFT_DIR) clean

fclean: clean
	rm -f $(NAME)
	$(MAKE) -C $(LIBFT_DIR) fclean

re: fclean all

