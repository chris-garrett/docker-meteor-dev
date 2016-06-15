## Versions
- Ubuntu 16.04
- Meteor 1.3.3

## Usage

Update node modules

`docker run --rm mackay/meteor-dev npm install`

Run meteor

`docker run -d --name meteor -v /home/chris/meteor:/opt/app mackay/meteor-dev`

Running a specific version of meteor
`docker run -d --name meteor -v /home/chris/meteor:/opt/app mackay/meteor-dev --release 1.2.1`

## Credits

Used Rick Golden's Dockerfile as my source: https://hub.docker.com/r/golden/meteor-dev/

