'use client'

const EmbeddedContent = () => {
  const game1Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010022"
  const game2Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010024"

  return (
    <div className="flex flex-col items-center md:flex-row md:items-start">
      <embed
        src={game1Url}
        type="text/html"
        className="w-full h-[50vh] md:w-[100vw] md:h-[100vh]">
      </embed>
      <embed
        src={game2Url}
        type="text/html"
        className="w-full h-[50vh] md:w-[100vw] md:h-[100vh]">
      </embed>
    </div>
  );
};

export default EmbeddedContent;
