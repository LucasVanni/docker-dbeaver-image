[Go to Portuguese documentation](README_pt-BR.md)

# DBeaver Cloud Docker Image

This Docker image is based on DBeaver Cloud and has been optimized to reduce computational costs. The image uses `alpine:latest` as its base, ensuring a lightweight and efficient footprint.

## Features

- **Lightweight Base**: Uses the `alpine:latest` image to ensure a minimal and secure base.
- **Java Runtime**: Includes `openjdk21-jre-headless` to run Java applications without the overhead of a graphical interface.
- **Cache Cleaning**: Removes caches and temporary files to reduce the image size.
- **Driver Elimination**: Removes unnecessary database drivers to optimize performance.
- **Startup Script**: Configured to run the `run-server.sh` script on startup.

## Usage Instructions

1. **Build the Image**: 
   ```bash
   docker build -t dbeaver-cloud-optimized .
   ```

2. **Run the Container**:
   ```bash
   docker run -d dbeaver-cloud-optimized
   ```

## Technical Details

- **Environment Variables**:
  - `CLOUDBEAVER_HOME`: Sets the installation directory for CloudBeaver.
  - `DRIVERS_TO_ELIMINATE`: List of database drivers to be removed for optimization.

- **Optimizations**:
  - Combines `RUN` commands to reduce the number of layers in the image.
  - Removes unnecessary log files and drivers to improve performance.

## Contributions

Contributions are welcome! Feel free to open issues or pull requests for improvements.
