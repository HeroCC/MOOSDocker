FROM ubuntu:18.04 as build
LABEL maintainer = Conlan Cesar <conlanc@csail.mit.edu>

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Install required MOOS build dependencies
RUN apt-get update && apt-get install -y cmake build-essential subversion && apt-get clean

# Check-out the MOOS-IvP trunk
RUN svn co https://oceanai.mit.edu/svn/moos-ivp-aro/trunk /moos-ivp

# Build the MOOS-IvP tools
RUN cd "/moos-ivp" && ./build-moos.sh -m && ./build-ivp.sh --nogui --nodebug


# Runtime Image
FROM ubuntu:18.04
LABEL maintainer = Conlan Cesar <conlanc@csail.mit.edu>

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Runtime deps
RUN apt-get update && apt-get install -y netbase && apt-get clean

# Make a user to run the MOOS apps
RUN useradd -m -p "moos" moos && usermod -a -G sudo moos

# Set the default user
USER moos

# Set the default entry dirctory to the moos user's home
WORKDIR "/home/moos"

# Add MOOS variables to the env
ENV PATH="/home/moos/moos-ivp/bin:${PATH}"
ENV IVP_BEHAVIOR_DIRS="/home/moos/moos-ivp/lib"

# Copy built moos-ivp
COPY --from=build --chown=moos:moos /moos-ivp "/home/moos/moos-ivp"

