FROM biocontainers/biocontainers:latest

USER root

# Install jupyter (python 2 version)
RUN python -m pip install --upgrade pip \
 && python -m pip install jupyter

# Install python 3 kernel
RUN conda create -n ipykernel_py3 python=3 ipykernel \
 && bash -c 'source activate ipykernel_py3 && python -m ipykernel install'

## further optional functionalities
# R kernel for jupyter
#RUN apt-get update && \
#    apt-get install -y apt-transport-https && \
#    echo "deb https://cran.wu.ac.at/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list && \
#    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
#    apt-get update && \
#    apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev r-base r-base-dev 

#RUN R -e "install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'), repos='http://cran.r-project.org', INSTALL_opts='--no-html')"
#RUN R -e "devtools::install_github('IRkernel/IRkernel'); IRkernel::installspec(user = FALSE)"


USER biodocker

EXPOSE 8888
CMD jupyter notebook --ip=0.0.0.0 --no-browser
