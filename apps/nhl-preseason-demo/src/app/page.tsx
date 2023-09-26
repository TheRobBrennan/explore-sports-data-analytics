'use client';
import React, { useState, useEffect } from 'react';

const EmbeddedContent = () => {
  const game1Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010022";
  const game2Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010024";

  const [dimensions, setDimensions] = useState({
    height: window.innerWidth * (9 / 16),
    width: window.innerWidth
  });

  const updateDimensions = () => {
    setDimensions({
      height: window.innerWidth * (9 / 16),
      width: window.innerWidth
    });
  };

  useEffect(() => {
    window.addEventListener("resize", updateDimensions);
    return () => window.removeEventListener("resize", updateDimensions);
  }, []);

  return (
    <div className="flex flex-col items-center">
      <embed
        src={game1Url}
        type="text/html"
        style={{ width: dimensions.width, height: dimensions.height }}
      />
      <embed
        src={game2Url}
        type="text/html"
        style={{ width: dimensions.width, height: dimensions.height }}
      />
    </div>
  );
};

export default EmbeddedContent;
