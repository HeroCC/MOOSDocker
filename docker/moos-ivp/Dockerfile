FROM ubuntu:18.04
LABEL maintainer = Conlan Cesar <conlanc@csail.mit.edu>

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Add MOOS variables to the env
ENV PATH="/home/moos/moos-ivp/bin:${PATH}"
ENV IVP_BEHAVIOR_DIRS="/home/moos/moos-ivp/lib"

# Install required MOOS dependencies
RUN apt-get update -y && apt-get install -y cmake build-essential subversion && apt-get clean

# Make a user to run the MOOS apps
RUN useradd -m -p "moos" moos && usermod -a -G sudo moos

# Set the default user
USER moos

# Set the default entry dirctory to the moos user's home
WORKDIR "/home/moos"

# Build Arguments
ARG SVN_REV=HEAD

# Check-out the MOOS-IvP trunk
RUN svn co -r "$SVN_REV" https://oceanai.mit.edu/svn/moos-ivp-aro/trunk /home/moos/moos-ivp

# Build the MOOS-IvP tools
RUN cd "$HOME/moos-ivp" && ./build-moos.sh --minrobot --release && ./build-ivp.sh --nogui

