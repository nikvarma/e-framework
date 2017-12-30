var msgCount = 0;
var _contentTypeConfig = {
    js: "text/javascript",
    css: "text/css"
}
var startUp = function () {
    this.msgbox = new msgBox();
}


startUp.prototype.onLoadComplete = function () {
    var arrgs = arguments;
    window.onload = () => {
        executeFun(arrgs);
        //console.log("After Load Complete");
    }
}

startUp.prototype.onLoadBefore = function () {
    var arrgs = arguments;
    //let i = 0;
    document.onreadystatechange = (res) => {
        if (document.readyState === "complete") {
            executeFun(arrgs);
            //console.log("Status complete");
        }
        //console.log("OnReady Status");
    }
}

startUp.prototype.onResize = function() {
    var arrgs = arguments;
    window.onresize = () => {
        executeFun(arrgs);
    }
}

startUp.prototype.onCloseWindow = function () {
    window.close = () => {
        alert();
    }
}

startUp.prototype.addJs = function () {
    var arrgs = arguments;
    var addjsdom = addJsToDom(_config);
    if (!addjsdom.status) {
        this.msgbox.msgBoxShow(addjsdom.msg);
    }
}

function executeFun(arrgs) {
    for (let i = 0; i < arrgs.length; i++) {
        if (typeof arrgs[i] === "function") {
            arrgs[i]();
        }
    }
}

function addJsToDom(Obj) {
    if (typeof Obj === "object") {
        if (typeof Obj.baseURL != "string") {
            return {
                status: false,
                msg: "baseURL is not set or it's not a string"
            };
        }

        if (typeof Obj.js != "object")
            return {
                status: false,
                msg: "JS path is not include or send"
            }
        addJs(Obj);
        return {
            status: true
        }
    }
    return {
        status: false,
        msg: "Object is required for adding a js file"
    };
}

var msgBox = function () {

}

msgBox.prototype.msgBoxShow = function () {
    var arrgs = arguments;
    msgBoxEle({
        msgtxt: arrgs[0]
    });
}

function msgBoxEle() {
    var arrgs = arguments;
    _msgBox = arrgs[0];
    _count = msgCount++;
    var divEle = document.createElement("div");
    divEle.setAttribute("class", "e-msg-box");
    divEle.setAttribute("id", "e-msg-box" + _count);
    var spanElemsgtxt = document.createElement("span");
    spanElemsgtxt.setAttribute("class", "e-msg-txt");
    spanElemsgtxt.setAttribute("id", "e-msg-txt-" + _count);
    var txtNodemsgtxt = document.createTextNode((typeof _msgBox.msgtxt != "undefined") ? _msgBox.msgtxt : "Message Box.. Add your message!");
    spanElemsgtxt.appendChild(txtNodemsgtxt);
    divEle.appendChild(spanElemsgtxt);
    document.body.appendChild(divEle);
}

function addJs(Obj) {
    _basePath = Obj.baseURL;
    _Obj = Obj.js;
    for (let i = 0; i < _Obj.length; i++) {
        var jsDom = document.createElement("script");
        jsDom.setAttribute("src", _basePath + _Obj[i].path);
        jsDom.setAttribute("type", _contentTypeConfig.js);
        document.body.parentNode.appendChild(jsDom);
    }
}

function windowSize() {
    var wWidth = window.innerWidth;
    var wHeight = window.innerHeight;
    return {
        width: wWidth,
        height: wHeight
    }
}

exports = startUp;
exports = msgBox;

