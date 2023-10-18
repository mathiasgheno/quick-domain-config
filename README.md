<p align="center">
  <img alt="Quick Domain Config Early Logo" src="https://i.imgur.com/qjCylkk.png" width="200">
</p>



<div align="center">
  <a href="">
    <img alt="MIT Licensed" src="https://img.shields.io/github/license/mathiasgheno/ducto" />
  </a>
</div>

# Quick Domain Config

Define custom domains in your Ubuntu Operational System, througth an JSON config and with one command.

### Prerequisites

```shell
sudo apt install jq && sudo install nginx
```

### Define your `router.json` file

```json
{
  "git.me": "https://github.com/mathiasgheno"
}
```

### Installing

```shell
chmod +x ./scripts/init.sh && cd ./scripts && ./init.sh
```

### Use Cases

- Direct access to YouTube and Spotify Playlists
- Direct access to Notion Page
- Direct access to any query params search URL like google