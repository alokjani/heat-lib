#!/bin/bash 
trap 'echo "Failed" > $heat_outputs_path.status; exit;' ERR

if [ "$http_proxy" = "none" ]; then
  unset http_proxy
else
  export HTTP_PROXY=$http_proxy
fi

if [ "$https_proxy" = "none" ]; then
  unset https_proxy
else
  export HTTPS_PROXY=$https_proxy
fi

apt-get install -y apache2
a2enmod ssl

# Insert Script Here
echo "Success" > $heat_outputs_path.status