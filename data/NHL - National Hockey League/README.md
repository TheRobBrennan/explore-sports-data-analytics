# Welcome

This directory contains example data files to explore [NHL](https://www.nhl.com) ([National Hockey League](https://www.nhl.com)) data.

[![Video](https://img.youtube.com/vi/5rr6ZxrYYdc/maxresdefault.jpg)](https://www.youtube.com/watch?v=5rr6ZxrYYdc)

[![](/assets/screenshot-nhl-shot-chart-on-vercel.png)](https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/nhl-schedule?gameId=2022030236&timezone=America%2FLos_Angeles)

For extra credit, if you want to see some of the exploration I'm doing with R and Python specifically for hockey data, feel free to check out my GitHub repo at [https://github.com/TheRobBrennan/explore-nhl-api-with-r-and-python](https://github.com/TheRobBrennan/explore-nhl-api-with-r-and-python)

## National Hockey League (NHL)

Example data is contained in files matching the pattern `YYYYMMDD-visiting-vs-home-<NHL_GAME_ID>.json` from the NHL API:

- GET [https://statsapi.web.nhl.com/api/v1/game/2022030236/feed/live?site=en_nhl](https://statsapi.web.nhl.com/api/v1/game/2022030236/feed/live?site=en_nhl)

  - [./20230513-DAL-vs-SEA-2022030236.json](./20230513-DAL-vs-SEA-2022030236.json)

### Additional URLs

Example URLs to work with this API include:

- NHL GameCenter game details

  - [https://www.nhl.com/gamecenter/dal-vs-sea/2023/05/13/2022030236#game=2022030236,game_state=final](https://www.nhl.com/gamecenter/dal-vs-sea/2023/05/13/2022030236#game=2022030236,game_state=final)
