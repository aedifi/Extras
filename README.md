### Extras for Aedificium
[Lua](https://lua.org) plugin for [Cuberite](https://cuberite.org) which provides fun commands and nonessentials for the leisure of players.
<br>
Based off the [mathiascode/extras](https://github.com/mathiascode/Extras) plugin by [Mathias](https://github.com/mathiascode).

### Visitor commands
By default server configuration, these commands are granted to visitors.
| Usage | Alias | Permission(s) | Description |
| ------- | ---------- | ----------- |
| `/delhome [home]` | `/dhome` `/deletehome` | `extras.visitor.delhome` | Deletes a home or your main home. |
| `/gohome [home]` | `/home` | `extras.visitors.gohome` | Takes you to a personal home. |
| `/gowarp <warp>` | `/warp` | `extras.visitor.gowarp` | Takes you to an operable warp. |
| `/homes` | | `extras.visitor.homes` | Lists personal homes. |
| `/particles` | `/effects` | `extras.visitor.particles` | Lists configured particles. |
| `/sethome [home]` | | `extras.visitor.sethome` | Sets a home at your coordinates. |
| `/warps` | | `extras.visitor.warps` | Lists operable warps. |

### Architect commands
By default server configuration, these commands are granted to architects.
| Usage | Alias | Permission(s) | Description |
| ------- | ---------- | ----------- |
| `/disguise <disguise> <entity[:baby]> [name]` | `/dis` | `extras.architect.disguise` | Disguises you as any entity. |
| `/hat` | `/head` | `extras.architect.hat` | Gives you a special hat. |
| `/name <name | default>` | `/nick` `/nickname` | `extras.architect.name` | Changes your name on the server. |
| `/reveal` | `/undis` `/undisguise` | `extras.architect.reveal` | Reveals you of any disguise. |
| `/scare` | `/jumpscare` | `extras.architect.scare` | Creates a jumpscare for every player on the server. |
| `/setwarp <warp>` | | `extras.architect.setwarp` | Sets a warp at your coordinates. |
| `/speed <speed | default>` | | `extras.architect.speed` | Sets your maximum speed. |
| `/trail <particle | air>` | | `/extras.architect.trail` | Sets a particle trail. |