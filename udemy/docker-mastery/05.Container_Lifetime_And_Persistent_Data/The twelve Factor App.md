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

## 5. Build, release, run

- A codebase is transformed into a deploy through three stages:
  - The _build stage_
    - Converts a code repo into an executable bundle known as a `build`.
    - It fetches vendors dependencies and compiles binaries and assets.
    - Initiated by the developer's whenever new code is deployed
  - The _release stage_
    - Takes the build, and combines it with deploy's current config.
    - ready for immediate execution in the execution environment.
    - Every release should have a unique release ID
    - Releases are an append-only ledger
    - A release cannot be mutated once it is created.
  - The _run stage_
    - Run's the app in the execution environment
    - Can happen automatically in cases such as a server reboot, etc.
    - Should be kept to as few moving parts as possible.
- **The twelve-factor app uses strict seperation between the build, release, and run stages.**

## 6. Processes

- The app is executed in the execution environment as one or more processes.
- Twelve-factor app processes are stateless and share nothing.
- Any data that needs to be persisted needs to be stored in a stateful _backing service_, typically a database.
- The memory-space or filesystem can be used as a brief, single-transaction cache.
- It never assumes that anything cached in memory or on disk will be available in a future request.
- Some web-apps rely on "sticky sessions":
  - caching user session data in memory of the app's process
  - Sticky sessions are a violation of twelve-factor and should never be relied on.
  - This data should be stored in a datastore such as "Memcached" or "Redis".

## 7. Port binding

- Export services via Port binding
- The twelve-factor app is completely self-contained and does not rely on runtime injection of a webserver into the execution environment to create a web-facing service.
- The web-app exports **HTTP as a service** by binding to a port, and listening to requests coming in on that port.
- With this approach, one app can become a _backing service_ for another app, by using the URL as a resource handle.

## 8. Concurrency

- The twelve-factor app recommends processes to be:
  - share-nothing
  - horizontally partitionable
  - handle their own internal multiplexing
  - able to span multiple processes running on multiple physical machines.
  - should not daemonize or write PID files, instead rely on OS' system manager for that.
- The apps take strong cues from the **Unix process model for running service daemons**
  - Each type of work is assigned to a process type

## 9. Disposability

- The twelve-factor's apps are _disposable_
  - Can be started or stopped at a moment's notice
  - Strive to _minimize startup time_
- Fast Scaling
- Rapid deployment of code/config changes, and robustness of production deploys
- Processes shut-down gracefully when they receive a SIGTERM signal
- Processes should also be robust against certain death.
