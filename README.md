## Versions
- Debian Jess base image
- Meteor 1.9.3
- Dockerise v0.6.1

## Usage

Update node modules

`docker run --rm chrisgarrett/meteor-dev:1.9.3 npm install`

Run meteor

`docker run -d --name meteor -v /home/chris/meteor:/opt/app chrisgarrett/meteor-dev:1.9.3`

Running a specific version of meteor
`docker run -d --name meteor -v /home/chris/meteor:/opt/app chrisgarrett/meteor-dev:1.9.3 --release 1.2.1`

## Credits

Used Rick Golden's Dockerfile as my source: https://hub.docker.com/r/golden/meteor-dev/
