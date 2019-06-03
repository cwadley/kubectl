# kubectl
A docker image with Kubernetes tools

## Tools
* kubectl
* kubectx
* kubens
* aws CLI
* aws-iam-authenticator

## Usage
`docker run -it cwadley/kubectl bash`

Once the container is running interactively, all of the above tools are accessible. Generate a `~/.kube/config` file (or volume mount it), and you are off to the races.