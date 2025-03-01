.PHONY: all us india clean

all: us india

watch:
	@echo "Watching for changes in Kishan Seksaria.tex..."
	@while true; do \
					inotifywait -e modify "Kishan Seksaria.tex" 2>/dev/null || fswatch -1 "Kishan Seksaria.tex"; \
					make all; \
					echo "Rebuilding after changes..."; \
	done

us:
	mkdir -p us
	pdflatex "\def\altphone{false}\input{Kishan Seksaria.tex}"
	mv "Kishan Seksaria.pdf" "us/Kishan Seksaria.pdf"
	# Clean up temporary files in main directory
	rm -f *.aux *.log *.out *.synctex.gz *.fls *.fdb_latexmk
	# Clean up any old temporary files in us directory (except PDF)
	rm -f us/*.aux us/*.log us/*.out us/*.synctex.gz us/*.fls us/*.fdb_latexmk

india:
	mkdir -p india
	pdflatex "\def\altphone{true}\input{Kishan Seksaria.tex}"
	mv "Kishan Seksaria.pdf" "india/Kishan Seksaria.pdf"
	# Clean up temporary files in main directory
	rm -f *.aux *.log *.out *.synctex.gz *.fls *.fdb_latexmk
	# Clean up any old temporary files in india directory (except PDF)
	rm -f india/*.aux india/*.log india/*.out india/*.synctex.gz india/*.fls india/*.fdb_latexmk

clean:
	rm -f *.aux *.log *.out *.synctex.gz *.fls *.fdb_latexmk
	rm -f us/*.aux us/*.log us/*.out us/*.synctex.gz us/*.fls us/*.fdb_latexmk
	rm -f india/*.aux india/*.log india/*.out india/*.synctex.gz india/*.fls india/*.fdb_latexmk
	rm -rf us india