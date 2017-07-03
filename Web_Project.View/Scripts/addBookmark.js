
var addBookmark = function (f) {
    var g = document.title; var c = document.URL; var d = window.event || arguments.callee.caller.arguments[0];
    var h = { IE: /MSIE/.test(window.navigator.userAgent) && !window.opera, FF: /Firefox/.test(window.navigator.userAgent), OP: !!window.opera }; f.onclick = null;
    if (h.IE) { f.attachEvent("onclick", function () { try { window.external.AddFavorite(c, g); window.event.returnValue = false } catch (a) { alert("加入收藏失败，请使用Ctrl+D进行添加") } }) }
    else {
        if (h.FF || f.nodeName.toLowerCase() == "a") {
            if (h.FF) { f.setAttribute("rel", "sidebar"), f.title = g, f.href = c }
            else { alert("加入收藏失败，请使用Ctrl+D进行添加") }
        }
        else {
            if (h.OP) { var b = document.createElement("a"); b.rel = "sidebar", b.title = g, b.href = c; f.parentNode.insertBefore(b, f); b.appendChild(f); b = null }
            else { alert("加入收藏失败，请使用Ctrl+D进行添加") }
        }
    }
};
function SetHome(obj, vrl) {
    try {
        obj.style.behavior = 'url(#default#homepage)'; obj.setHomePage(vrl);
    }
    catch (e) {
        if (window.netscape) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            }
            catch (e) {
                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
            }
            var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
            prefs.setCharPref('browser.startup.homepage', vrl);
        }
    }
}