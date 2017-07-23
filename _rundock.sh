#!/bin/bash
echo
if [ -z $1]; then
  RS=1873
  echo "rstudio server port not set, setting to $RS, the year South Hall was built :)"
else
  RS=$1
fi
if [ -z $2]; then
  WP=2014
  echo "web preview port not set, setting to $WP, the year MIDS launched :P"
else
  WP=$2
fi

# pull fresh docker image
echo
echo "pulling container image..."
docker pull w201rdada/portfolio

# delete container if already running
# save your work! memory will be lost but changes to local volume won't
docker rm -f portfolio

echo
echo "running portfolio container..."

# A hack to make docker ps list vertically for readability
FORMAT="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\nSIZE\t{{.Size}}\n"

# Run container...
docker run \
  --name portfolio -d -p $RS:8787 -p $WP:2015 \
  -e USER=oski -e PASSWORD=goldenbears -e USERID=$UID \
  -v "$(pwd)":/home/oski \
  w201rdada/portfolio \
&& docker ps -a -s --format="$FORMAT" \
&& DIP="$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' portfolio)" \
&& echo \
&& echo "...success!" \
&& echo "  rstudio server listening at http://localhost:$RS or http://$DIP:$RS" \
&& echo "    user: oski" \
&& echo "    pass: goldenbears" \
&& echo "  web preview listening at http://localhost:$WP or http://$DIP:$RS" \

# Arguments to docker run:
# --name the container "portfolio". Helps prevent proliferation of containers.
# -d Start the container in detached mode
# -p Map, respectively, the host ports $RS and $WP to container ports:
#  8787 (used by rstudio server) and
#  8008 (used by python simpleHTTPserver).
# -e execute shell commands when container runs.
#  The variables are used by ./init to set up the user within the container.
#  See base image docs: https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image#custom-use
# -v this maps your host's working directory to the oski user's home directory within the container
# w201rdada/portfolio is the dockerhub image from which to run the container

# docker ps: lists -a all running and stopped containers

