'use client';
import React from 'react';

const EmbeddedContent = () => {
  const game1Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010022";
  const game2Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010024";

  return (
    <div className="w-full m-0 p-0">
      <div className="relative w-full md:pb-[56.25%] pb-[75%] m-0">
        <iframe
          src={game1Url}
          className="absolute top-0 left-0 w-full h-full m-0 border-0"
          title="Game 1"
          style={{ width: '100vw' }}
        />
      </div>
      <div className="relative w-full md:pb-[56.25%] pb-[75%] m-0">
        <iframe
          src={game2Url}
          className="absolute top-0 left-0 w-full h-full m-0 border-0"
          title="Game 2"
          style={{ width: '100vw' }}
        />
      </div>
    </div>
  );
};

export default EmbeddedContent;
