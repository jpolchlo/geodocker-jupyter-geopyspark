// Adds standard UC environment banner message.
//
// To install:
//
//      jupyter nbextension install . --user
//      jupyter nbextension enable ato-banner/main --section=common

define([
    'base/js/namespace'
], function(Jupyter) {
    function load_ipython_extension() {
        var banner = document.createElement("DIV");
        banner.setAttribute("id", "banner");
        banner.style.color = "white";
        banner.style.background = "green";
        banner.style.textAlign = "center";
        banner.appendChild(document.createTextNode("Unclassified"));
        document.getElementsByTagName("BODY")[0].insertBefore(banner, document.getElementById("header"));

        console.log(
            'This is the current notebook application instance:',
            Jupyter.notebook
        );
    }

    return {
        load_ipython_extension: load_ipython_extension
    };
});
