# Setup Dashstack Next

## Setup GitHub Write Access if needed

For write access to the repo, add your SSH Key to Github.

Put your new devhost Pub key on GitHub:\
i.e.

* From: `cat ~/.ssh/id_ed25519.pub`
* To: [https://github.com/settings/keys](https://github.com/settings/keys)

## Clone the DashStack Repo

This repo was formed form the MCCI IoT-Dashboard.

* [https://github.com/sheeriot/dashstack](https://github.com/sheeriot/dashstack)

Clone the DashStack Repo to the `/opt/docker` folder:

>`git clone git@github.com:sheeriot/dashstack.git /opt/docker dashstack`

## Create a Compose .env File for Variables

create .env in compose folder.

    IOT_DASHBOARD_NGINX_FQDN=surveyor1.kttex.com
    IOT_DASHBOARD_CERTBOT_FQDN=surveyor1.kttex.com

    IOT_DASHBOARD_CERTBOT_EMAIL=certs@austinvoicedata.com

    IOT_DASHBOARD_DATA=/var/opt/dashstack
    
    IOT_DASHBOARD_GRAFANA_SMTP_FROM_ADDRESS=monitor@austinvoicedata.com
    IOT_DASHBOARD_GRAFANA_ADMIN_PASSWORD=XXXXX

    IOT_DASHBOARD_INFLUXDB_INITIAL_DATABASE_NAME=iotdashdb

    # IOT_DASHBOARD_MAIL_HOST_NAME=surveyor1.kttex.com
    # IOT_DASHBOARD_MAIL_DOMAIN=surveyor1.kttex.com

    IOT_DASHBOARD_NODERED_INSTALL_PLUGINS=node-red-contrib-influxdb node-red-node-base64

    IOT_DASHBOARD_TIMEZONE=America/Chicago

## Docker-Compose Up

Start the Docker-Compose with

> `docker-compose up`

Start and Detach with

> `docker-compose up -d`

RTFM
