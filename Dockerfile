FROM osrf/ros:noetic-desktop-full

#USER ARGS
ARG USERNAME=traxxas
ARG USER_UID=1000
ARG USER_GID=$USER_UID

#CREATE USER
RUN groupadd --gid $USER_GID $USERNAME && \
    useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME && \
    mkdir /home/$USERNAME/.config && chown -R $USER_UID:$USER_GID /home/$USERNAME/.config && \
    mkdir /home/$USERNAME/.local/ && chown -R $USER_UID:$USER_GID /home/$USERNAME/.local && \ 
    usermod -aG dialout traxxas

#INSTALL APPS
RUN apt-get update && \ 
    apt-get install -y gpg neovim curl wget pip git && \
    rm -rf /var/lib/apt/lists/*

#INSTALL SUDO
RUN apt-get update && \ 
    apt-get install -y sudo && \
    echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers && \
    rm -rf /var/lib/apt/lists/*

#COPY VIM CONFIG
USER $USERNAME
COPY ./init.vim   /home/$USERNAME/.config/nvim/init.vim    
USER root

#INSTALL VIM PLUG
USER $USERNAME
RUN curl -fLo /home/$USERNAME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
USER root

#INSTALL ROS JOYSTICK DRIVERS
RUN apt-get update && \ 
    apt-get install -y ros-noetic-joy && \
    rm -rf /var/lib/apt/lists/*

#INSTALL ROSSERIAL
RUN pip install pyserial && \
    apt-get update && \ 
    apt-get install -y ros-noetic-rosserial-arduino && \
    apt-get install -y ros-noetic-rosserial && \ 
    rm -rf /var/lib/apt/lists/*   

#SET ENTRYPOINT & SOURCE ROS
COPY ./entrypoint.bash /entrypoint.bash
RUN echo "source /opt/ros/noetic/setup.bash" >> /home/$USERNAME/.bashrc
RUN echo "source /traxxas_ws/devel/setup.bash" >> /home/$USERNAME/.bashrc
ENTRYPOINT ["/bin/bash", "/entrypoint.bash"]

CMD ["bash"]
