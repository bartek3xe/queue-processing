# SYMFONY + REDIS PROJECT TEMPLATE

This repository is a project template based on Symfony and Redis.
It includes Docker setup, a Makefile for command management, and tools for code testing with CI on GitHub.
The template is ready to be used as a base for building more advanced applications.

## Technologies used in this project

- **Symfony** - a PHP framework for web applications.
- **Redis** - a NoSQL database used for caching and queue management.
- **Docker** - for running the application in containers, creating a consistent environment.
- **Makefile** - a tool to manage project commands, like starting the server or running tests.
- **PHPUnit** - for unit testing.
- **Behat** - for acceptance testing.
- **GitHub Actions** - CI/CD pipeline for automated testing and deployment.

## Requirements

- **Docker and Docker Compose** - required for container setup.
- **PHP** - version compatible with Symfony.
- **Composer** - for PHP dependency management.

## Getting Started

To start the project, follow these steps:

1. Clone the repository:
```git clone https://github.com/bartek3xe/symfony-redis-template.git```
```cd symfony-redis-template```

2. Start Docker containers:
```make start```

3. Install PHP dependencies:
```make composer-install```

4. Run migrations:
```make migrate```

5. The application should be available at: ```http://localhost:8888```.

6. Reload docker containers:
```make reload```

7. Stop application:
```make stop```

## Project structure
```
symfony-redis-template/
├── .github/
│ └── workflows/ # GitHub Actions CI configuration
├── docker/ # Docker configuration files
│ ├── app/ # PHP configuration (e.g., Dockerfile)
│ └── nginx/ # Nginx server configuration
├── src/ # Main Symfony application code
├── tests/ # Tests for the application
│ ├── Behat/ # Behat test scenarios
│ └── PHPUnit/ # PHPUnit test cases
├── Makefile # Collection of commands to manage the project
└── README.md # Project documentation
```

## Makefile Commands
To show list of available commands run:
```make help```

This template provides a solid base for Symfony + Redis projects, with fast setup, container management, and built-in testing and CI.
