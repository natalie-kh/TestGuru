document.addEventListener('turbolinks:load', function() {
    var timer = document.querySelector('.countdown');
    if (timer) {
        var timeleft = timer.dataset.seconds;
        setInterval(function () {
            if (timeleft > 0) {
                timeleft -= 1;
            } else {
                document.querySelector('form').submit();
            }
            function pad(n) {
                return (n < 10 ? "0" + n : n);
            }
            timer.innerHTML = pad(parseInt(timeleft / 60)) + ':' + pad(timeleft % 60);
        }, 1000)
    };
});
