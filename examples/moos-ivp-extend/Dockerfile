# File created by Conlan Cesar @ MIT
# This file should be used as a template for your extend trees, tweak it as you see fit

FROM moosivp/moos-ivp:trunk

# Replace this label with yourself
LABEL maintainer = Conlan Cesar <conlanc@csail.mit.edu> 

# Change this to the name of your extend tree
ENV MOOS="moos-ivp-extend"

# Adds the bin/ to path and lib/ to behaviors dir
ENV PATH="/home/moos/${MOOS}/bin:${PATH}"
ENV IVP_BEHAVIOR_DIRS="${IVP_BEHAVIOR_DIRS}:/home/moos/${MOOS}/lib"

# Install any extra dependencies you need here
USER root
#RUN sudo apt install -y my-very-cool-dependency
USER moos

# If your Dockerfile is at the root of your repo, this will the entire repo into the container
# Don't forget to create a .dockerignore! (LPT: Symlink it to .gitignore)
COPY --chown=moos:moos "." "${HOME}/${MOOS}/"

# Build 
RUN cd "${HOME}/${MOOS}" && ./build.sh

