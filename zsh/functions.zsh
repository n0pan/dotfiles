create_docker () {
  docker-machine create -d virtualbox --virtualbox-no-vtx-check "$1"
}
