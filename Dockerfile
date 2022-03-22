FROM rocker/verse
RUN Rscript -e "install.packages('pak')"
