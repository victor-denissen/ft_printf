NAME :=		libftprintf.a
CC :=		gcc
CFLAGS :=	-Wall -Wextra -Werror
AR :=		ar rcs
OBJDIR :=	obj


SRCS :=	src/ft_pntr_print.c\
		src/ft_printf.c\
		src/ft_putstr.c\
		src/ft_ulltoa.c\
		src/print_base.c

OBJS : $(SRCS:%.c=$(OBJDIR)/%.o)
	

HEADERS := inc/ft_printf.h

all:	$(NAME)

$(NAME):	$(OBJS) $(HEADERS)
				make -C libft
				$(AR) $@ $^
				echo "Compiled $@"

$(OBJDIR)/%.o: %.c $(HEADERS)                                       
				mkdir -p $(@D)
				echo "Compiling $@"
				$(CC) -c $(CFLAGS) $< -o $@

clean:
				make -C libft clean
				rm -rf $(OBJDIR)

fclean:	
				make clean
				make -C libft fclean
				rm -f $(NAME)

re: fclean all

.SILENT:
.PHONY: all clean fclean re
