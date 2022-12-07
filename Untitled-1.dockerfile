 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    2  sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    3     $(lsb_release -cs) \
    4    stable"
    5  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    6  cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
    7  deb https://apt.kubernetes.io/ kubernetes-xenial main
    8  EOF
    9  sudo apt-get update
   10  sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu kubelet=1.15.7-00 kubeadm=1.15.7-00 kubectl=1.15.7-00
   11  sudo apt-get install docker-ce docker-ce-cli containerd.io
   12  sudo apt-get install -y kubelet=1.15.7-00 kubeadm=1.15.7-00 kubectl=1.15.7-00
   13  sudo apt-mark hold docker-ce kubelet kubeadm kubectl
   14  echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
   15  sudo sysctl -p
   16  sudo kubeadm init --pod-network-cidr=10.244.0.0/16
   17  sudo kubeadm init
   18  rm /etc/containerd/config.toml
   19  systemctl restart containerd
   20  sudo kubeadm init
   21  sudo kube adm
   22  sudo kubeadm init
   23  mkdir -p $HOME/.kube
   24  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   25  sudo chown $(id -u):$(id -g) $HOME/.kube/config
   26  sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
   27  kubectl get nodes
   28  history

kubeadm join 172.31.40.5:6443 --token 506q9x.ww4191pzojsjp50i \
        --discovery-token-ca-cert-hash sha256:e32b2e465fdb13a3f3cf42679a99e2357d8948cc5422909e027307127715cb65


      kubectl apply-f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply-f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml
kubectl get pods --all-namespaces
kubectl get componentstatus
