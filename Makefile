all: scanner

scanner:
	lex main.l
	gcc lex.yy.c -o scan