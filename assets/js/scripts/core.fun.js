var eFrame = function () {
    this.arrgs = arguments;
    this.action = actions;
    this.selector = null;
    this.selectorObj = null;
    this.parentSelector = null;
    this.parentSelectorObj = null;
    this.eleObj = [];
    this.select = function (selector, fun) {
        this.eleObjCheck();
        this.parentSelector = selector;
        this.parentSelectorObj = document.querySelectorAll(selector);

        return this;
    }
    this.selectID = function (selector, fun) {
        this.eleObjCheck();
        this.parentSelector = selector;
        this.parentSelectorObj = document.getElementById(selector);
        return this;
    }
    this.selectTag = function (selector, fun) {
        this.eleObjCheck();
        this.parentSelector = selector;
        this.parentSelectorObj = document.getElementsByTagName(selector);
        return this;
    }
    this.selectName = function (selector, fun) {
        this.eleObjCheck();
        this.parentSelector = selector;
        this.parentSelectorObj = document.getElementsByName(selector);
        return this;
    }
    this.classes = function (selector, action, fun) {
        //var eleObj = document.querySelector(selector);
        if (typeof this.action[action] === 'undefined') {
            console.log("action is not found.");
            return this;
        }
        _flag = this.action[action](this.parentSelectorObj, selector, 'class');
        if (action === "has") {
            return _flag;
        }
        return this;
    }
    this.ids = function (selector, action, fun) {
        //var eleObj = document.getElementById(selector);
        if (typeof this.action[action] === 'undefined') {
            console.log("action is not found.");
            return this;
        }
        this.action[action](this.parentSelectorObj, selector, 'id');
        //console.log(eleObj);
        return this;
    }
    this.eleObjEmpty = function () {
        this.eleObj = [];
        return this;
    }
    this.eleObjCheck = function () {
        if (this.parentSelectorObj != null && this.eleObj.indexOf(this.parentSelectorObj) < 1) {
            this.eleObj.push(this.parentSelectorObj);
        }
    }

    this.autosize = function (eventtype) {
        _pEle = this.parentSelectorObj;
        if (eventtype === "load") {
            for (var i = 0; i < _pEle.length; i++) {
                _height = _pEle[i].scrollHeight;
                _pEle[i].style.height = _height + 10 + "px";
            }
        }
        return this;
    }
    //console.log(this);    
};

var actions = {
    add: function (Obj, selector, actionfor) {
        // console.dir(Obj);
        if (Obj === null) {
            return;
        }
        if (actionfor === "class") {
            if (Obj.length > 0) {
                for (var i = 0; i < Obj.length; i++) {
                    Obj[i].classList.add(selector);
                }
            } else {
                Obj.classList.add(selector);
            }
        }
        if (actionfor === 'id') {
            if (Obj.length > 0) {
                _flag = (Obj.length > 1) ? true : false;
                for (var i = 0; i < Obj.length; i++) {
                    Obj[i].id = (_flag) ? selector + "_" + i : selector;
                }
            } else {
                Obj[i].id = selector;
            }
        }
    },
    remove: function (Obj, selector, actionfor) {
        if (Obj === null) {
            return;
        }
        if (actionfor === "class") {
            if (Obj.length > 0) {
                for (var i = 0; i < Obj.length; i++) {
                    Obj[i].classList.remove(selector);
                }
            } else {
                Obj.classList.remove(selector);
            }
        }
        if (actionfor === 'id') {
            if (Obj.length > 0) {
                for (var i = 0; i < Obj.length; i++) {
                    Obj[i].removeAttribute("id");
                }
            } else {
                Obj.removeAttribute("id");
            }
        }
    },
    has: function (Obj, selector, actionfor) {
        if (Obj === null) {
            return false;
        }
        if (actionfor === "class") {
            if (Obj.length > 0) {
                _flag = Obj[0].classList.contains(selector);
            }
            else {
                _flag = Obj.classList.contains(selector);
            }
            return _flag;
        }
        if (actionfor === 'id') {
            //Obj.id.indexOf(selector);
            return false;
        }
    },
    replace: function (Obj, selector, actionfor) {
        if (Obj === null) {
            return;
        }
        if (actionfor === "class") {
            _selector_split = selector.split("=>");
            if (Obj.length > 0) {
                for (var i = 0; i < Obj.length; i++) {
                    Obj[i].classList.replace(_selector_split[0], _selector_split[1]);
                }
            } else {
                Obj.classList.replace(_selector_split[0], _selector_split[1]);
            }
        }
        if (actionfor === 'id') {
            actions.add(Obj, selector, actionfor);
        }
    },
    toggle: function (Obj, selector, actionfor) {
        if (Obj === null) {
            return;
        }
        // _selector_split = selector.split("=>");
        // _splitCond = (_selector_split.length > 1) ?
        //     "'" + _selector_split[0] + "'" + "," + "'" + _selector_split[1] + "'" :
        //     _selector_split[0];
        // _splitCond = _splitCond.replace(/ /g, '');
        if (actionfor === "class") {
            if (Obj.length > 0) {
                for (var i = 0; i < Obj.length; i++) {
                    Obj[i].classList.toggle(selector);
                }
            } else {
                Obj.classList.toggle(selector);
            }
        }
        if (actionfor === 'id') {
            actions.add(Obj, selector, actionfor);
        }
    }
}

// var ef = new eFrame();

// var bol = ef.selectID("e-small-breadcrumb").classes('e-menu-e', 'toggle');

exports = eFrame;