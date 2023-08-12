# Welcome

This directory contains example data files to get started with popular sports APIs. A great starting point if you haven't acquired credentials or API keys to access data directly.

## Example data

### Major League Baseball

#### Games

##### 2023.08.09 - San Diego Padres vs Seattle Mariners

Example URLs for this game include:

- Official MLB summary
  - [https://www.mlb.com/gameday/padres-vs-mariners/2023/08/09/717055/final/summary/all](https://www.mlb.com/gameday/padres-vs-mariners/2023/08/09/717055/final/summary/all)
- Example data visualization of various aspects of this game from [Baseball Savant Visuals](https://baseballsavant.mlb.com/visuals)
  - [https://baseballsavant.mlb.com/gamefeed?date=8/9/2023&gamePk=717055&chartType=pitch&legendType=pitchName&playerType=pitcher&inning=&count=&pitchHand=&batSide=&descFilter=&ptFilter=&resultFilter=&hf=&sportId=1](https://baseballsavant.mlb.com/gamefeed?date=8/9/2023&gamePk=717055&chartType=pitch&legendType=pitchName&playerType=pitcher&inning=&count=&pitchHand=&batSide=&descFilter=&ptFilter=&resultFilter=&hf=&sportId=1) -

Example files for this game include:

- GET https://ws.statsapi.mlb.com/api/v1.1/game/717055/feed/live?language=en
  - [mlb-717055-20230809-san-diego-padres-vs-seattle-mariners.json](./mlb-717055-20230809-san-diego-padres-vs-seattle-mariners.json)

### National Football League

#### Games

##### 2023.08.10 - [PRE-SEASON] Minnesota Vikings vs Seattle Seahawks

Example URLs for this game include:

- ESPN game details
  - [http://cdn.espn.com/nfl/boxscore/\_/gameId/401550740](http://cdn.espn.com/nfl/boxscore/_/gameId/401550740)
- NFL game details
  - [https://www.nfl.com/games/vikings-at-seahawks-2023-pre-1](https://www.nfl.com/games/vikings-at-seahawks-2023-pre-1)

Example files for this game include:

- ESPN
  - GET [https://cdn.espn.com/core/nfl/playbyplay?xhr=1&gameId=401550740](https://cdn.espn.com/core/nfl/playbyplay?xhr=1&gameId=401550740)
    - [./nfl-espn-401550740-20230810-minnesota-vikings-vs-seattle-seahawks.json](./nfl-espn-401550740-20230810-minnesota-vikings-vs-seattle-seahawks.json)
- NFL
  - GET [https://api.nfl.com/experience/v1/gamedetails/96bf38fb-0976-11ee-ae17-58f2e1e72efb](https://api.nfl.com/experience/v1/gamedetails/96bf38fb-0976-11ee-ae17-58f2e1e72efb)
    - [./nfl-96bf38fb-0976-11ee-ae17-58f2e1e72efb-20230809-san-diego-padres-vs-seattle-mariners.json](./nfl-96bf38fb-0976-11ee-ae17-58f2e1e72efb-20230809-san-diego-padres-vs-seattle-mariners.json)

### National Hockey League

#### Games

##### 2023.05.13 - Dallas Stars vs Seattle Kraken - Round 2 Game 6 of the 2023 Stanley Cup Playoffs

Example URLs for this game include:

- NHL GameCenter game details
  - [https://www.nhl.com/gamecenter/dal-vs-sea/2023/05/13/2022030236#game=2022030236,game_state=final](https://www.nhl.com/gamecenter/dal-vs-sea/2023/05/13/2022030236#game=2022030236,game_state=final)
- YouTube video for the Kraken intro in this historic event
  - [https://youtu.be/5rr6ZxrYYdc](https://youtu.be/5rr6ZxrYYdc)

Example files for this game include:

- NHL
  - GET [https://statsapi.web.nhl.com/api/v1/game/2022030236/feed/live?site=en_nhl](https://statsapi.web.nhl.com/api/v1/game/2022030236/feed/live?site=en_nhl)
    - [nhl-2022030236-20230513-dallas-stars-vs-seattle-kraken-stanley-cup-playoffs-round-2-game-6.json](./nhl-2022030236-20230513-dallas-stars-vs-seattle-kraken-stanley-cup-playoffs-round-2-game-6.json)
