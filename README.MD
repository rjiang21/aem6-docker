### Install AEM CQ 6.2 to Docker
Due to the copyright issue, I cannot upload the AEM 6.2 jar file and the licence file to the github.
In order to build your own AEM CQ 6.2 docker image, please make sure your AEM 6.2 jar file and the licence file are in
the same folder as Dockerfile.
This will install an author instance in the docker. But if you want to install a publish instance, simple change the naming in file and the Dockerfile.
Here, the default CQ jar file is cq-author-p4502.jar and the licence file is license.properties.
Port 80, 443, 4502, 58242 are open.
Port 58242 is for debugging port.
![file structure](https://raw.githubusercontent.com/rjiang21/aem6-docker/master/filestructure.png)

### To Install the image
```aidl
   docker build -t aem/cq:6.2 . 
```

### To start a container
```aidl
    docker run -t -i -p 4502:4502 -p 58242:58242 -p 80:80 -p 443:443 aem/cq:6.2 /bin/bash
```
### To start AEM CQ in your container
```aidl
    service aem6 start
```

