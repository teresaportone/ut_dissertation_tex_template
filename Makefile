target=dissertation.pdf
texsource := $(wildcard paper.tex poster.tex proposal.tex report.tex talk.tex)
texroot := $(patsubst %.tex, %, $(texsource))
bibfiles := $(wildcard *.bib)
styfiles := $(wildcard *.sty)
clsfiles := $(wildcard *.cls)
figures := $(shell find figs/ -name '*.png' -o -name '*.pdf' -o -name '*mpg' -o -name '*.mpeg' 2>/dev/null)
alldeps := *.tex $(bibfiles) $(figures) $(clsfiles) $(styfiles)

all : $(target)

$(target) : $(alldeps)
	pdflatex $(texsource) && bibtex $(texroot) && pdflatex $(texsource) && pdflatex $(texsource) && mv $(texroot).pdf $(target)

clean:
	rm -f $(target) *aux *log *toc *snm *nav *out *bbl *blg *cb *cb2
