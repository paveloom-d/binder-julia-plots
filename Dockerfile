# Pull the image containing Julia
FROM paveloom/binder-julia:0.1.0 AS binder-julia

# Base image
FROM paveloom/binder-tex:0.1.0

# Meta information
LABEL maintainer="Pavel Sobolev (https://github.com/Paveloom)"
LABEL version="0.1.0"
LABEL description="If `paveloom/binder-julia` and `paveloom/binder-tex` had a baby."
LABEL github-repository="https://github.com/paveloom-d/binder-julia-plots"
LABEL docker-repository="https://hub.docker.com/r/paveloom/binder-julia-plots"

# Copy the scripts to the root
COPY scripts /scripts

# Allow their execution
RUN sudo chmod -R +x /scripts

# Add `/usr/other/$USER/julia/bin` to the `PATH`
ENV PATH=$PATH:/usr/other/$USER/julia/bin

# Copy the Julia binaries folder
COPY --from=binder-julia /usr/other/$USER/julia /usr/other/$USER/julia

# Copy the Julia environment
COPY --from=binder-julia $HOME/.julia $HOME/.julia

# Install Julia packages
RUN /scripts/user/julia/install-julia-packages.sh

# Remove scripts
RUN sudo rm -rf /scripts