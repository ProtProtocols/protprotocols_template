

# Template for proteomics protocols
Based on the latest biocontainer (biocontainers.pro)

Implements jupyter notebooks with python and R kernels for protocol descriptions

Versions:
latest: 0.1.1
0.1

## Users: Run latest version
- Either latest version: 
```docker pull veitveit/protprotocols_template:latest```
or specific version:
```TODO```
- run image: ```docker run -i -t  -p 8888:8888  protprotocols_template```
- Use the link given by the previous command or access via _0.0.0.0:8888_ in a web browser.


## Developers: Implement docker image 

### build docker image
In the directory where the Dockerfile is located:

`docker build -t protprotocols_template .`

### run docker image
`docker run -i -t  -p 8888:8888  protprotocols_template`

You can change the second 8888 to any port you want to access the web interface


## create a new protocol

a) all above
b) edit Dockerfile to add installation instruction for software used in the protocol
c) use jupyter notebook template to create documented example case and detailed description
d) add instruction to Dockerfile to add newly created notebook
e) add protocol as new repository
