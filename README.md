## Versions
- Ubuntu 16.04
- Meteor 1.3.5.1

## Usage

Update node modules

`docker run --rm chrisgarrett/meteor-dev npm install`

Run meteor

`docker run -d --name meteor -v /home/chris/meteor:/opt/app chrisgarrett/meteor-dev`

Running a specific version of meteor
`docker run -d --name meteor -v /home/chris/meteor:/opt/app chrisgarrett/meteor-dev --release 1.2.1`

## Credits

Used Rick Golden's Dockerfile as my source: https://hub.docker.com/r/golden/meteor-dev/
