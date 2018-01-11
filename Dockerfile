FROM biocontainers/biocontainers:latest

USER root

# Install jupyter (python 2 version)
RUN python -m pip install --upgrade pip \
 && python -m pip install jupyter

# Install python 3 kernel
RUN conda create -n ipykernel_py3 python=3 ipykernel \
 && bash -c 'source activate ipykernel_py3 && python -m ipykernel install'

## further functionalities
# R kernel for jupyter
#TODO

USER biodocker

EXPOSE 8888
CMD jupyter notebook --ip=0.0.0.0 --no-browser
