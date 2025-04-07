# Enhanced n8n Basic Docker Setup

This directory contains an enhanced version of the basic n8n Docker Compose setup. The configuration provides a solid foundation for running n8n locally with improved reliability, security, and performance.

## Usage

### Environment Configuration

1. Copy the example environment file:

```bash
   cp .env.example .env
   ```

2. Edit the `.env` file to customize your configuration:

```bash
   vim .env
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

### Customization

You can modify the following settings as needed:

* Database credentials
* n8n authentication credentials
* Port mappings
* Volume names

## Documentation

For more information about n8n configuration options, see the [official n8n documentation](https://docs.n8n.io/hosting/installation/docker/).
