# Rails & Vue

Example project containing a configured, initialized and dockerized Rails app with a single page frontend build with Vue.
Could be a good starting point for other projects.

### Run Locally with Docker
Requirements:
- [Docker](https://docs.docker.com/install/)
- [Docker Compose](https://docs.docker.com/install/)

1. To install the app and start ide-debug run:  
`docker-compsoe up`

2. To configure **Ruby SDK for RubyMine** go to *Settings*->*Add*->*New Remote*->*Docker Compose*.  
In *Service* dropdown select *app*.  
Apply changes.

3. To configure **RubyMine to run in remote debug mode** go to *Run*->*Edit Configurations*->*Add New Configuration*->*Ruby remote debug*.  
In *Remote root folder* specify */usr/src/app*.  
In *Local root folder* specify a path where the project was installed.  
Apply changes.

4. Now while docker compose is **up** start the debug configuration in RubyMine.  

5. Access the app at [http://localhost:3000](http://localhost:3000).


To run the app from scratch (reinstalls gems, node modules and recreates db):  
`DRY_RUN=true docker-compose up`

### Docker Configuration Features:
- Entrypoint script automatically checks whether any gems are missing and installs them;
- Gems are being cached between builds and restarts because they are mounted as volume;
- Automatic installation of node modules;
- Node modules are being cached between builds and restarts because they are mounted as volume;
- Optionally dependencies can be installed on build. See `bundle_on_build` build arg. Useful for distributing production images;
- Entrypoint script waits until Postgres is ready;
- Entrypoint script checks whether the DB was created and creates one if not;
- Optionally migrations run automatically on every container startup. Could be disabled to speed startup more;
- Code is mounted as volume so changes are being applied immediately;
- Postgres data is mounted as a volume so persists between builds;
- Configured to run in debug mode from RubyMine.

### Features:
- vue router
- proper routes configuration to allow vue's routes history mode
- includes Trailblazer
- axios for api fetching
- trailblazer loader disabled and using rails loader instead
- rspec
- factory bot
- faker
- vue formulate
