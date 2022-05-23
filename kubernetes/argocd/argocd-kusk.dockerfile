FROM argoproj/argocd:latest

# Switch to root for the ability to perform install
USER root

# Install tools needed for your repo-server to retrieve & decrypt secrets, render manifests 
# (e.g. curl, awscli, gpg, sops)
RUN apt-get update && \
  apt-get install -y curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  curl -sSLf https://raw.githubusercontent.com/kubeshop/kusk/main/scripts/install.sh > install.sh && \
  chmod +x install.sh && ./install.sh

# Switch back to non-root user
USER 999