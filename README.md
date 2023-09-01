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