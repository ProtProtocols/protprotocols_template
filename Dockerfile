FROM biocontainers/biocontainers:latest

USER root

RUN python -m pip install --upgrade pip \
 && python -m pip install jupyter

USER biodocker

EXPOSE 8888
CMD jupyter notebook --ip=0.0.0.0 --no-browser
