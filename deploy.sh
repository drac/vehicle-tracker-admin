#!/bin/bash
set -x

openssl aes-256-cbc -K $encrypted_44f843209bfd_key -iv $encrypted_44f843209bfd_iv -in priv.enc -out /tmp/id_rsa -d
chmod 600 /tmp/id_rsa

rsync -r --delete-after -Pav -e "ssh -i /tmp/id_rsa -o StrictHostKeyChecking=no" $TRAVIS_BUILD_DIR/public core@api.neu.edu.tr:/srv/vehicle-tracker-admin/

rm -rf /tmp/id_rsa
