'use client';
import React, { useState, useEffect } from 'react';

const EmbeddedContent = () => {
  const game1Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010022";
  const game2Url = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010024";

  const [dimensions, setDimensions] = useState({
    height: 0,
    width: 0
  });

  const updateDimensions = () => {
    setDimensions({
      height: window.innerWidth * (9 / 16),
      width: window.innerWidth
    });
  };

  useEffect(() => {
    // Ensure window is defined
    if (typeof window !== 'undefined') {
      updateDimensions(); // Initial update
      window.addEventListener("resize", updateDimensions);
      return () => window.removeEventListener("resize", updateDimensions);
    }
  }, []);

  return (
    <div className="flex flex-col items-center">
      <embed
        src={game1Url}
        type="text/html"
        style={{ width: `${dimensions.width}px`, height: `${dimensions.height}px` }}
      />
      <embed
        src={game2Url}
        type="text/html"
        style={{ width: `${dimensions.width}px`, height: `${dimensions.height}px` }}
      />
    </div>
  );
};

export default EmbeddedContent;
