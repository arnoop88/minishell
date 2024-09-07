# minishell

**minishell** is a project that involves creating a simple shell program in C, mimicking the basic behavior and functionalities of the UNIX `bash` shell. This project aims to provide an understanding of command parsing, process creation and synchronization, signal handling, and more.

## Features

- Display a prompt and wait for user input.
- Have a working history.
- Execute basic commands with their relative or absolute paths.
- Handle built-in commands such as `echo`, `cd`, `pwd`, `export`, `unset`, `env`, and `exit`.
- Manage environment variables (`$`) and `$?` which expands to the exit status of the most recently executed foreground pipeline.
- Handle single and double quotes.
- Implement redirections (`<`, `>`, `>>`, `<<`) and pipes (`|`).
- Support for `Ctrl-C`, `Ctrl-D`, and `Ctrl-\` signals handling similar to bash.

## Getting Started

### Prerequisites

- A Unix-based system (Linux or macOS)
- `gcc` compiler and `make`
- Basic knowledge of C programming and UNIX systems

### Installation

1. Clone the repository:

	```bash
	git clone https://github.com/arnoop88/minishell.git
	cd minishell

2. Compile the project:

	```bash
	make

## Running the Shell

To run the shell, execute the following command:

	./minishell

You should see this promp:

![minishell_prompt](minishell_prompt.png)

You can then start typing commands, just like in a standard bash shell

## Supported Built-in Commands

- `echo [-n] [arg...]`: Display a line of text, use option `-n` to display without end of line (`\n`).
- `cd [dir]`: Change the current directory.
- `pwd`: Print the current working directory.
- `export [name[=value] ...]`: Set or export environment variables.
- `unset [name ...]`: Remove environment variables.
- `env`: Display the environment variables.
- `exit [status]`: Exit the shell.

## Contruibuting

Contributions are welcome! Feel free to open issues, suggest features, or create pull requests.
