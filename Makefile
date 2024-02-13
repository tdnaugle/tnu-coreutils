CC = gcc
BIN_DIR = $(HOME)/.local/bin 

# placeholder targets
all:
install:
clean:

.PHONY: all install clean

# If SRCS is not provided by the user, show an error message
ifndef SRCS
$(error SRCS is not defined. Please provide the list of source files.)
endif

# Target binaries
BINS = $(patsubst %.c,%,$(SRCS))

# Default target: build all specified binaries
all: $(BINS)

# Compile each source file into a binary
%: %.c
	$(CC) $(CFLAGS) $< -o $@

# Install binaries to the specified directory
install: $(BINS)
	cp $(BINS) $(BIN_DIR)

# Remove binaries
clean:
	rm -f $(BINS) 