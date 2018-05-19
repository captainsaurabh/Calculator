calc:	calc.l calc.y
		flex -o calc.lex.c calc.l
		bison -o calc.tab.c -d calc.y
		cc -o calc calc.lex.c calc.tab.c -lm -lfl
		
