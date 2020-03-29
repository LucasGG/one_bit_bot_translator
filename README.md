# one bit bot translator

Second challenge for <onebitcode.com>

## Diagram

<https://www.draw.io/#G1hEnUu0WCP4TAWFVDKx5A1pHAe9vwGmBf>

## Running

```shell
docker-compose up
```

## Test

```shell
docker-compose run --rm app bin/rspec
```

## Loading environment

Create a `.env.{environment}` file that will be automatically loaded
before initialization (see `app-entrypoint.sh`).
