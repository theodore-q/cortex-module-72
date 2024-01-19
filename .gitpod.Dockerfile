FROM gitpod/workspace-full

USER gitpod

# Install PostgreSQL
RUN sudo apt-get update && \
    sudo apt-get install -y postgresql postgresql-contrib

# PostgreSQL Initialization (if needed)
# RUN sudo service postgresql start && \
#     sudo service postgresql stop

# Create user and database
RUN sudo service postgresql start && \
    sudo -u postgres psql -c "CREATE USER gitpod WITH SUPERUSER PASSWORD 'gitpod';" && \
    sudo -u postgres createdb gitpod && \
    sudo service postgresql stop

# Start PostgreSQL service
CMD sudo service postgresql start && tail -f /dev/null
