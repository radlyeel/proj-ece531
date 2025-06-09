PROG = project
OBJ = project.o

CC = arm-linux-gnueabi-gcc
DEST = daryl@localhost:~/bin

# Use only static libraries, since the target won' thave shareable librires
CFLAGS = -static

# Use modern C and get the most help possible
CFLAGS += -std=c2x -Wall -Werror

# Use POSIX threads
LIBS = -lpthread

$(PROG): $(OBJ)
	$(CC) $(OBJ) -o $(PROG) $(LIBS)

clean:
	rm -f $(PROG) $(OBJ)

install: $(PROG)
	scp -P 2222 $(PROG) $(DEST)


