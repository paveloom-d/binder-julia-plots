# Pull the image containing Julia
FROM paveloom/binder-julia:0.1.1 AS binder-julia

# Base image
FROM paveloom/binder-tex:0.1.1

# Meta information
LABEL maintainer="Pavel Sobolev (https://github.com/Paveloom)"
LABEL version="0.1.1"
LABEL description="If `paveloom/binder-julia` and `paveloom/binder-tex` had a baby."
LABEL github-repository="https://github.com/paveloom-d/binder-julia-plots"
LABEL docker-repository="https://hub.docker.com/r/paveloom/binder-julia-plots"

# Copy the scripts to the root
COPY scripts /scripts

# Allow their execution
RUN sudo chmod -R +x /scripts

# Create a hidden folder for the user
RUN sudo mkdir -p /usr/other/$USER && \
    sudo chgrp -R $USER /usr/other/$USER && \
    sudo chmod -R g+w /usr/other/$USER

# Copy the Julia binaries folder
COPY --from=binder-julia --chown=$USER:$USER /usr/other/$USER/julia /usr/other/$USER/julia

# Copy the Julia environment
COPY --from=binder-julia --chown=$USER:$USER $HOME/.julia $HOME/.julia

# Add `/usr/other/$USER/julia/bin` to the `PATH`
ENV PATH=$PATH:/usr/other/$USER/julia/bin

# Install Julia packages
RUN /scripts/user/julia/install-julia-packages.sh

# Remove scripts
RUN sudo rm -rf /scripts