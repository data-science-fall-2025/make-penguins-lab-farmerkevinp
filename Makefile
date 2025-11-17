.PHONY = all
all : output/penguin_report.html

output/penguins_pairs.png: analysis/plot_penguin.R
	R CMD BATCH --no-save --no-restore analysis/plot_penguin.R
	
output/penguin_class.csv: analysis/classify_penguins.R
	R CMD BATCH --no-save --no-restore analysis/classify_penguins.R
	
output/penguin_report.html: analysis/penguin_report.qmd output/penguin_pairs.png output/penguin_class.csv
	render quarto analysis/penguin_report.qmd