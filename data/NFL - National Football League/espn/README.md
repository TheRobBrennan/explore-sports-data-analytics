# Welcome

This directory contains example data files to explore [NFL](https://www.nfl.com) ([National Football League](https://www.nfl.com)) data from ESPN.

## ESPN

This endpoint is publicly-available and can be accessed by obtaining the game ID from the ESPN NFL scoreboard.

Example data is contained in files matching the pattern `YYYYMMDD-visiting-vs-home-<NFL_GAME_ID>.json` from the publicly available ESPN API:

- ESPN play-by-play details
  - GET [https://cdn.espn.com/core/nfl/playbyplay?xhr=1&gameId=401671907](https://cdn.espn.com/core/nfl/playbyplay?xhr=1&gameId=401671907)
    - [Preseason Week 1 - SEA vs LAC](./2024-25/20240810-SEA-vs-LAC-401671907-preseason-week-1.json)
    - [Preseason Week 2 - SEA vs TEN](./2024-25/20240817-SEA-vs-TEN-401673562-preseason-week-2.json)
    - [Preseason Week 3 - CLE vs SEA](./2024-25/20240824-CLE-vs-SEA-401671904-preseason-week-3.json)
    - [Week 01 - DEN vs SEA](./2024-25/20240908-DEN-vs-SEA-401671664-week-01.json)
