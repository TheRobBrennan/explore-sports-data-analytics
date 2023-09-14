# Welcome

This directory contains example data files to explore [WHL](https://chl.ca/whl/) ([Western Hockey League](https://chl.ca/whl/)) data.

## Western Hockey League (WHL)

Example data is contained in files matching the pattern `YYYYMMDD-visiting-vs-home-<WHL_GAME_ID>-<tab>.json` from the WHL API.

### Game summary

Example data using the `gamesummary` tab:

- GET [https://cluster.leaguestat.com/feed/index.php?feed=gc&key=41b145a848f4bd67&client_code=whl&game_id=1020236&lang_code=en&fmt=json&tab=gamesummary](https://cluster.leaguestat.com/feed/index.php?feed=gc&key=41b145a848f4bd67&client_code=whl&game_id=1020236&lang_code=en&fmt=json&tab=gamesummary)
  - [./preseason/20230910-SEA-vs-POR-1020236-gamesummary.json](./preseason/20230910-SEA-vs-POR-1020236-gamesummary.json)

### Play-by-play (verbose)

Example data using the `pxpverbose` tab:

- GET [https://cluster.leaguestat.com/feed/index.php?feed=gc&key=41b145a848f4bd67&client_code=whl&game_id=1020236&lang_code=en&fmt=json&tab=pxpverbose](https://cluster.leaguestat.com/feed/index.php?feed=gc&key=41b145a848f4bd67&client_code=whl&game_id=1020236&lang_code=en&fmt=json&tab=pxpverbose)
  - [./preseason/20230910-SEA-vs-POR-1020236-pxpverbose.json](./preseason/20230910-SEA-vs-POR-1020236-pxpverbose.json)
