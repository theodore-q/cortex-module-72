FROM gitpod/workspace-full

USER gitpod

# Install PostgreSQL
RUN sudo apt-get update && \
    sudo apt-get install -y postgresql postgresql-contrib

# Initialize PostgreSQL data directory and start PostgreSQL service
RUN sudo service postgresql start && \
    sudo service postgresql stop

ARG DOCKER_PASS

# Debug: Print the DOCKER_PASS variable (Remove or comment out this line for security)
RUN echo "DOCKER_PASS is $DOCKER_PASS"
