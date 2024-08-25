# Welcome

This directory contains example data files to explore [MLB](https://www.mlb.com) ([Major League Baseball](https://www.mlb.com)) data.

## Major League Baseball (MLB)

This endpoint is publicly-available and can be accessed by obtaining the game ID from the MLB scoreboard.
Example data is contained in files matching the pattern `YYYYMMDD-visiting-vs-home-<MLB_GAME_ID>.json` from the MLB API:

Example scoreboard URL for the 2024.08.24 game between SF and SEA is [https://www.mlb.com/gameday/giants-vs-mariners/2024/08/24/745218/final/wrap](https://www.mlb.com/gameday/giants-vs-mariners/2024/08/24/745218/final/wrap):

- GET [https://ws.statsapi.mlb.com/api/v1.1/game/745218/feed/live?language=en](https://ws.statsapi.mlb.com/api/v1.1/game/745218/feed/live?language=en)
  - [./2024/20240824-SF-v-SEA-745218.json](./2024/20240824-SF-v-SEA-745218.json)
