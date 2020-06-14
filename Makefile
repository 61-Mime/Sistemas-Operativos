CC = gcc

CFLAGS = -Wall

argus : listar.o executar.o argus.o
				$(CC) $(CFLAGS) -o argus listar.o executar.o argus.o

argusd : listar.o executar.o argusd.o
				$(CC) $(CFLAGS) -o argusd listar.o executar.o argusd.o

all : argus argusd
			@mkfifo -m 0666 pipeClienteServidor
			@mkfifo -m 0666 pipeServidorCliente
			
listar.o : listar.c listar.h
executar.o : executar.c executar.h
argus.o : argus.c argus.h listar.h executar.h
argusd.o : argusd.c argus.h listar.h executar.h

clean:
	rm argus argusd pipeClienteServidor pipeServidorCliente
	rm -r *.o
	@echo Objetos e Executável Apagados

cleanall: cleanech
	@echo Documentação Apagada