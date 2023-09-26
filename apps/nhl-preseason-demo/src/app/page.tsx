'use client';

const EmbeddedContent = () => {
  const game1Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010022";
  const game2Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010024";

  return (
    <div className="flex flex-col items-center">
      <div className="relative w-full" style={{ paddingBottom: '56.25%' }}>
        <embed
          src={game1Url}
          type="text/html"
          className="absolute top-0 left-0 w-full h-full"
        />
      </div>
      <div className="relative w-full" style={{ paddingBottom: '56.25%' }}>
        <embed
          src={game2Url}
          type="text/html"
          className="absolute top-0 left-0 w-full h-full"
        />
      </div>
    </div>
  );
};

export default EmbeddedContent;
