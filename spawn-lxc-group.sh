for i in `seq 0 10`;
do
  lxc launch ubuntu:16.04 c$i  
done
