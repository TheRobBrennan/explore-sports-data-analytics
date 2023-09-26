'use client';
import React from 'react';

const EmbeddedContent = () => {
  const game1Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010022";
  const game2Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010024";

  return (
    <div className="flex flex-col items-center">
      <div className="relative w-full md:pb-[56.25%] pb-[75%]">
        <iframe
          src={game1Url}
          className="absolute top-0 left-0 w-full h-full"
          frameBorder="0"
          scrolling="no"
          title="Game 1"
        />
      </div>
      <div className="relative w-full md:pb-[56.25%] pb-[75%]">
        <iframe
          src={game2Url}
          className="absolute top-0 left-0 w-full h-full"
          frameBorder="0"
          scrolling="no"
          title="Game 2"
        />
      </div>
    </div>
  );
};

export default EmbeddedContent;
