# swarm-jitsi-meet
Jitsi meet on Docker swarm

Online conference significantly improves our productivity, avoids unnecessary physical contacts and saves cost. Free online conference services are provided by many IT companies, which is a great thing. However hosting your own online conference service does have its advantages such as securing your company confidential data and enjoying better audio / video quality. At work, I deploy Jitst meet which is a great free and open source online conference solution. However Jitsi meet is rather complicated to setup properly, so I am going to show you how to setup Jitsi meeting easily in Docker swarm + Traefik environment.

So before doing the setup, I assume that you have the following things working
1. A docker swarm (can be a single server or a cluster)
2. Traefik is running in your docker swarm.
3. At least of the docker node has public IP. (ex: 123.123.123.123)
4. Configure a public url for jitsi points to the aforementioned host. (jitsi.mydomain.com -> 123.123.123.123)
5. If you have a more than 1 node in your docker swarm cluster, you need to have a NFS share so that data is accessible to all nodes.

Setup steps:
1. Get the files from github
2. Edit jitsi.yml: (search for the text EDIT ME)
   - Set Host for the Traefik rule
   - Set the docker host that JVB will run on. This host should be the one that jitsi public url points to
   - Note that traefik_network is the name of the Traefik network.
3. Edit file jitsi_stack_start.sh:
   - Set value for CONFIG. This is the location of the jitsi meet cfg (downloaded from github). It has to be accessible to all docker nodes, in my case, I use NFS.
   - Set value for PUBLIC_URL
   - Set value for TZ
   
4. Create the stack by executing the script jitsi_stack_start.sh   

The setup is meant for private usage. So it restricts that:
1. Only registered user can create conference rooms. To create user: run the following command in the container that runs prosody
   - Go to the docker node that run prosody, run: 
        docker container exec -it <container_id> /bin/bash
       	prosodyctl --config /config/prosody.cfg.lua register <userName1> auth.meetjitsi <password1>
		prosodyctl --config /config/prosody.cfg.lua register <userName2> auth.meetjitsi <password2>
		...
		
2. Guests can only join conference rooms.

Now your jitsi is ready. You can access it via web https://jitsi.mydomain.com (or http://jitsi.mydomain.com depending on your traefik TLS config) or the Jitsi meet mobile app.

Notes:
1. Jitsi meet has mobile apps which can be installed from Google store / Apple app store. After installing, you need to configure the server url in the mobile app settings.
2. You can follow similar steps to run Jitsi meeting on Kubernetes, but I prefer Docker swarm because it fits my company's needs really well. Docker swarm is simple and it just works.
3. You should use the generated random room name.
4. You can explore other configurations by reading the docker jitsi meet readme (such as enabling letsencrypt, ...) 

References:
1. The docker-jitsi-meet project (https://github.com/jitsi/docker-jitsi-meet)
