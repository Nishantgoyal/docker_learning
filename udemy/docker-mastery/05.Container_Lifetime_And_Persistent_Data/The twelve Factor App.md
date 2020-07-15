# The 12 Factor App

It is a methodology for building software-as-a-service apps.

## 1. Codebase

- One codebase tracked in revision control, many deploys
- There is always a one-to-one correlation between the codebase and the app:
  - For a distributed system, there are multiple codebases, and each component is an app, individually complying with the twelve-factor.
  - Multiple apps sharing the same code is a violetion of the twelve-factor.
- A *deploy* is a running instance of the app, like dev, staging, testing, or production environments.
- The codebase is same across all deploys, although different versions may be active in each deploy.

## 2. Dependencies

- Explicitely declare and isolate dependencies.
- For most programming languages, libraries installed through a packaging system can be installed:
  - system-wide, known as site-packages
  - scoped, into the directory, containing the app
- **A twelve-factor app never relies on implicit existence of system-wide packages**
- A twelve-factor app:
  - declares all dependencies, completely and exactly, via a _dependency declaration_ manifest
  - uses a _dependency isolation tool_ during execution to ensure that no implicit dependencies "leak-in" from the surrounding system.
- **dependency declaration** and **isolation** must always be used together, to satisfy the twelve-factors.
- Twelve-factor apps do not rely on the implicit existence of any system tools.

## 3. Config

- Store config in the environment
- An app's config is everything that is likely to be vary between `deploys`, including:
  - Resource handles to database, redis, etc.
  - Credentials to external services, such as Amazon S3 or Twitter
  - Per deploy value such as the canonical hostname for the deploy
- twelve-factor requires **strict seperation of config from code**
  - Apps sometime store configs as constants which is a violation of the twelve-factor.
- This defination of _config_ does not include internal application config, such as routes. It does not vary between deploys and hence is best done in code.
- In a twelve-factor app, env vars are granular controls, each fully independent to other.

## 4. Backing Services

- Treat backing services as attached resources.
- A backing service is any service the app consumes over the network as part of its normal operation. Normally these are local to the application. 
  - datastores: MySQL, CouchDB
  - messaging/queueing system: Kafka, RabbitMQ
  - SMTP services for outbound email
  - Caching systems
- In addition, the app may use services provided and managed by third parties, like:
  - metric-gathering: New Relic or Loggly
  - API-accessible consumers: Twitter
- The code for a twelve-factor app makes no distinction between local and third party services
- To the app, both are attached resources, accessed via a URL or other locater/credentials stored in the config.
- Each _distinct_ backing service is a resource.
- Resources can be attached to and detatched from deploys at will.

