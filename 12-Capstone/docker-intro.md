# Docker Introduction

## Learning Goals

By the end of this lesson you should be able to:

- Explain what Docker & Containerization are
- Read a basic Dockerfile
- Explain what docker-compose does
- Build a simple Rails app with Docker

## What is Docker & Containerization

Docker is a set of platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers.

**What?**

Lets do some vocabularly and history.  In the _old_ days when you wanted to launch a service on the web you bought a server (see image below) and then:

- Installed the Operating System
- Installed all your app's dependencies
- Installed your app
- Configured your app
- Debugged your mistakes
- Then connected your server to the internet and launched your service

![Sample Server](assets/server.png)

This was too much work, and a service might only use a portion of the CPU and memory available to the server.  We could (and did) install multiple services on the same server, but then ran the risk of conflicts between the services.  What is one app required Ruby 2.3 and another required 2.4?  What if they both used conflicting version of python?

### Enter Virtualization!

Instead of installing everything on one "bare metal" machine we set up the physical server to emulate many servers.  Using software like Virtualbox, Hyper-V or VMWare one computer could run emulators pretending to be many servers, each with their own operating systems, disk space, software libraries etc.  Each **virtual machine** runs independently of the others consuming a portion of the physical server's resources.  

This was a great deal more efficient, but you still had to...

- Installed the Operating Systems
- Installed all your app's dependencies
- Installed your app
- Configured your app
- Debugged your mistakes
- Then connected your server to the internet and launched your service

Just on a virtual machine, instead of a physical one!  Still too much work!

![Too much work meme](assets/too-much-work.jpg)

### Docker To The Rescue

![Docker to the rescue](assets/docker-to-the-rescue.jpg)

Now Docker enters the picture.  When you install Docker it installs **one** linux virtual machine.  Instead of configuring a new computer for each app, we take advantage of the Namespace feature of Linux.  

If you run an set of software in a namespace, it runs separately from all other applications and code.  Each namespace operates **independently** in terms of library code, CPU, Memory and hard disk space.  So you can have Python 2 running in one namespace and Python 3 running in another.  You can also have conflicting library code installed in sparate namespaces without conflict.

![Container image from Stephen Grider's Udemy Course](assets/diagrams-15-stack.png)
_[image from Docker & Kubernetes: The complete Guide](https://www.udemy.com/share/101WjMAkEacV9UQn4=/)_

### Docker Terminology

- **Docker Client** - A tool which provides a command-line interface (CLI) that lets you build run and stop application commands to the Docker daemon.  The **docker** command.
- **Docker Server** - a tool designed to make it easier to create, deploy, and run applications by using containers.  You installed it when you installed Docker on your computer.
- **Docker Machine** - a tool that lets you install Docker Engine on virtual hosts, and manage the hosts with docker-machine commands.  You can use it to create Docker hosts on a local computer or cloud hosted machines.
- **Docker Image** - a file, comprised of multiple layers, used to execute code in a Docker container.  It's used to build and run an app in a container.
- **Docker Hub** - a cloud-based repository in which Docker users and partners create, test, store and distribute container images.
- **Docker Compose** - a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application's services.

## Building A Rails App with Docker

### Starter App

### Dockerfile

### Docker Compose

### Starting and Stopping Stuff

## What about this Kubernetes Thingy I Heard About...

## Resources

- [Docker Hub](https://hub.docker.com/)
- [Getting Started with Docker](https://docs.docker.com/get-started/)
- [Offical tutorials with Rails, Django etc](https://docs.docker.com/samples/#sample-applications)