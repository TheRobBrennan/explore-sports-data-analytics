'use client'

const EmbeddedContent = () => {
  const game1Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010022"
  const game2Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010024"

  return (
    <div className="flex flex-col items-center">
      <embed
        src={game1Url}
        type="text/html"
        className="w-full h-full sm:w-9/10 sm:h-9/10">
      </embed>
      <embed
        src={game2Url}
        type="text/html"
        className="w-full h-full sm:w-9/10 sm:h-9/10">
      </embed>
    </div>
  );
};

export default EmbeddedContent;
