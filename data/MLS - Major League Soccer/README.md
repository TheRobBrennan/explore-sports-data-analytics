# Welcome

This directory contains example data files to explore [MLS](https://www.mlssoccer.com) ([Major League Soccer](https://www.mlssoccer.com)) data.

## Major League Soccer (MLS)

![https://images.mlssoccer.com/image/upload/t_keep-aspect-ratio-e/assets/venue-backgrounds/7425.jpg](https://images.mlssoccer.com/image/upload/t_keep-aspect-ratio-e/assets/venue-backgrounds/7425.jpg)

### 2024

Example data is contained in files matching the pattern `YYYYMMDD-<MLS_GAME_ID>-visiting-vs-home-<LABEL>.json`

#### Saturday, August 17th, 2024 - LAFC vs Seattle Sounders

This game (ID # **289017421**) can be viewed on the MLS site at [https://www.mlssoccer.com/competitions/leagues-cup/2024/matches/seavslafc-08-17-2024/](https://www.mlssoccer.com/competitions/leagues-cup/2024/matches/seavslafc-08-17-2024/)

##### MLS Sport API - sportapi.mlssoccer.com

- [Sport API - Match details](https://sportapi.mlssoccer.com/api/matches/289017421?) - [data](./2024/20240817-289017421-LAFC-vs-SEA-sport-api-match-details.json)
- [Sport API - Players by match](https://sportapi.mlssoccer.com/api/players/byMatch/289017421?culture=en-us) - [data](./2024/20240817-289017421-LAFC-vs-SEA-sport-api-players-by-match.json)
- [Sport API - Previous matches](https://sportapi.mlssoccer.com/api/previousMatches/3500?culture=en-us&secondClub=11690&matchDate=2024-08-18T00:00:00Z&maxItems=3&formGuideMatchesCount=5) - [data](./2024/20240817-289017421-LAFC-vs-SEA-sport-api-previous-matches.json)

##### MLS Stats API 0 stats-api.mlssoccer.com

- [Stats API - Match details](https://stats-api.mlssoccer.com/v1/matches?&match_game_id=289017421&include=away_club_match&include=home_club_match&include=venue&include=home_club&include=away_club) - [data](./2024/20240817-289017421-LAFC-vs-SEA-stats-api-match-details.json)
- [Stats API - Commentary](https://stats-api.mlssoccer.com/v1/commentaries?&match_game_id=289017421&commentary_type=secondyellow%20card&commentary_type=penalty%20goal&commentary_type=own%20goal&commentary_type=yellow%20card&commentary_type=red%20card&commentary_type=substitution&commentary_type=goal&include=club&include=player&order_by=commentary_period&order_by=commentary_minute&order_by=commentary_second&order_by=commentary_timestamp&order_by=commentary_opta_id&page=0&page_size=100) - [data](./2024/20240817-289017421-LAFC-vs-SEA-stats-api-commentary.json)
- [Stats API - Goals](https://stats-api.mlssoccer.com/v1/goals?&match_game_id=289017421&order_by=goal_minute&include=club&include=first_assist_player&include=second_assist_player) - [data](./2024/20240817-289017421-LAFC-vs-SEA-stats-api-goals.json)
