FROM gitpod/workspace-full

USER gitpod

# Install PostgreSQL
RUN sudo apt-get update && \
    sudo apt-get install -y postgresql postgresql-contrib

# Initialize PostgreSQL data directory and start PostgreSQL service
RUN sudo service postgresql start && \
    sudo service postgresql stop

ARG DOCKER_PASS

# Debug: Print PostgreSQL service status
RUN sudo service postgresql status

# Debug: Print the DOCKER_PASS variable (Remove or comment out this line for security)
RUN echo "DOCKER_PASS is $DOCKER_PASS"

# Create a PostgreSQL role named `gitpod` using the DOCKER_PASS environment variable as the password, and then create a database `gitpod` owned by the `gitpod` role.
RUN sudo service postgresql start && \
    sudo -u postgres psql -c "CREATE ROLE gitpod WITH LOGIN SUPERUSER PASSWORD '$DOCKER_PASS';" && \
    sudo -u postgres createdb gitpod -O gitpod && \
    sudo service postgresql stop

# Start PostgreSQL service
CMD sudo service postgresql start && tail -f /dev/null
