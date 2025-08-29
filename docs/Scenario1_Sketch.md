🔗 Context Summary for New Chat

We are building a staged DevOps lab hosted on Ubuntu 24 VM, using containers and Git for version management.

The lab explores:

Client/server architecture

Containerized backend (web + db) and frontend clients

Network topologies and performance monitoring

Security configuration and scaling scenarios

We decided to start with Stage 1: a single website with local clients:

Backend: One web server container (Nginx or Apache) serving a static HTML page.

Clients:

Interactive (browser → localhost)

Scripted (e.g., curl, wget, or a simple load test with k6/Locust).

Setup:

docker-compose.yml to launch web server container

Client scripts to verify connectivity

Runs entirely on localhost

The goal is to stand up a minimal working lab as a foundation for later stages.
