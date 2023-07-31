set positional-arguments

deploy:
  ssh root@ordinals.org "mkdir -p deploy \
    && apt-get update --yes \
    && apt-get upgrade --yes \
    && apt-get install --yes git rsync"
  rsync -avz deploy/* root@ordinals.org:deploy/
  ssh root@ordinals.org 'chmod 777 ./deploy/setup'
  ssh root@ordinals.org './deploy/setup'
  rsync -avz site/Caddyfile root@ordinals.org:/var/lib/openordinals/
  rsync -avz --exclude='Caddyfile' site/* root@ordinals.org:/var/www/openordinals/

log:
  ssh root@ordinals.org 'journalctl -fu openordinals'

test: 
  python3 -m http.server -d site
