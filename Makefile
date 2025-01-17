
CFLAGS = -Wall -g

tiny: main.o util.o scan.o parse.o symtab.o analyze.o code.o cgen.o
	gcc $(CFLAGS) -o tiny main.o util.o scan.o parse.o symtab.o analyze.o code.o cgen.o

main.o: main.c globals.h util.h scan.h parse.h analyze.h cgen.h
	gcc $(CFLAGS) -c main.c

util.o: util.c util.h globals.h
	gcc $(CFLAGS) -c util.c

scan.o: scan.c scan.h util.h globals.h
	gcc $(CFLAGS) -c scan.c

parse.o: parse.c parse.h scan.h globals.h util.h
	gcc $(CFLAGS) -fno-builtin -c parse.c

symtab.o: symtab.c symtab.h
	gcc $(CFLAGS) -c symtab.c

analyze.o: analyze.c globals.h symtab.h analyze.h
	gcc $(CFLAGS) -c analyze.c

code.o: code.c code.h globals.h
	gcc $(CFLAGS)  -c code.c

cgen.o: cgen.c globals.h symtab.h code.h cgen.h
	gcc $(CFLAGS) -c cgen.c


clean: 
	rm -f main.o util.o scan.o parse.o symtab.o analyze.o code.o cgen.o lex/lex.yy.c yacc/tiny.tab.c  

tm: tm.c
	gcc $(CFLAGS) -o tm tm.c