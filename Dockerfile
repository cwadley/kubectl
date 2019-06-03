FROM centos:7
RUN yum -y update \
	&& yum -y groupinstall development \
	&& yum -y install https://centos7.iuscommunity.org/ius-release.rpm \
	&& yum -y install python36u python36u-pip git vim
RUN python3.6 -m pip install awscli --upgrade \
	&& curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/aws-iam-authenticator \
	&& chmod +x ./aws-iam-authenticator \
	&& cp ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator \
	&& curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
	&& chmod +x ./kubectl \
	&& mv ./kubectl /usr/local/bin/kubectl \
	&& mkdir ~/.kube
RUN git clone https://github.com/ahmetb/kubectx /opt/kubectx \
	&& ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx \
	&& ln -s /opt/kubectx/kubens /usr/local/bin/kubens