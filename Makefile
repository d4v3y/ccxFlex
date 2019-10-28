all: scanner clean

scanner:
	lex main.l
	gcc lex.yy.c -o scan

clean:
	rm *.c