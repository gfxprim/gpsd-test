CFLAGS=-W -Wall -Wextra -O2 $(shell gfxprim-config --cflags)
LDLIBS=-lgfxprim $(shell gfxprim-config --libs-widgets) -lgps
BIN=gpsd-test
DEP=$(BIN:=.dep)

all: $(DEP) $(BIN)

%.dep: %.c
	$(CC) $(CFLAGS) -M $< -o $@

-include $(DEP)

clean:
	rm -f $(BIN) *.dep *.o
