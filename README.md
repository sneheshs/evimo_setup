# Setup
Scripts below assume evimo_setup folder is in your home folder

Build docker container
`docker build --tag ev_imo:1.0 .`

Create the catkin workspace
`./initialize_ev_imo_catkin_workspace.sh`

Run docker container from evimo_setup folder
Flags allow:
* Creates a fake home directory with same name as host user for roscore to store things
* Mounts the catkin workspace in that fake home directory
* running as host user (so permissions and ownership is correct on host machine file system)
* allows using sudo, so you can still modify the container's files
* gives access to hosts X server (GUI apps)
* insecure, only run trusted software in here

```bash
docker run -it \
    --user=(id -u $USER):(id -g $USER) \
    --env="DISPLAY" \
    --workdir="/home/$USER" \
    --volume="/home/$USER/evimo_setup/docker_home:/home/$USER" \
    --volume="/home/$USER/evimo_setup/catkin_ws:/home/$USER/catkin_ws" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    ev_imo:1.0 \
    bash
```

Once inside test compilation with:
```bash
cd catkin_ws
catkin_make
```

# Old information
## libcaer only needed for full rpg_davis_ros build
From: https://gitlab.com/inivation/dv/libcaer

```bash
cd ..
git clone https://gitlab.com/inivation/dv/libcaer.git
cd libcaer
cmake -DCMAKE_INSTALL_PREFIX=/usr .
make -j8
sudo make install
```