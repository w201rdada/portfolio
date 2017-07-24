#!/bin/bash
bash <(dos2unix < _build.sh) && bash <(dos2unix < _deploy.sh)
