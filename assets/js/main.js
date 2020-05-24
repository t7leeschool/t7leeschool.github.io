// Table of contents button for small displays
let closeMenu = function closeMenu (e) {
  document.body.classList.remove('expanded');
  document.querySelector('main').removeEventListener('click', closeMenu);
}
document.querySelector('.menu-btn').addEventListener('click', function (e) {
  e.stopPropagation();
  document.body.classList.add('expanded');
  document.querySelector('main').addEventListener('click', closeMenu);
});

// Detect audio not looping seamlessly and display a warning

document.querySelectorAll('audio').forEach((el) => {
  if (!el.loop) return;
  let t0;
  el.addEventListener(
    'seeked',
    function testLoop (e) {
      let t = performance.now();
      if (typeof el.duration !== 'undefined' && typeof t0 !== 'undefined') {
        let diff = Math.abs(t - t0 - el.duration * 1000);
        if (diff < 200) {
          // Loop found, stop testing
          el.removeEventListener('seeked', testLoop);

          if (diff > 80) {
            // Choppy loop, display warning
            let warning = document.createElement('p');
            warning.className = 'flash loop-warning';
            warning.innerHTML =
              'There’s a bug in Chrome that '
              + '<a href="https://bugs.chromium.org/p/chromium/issues/detail?id=353072">'
              + 'audio loops aren’t seamless.</a> '
              + 'Try Firefox or Edge for practise.';
            el.insertAdjacentElement('afterend', warning);
          }
        }
      }
      t0 = t;
    },
  );
});

// Scroll smoothly when navigating within the document
(function () {
  let cb = function (e) {
    let heading = document.querySelector(e.target.hash);
    if (heading) {
      e.preventDefault();

      window.scrollBy({
        top: heading.getBoundingClientRect().y - 90,
        behavior: 'smooth',
      });

      history.pushState(null, null, e.target.hash);
    }
  };

  document.querySelectorAll('a[href^="#"]').forEach(el => {
    el.addEventListener('click', cb);
  });
})();

// Indicate in the toc which section we're currently in
(function () {
  let mainEls = [ ...document.querySelectorAll('main > *, footer') ];

  document.querySelectorAll('.index a[href^="#"]').forEach(el => {
    let tgt = document.querySelector(el.hash);
    if (tgt) {
      tgt.tocEntry = el.parentElement;
    }
  });

  let highlighted = document.getElementById('title').tocEntry;
  let cb = function(changed, obs) {
    changed.forEach(entry => {
      entry.target._visible = entry.isIntersecting;
    });

    let i = mainEls.findIndex(el => el._visible);
    while (i >= 0 && !mainEls[i].tocEntry) --i;

    let el = mainEls[i] || document.getElementById('title');
    console.log(highlighted, el);
    if (highlighted && highlighted !== el) {
      highlighted.classList.remove('current');
    }

    el.tocEntry.classList.add('current');
    highlighted = el.tocEntry;
  };

  let obs = new IntersectionObserver(cb, {
    rootMargin: '-90px 0px 0px 0px',
    threshold: 0,
  });

  mainEls.forEach(el => obs.observe(el));
})();
