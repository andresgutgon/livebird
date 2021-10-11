# What?
This is me playing with [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html)

## TODO
- [ ] Create the app locally and serve it in a Docker environment
- [ ] Deploy to [fly.io](https://fly.io/) if they have a free Postgresql tier. If not let's see
- [ ] Think about some mini app to do and try LiveView realtime


## Local development
Local development is done with a `docker-compose.yml` file to have inside a Docker env Postgresql and Elixir.
Environment variables are set on root `.env` file. Make sure you create this file. copy from `env.example`

Run the server in your local machine:
```
docker-compose --env-file .env.dev up
```

Enter in the container and run commands:
```
 docker-compose --env-file .env.dev run web bash
 ```

## Production
Production is done in the `Dockerfile` in the root of the project. This file is used by [fly.io](https://fly.io/) in their servers.
