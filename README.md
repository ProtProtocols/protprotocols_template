# biocontainer-jupyter

## build docker image
In the directory where the Dockerfile is located:

`sudo docker build -t biocontainer-jupyter .`

## run docker image
`sudo docker run -i -t  -p 8888:8888  biocontainer-jupyter`

You can change the second 8888 to any port you want to access the web interface

## access protocol
Use the link given by the previous command
