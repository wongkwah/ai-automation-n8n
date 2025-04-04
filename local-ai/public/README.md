# n8n with PostgreSQL and ngrok

This setup provides a Docker Compose configuration for running n8n workflow automation tool with PostgreSQL database and ngrok for public access.

## Features

* n8n workflow automation platform
* PostgreSQL database for persistent storage
* ngrok for secure public access
* Environment variable configuration
* Proper networking and volume management
* Logging configuration

## Setup Instructions

### 1. Create .env file

Copy the example environment file:

```bash
cp .env.example .env
```

Edit the `.env` file and set your configuration values:

```
# Database Configuration
POSTGRES_USER=n8n
POSTGRES_PASSWORD=your_secure_password
POSTGRES_DB=n8n
POSTGRES_PORT=5432

# n8n Configuration
N8N_PORT=5678
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=your_secure_password
N8N_PROTOCOL=https

# ngrok Configuration
NGROK_AUTHTOKEN=your_ngrok_authtoken
NGROK_REGION=us  # Options: us, eu, au, ap, sa, jp, in
```

### 2. Get ngrok Auth Token

1. Sign up for a free account at [ngrok.com](https://ngrok.com)
2. Get your auth token from the ngrok dashboard
3. Add it to your `.env` file

### 3. Start the Services

```bash
docker-compose up -d
```

### 4. Access n8n

* **Local access**: http://localhost:5678
* **Public access**: The ngrok URL will be displayed in the ngrok container logs:

```bash
docker-compose logs ngrok
```

### 5. Stop the Services

```bash
docker-compose down
```

To remove all data volumes:

```bash
docker-compose down -v
```

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| POSTGRES_USER | PostgreSQL username | n8n |
| POSTGRES_PASSWORD | PostgreSQL password | change_this_password |
| POSTGRES_DB | PostgreSQL database name | n8n |
| POSTGRES_PORT | PostgreSQL port | 5432 |
| N8N_PORT | n8n web interface port | 5678 |
| N8N_BASIC_AUTH_USER | n8n basic auth username | admin |
| N8N_BASIC_AUTH_PASSWORD | n8n basic auth password | change_this_password |
| N8N_PROTOCOL | Protocol for webhook URLs | https |
| NGROK_AUTHTOKEN | Your ngrok auth token | - |
| NGROK_SUBDOMAIN | Custom subdomain (paid accounts) | - |
| NGROK_REGION | ngrok region | us |

## Security Considerations

* Change all default passwords in the `.env` file
* Use strong, unique passwords
* Consider using a secrets management solution for production
* Restrict access to your n8n instance using the basic authentication
