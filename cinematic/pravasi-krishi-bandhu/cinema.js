(() => {
  const video = document.getElementById('league-intro');
  if (!video) return;

  const motion = window.matchMedia('(prefers-reduced-motion: reduce)');
  const saveData = navigator.connection?.saveData;
  let resumeWhenVisible = false;

  function playBackground() {
    if (!motion.matches && !saveData && !document.hidden) {
      video.play().catch(() => {
        // The poster remains visible when autoplay is unavailable.
      });
    }
  }

  video.controls = false;
  video.muted = true;
  document.addEventListener('visibilitychange', () => {
    if (document.hidden) {
      resumeWhenVisible = !video.paused;
      video.pause();
    } else if (resumeWhenVisible) {
      resumeWhenVisible = false;
      playBackground();
    }
  });
  motion.addEventListener('change', event => {
    if (event.matches) {
      resumeWhenVisible = false;
      video.pause();
    }
  });
  playBackground();
})();
