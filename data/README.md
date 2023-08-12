# Welcome

This directory contains example data files to get started with popular sports APIs. A great starting point if you haven't acquired credentials or API keys to access data directly.

## Example data

### Major League Baseball

#### Games

##### 2023.08.09 - San Diego Padres vs Seattle Mariners

See [https://www.mlb.com/gameday/padres-vs-mariners/2023/08/09/717055/final/summary/all](https://www.mlb.com/gameday/padres-vs-mariners/2023/08/09/717055/final/summary/all) for an official summary of the game - and [https://baseballsavant.mlb.com/gamefeed?date=8/9/2023&gamePk=717055&chartType=pitch&legendType=pitchName&playerType=pitcher&inning=&count=&pitchHand=&batSide=&descFilter=&ptFilter=&resultFilter=&hf=&sportId=1](https://baseballsavant.mlb.com/gamefeed?date=8/9/2023&gamePk=717055&chartType=pitch&legendType=pitchName&playerType=pitcher&inning=&count=&pitchHand=&batSide=&descFilter=&ptFilter=&resultFilter=&hf=&sportId=1) for example data visualization of various aspects of this game from [Baseball Savant Visuals](https://baseballsavant.mlb.com/visuals)

Example files for this game include:

- [mlb-717055-20230809-san-diego-padres-vs-seattle-mariners.json](./mlb-717055-20230809-san-diego-padres-vs-seattle-mariners.json) - GET https://ws.statsapi.mlb.com/api/v1.1/game/717055/feed/live?language=en
