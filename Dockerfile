FROM debian:bullseye

# Install required dependencies
RUN apt-get update && apt-get install -y \
  bash \
  cowsay \
  fortune-mod \
  netcat \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add the directory to PATH (where cowsay and fortune are usually installed)
ENV PATH="/usr/games:${PATH}"

# Set the working directory
WORKDIR /app

# Copy the script into the container
COPY wisecow.sh .

# Ensure the script is executable
RUN chmod +x wisecow.sh

# Expose the required port
EXPOSE 4499

# Set the entry point for the container
ENTRYPOINT ["bash", "wisecow.sh"]
