
</div><!-- /ow-main container -->

<footer class="mt-auto py-3" style="background-color:#171c2d; border-top: 1px solid rgba(227,114,57,0.3);">
    <div class="container text-center">
        <p class="mb-0" style="color:#eab56f; font-size:0.88rem;">
            Proyecto web &mdash; Créditos Apo 3 @2026
        </p>
    </div>
</footer>

<script>
(function () {
    function loadMalCovers() {
        var imgs = Array.prototype.slice.call(document.querySelectorAll('img.ow-cover[data-mal]'));
        var idx = 0;
        var CONC = 3;
        var GAP_MS = 400;
        function loadOne(img) {
            var id = img.getAttribute('data-mal');
            if (!id) return Promise.resolve();
            return fetch('https://api.jikan.moe/v4/anime/' + id)
                .then(function (r) { return r.json(); })
                .then(function (j) {
                    var u = j.data && j.data.images && j.data.images.jpg && j.data.images.jpg.large_image_url;
                    if (u) img.src = u;
                })
                .catch(function () { });
        }
        function tick() {
            var slice = imgs.slice(idx, idx + CONC);
            idx += CONC;
            if (slice.length === 0) return;
            Promise.all(slice.map(loadOne)).then(function () {
                if (idx < imgs.length) setTimeout(tick, GAP_MS);
            });
        }
        tick();
    }
    if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', loadMalCovers);
    else loadMalCovers();
})();
</script>

</body>
</html>
