# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: apodader <apodader@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/05 11:30:25 by apodader          #+#    #+#              #
#    Updated: 2024/09/07 15:56:18 by apodader         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= minishell
INC			= ./includes
INC_HEADERS	= $(INC)/minishell.h

FT_INC		= $(FT)/libft.h

FT			= ./libft
FT_LNK		= -L$(FT) -lft
FT_LIB		= $(FT)libft.a

SRC_DIR		= src/
OBJ_DIR		= obj/
COMFLAGS	= -I/Users/$(USER)/.brew/opt/readline/include
LINKFLAGS	= -L/Users/$(USER)/.brew/opt/readline/lib -lreadline
CFLAGS		= -I $(INC) -MMD -Wall -Werror -Wextra -fsanitize=address -g
RM			= rm -f

################################################################################
### COLORS
################################################################################

DEL_LINE =		\033[2K
ITALIC =		\033[3m
BOLD =			\033[1m
DEF_COLOR =		\033[0;39m
GRAY =			\033[0;90m
RED =			\033[0;91m
GREEN =			\033[0;92m
YELLOW =		\033[0;93m
BLUE =			\033[0;94m
MAGENTA =		\033[0;95m
CYAN =			\033[0;96m
WHITE =			\033[0;97m
BLACK =			\033[0;99m
ORANGE =		\033[38;5;209m
BROWN =			\033[38;2;184;143;29m
DARK_GRAY =		\033[38;5;234m
MID_GRAY =		\033[38;5;245m
DARK_GREEN =	\033[38;2;75;179;82m
DARK_YELLOW =	\033[38;5;143m

################################################################################
### OBJECTS
################################################################################

SRC_FILES	=	dollar_sign.c		\
				env_init.c			\
				executor.c			\
				executor_2.c		\
				heredoc.c			\
				minishell.c			\
				main.c				\
				parser.c			\
				quotes.c			\
				scanner.c			\
				signals.c			\
				utils.c				\
				lst_utils.c			\
				error.c				\
				builtins.c			\
				builtins_2.c		\
				builtins_utils.c

SRC			=	$(addprefix $(SRC_DIR), $(SRC_FILES))
OBJ 		=	$(addprefix $(OBJ_DIR), $(notdir $(SRC:.c=.o)))
DEP			= 	$(addprefix $(OBJ_DIR), $(notdir $(SRC:.c=.d)))
B_OBJ		=	$(OBJ)

################################################################################
### RULES
################################################################################

all: $(NAME)

$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(INC_HEADERS) Makefile
			@mkdir -p $(OBJ_DIR)
			@echo "${BLUE} ◎ $(BROWN)Compiling   ${MAGENTA}→   $(CYAN)$< $(DEF_COLOR)"
			@$(CC) $(CFLAGS) $(COMFLAGS) -c $< -o $@

$(NAME):	$(OBJ)
			@$(MAKE) -C $(FT) --silent
			@$(CC) $(CFLAGS) $(OBJ) $(FT_LNK) $(LINKFLAGS) -o $(NAME)
			@echo "$(GREEN)\nCreated ${NAME} ✓$(DEF_COLOR)\n"

-include $(DEP)

bonus:		$(B_OBJ) $(NAME)

clean:
			@$(RM) -rf $(OBJ_DIR)
			@make clean -C $(FT) --silent
			@echo "\n${BLUE} ◎ $(ORANGE)All objects cleaned successfully ${BLUE}◎$(DEF_COLOR)\n"

fclean:		clean
			@$(RM) -f $(NAME)
			@$(RM) -f lib*.a
			@make fclean -C $(FT) --silent
			@echo "\n${BLUE} ◎ $(ORANGE)Executable cleaned successfully${BLUE} ◎$(DEF_COLOR)\n"

re:			fclean all
			@echo "$(GREEN)Cleaned and rebuilt everything for $(NAME)!$(DEF_COLOR)"

norm:
			@norminette $(SRC) $(INC)minishell.h $(FT) | grep -v Norme -B1 || true

.PHONY:		all clean fclean re norm
