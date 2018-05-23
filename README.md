kbhbilleder-docker
==================

Docker setup for kbhbilleder.

Requirements
------------
1. [Install Docker](https://store.docker.com/search?type=edition&offering=community)
2. Clone this repository
3. [Add an .env file to ./kbhbilleder/](https://github.com/CopenhagenCityArchives/kbh-billeder#create-a-env-file-with-environment-variables)

Mac & Linux
------------
1. `gem install dory`
2. `dory up`
3. `docker-compose up -d && docker-compose logs -f node`
4. [Go to kbhbilleder.docker](http://kbhbilleder.docker)
5. ☕️🤷‍♂️ ???
6. Profit! 💰

Windows
-------
1. `git submodule init`
2. `git submodule update --recursive --remote`
3. `docker-compose up -d; docker-compose logs -f node`
4. `docker ps`
5. Find the kbhbilleder-docker_node port
6. Access `localhost:port`
7. ☕️🤷‍♂️ ???
8. Profit! 💰

Tips & tricks
-------------
* Output from the node container: `docker-compose logs -f node`
* If gulp stops because of an error, you can run: `docker-compose exec node npm run gulp`
* Changes in `package.json` should invalidate the Docker image cache.
If it doesn't rebuild, run `docker-compose up --force-rebuild --build`
* You can run `npm install` inside the container with `docker-compose exec node npm install`
* Start indexing manually (starts automatically) with `docker-compose exec node run index all`
