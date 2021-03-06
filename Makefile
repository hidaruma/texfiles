MAKE = make

LATEX ?= platex
LUALATEX ?= lualatex
LATEXFLAG = --kanji=utf8 -halt-on-error

DVIPDFM ?= dvipdfmx

SRC = word

TARGETS = $(addsuffix .cls, $(SRC))
DOCUMENT = $(addsuffix .pdf, $(SRC))
TEXDTX = $(addsuffix .dtx, $(SRC))
TEXINS = $(addsuffix .ins, $(SRC))

TARGETSLUA = $(addsuffix .cls, $(SRC))
DOCUMENTLUA = $(addsuffix .pdf, $(SRC))

.PHONY: all doc clean word

.DEFAULT_GOAL := all

word: $(TARGETS)
		$(MAKE) $(TARGETS)


doc: $(DOCUMENT)
		$(MAKE) $(DOCUMENT)
		

all: $(TARGETS) $(DOCUMENT)

$(TARGETS) : $(TEXINS) $(TEXDTX)
		$(LUALATEX)  $(TEXINS)

$(DOCUMENT) : $(TEXDTX)
		$(LUALATEX) $(TEXDTX)

clean:
		rm *aux *.cls *.log *.toc *.dvi *.pdf *.out *.fls
