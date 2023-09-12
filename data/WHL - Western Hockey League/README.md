# Welcome

This directory contains example data files to explore [WHL](https://chl.ca/whl/) ([Western Hockey League](https://chl.ca/whl/)) data.

## Western Hockey League (WHL)

Example data is contained in files matching the pattern `YYYYMMDD-visiting-vs-home-<WHL_GAME_ID>.json` from the WHL API using the `game_id` (`1020236` in the example below) as a query parameter.

### Game summary

- GET [https://cluster.leaguestat.com/feed/index.php?feed=gc&key=41b145a848f4bd67&client_code=whl&game_id=1020236&lang_code=en&fmt=json&tab=gamesummary](https://cluster.leaguestat.com/feed/index.php?feed=gc&key=41b145a848f4bd67&client_code=whl&game_id=1020236&lang_code=en&fmt=json&tab=gamesummary)
  - [20230910-SEA-vs-POR-1020236-gamesummary.json](./20230910-SEA-vs-POR-1020236-gamesummary.json)

### Play-by-play (verbose)

- GET [https://cluster.leaguestat.com/feed/index.php?feed=gc&key=41b145a848f4bd67&client_code=whl&game_id=1020236&lang_code=en&fmt=json&tab=pxpverbose](https://cluster.leaguestat.com/feed/index.php?feed=gc&key=41b145a848f4bd67&client_code=whl&game_id=1020236&lang_code=en&fmt=json&tab=pxpverbose)
  - [./20230910-SEA-vs-POR-1020236-pxpverbose.json](./20230910-SEA-vs-POR-1020236-pxpverbose.json)
