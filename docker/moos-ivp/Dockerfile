FROM ubuntu:18.04 as build
LABEL maintainer = Conlan Cesar <conlanc@csail.mit.edu>

# Install required MOOS dependencies
RUN apt-get update -y && apt-get install -y cmake build-essential subversion && apt-get clean

# Build Arguments
ARG SVN_REV=HEAD

# Check-out the MOOS-IvP trunk
RUN svn co -r "$SVN_REV" https://oceanai.mit.edu/svn/moos-ivp-aro/trunk "/home/moos/moos-ivp"

# Build the MOOS-IvP tools
RUN cd "/home/moos/moos-ivp" && ./build-moos.sh --minrobot && ./build-ivp.sh --nogui

# Runtime Image
FROM ubuntu:18.04
LABEL maintainer = Conlan Cesar <conlanc@csail.mit.edu>

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Add MOOS variables to the env
ENV PATH="/home/moos/moos-ivp/bin:${PATH}"
ENV IVP_BEHAVIOR_DIRS="/home/moos/moos-ivp/lib"

# Make a user to run the MOOS apps
RUN useradd -m -p "moos" moos && usermod -a -G sudo moos

# Runtime Deps
RUN apt-get update -y && apt-get install -y netbase net-tools && apt-get clean -y

# Set the default user
USER moos

# Set the default entry dirctory to the moos user's home
WORKDIR "/home/moos"

# Copy build files
COPY --from=build --chown=moos:moos /home/moos/moos-ivp /home/moos/moos-ivp

