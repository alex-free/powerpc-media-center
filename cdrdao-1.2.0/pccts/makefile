#
# Main makefile for PCCTS 1.33MR32	/* MRXXX */
#
# Terence Parr
# Parr Research Corporation
#
# verbosity versus silence...
PSss=
#
# this can be set to /user/local/bin etc...
BINDIR=bin
# This part added by Thomas Herter, M"unchen, Germany. See also manpages
# target.
MANDIR=$(HOME)/man
MANEXT=1
MANFILES=dlg/dlg.1 antlr/antlr.1

#CC=cc
#CC=gcc
#COPT=-O2
COPT=$(CFLAGS)

all:
	@echo " "
	@echo "             Welcome to PCCTS 1.33MR32 installation"
	@echo " "
	@echo "             (Version 1.33 Maintenance Release #32)" # mrxxx
	@echo " "
	@echo "                  Released 3 March 2002"
	@echo " "
	@echo "                        Featuring"
	@echo "         ANTLR     -- ANother Tool for Language Recognition"
	@echo "         DLG       -- DFA-based Lexical Analyzer Generator"
	@echo "         SORCERER  -- Source-to-source translator (tree walker)" 
	@echo " "
	@echo "                  http://www.antlr.org"	
	@echo " "
	@echo "             Trouble reports to tmoog@polhode.com"
	@echo "             Additional PCCTS 1.33 information at"
	@echo "                  http://www.polhode.com"
	@echo
	@echo
	@echo "To substitute gcc for CC to invoke compiler: make CC=gcc"
	@echo "If there are problems with cr and lf try: unzip -a ..."
	@echo
#
	@if [ ! -d $(BINDIR) ] ; then mkdir $(BINDIR) ; fi
	@echo Making executables...
	(cd ./antlr; $(MAKE) CC="$(CC)" COPT="$(COPT)")
	@echo antlr executable now in $(BINDIR)
	(cd ./dlg; $(MAKE) CC="$(CC)" COPT="$(COPT)")
	@echo dlg executable now in $(BINDIR)
#	(cd ./sorcerer; $(MAKE) CC="$(CC)" COPT="$(COPT)")
#	@echo sorcerer executable now in $(BINDIR)
#	(cd ./support/genmk; $(MAKE) CC="$(CC)" COPT="$(COPT)"; mv genmk ../../$(BINDIR))
#	@echo genmk executable now in $(BINDIR)
	@echo
	@echo "       PCCTS 1.33MR32 installation complete"  # MRXXX

clean:
	(cd ./antlr; $(MAKE) clean)
	(cd ./dlg; $(MAKE) clean)
#	(cd ./sorcerer; $(MAKE) -s clean)
#	(cd ./support/genmk; $(MAKE) -s clean)

distclean: clean

manpages:
	# mkdir -p $(MANDIR)/man$(MANEXT)
	if [ ! -d $(MANDIR) ] ; then \
	  mkdir $(MANDIR) ; fi
	if [ ! -d $(MANDIR)/man$(MANEXT) ] ; then \
	  mkdir $(MANDIR)/man$(MANEXT); fi
	cp -p $(MANFILES) $(MANDIR)/man$(MANEXT)

install:
check:
uninstall:
