function addFooter() {
    document.getElementById("foot").innerHTML = '<p class="button"><a href="http://validator.w3.org/check/referer"><strong> HTML </strong> Valid! </a> &nbsp; <a href="http://jigsaw.w3.org/css-validator/check/referer?profile=css3"> <strong> CSS </strong> Valid! </a></p><p><a href="http://www.ibiblio.org/"><img src="http://www.ibiblio.org/hosted/images/sm_hosted_trans.gif" width="100" height="30" alt="hosted by ibiblio" /></a></p>';
    var num = document.URL.substr(-6, 1);
    numb=num*1
    if (typeof(numb)=="number") {
        var changed = "s" + num;
        document.getElementById(changed).style.background = "#006";
    }
}
