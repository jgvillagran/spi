
# main compiler
CC := gcc
# CC := clang --analyze # and comment out the linker last line for sanity

# define the directories
SRCDIR := ~/source/build_dir/target-mipsel_24kc_musl/spi-gpio-driver/ 
INCDIR := ~/source/build_dir/target-mipsel_24kc_musl/spi-gpio-driver
BUILDDIR := ~/source/build_dir/target-mipsel_24kc_musl/spi-gpio-driver/build
BINDIR := ~/source/build_dir/target-mipsel_24kc_musl/spi-gpio-driver/bin
LIBDIR := ~/source/build_dir/target-mipsel_24kc_musl/spi-gpio-driver/lib
PYLIBDIR := ~/source/build_dir/target-mipsel_24kc_musl/spi-gpio-driver/lib/python


# libraries
$(TARGET_LIB0): $(OBJECT_LIB0)
	@echo " Compiling $@"
	@mkdir -p $(LIBDIR)
	$(CC) -shared -o $@  $^ $(LIB_LIB0)

# python libraries
$(TARGET_PYLIB0): $(OBJECT_PYLIB0)
	@echo " Compiling $@"
	@mkdir -p $(PYLIBDIR)
	$(CC) -shared -o $@  $^ $(LIB_PYLIB0)

# application binaries
$(TARGET_APP0): $(OBJECT_APP0)
	@echo " Compiling $(APP0)"
	@mkdir -p $(BINDIR)
	@echo " Linking..."
	$(CC) $^ $(CFLAGS) $(LDFLAGS) -o $(TARGET_APP0) $(LIB) $(LIB_APP0)


# generic: build any object file required
$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(dir $@)
	@echo " $(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $<

clean:
	@echo " Cleaning..."; 
	$(RM) -r $(BUILDDIR) $(BINDIR) $(LIBDIR)

info:
	@echo "CC: $(CC)"
	@echo "CCFLAGS: $(CCFLAGS)"
	@echo "LDFLAGS: $(LDFLAGS)"
	@echo "LIB: $(LIB)"
	@echo "INC: $(INC)"
	@echo "SOURCES: $(SOURCES)"
	@echo "OBJECTS: $(OBJECTS)"

# Tests
tester:
	$(CC) $(CFLAGS) test/tester.cpp $(INC) $(LIB) -o bin/tester

# Spikes
#ticket:
#  $(CC) $(CFLAGS) spikes/ticket.cpp $(INC) $(LIB) -o bin/ticket

.PHONY: clean
