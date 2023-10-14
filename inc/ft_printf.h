/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vdenisse <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/02 16:58:24 by vdenisse          #+#    #+#             */
/*   Updated: 2023/10/14 15:49:43 by vdenisse         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include "../libft/header/libft.h"
# include <stdarg.h>
# include <stdint.h>
# include <unistd.h>
# define HEXA_UPPER "0123456789ABCDEF"
# define HEXA_LOWER "0123456789abcdef"
# define INT_MAX 2147483647
# define INT_MIN -2147483648
# define LOG_MAX 9223372036854775807
# define LOG_MIN -9223372036854775808

//ft_printf.c
int		ft_printf(const char *str, ...);
int		ft_print(const char *str, va_list args);
int		ft_print_chooser(const char *str, int index, va_list *args);

//ft_pntr_print.c
int		ft_ptr_printer(unsigned long long ptr);

//ft_putstr.c
int		ft_string_printer(const char *str);
int		ft_character_printer(int chr);
int		ft_uint_printer(unsigned int nbr);
int		ft_number_printer(int nbr);

//ft_ulltoa.c
char	*ft_ulltoa(unsigned long long nbr);

//print_base.c
int		ft_put_udec(unsigned int nbr);
int		ft_putnbr_base(unsigned int nbr, char *base);

#endif
