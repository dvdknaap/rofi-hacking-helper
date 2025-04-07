
FROM __BASE_IMAGE__

ARG DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Install minimal prerequisites as root
RUN apt-get update -qq && \
    apt-get upgrade -y -qq && \
    apt-get install -y -qq --no-install-recommends __KALI_DESKTOP__ curl sudo xvfb fluxbox 

# Ensure sudoers.d exists
RUN mkdir -p /etc/sudoers.d

# Setup regular user
RUN useradd --create-home --shell /bin/bash testuser || echo "User already exists or error creating user."
RUN usermod -aG sudo testuser
RUN echo "testuser  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && chmod 0440 /etc/sudoers

RUN echo 'export PATH="/home/testuser/.local/bin:$PATH"' > /etc/profile.d/local_bin_path.sh && chmod +x /etc/profile.d/local_bin_path.sh

# Switch to the regular user for subsequent commands/runtime
USER testuser
WORKDIR /home/testuser

RUN mkdir -p /tmp/git_source
COPY . /tmp/git_source

ENTRYPOINT ["/bin/bash","/tmp/git_source/.docker/entrypoint.sh"]

CMD ["sleep", "infinity"]
