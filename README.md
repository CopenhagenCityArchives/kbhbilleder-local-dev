# kbhbilleder-local-dev

Simplificeret docker-compose setup, som tager udgangspunkt i https://github.com/CopenhagenCityArchives/kbh-billeder

## Mål
Et lokalt setup, med så mange features som muligt aktiveret, men med begrænset afhængigheder til eksterne services/prebuilds.

Det er ikke meningen, at dette setup skal køres i produktion, men at det kan bruges som udgangspunkt for rettelser i koden i de tre repositories, som udgør kbhbilleder.dk

## Kom i gang
Projektet kræver at du har Docker og Git installeret.

Ved en komplet ny opstart af projektet skal følgende gøres:
* Klon dette projekt: `git clone https://github.com/CopenhagenCityArchives/kbhbilleder-local-dev` (det er vigtigt at mappen du kloner til er tilgængelig for Docker. Du kan dele drev med Docker under Settings i Docker)
* Hent de tre repos collections-online:testing, collections-online-cumulus:master og kbh-billeder:master til mappen /projects
Det gøres med disse kommandoer:

  * `git clone --branch="master" https://github.com/CopenhagenCityArchives/kbh-billeder.git projects/kbh-billeder`
  * `git clone --branch="testing" https://github.com/CopenhagenCityArchives/collections-online.git projects/collections-online`
  * `git clone --branch="master" https://github.com/CopenhagenCityArchives/collections-online-cumulus.git projects/collections-online-cumulus`

* Udfyld .env med de nødvendige variabler (se .env-example for en komplet liste over indstillinger), og placer den i roden af dette projekt (den vil blive mappet til de relvante lokationer i projects-mappen). De enkelte variabler kan også sættes i docker-compose-filen hvis det er nødvendigt. Disse vil i så fald override variablerne i .env-filen.

* Kør `docker-compose -f docker-compose.build.local.yml up -d --force-recreate --build` og vent cirka 10 minutter

* Kør `docker-compose -f docker-compose.build.local.yml exec nodejs npm run prepublish`  (bygger frontenden)

* Kør `docker-compose -f docker-compose.build.local.yml exec nodejs npm run index`  (henter assets fra Cumulus, som er ændret de seneste 10 minutter)

* Nu er du klar til at udvikle og teste!

## Nyttige kommandoer
* Kør nodemon og gulp watch (god til udvikling): `docker-compose -f docker-compose.build.local.yml exec nodejs npm start:dev`


## Porte og services
Følgende lokationer er tilgængelige på din localhost:
* http://localhost:9200: ElasticSearch (de indekserede assets fra Cumulus)
* http://locahost:8000: Nginx-frontenden (cache for billeder fra Cumulus)
* http://locahost:9000: Direkte adgang til Node-appen
* http://localhost:27017: MongoDB (data fra Keystone CMS)

## Todo
* Setuppet er ikke testet på Linux og Mac OS

## Ændringer ift. kbhbilleder-docker
### Ny docker-compose fil
* Nginx udskilt som egen server. Det giver et mere overskueligt server-setup, og hurtigere builds.
* Minimeret ram-forbrug for ElasticSearch (512 mb), og hukommelsesforbruget for servicen er eksplicit angivet i docker-compose-fil. Det gør det nemmere at skalere løsningen til lokale ressourcer
* Fjernet data-volume for MongoDB, da mappingen ikke er understøttet for ikke-EXT4-drev (Windows), jf. dette issue: https://github.com/docker-library/mongo/issues/190. Det gør det muligt at køre løsningen på Windows, og giver ikke udfordringer ift. gemte data.
* Alle udadvendte port-mappings er nu eksplicitte
* Fjernet links-parametrene fra node-servicen. De er ikke længere understøttet.
* .env og google-key.json bliver nu mappet fra rodmappen.

### Dockerfile for Node-servicen
* Fjernet brugen af wait-for-it til gengæld for depends_on-parameteren i Docker-compose. Der er ikke oplevet problemer med denne løsning, og gør brugen af npm run mere gennemskuelig
* Flyttet npm variablerne NODE_ENV og NPM_CONFIG_LOGLEVEL til .env-filen.

### Nginx-servicen
* Fjernet image-libraries fra nginx-serveren, da disse ikke ser ud til at blive brugt.
* Opsat proxyen til Node-servicen korrekt (der er ikke behov for en upstream-konfiguration)


### npm run:
* Kommandoen nodemon er lavet om til følgende: `nodemon --watch . --watch ../collections-online --watch ../collections-online-cumulus server.js`

### .env
* Omstruktureret .env så dens variabler er mere overskueligt arrangeret
