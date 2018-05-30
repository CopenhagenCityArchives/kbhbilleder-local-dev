kbhbilleder-docker
==================

Docker setup for kbhbilleder.

Requirements
------------
1. [Install Docker](https://store.docker.com/search?type=edition&offering=community)
2. Clone this repository
3. [Add an .env file to ./kbhbilleder/](https://github.com/CopenhagenCityArchives/kbh-billeder#create-a-env-file-with-environment-variables)

Get started
-------
1. Clone this repo
2. run scripts/clone-projects.sh (in Windows: run git clone for the projects collections-online, collections-online-cumulus and kbhbilleder and place them in the projects folder)
3. run build-image.sh (uses docker to build kbhbilleder-dev). If you're having problems, run the build command manually: ``docker build --tag kbhbilleder:latest-dev -f "./docker/dev-env-Dockerfile" "./.."``
4. add a .env in /projects/kbh-billeder/
5. run ``docker-compose up``

Tips & tricks
-------------
* Output from the node container: `docker-compose logs -f node`
* If gulp stops because of an error, you can run: `docker-compose exec node npm run gulp`
* Changes in `package.json` should invalidate the Docker image cache.
If it doesn't rebuild, run `docker-compose up --force-rebuild --build`
* You can run `npm install` inside the container with `docker-compose exec node npm install`
* Start indexing manually (starts automatically) with `docker-compose exec node run index all`
