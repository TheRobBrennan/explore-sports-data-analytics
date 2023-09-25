'use client'
import React, { useRef } from 'react';

const EmbeddedContent = () => {
  const iframeRef1 = useRef(null);
  const iframeRef2 = useRef(null);
  const game1 = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010022"
  const game2 = "https://nhl-shot-chart-on-vercel-with-fastapi.vercel.app/?gameId=2023010024"

  // Function to handle the loading of the iframe
  // @ts-ignore
  const handleIframeLoad = (iframeRef) => {
    const iframe = iframeRef.current;
    const doc = iframe.contentDocument || iframe.contentWindow.document;

    // Wait for iframe to fully load
    doc.onreadystatechange = () => {
      if (doc.readyState === 'complete') {
        const errorText = doc.body.innerText || doc.body.textContent;

        // Check for error text and replace with placeholder image if found
        if (errorText.includes('Error Generating Shot Chart')) {
          iframe.src = 'https://assets.nhle.com/logos/nhl/svg/SEA_dark.svg';
        }
      }
    };
  };

  return (
    <div>
      <iframe
        ref={iframeRef1}
        src={game1}
        onLoad={() => handleIframeLoad(iframeRef1)}
        width="500"
        height="500"
        title="Game 1"
      />
      <iframe
        ref={iframeRef2}
        src={game2}
        onLoad={() => handleIframeLoad(iframeRef2)}
        width="500"
        height="500"
        title="Game 2"
      />
    </div>
  );
};

export default EmbeddedContent;
