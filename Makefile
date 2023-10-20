LATEX	= pdflatex -shell-escape
BIBTEX	= bibtex

TARGET	= main

TEX	= $(TARGET).tex $(wildcard *.tex)
BIB	= $(wildcard *.bib)
FIG	= $(wildcard figures/*.pdf)

.PHONY: all clean


all: $(TARGET).pdf

$(TARGET).bbl: $(BIB)
	$(LATEX)	$(TARGET)
	$(BIBTEX)	$(TARGET)

$(TARGET).pdf: $(TARGET).bbl $(TEX) $(FIG)
	$(LATEX)	$(TARGET)
	$(LATEX)	$(TARGET)

clean:
	$(RM) -r $(addprefix $(TARGET), .aux .bbl .blg .log .out .pdf) _minted-$(TARGET)/
