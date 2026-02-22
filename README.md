# GreenDIGIT-sensor
GreenDIGIT project / Simple sensor of temperature in a datacentre https://greendigit-project.eu/
## About
Simple implementation of a  temperature sensor for a data center. Part of the toolset controlling the CPU frequency based on power-grid signals. The tool is universal and allows also capping the power usage based on current temperature in the data center to provide secure and more efficient housing of high-performance computing equipment.
## Instalation
This proof of concept implementation use I2C sensor.
* enable I2C on your PRi
* setup properly the security
* chceckout this repository and from the direcotry call GreenDIGIT-sensor call
> docker compose up -d --build
* try the sensor
> wget http://IP:/api/greendigit/data
