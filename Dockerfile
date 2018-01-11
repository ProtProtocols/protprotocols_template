FROM biocontainers/biocontainers:latest

USER root

# Install jupyter (python 2 version)
RUN python -m pip install --upgrade pip \
 && python -m pip install jupyter

# Install python 3 kernel
RUN conda create -n ipykernel_py3 python=3 ipykernel \
 && bash -c 'source activate ipykernel_py3 && python -m ipykernel install'

# Install R
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
 && echo "deb http://cran.wu.ac.at/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y libcurl3-dev libssl-dev r-base

# Install R kernel
RUN R -e "install.packages('devtools', repos='http://cran.rstudio.com/')" \
      -e "devtools::install_github('IRkernel/IRkernel')" \
      -e "IRkernel::installspec()"

RUN chown -R biodocker:biodocker /home/biodocker

USER biodocker


WORKDIR /home/biodocker
RUN mkdir IN  OUT LOG misc && rmdir bin

# Changes in web interface
COPY page.html /usr/local/lib/python2.7/dist-packages/notebook/templates/
COPY tree.html /usr/local/lib/python2.7/dist-packages/notebook/templates/
COPY Eubic_logo.png /home/biodocker/misc

# template for protocol notebook
COPY 'Protocol Template.ipynb' .

EXPOSE 8888
CMD jupyter notebook --ip=0.0.0.0 --no-browser
