kbhbilleder-docker
==================

Docker setup for kbhbilleder.

Requirements
------------
1. [Install Docker](https://store.docker.com/search?type=edition&offering=community)
2. [Dory](https://github.com/FreedomBen/dory#installation)

Get started
-------
1. Clone this repo
2. Clone kbh-billeder, collections-online and collections-online-cumulus into projects/
3. [Add an .env file to ./kbhbilleder/](https://github.com/CopenhagenCityArchives/kbh-billeder#create-a-env-file-with-environment-variables)
4. run ``docker-compose up``
5. Start indexing with `docker-compose exec node npm run index all`
6. Go to `kbhbilleder.docker` in your browser (if `dory` is running)

Tips & tricks
-------------
* Output from the node container: `docker-compose logs -f node`
* If gulp stops because of an error, you can run: `docker-compose exec node npm run gulp`
* Changes in `package.json` should invalidate the Docker image cache.
If it doesn't rebuild, run `docker-compose up --force-rebuild --build`
* You can run `npm install` inside the container with `docker-compose exec node npm install`
* Start indexing with `docker-compose exec node npm run index all`
* If you make changes to your local projects and need a dev-env image for it (read: you made major changes to package.json) run `scripts/build-local-dev-image.sh`
