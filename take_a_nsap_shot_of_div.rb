var script = document.createElement('script');
script.type = 'text/javascript';
script.src = 'https://cdn.jsdelivr.net/npm/html2canvas@1.0.0-rc.5/dist/html2canvas.min.js';
document.head.appendChild(script);
function takeshot() {
    let div = document.getElementsByClassName('document doc-root fontsize fontface vmargins hmargins mono-1   pagesize skn-mlc1 MLC1  MPR     ')[0];
    // Use the html2canvas function to take a screenshot and append it to the output div
    html2canvas(div).then(
        function (canvas) {
           document.getElementById('output').appendChild(canvas);
    })
}


//disable right click on the inspect of the console
document.addEventListener('contextmenu', event => event.stopPropagation(), true);