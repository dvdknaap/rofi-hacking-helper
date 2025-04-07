FROM __BASE_IMAGE__

ARG DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Install minimal prerequisites as root
RUN apt-get update -qq && \
    apt-get upgrade -y -qq && \
    apt-get install -y -qq --no-install-recommends __KALI_DESKTOP__ sudo xvfb fluxbox 

# Ensure we run as root
USER root
WORKDIR /root

RUN mkdir -p /tmp/git_source
COPY . /tmp/git_source
RUN chmod +x /tmp/git_source/.docker/entrypoint.sh
RUN echo 'export PATH="$HOME/.local/bin:$PATH"' > /etc/profile.d/local_bin_path.sh && chmod +x /etc/profile.d/local_bin_path.sh

ENTRYPOINT ["/bin/bash","/tmp/git_source/.docker/entrypoint.sh"]

CMD ["sleep", "infinity"]
