<a href="https://wakatime.com/badge/user/1f18b09f-6cf2-4aa1-a256-b88b4b5616fe/project/aa825971-ae1c-437b-9415-82df72047644"><img src="https://wakatime.com/badge/user/1f18b09f-6cf2-4aa1-a256-b88b4b5616fe/project/aa825971-ae1c-437b-9415-82df72047644.svg" alt="wakatime"></a>

# Eidole

Eidole is a Discord service including a bot and a webapp. Everything works fine
locally and by using Docker compose.

Launch the projet:
```bash
make
```
Stop the project and remove Docker content:
```bash
make stop
```

# The Discord bot

Technology: TypeScript (NodeJS) with Discord.js
To launch only the Discord bot, you can do:
```bash
cd bot ; make
```