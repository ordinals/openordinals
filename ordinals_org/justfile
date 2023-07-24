set positional-arguments

deploy:
  ssh root@inscribingamsterdam "mkdir -p deploy \
    && mkdir -p /var/lib/inscribingamsterdam \
    && apt-get update --yes \
    && apt-get upgrade --yes \
    && apt-get install --yes git rsync"
  scp Caddyfile index.html banner.jpeg root@inscribingamsterdam:/var/lib/inscribingamsterdam
  rsync -avz deploy/* root@inscribingamsterdam:deploy/
  ssh root@inscribingamsterdam './deploy/setup'

log:
  ssh root@inscribingamsterdam 'journalctl -fu inscribingamsterdam'

test: 
  python3 -m http.server
