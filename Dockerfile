FROM rocker/verse
RUN Rscript -e "install.packages(c('pak', 'renv', 'r2dii.data'))"
