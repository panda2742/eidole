import {Client} from 'discord.js';
import * as dotenv from 'dotenv';
dotenv.config({ path: "./envs/.env" });

const client: Client = new Client({
	intents: 53608447,
});

client.login(process.env.DISCORD_TOKEN);
