

# Template for proteomics protocols: biocontainer-jupyter
Versions:

latest: 0.1


## Users: Run latest version
- Either latest version: 
```docker pull ```
or: 


- 
- Use the link given by the previous command or access via _0.0.0.0:8888_ in a web browser.


## Developers: Implement docker image 

### build docker image
In the directory where the Dockerfile is located:

`sudo docker build -t biocontainer-jupyter .`

### run docker image
`sudo docker run -i -t  -p 8888:8888  biocontainer-jupyter`

You can change the second 8888 to any port you want to access the web interface


## create a new protocol

a) all above
b) edit Dockerfile to add installation instruction for software used in the protocol
c) use jupyter notebook template to create documented example case and detailed description
d) add instruction to Dockerfile to add newly created notebook
e) add protocol as new repository
