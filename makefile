DOCKER_VOLUME := $(HOME)/work/docker/jenkins_data

build:
	@docker pull jenkins
run:
	echo $(DOCKER_VOLUME)
	@docker run -p 8080:8080 -d \
				--name=jenkins-master \
				-v $(DOCKER_VOLUME):/var/jenkins_home \
				--env JAVA_OPTS="-Xmx8192m" \
				--env JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300"\
				jenkins
	
start:
	@docker start jenkins-master
stop:
	@docker stop jenkins-master
clean:	stop
	@docker rm -v jenkins-master