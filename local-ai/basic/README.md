# Enhanced n8n Basic Docker Setup

This directory contains an enhanced version of the basic n8n Docker Compose setup. The configuration provides a solid foundation for running n8n locally with improved reliability, security, and performance.

## Enhancements

The following enhancements have been made to the basic n8n Docker setup:

1. **Alpine-based PostgreSQL**: Using the Alpine variant for a smaller image footprint
2. **Health Checks**: Added for both PostgreSQL and n8n services to ensure proper startup sequence
3. **Improved Restart Policies**: Using `unless-stopped` for n8n to prevent automatic restarts during intentional shutdowns
4. **Network Isolation**: Services are placed in a dedicated bridge network
5. **Log Rotation**: Configured JSON file logging with size and file count limits
6. **Execution Settings**: Added main process execution mode and timezone configuration
7. **Named Volumes**: Explicit naming for better volume management
8. **Optional Redis Integration**: Commented configuration for Redis to enable queue mode
9. **Dependency Management**: n8n properly waits for PostgreSQL to be healthy before starting

## Usage

### Environment Configuration

1. Copy the example environment file:


```bash
   cp .env.example .env
   ```

2. Edit the `.env` file to customize your configuration:


```bash
   nano .env
   ```

### Starting the Services

To start the services:

```bash
docker-compose up -d
```

Access n8n at: http://localhost:5678 (or your configured host/port)

Default credentials:
* Username: admin
* Password: adminpass

You can change these credentials in the `.env` file.

## Optional Features

### Redis Queue Mode

To enable Redis for improved performance with queues:

1. Uncomment the Redis service section
2. Uncomment the Redis volume
3. Uncomment the Redis environment variables in the n8n service

### Customization

You can modify the following settings as needed:

* Database credentials
* n8n authentication credentials
* Port mappings
* Volume names

## Documentation

For more information about n8n configuration options, see the [official n8n documentation](https://docs.n8n.io/hosting/installation/docker/).
