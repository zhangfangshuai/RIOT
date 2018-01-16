(function(doc, win) {
    var docEl = doc.documentElement,
        resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
        recalc = function() {
            var clientWidth = docEl.clientWidth
            if (!clientWidth) return
            if (clientWidth < 550) {
                docEl.style.fontSize = 24 * (clientWidth / 720) + 'px'
            } else {
                docEl.style.fontSize = 24 * (clientWidth / 1440) + 'px'
            }
            refreshLang()
        }
    win.addEventListener(resizeEvt, recalc, false)
    if (!doc.addEventListener) return
    doc.addEventListener('DOMContentLoaded', recalc, false)
})(document, window);

var width = '30rem'
var msgBus = {
        mainMsgBus: riot.observable(),
        modalMsgBus: riot.observable(),
        loadMsgBus: riot.observable(),
    },
    APP = {
        data: {
            'ua': navigator.userAgent,
            'online': navigator.onLine,
            'language': (navigator.browserLanguage || navigator.language).toLowerCase(),
            'appVer': navigator.appVersion,
            'h5Ver': 'VERSION'
        },
        start: new Date().getTime(),
        tags: [],
        events: {},
        count: 0,
        error: '',
        phoneFilter: /^1[34578][0-9]{9}$/
    },
    CONFIG = {},
    CACHE = {},
    PRD_CACHE = [],
    LANG = {}

function refreshLang() {
    // APP.data.language = 'zh-cn'
    switch (APP.data.language) {
        case 'zh-cn':
            LANG = zhcn
            break
        case 'en-us':
            LANG = enus
            break
        case 'zh-tw':
            LANG = zhtw
            break
        default:
            LANG = enus
            break
    }
}
refreshLang()

function loadTag(name, cb) {
    if (name.indexOf('tags/') === 0) return cb()
    APP.tags.indexOf(name) > -1 ? cb() : riot.compile(name, function() {
        APP.tags.push(name)
        cb()
    })
}

function timeOffset() {
    return new Date().getTime() - APP.start
}

function addEvent(e, p) {
    var k = e + (p ? p : '')
    APP.events[k] || (APP.events[k] = [])
    APP.events[k].push(timeOffset())
}

function setParam(k, v) {
    APP.data['' + k] = v
}

function getParam(k) {
    var v = APP.data[k]
    return (!v || v == 'null' || v == 'undefined') ? '' : v
}

function getUrlParam(name) {
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}

function popurl() {
    if (APP.count < 9) {
        APP.count ++
    } else {
        APP.count = 0
        msgBus.modalMsgBus.trigger('url')
    }
}

function tip(s, e) {
    // APP.error = s ? e[s] : e['-1']
    e && (APP.error = s ? e.interface + ': ' + s : e.interface + ': ' + '-1')
    msgBus.modalMsgBus.trigger('close')
    msgBus.mainMsgBus.trigger('go', 'error')
}

function url() {
    return CONFIG.apis.base
}

function buildRequest(method, url, json, auth, failCallback) {
    var request = new XMLHttpRequest()
    request.open(method, url)
    json && request.setRequestHeader('Content-Type', 'application/json;charset=utf-8')
    auth && request.setRequestHeader('Authorization', getParam('auth'))
    request.timeout = 5000
    request.ontimeout = function(e) {
        (failCallback.toString() != 'true') && e && failCallback && failCallback()
        (failCallback.toString() == 'true') && e && (APP.error = LANG.neterr) && tip(false, false)
    }
    request.onabort = function(e) {
        (failCallback.toString() != 'true') && e && failCallback && failCallback()
        (failCallback.toString() == 'true') && e && (APP.error = LANG.neterr) && tip(false, false)
    }
    request.onerror = function(e) {
        (failCallback.toString() != 'true') && e && failCallback && failCallback()
        (failCallback.toString() == 'true') && e && (APP.error = LANG.neterr) && tip(false, false)
    }
    return request
}


function post_request(s, f, r) {
    var retry = r || 1
    if (getParam('auth') && new Date().getTime() < getParam('authTimeout') && !getParam('tokenNeedRefresh')) {
        console.log('auth_not_expired')
        s && s()
    } else {
        var request = buildRequest('POST', url(), true, false, f)
        request.onload = function() {
            if (this.status == 200) {
                var data = JSON.parse(request.responseText)
                setParam('auth', data.token)
                setParam('authTimeout', data.expiresIn * 1000 + new Date().getTime() - 5000)
                s && s()
            } else if (retry < 3) {
                setTimeout(function() { auth(s, f, ++retry) }, 500)
            } else {
                // f && f(JSON.parse(request.responseText))
                f && (function(s) {
                    var e = {
                        'interface': '1000',
                        '-1': '鉴权时网络异常,请检查后重试'
                    }
                    tip(s, e)
                  })(this.status)
            }
        }
        request.send(JSON.stringify({
            'postDatas': 'postDatas'
        }))
    }
}

function get_request(s, f, r) {
    var retry = r || 1
    var request = buildRequest('GET', url(), false, true, f)
    request.onload = function() {
        if (this.status == 200) {
            var data = JSON.parse(request.responseText)
            setParam('resp_info', data.resp_info)
            s && s(data)
        } else if (retry < 3) {
            setTimeout(function() { get_request(s, f, ++retry) }, 500)
        } else {
            // f && f(JSON.parse(request.responseText))
            f && (function() {
                var e = {
                  'interface': '1001',
                  '-1': '发送get请求时网络异常，请检查后重试'
                }
                tip(s, e)
            })(this.status)
        }
    }
    request.send()
}

var NetWorkListener = {
    addHandler: function(element, type, handler) {
        if (element.addEventListener) {
            element.addEventListener(type, handler, false);
        } else if (element.attachEvent) {
            element.attachEvent("on" + type, handler);
        } else {
            element["on" + type] = handler;
        }
    }
}
NetWorkListener.addHandler(window, "online", function() {
    console.log("网络连接正常")
    msgBus.modalMsgBus.trigger('ball-loading')
    window.location.reload()
})
NetWorkListener.addHandler(window, "offline", function() {
    APP.error = LANG.neterr
    tip(false, false)
})


function init() {
    console.log("Network reachable: " + APP.data.online)
    CONFIG['apis'] = APIS['default']
    msgBus.mainMsgBus.on('*', addEvent)
    msgBus.modalMsgBus.on('*', addEvent)
    msgBus.loadMsgBus.on('*', addEvent)
    riot.mixin(msgBus)
    riot.mount('*')
}

init()
