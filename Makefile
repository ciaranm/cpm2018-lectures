all : tables graphs
	latexmk -pdf -pdflatex='pdflatex -interaction=nonstopmode %O %S' \
	    all-different
	latexmk -pdf -pdflatex='pdflatex -interaction=nonstopmode %O %S' \
	    discrepancies
	latexmk -pdf -pdflatex='pdflatex -interaction=nonstopmode %O %S' \
	    parallel

TABLES =

GRAPHS = \
	 gen-graph-scatter-dds.pdf \
	 gen-graph-scatter-final.pdf \
	 gen-graph-scatter-random.pdf \
	 gen-graph-scatter-random-goods.pdf

graphs : $(GRAPHS)

tables : $(TABLES)

gen-graph-%.pdf : graph-%.gnuplot common.gnuplot glasgow.pal
	gnuplot $<
	sed -i -e '19,20s/^\(\\path.*\)/\% \1/' gen-graph-$*.tex # epic haxx
	latexmk -pdf gen-graph-$*

