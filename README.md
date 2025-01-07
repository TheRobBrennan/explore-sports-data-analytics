# Welcome

This project explores working with a variety of APIs for sports data analysis and visualization.

## Getting started

### Let's look at some sample data

Before considering tooling and software to review and analyze data, we need to find some meaningful data we want to work with.

Please review the overview of sample data locally available within this project at [data/README.md](data/README.md).

## Download data from supported sources

### EXAMPLE: Download NHL Game Data

Please note that functionality exists to download Seattle Kraken NHL data as of this writing (Monday, January 6th, 2025).

Make sure that `src/download_nhl.sh` is executable:

```bash
chmod +x src/download_nhl.sh
```

The project includes several scripts for downloading NHL game data:

- `npm run download:kraken` - Downloads Kraken game data for the current date
- `npm run download:nhl:kraken` - Downloads Kraken game data for the current date
- `npm run download:nhl:kraken:date` - Example to demonstrate how to download Kraken game data for YYYY-MM-DD

To download data for a specific date, you can modify the date in `package.json` or use the shell script directly:

```bash
./src/download_nhl.sh kraken YYYY-MM-DD
```

### EXAMPLE: Download WHL Game Data

Please note that functionality exists to download Seattle Kraken NHL data as of this writing (Monday, January 6th, 2025).

Make sure that `src/download_whl.sh` is executable:

```bash
chmod +x src/download_whl.sh
```

The project includes several scripts for downloading NHL game data:

- `npm run download:tbirds` - Downloads Kraken game data for the current date
- `npm run download:whl:tbirds` - Downloads Kraken game data for the current date
- `npm run download:whl:tbirds:date` - Example to demonstrate how to download Kraken game data for YYYY-MM-DD

To download data for a specific date, you can modify the date in `package.json` or use the shell script directly:

```bash
./src/download_whl.sh thunderbirds YYYY-MM-DD
```
