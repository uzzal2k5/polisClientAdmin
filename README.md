# polisClientAdmin
Docker images for **polis devployment** -

 Anyone can pull ready image from my repository as bellow or build from my git 
    
    docker pull uzzal2k5/polis_postgresql:1.0
    docker pull uzzal2k5/polis_server:1.0
    docker pull uzzal2k5/polis_clientadmin:1.0
         
    

Build docker image for **polisClientAdmin**
    
    git clone <repo.git>
    cd repo &&  docker build -t polis_clientadmin:latest .


Environment variable need to tell

       // need to tell where is  polisServer
      
        SERVICE_URL=http://<polis_server_hostname or polis_server_IP>
        
        if polis_server ip = 172.17.0.3 then
            
            SERVICE_URL=http://172.17.0.3
        
       

docker container run
    
        docker run -itd --name polisclientadmin -p 5002:5002 -e SERVICE_URL=http://<polis_server_hostname or polis_server_IP>  polis_clientadmin:latest
        
        
        


Container Lists using **docker ps** command  

    [root@uzzal POLIS]# docker ps
    CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS              PORTS                              NAMES
    a82332c7d17b        polis_clientadmin:latest   "sh x"                   5 seconds ago       Up 4 seconds        0.0.0.0:5002->5002/tcp             polisclientadmin
    b883fc6a5b45        polis_server:latest        "sh x"                   40 minutes ago      Up 40 minutes       0.0.0.0:5000->5000/tcp, 5001/tcp   polisserver
    6e281987f6b8        polis_postgresql:latest    "docker-entrypoint.s…"   27 hours ago        Up 27 hours         0.0.0.0:5432->5432/tcp             polisdb

 

