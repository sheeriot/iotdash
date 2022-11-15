# IoT Dash

SheerIoT is an abrupt focus on making IoT technologies operational through knowledge sharing and collaboration.

## Why am I here?

This repository is used to house infrastructure-as-code (IaC) for deploying IoT Dashboard Applications.

For documentation and collaboration purposes, strong preference is for an Open-Source approach and corresponding application choices.

Typical software applications:

* Mosquitto - MQTT Broker
* Nginx for Web Hosting, Reverse-Proxy, Load-balancing)
* InfluxDB for Time Series Database
* Grafana for Ad Hoc Query and Dashboards
* Django for Custom Apps

This projects is focussed on Infrastructure as Code (IaC) using Terraform.

## Building Blocks

### Azure Infrastructure

The Azure subfolder contains terraform for building an Azure Infrastructure (network and VM) for hosting an IoT application.

### RF Field Surveyor

The RF Field Surveyor is a Python Django web application, hosted by NGINX in production.

The RF Field Surveyor is used to validate LoRaWAN Network Coverage. It contains three primary components:

* Packet Tracker - inspect RF Performance by Device
* ClimateWAN - graphs temperature, humidity, battery by device
* Surveyor - the GPS Pages provide maps of device location, signal strength, gateway, distance. Very powerful for field validation.
