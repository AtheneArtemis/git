function e(e) {
    var r = {
        omitExtraWLInCodeBlocks: {
            defaultValue: !1,
            describe: "Omit the default extra whiteline added to code blocks",
            type: "boolean"
        },
        noHeaderId: {
            defaultValue: !1,
            describe: "Turn on/off generated header id",
            type: "boolean"
        },
        prefixHeaderId: {
            defaultValue: !1,
            describe: "Specify a prefix to generated header ids",
            type: "string"
        },
        headerLevelStart: {
            defaultValue: !1,
            describe: "The header blocks level start",
            type: "integer"
        },
        parseImgDimensions: {
            defaultValue: !1,
            describe: "Turn on/off image dimension parsing",
            type: "boolean"
        },
        simplifiedAutoLink: {
            defaultValue: !1,
            describe: "Turn on/off GFM autolink style",
            type: "boolean"
        },
        literalMidWordUnderscores: {
            defaultValue: !1,
            describe: "Parse midword underscores as literal underscores",
            type: "boolean"
        },
        strikethrough: {
            defaultValue: !1,
            describe: "Turn on/off strikethrough support",
            type: "boolean"
        },
        tables: {
            defaultValue: !1,
            describe: "Turn on/off tables support",
            type: "boolean"
        },
        tablesHeaderId: {
            defaultValue: !1,
            describe: "Add an id to table headers",
            type: "boolean"
        },
        ghCodeBlocks: {
            defaultValue: !0,
            describe: "Turn on/off GFM fenced code blocks support",
            type: "boolean"
        },
        tasklists: {
            defaultValue: !1,
            describe: "Turn on/off GFM tasklist support",
            type: "boolean"
        },
        smoothLivePreview: {
            defaultValue: !1,
            describe: "Prevents weird effects in live previews due to incomplete input",
            type: "boolean"
        },
        smartIndentationFix: {
            defaultValue: !1,
            description: "Tries to smartly fix identation in es6 strings",
            type: "boolean"
        }
    };
    if (!1 === e) return JSON.parse(JSON.stringify(r));
    var t = {};
    for (var n in r) r.hasOwnProperty(n) && (t[n] = r[n].defaultValue);
    return t;
}

function r(e, r) {
    var t = r ? "Error in " + r + " extension->" : "Error in unnamed extension", n = {
        valid: !0,
        error: ""
    };
    o.helper.isArray(e) || (e = [ e ]);
    for (var s = 0; s < e.length; ++s) {
        var i = t + " sub-extension " + s + ": ", l = e[s];
        if ("object" !== (void 0 === l ? "undefined" : a(l))) return n.valid = !1, n.error = i + "must be an object, but " + (void 0 === l ? "undefined" : a(l)) + " given", 
        n;
        if (!o.helper.isString(l.type)) return n.valid = !1, n.error = i + 'property "type" must be a string, but ' + a(l.type) + " given", 
        n;
        var c = l.type = l.type.toLowerCase();
        if ("language" === c && (c = l.type = "lang"), "html" === c && (c = l.type = "output"), 
        "lang" !== c && "output" !== c && "listener" !== c) return n.valid = !1, n.error = i + "type " + c + ' is not recognized. Valid values: "lang/language", "output/html" or "listener"', 
        n;
        if ("listener" === c) {
            if (o.helper.isUndefined(l.listeners)) return n.valid = !1, n.error = i + '. Extensions of type "listener" must have a property called "listeners"', 
            n;
        } else if (o.helper.isUndefined(l.filter) && o.helper.isUndefined(l.regex)) return n.valid = !1, 
        n.error = i + c + ' extensions must define either a "regex" property or a "filter" method', 
        n;
        if (l.listeners) {
            if ("object" !== a(l.listeners)) return n.valid = !1, n.error = i + '"listeners" property must be an object but ' + a(l.listeners) + " given", 
            n;
            for (var u in l.listeners) if (l.listeners.hasOwnProperty(u) && "function" != typeof l.listeners[u]) return n.valid = !1, 
            n.error = i + '"listeners" property must be an hash of [event name]: [callback]. listeners.' + u + " must be a function but " + a(l.listeners[u]) + " given", 
            n;
        }
        if (l.filter) {
            if ("function" != typeof l.filter) return n.valid = !1, n.error = i + '"filter" must be a function, but ' + a(l.filter) + " given", 
            n;
        } else if (l.regex) {
            if (o.helper.isString(l.regex) && (l.regex = new RegExp(l.regex, "g")), !l.regex instanceof RegExp) return n.valid = !1, 
            n.error = i + '"regex" property must either be a string or a RegExp object, but ' + a(l.regex) + " given", 
            n;
            if (o.helper.isUndefined(l.replace)) return n.valid = !1, n.error = i + '"regex" extensions must implement a replace string or function', 
            n;
        }
    }
    return n;
}

function t(e, r) {
    return "~E" + r.charCodeAt(0) + "E";
}

var n = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
    return typeof e;
} : function(e) {
    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e;
}, s = "function" == typeof Symbol && "symbol" == n(Symbol.iterator) ? function(e) {
    return void 0 === e ? "undefined" : n(e);
} : function(e) {
    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : void 0 === e ? "undefined" : n(e);
}, a = "function" == typeof Symbol && "symbol" == s(Symbol.iterator) ? function(e) {
    return void 0 === e ? "undefined" : s(e);
} : function(e) {
    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : void 0 === e ? "undefined" : s(e);
}, o = {}, i = {}, l = {}, c = e(!0), u = {
    github: {
        omitExtraWLInCodeBlocks: !0,
        prefixHeaderId: "user-content-",
        simplifiedAutoLink: !0,
        literalMidWordUnderscores: !0,
        strikethrough: !0,
        tables: !0,
        tablesHeaderId: !0,
        ghCodeBlocks: !0,
        tasklists: !0
    },
    vanilla: e(!0)
};

o.helper = {}, o.extensions = {}, o.setOption = function(e, r) {
    return c[e] = r, this;
}, o.getOption = function(e) {
    return c[e];
}, o.getOptions = function() {
    return c;
}, o.resetOptions = function() {
    c = e(!0);
}, o.setFlavor = function(e) {
    if (u.hasOwnProperty(e)) {
        var r = u[e];
        for (var t in r) r.hasOwnProperty(t) && (c[t] = r[t]);
    }
}, o.getDefaultOptions = function(r) {
    return e(r);
}, o.subParser = function(e, r) {
    if (o.helper.isString(e)) {
        if (void 0 === r) {
            if (i.hasOwnProperty(e)) return i[e];
            throw Error("SubParser named " + e + " not registered!");
        }
        i[e] = r;
    }
}, o.extension = function(e, t) {
    if (!o.helper.isString(e)) throw Error("Extension 'name' must be a string");
    if (e = o.helper.stdExtName(e), o.helper.isUndefined(t)) {
        if (!l.hasOwnProperty(e)) throw Error("Extension named " + e + " is not registered!");
        return l[e];
    }
    "function" == typeof t && (t = t()), o.helper.isArray(t) || (t = [ t ]);
    var n = r(t, e);
    if (!n.valid) throw Error(n.error);
    l[e] = t;
}, o.getAllExtensions = function() {
    return l;
}, o.removeExtension = function(e) {
    delete l[e];
}, o.resetExtensions = function() {
    l = {};
}, o.validateExtension = function(e) {
    var t = r(e, null);
    return !!t.valid || (console.warn(t.error), !1);
}, o.hasOwnProperty("helper") || (o.helper = {}), o.helper.isString = function(e) {
    return "string" == typeof e || e instanceof String;
}, o.helper.isFunction = function(e) {
    var r = {};
    return e && "[object Function]" === r.toString.call(e);
}, o.helper.forEach = function(e, r) {
    if ("function" == typeof e.forEach) e.forEach(r); else for (var t = 0; t < e.length; t++) r(e[t], t, e);
}, o.helper.isArray = function(e) {
    return e.constructor === Array;
}, o.helper.isUndefined = function(e) {
    return void 0 === e;
}, o.helper.stdExtName = function(e) {
    return e.replace(/[_-]||\s/g, "").toLowerCase();
}, o.helper.escapeCharactersCallback = t, o.helper.escapeCharacters = function(e, r, n) {
    var s = "([" + r.replace(/([\[\]\\])/g, "\\$1") + "])";
    n && (s = "\\\\" + s);
    var a = new RegExp(s, "g");
    return e = e.replace(a, t);
};

var p = function(e, r, t, n) {
    var s, a, o, i, l, c = n || "", u = c.indexOf("g") > -1, p = new RegExp(r + "|" + t, "g" + c.replace(/g/g, "")), h = new RegExp(r, c.replace(/g/g, "")), d = [];
    do {
        for (s = 0; o = p.exec(e); ) if (h.test(o[0])) s++ || (i = (a = p.lastIndex) - o[0].length); else if (s && !--s) {
            l = o.index + o[0].length;
            var f = {
                left: {
                    start: i,
                    end: a
                },
                match: {
                    start: a,
                    end: o.index
                },
                right: {
                    start: o.index,
                    end: l
                },
                wholeMatch: {
                    start: i,
                    end: l
                }
            };
            if (d.push(f), !u) return d;
        }
    } while (s && (p.lastIndex = a));
    return d;
};

o.helper.matchRecursiveRegExp = function(e, r, t, n) {
    for (var s = p(e, r, t, n), a = [], o = 0; o < s.length; ++o) a.push([ e.slice(s[o].wholeMatch.start, s[o].wholeMatch.end), e.slice(s[o].match.start, s[o].match.end), e.slice(s[o].left.start, s[o].left.end), e.slice(s[o].right.start, s[o].right.end) ]);
    return a;
}, o.helper.replaceRecursiveRegExp = function(e, r, t, n, s) {
    if (!o.helper.isFunction(r)) {
        var a = r;
        r = function() {
            return a;
        };
    }
    var i = p(e, t, n, s), l = e, c = i.length;
    if (c > 0) {
        var u = [];
        0 !== i[0].wholeMatch.start && u.push(e.slice(0, i[0].wholeMatch.start));
        for (var h = 0; h < c; ++h) u.push(r(e.slice(i[h].wholeMatch.start, i[h].wholeMatch.end), e.slice(i[h].match.start, i[h].match.end), e.slice(i[h].left.start, i[h].left.end), e.slice(i[h].right.start, i[h].right.end))), 
        h < c - 1 && u.push(e.slice(i[h].wholeMatch.end, i[h + 1].wholeMatch.start));
        i[c - 1].wholeMatch.end < e.length && u.push(e.slice(i[c - 1].wholeMatch.end)), 
        l = u.join("");
    }
    return l;
}, o.helper.isUndefined(console) && (console = {
    warn: function(e) {
        alert(e);
    },
    log: function(e) {
        alert(e);
    },
    error: function(e) {
        throw e;
    }
}), o.Converter = function(e) {
    function t(e, t) {
        if (t = t || null, o.helper.isString(e)) {
            if (e = o.helper.stdExtName(e), t = e, o.extensions[e]) return console.warn("DEPRECATION WARNING: " + e + " is an old extension that uses a deprecated loading method.Please inform the developer that the extension should be updated!"), 
            void n(o.extensions[e], e);
            if (o.helper.isUndefined(l[e])) throw Error('Extension "' + e + '" could not be loaded. It was either not found or is not a valid extension.');
            e = l[e];
        }
        "function" == typeof e && (e = e()), o.helper.isArray(e) || (e = [ e ]);
        var a = r(e, t);
        if (!a.valid) throw Error(a.error);
        for (var i = 0; i < e.length; ++i) {
            switch (e[i].type) {
              case "lang":
                h.push(e[i]);
                break;

              case "output":
                d.push(e[i]);
            }
            if (e[i].hasOwnProperty(f)) for (var c in e[i].listeners) e[i].listeners.hasOwnProperty(c) && s(c, e[i].listeners[c]);
        }
    }
    function n(e, t) {
        "function" == typeof e && (e = e(new o.Converter())), o.helper.isArray(e) || (e = [ e ]);
        var n = r(e, t);
        if (!n.valid) throw Error(n.error);
        for (var s = 0; s < e.length; ++s) switch (e[s].type) {
          case "lang":
            h.push(e[s]);
            break;

          case "output":
            d.push(e[s]);
            break;

          default:
            throw Error("Extension loader error: Type unrecognized!!!");
        }
    }
    function s(e, r) {
        if (!o.helper.isString(e)) throw Error("Invalid argument in converter.listen() method: name must be a string, but " + (void 0 === e ? "undefined" : a(e)) + " given");
        if ("function" != typeof r) throw Error("Invalid argument in converter.listen() method: callback must be a function, but " + (void 0 === r ? "undefined" : a(r)) + " given");
        f.hasOwnProperty(e) || (f[e] = []), f[e].push(r);
    }
    function i(e) {
        var r = e.match(/^\s*/)[0].length, t = new RegExp("^\\s{0," + r + "}", "gm");
        return e.replace(t, "");
    }
    var p = {}, h = [], d = [], f = {};
    !function() {
        e = e || {};
        for (var r in c) c.hasOwnProperty(r) && (p[r] = c[r]);
        if ("object" !== (void 0 === e ? "undefined" : a(e))) throw Error("Converter expects the passed parameter to be an object, but " + (void 0 === e ? "undefined" : a(e)) + " was passed instead.");
        for (var n in e) e.hasOwnProperty(n) && (p[n] = e[n]);
        p.extensions && o.helper.forEach(p.extensions, t);
    }(), this._dispatch = function(e, r, t, n) {
        if (f.hasOwnProperty(e)) for (var s = 0; s < f[e].length; ++s) {
            var a = f[e][s](e, r, this, t, n);
            a && void 0 !== a && (r = a);
        }
        return r;
    }, this.listen = function(e, r) {
        return s(e, r), this;
    }, this.makeHtml = function(e) {
        if (!e) return e;
        var r = {
            gHtmlBlocks: [],
            gHtmlMdBlocks: [],
            gHtmlSpans: [],
            gUrls: {},
            gTitles: {},
            gDimensions: {},
            gListLevel: 0,
            hashLinkCounts: {},
            langExtensions: h,
            outputModifiers: d,
            converter: this,
            ghCodeBlocks: []
        };
        return e = e.replace(/~/g, "~T"), e = e.replace(/\$/g, "~D"), e = e.replace(/\r\n/g, "\n"), 
        e = e.replace(/\r/g, "\n"), p.smartIndentationFix && (e = i(e)), e = e, e = o.subParser("detab")(e, p, r), 
        e = o.subParser("stripBlankLines")(e, p, r), o.helper.forEach(h, function(t) {
            e = o.subParser("runExtension")(t, e, p, r);
        }), e = o.subParser("hashPreCodeTags")(e, p, r), e = o.subParser("githubCodeBlocks")(e, p, r), 
        e = o.subParser("hashHTMLBlocks")(e, p, r), e = o.subParser("hashHTMLSpans")(e, p, r), 
        e = o.subParser("stripLinkDefinitions")(e, p, r), e = o.subParser("blockGamut")(e, p, r), 
        e = o.subParser("unhashHTMLSpans")(e, p, r), e = o.subParser("unescapeSpecialChars")(e, p, r), 
        e = e.replace(/~D/g, "$$"), e = e.replace(/~T/g, "~"), o.helper.forEach(d, function(t) {
            e = o.subParser("runExtension")(t, e, p, r);
        }), e;
    }, this.setOption = function(e, r) {
        p[e] = r;
    }, this.getOption = function(e) {
        return p[e];
    }, this.getOptions = function() {
        return p;
    }, this.addExtension = function(e, r) {
        t(e, r = r || null);
    }, this.useExtension = function(e) {
        t(e);
    }, this.setFlavor = function(e) {
        if (u.hasOwnProperty(e)) {
            var r = u[e];
            for (var t in r) r.hasOwnProperty(t) && (p[t] = r[t]);
        }
    }, this.removeExtension = function(e) {
        o.helper.isArray(e) || (e = [ e ]);
        for (var r = 0; r < e.length; ++r) {
            for (var t = e[r], n = 0; n < h.length; ++n) h[n] === t && h[n].splice(n, 1);
            for (;0 < d.length; ++n) d[0] === t && d[0].splice(n, 1);
        }
    }, this.getAllExtensions = function() {
        return {
            language: h,
            output: d
        };
    };
}, o.subParser("anchors", function(e, r, t) {
    var n = function(e, r, n, s, a, i, l, c) {
        o.helper.isUndefined(c) && (c = ""), e = r;
        var u = n, p = s.toLowerCase(), h = a, d = c;
        if (!h) if (p || (p = u.toLowerCase().replace(/ ?\n/g, " ")), h = "#" + p, o.helper.isUndefined(t.gUrls[p])) {
            if (!(e.search(/\(\s*\)$/m) > -1)) return e;
            h = "";
        } else h = t.gUrls[p], o.helper.isUndefined(t.gTitles[p]) || (d = t.gTitles[p]);
        var f = '<a href="' + (h = o.helper.escapeCharacters(h, "*_", !1)) + '"';
        return "" !== d && null !== d && (d = d.replace(/"/g, "&quot;"), f += ' title="' + (d = o.helper.escapeCharacters(d, "*_", !1)) + '"'), 
        f += ">" + u + "</a>";
    };
    return e = (e = t.converter._dispatch("anchors.before", e, r, t)).replace(/(\[((?:\[[^\]]*]|[^\[\]])*)][ ]?(?:\n[ ]*)?\[(.*?)])()()()()/g, n), 
    e = e.replace(/(\[((?:\[[^\]]*]|[^\[\]])*)]\([ \t]*()<?(.*?(?:\(.*?\).*?)?)>?[ \t]*((['"])(.*?)\6[ \t]*)?\))/g, n), 
    e = e.replace(/(\[([^\[\]]+)])()()()()()/g, n), e = t.converter._dispatch("anchors.after", e, r, t);
}), o.subParser("autoLinks", function(e, r, t) {
    function n(e, r) {
        var t = r;
        return /^www\./i.test(r) && (r = r.replace(/^www\./i, "http://www.")), '<a href="' + r + '">' + t + "</a>";
    }
    function s(e, r) {
        var t = o.subParser("unescapeSpecialChars")(r);
        return o.subParser("encodeEmailAddress")(t);
    }
    var a = /\b(((https?|ftp|dict):\/\/|www\.)[^'">\s]+\.[^'">\s]+)(?=\s|$)(?!["<>])/gi, i = /<(((https?|ftp|dict):\/\/|www\.)[^'">\s]+)>/gi, l = /(?:^|[ \n\t])([A-Za-z0-9!#$%&'*+-/=?^_`\{|}~\.]+@[-a-z0-9]+(\.[-a-z0-9]+)*\.[a-z]+)(?:$|[ \n\t])/gi, c = /<(?:mailto:)?([-.\w]+@[-a-z0-9]+(\.[-a-z0-9]+)*\.[a-z]+)>/gi;
    return e = (e = t.converter._dispatch("autoLinks.before", e, r, t)).replace(i, n), 
    e = e.replace(c, s), r.simplifiedAutoLink && (e = (e = e.replace(a, n)).replace(l, s)), 
    e = t.converter._dispatch("autoLinks.after", e, r, t);
}), o.subParser("blockGamut", function(e, r, t) {
    e = t.converter._dispatch("blockGamut.before", e, r, t), e = o.subParser("blockQuotes")(e, r, t), 
    e = o.subParser("headers")(e, r, t);
    var n = o.subParser("hashBlock")("<hr />", r, t);
    return e = e.replace(/^[ ]{0,2}([ ]?\*[ ]?){3,}[ \t]*$/gm, n), e = e.replace(/^[ ]{0,2}([ ]?\-[ ]?){3,}[ \t]*$/gm, n), 
    e = e.replace(/^[ ]{0,2}([ ]?_[ ]?){3,}[ \t]*$/gm, n), e = o.subParser("lists")(e, r, t), 
    e = o.subParser("codeBlocks")(e, r, t), e = o.subParser("tables")(e, r, t), e = o.subParser("hashHTMLBlocks")(e, r, t), 
    e = o.subParser("paragraphs")(e, r, t), e = t.converter._dispatch("blockGamut.after", e, r, t);
}), o.subParser("blockQuotes", function(e, r, t) {
    return e = t.converter._dispatch("blockQuotes.before", e, r, t), e = e.replace(/((^[ \t]{0,3}>[ \t]?.+\n(.+\n)*\n*)+)/gm, function(e, n) {
        var s = n;
        return s = s.replace(/^[ \t]*>[ \t]?/gm, "~0"), s = s.replace(/~0/g, ""), s = s.replace(/^[ \t]+$/gm, ""), 
        s = o.subParser("githubCodeBlocks")(s, r, t), s = o.subParser("blockGamut")(s, r, t), 
        s = s.replace(/(^|\n)/g, "$1  "), s = s.replace(/(\s*<pre>[^\r]+?<\/pre>)/gm, function(e, r) {
            var t = r;
            return t = t.replace(/^  /gm, "~0"), t = t.replace(/~0/g, "");
        }), o.subParser("hashBlock")("<blockquote>\n" + s + "\n</blockquote>", r, t);
    }), e = t.converter._dispatch("blockQuotes.after", e, r, t);
}), o.subParser("codeBlocks", function(e, r, t) {
    e = t.converter._dispatch("codeBlocks.before", e, r, t);
    var n = /(?:\n\n|^)((?:(?:[ ]{4}|\t).*\n+)+)(\n*[ ]{0,3}[^ \t\n]|(?=~0))/g;
    return e = (e += "~0").replace(n, function(e, n, s) {
        var a = n, i = s, l = "\n";
        return a = o.subParser("outdent")(a), a = o.subParser("encodeCode")(a), a = o.subParser("detab")(a), 
        a = a.replace(/^\n+/g, ""), a = a.replace(/\n+$/g, ""), r.omitExtraWLInCodeBlocks && (l = ""), 
        a = "<pre><code>" + a + l + "</code></pre>", o.subParser("hashBlock")(a, r, t) + i;
    }), e = e.replace(/~0/, ""), e = t.converter._dispatch("codeBlocks.after", e, r, t);
}), o.subParser("codeSpans", function(e, r, t) {
    return void 0 === (e = t.converter._dispatch("codeSpans.before", e, r, t)) && (e = ""), 
    e = e.replace(/(^|[^\\])(`+)([^\r]*?[^`])\2(?!`)/gm, function(e, r, t, n) {
        var s = n;
        return s = s.replace(/^([ \t]*)/g, ""), s = s.replace(/[ \t]*$/g, ""), s = o.subParser("encodeCode")(s), 
        r + "<code>" + s + "</code>";
    }), e = t.converter._dispatch("codeSpans.after", e, r, t);
}), o.subParser("detab", function(e) {
    return e = e.replace(/\t(?=\t)/g, "    "), e = e.replace(/\t/g, "~A~B"), e = e.replace(/~B(.+?)~A/g, function(e, r) {
        for (var t = r, n = 4 - t.length % 4, s = 0; s < n; s++) t += " ";
        return t;
    }), e = e.replace(/~A/g, "    "), e = e.replace(/~B/g, "");
}), o.subParser("encodeAmpsAndAngles", function(e) {
    return e = e.replace(/&(?!#?[xX]?(?:[0-9a-fA-F]+|\w+);)/g, "&amp;"), e = e.replace(/<(?![a-z\/?\$!])/gi, "&lt;");
}), o.subParser("encodeBackslashEscapes", function(e) {
    return e = e.replace(/\\(\\)/g, o.helper.escapeCharactersCallback), e = e.replace(/\\([`*_{}\[\]()>#+-.!])/g, o.helper.escapeCharactersCallback);
}), o.subParser("encodeCode", function(e) {
    return e = e.replace(/&/g, "&amp;"), e = e.replace(/</g, "&lt;"), e = e.replace(/>/g, "&gt;"), 
    e = o.helper.escapeCharacters(e, "*_{}[]\\", !1);
}), o.subParser("encodeEmailAddress", function(e) {
    var r = [ function(e) {
        return "&#" + e.charCodeAt(0) + ";";
    }, function(e) {
        return "&#x" + e.charCodeAt(0).toString(16) + ";";
    }, function(e) {
        return e;
    } ];
    return e = "mailto:" + e, e = e.replace(/./g, function(e) {
        if ("@" === e) e = r[Math.floor(2 * Math.random())](e); else if (":" !== e) {
            var t = Math.random();
            e = t > .9 ? r[2](e) : t > .45 ? r[1](e) : r[0](e);
        }
        return e;
    }), e = '<a href="' + e + '">' + e + "</a>", e = e.replace(/">.+:/g, '">');
}), o.subParser("escapeSpecialCharsWithinTagAttributes", function(e) {
    var r = /(<[a-z\/!$]("[^"]*"|'[^']*'|[^'">])*>|<!(--.*?--\s*)+>)/gi;
    return e = e.replace(r, function(e) {
        var r = e.replace(/(.)<\/?code>(?=.)/g, "$1`");
        return r = o.helper.escapeCharacters(r, "\\`*_", !1);
    });
}), o.subParser("githubCodeBlocks", function(e, r, t) {
    return r.ghCodeBlocks ? (e = t.converter._dispatch("githubCodeBlocks.before", e, r, t), 
    e += "~0", e = e.replace(/(?:^|\n)```(.*)\n([\s\S]*?)\n```/g, function(e, n, s) {
        var a = r.omitExtraWLInCodeBlocks ? "" : "\n";
        return s = o.subParser("encodeCode")(s), s = o.subParser("detab")(s), s = s.replace(/^\n+/g, ""), 
        s = s.replace(/\n+$/g, ""), s = "<pre><code" + (n ? ' class="' + n + " language-" + n + '"' : "") + ">" + s + a + "</code></pre>", 
        s = o.subParser("hashBlock")(s, r, t), "\n\n~G" + (t.ghCodeBlocks.push({
            text: e,
            codeblock: s
        }) - 1) + "G\n\n";
    }), e = e.replace(/~0/, ""), t.converter._dispatch("githubCodeBlocks.after", e, r, t)) : e;
}), o.subParser("hashBlock", function(e, r, t) {
    return e = e.replace(/(^\n+|\n+$)/g, ""), "\n\n~K" + (t.gHtmlBlocks.push(e) - 1) + "K\n\n";
}), o.subParser("hashElement", function(e, r, t) {
    return function(e, r) {
        var n = r;
        return n = n.replace(/\n\n/g, "\n"), n = n.replace(/^\n/, ""), n = n.replace(/\n+$/g, ""), 
        n = "\n\n~K" + (t.gHtmlBlocks.push(n) - 1) + "K\n\n";
    };
}), o.subParser("hashHTMLBlocks", function(e, r, t) {
    for (var n = [ "pre", "div", "h1", "h2", "h3", "h4", "h5", "h6", "blockquote", "table", "dl", "ol", "ul", "script", "noscript", "form", "fieldset", "iframe", "math", "style", "section", "header", "footer", "nav", "article", "aside", "address", "audio", "canvas", "figure", "hgroup", "output", "video", "p" ], s = 0; s < n.length; ++s) e = o.helper.replaceRecursiveRegExp(e, function(e, r, n, s) {
        var a = e;
        return -1 !== n.search(/\bmarkdown\b/) && (a = n + t.converter.makeHtml(r) + s), 
        "\n\n~K" + (t.gHtmlBlocks.push(a) - 1) + "K\n\n";
    }, "^(?: |\\t){0,3}<" + n[s] + "\\b[^>]*>", "</" + n[s] + ">", "gim");
    return e = e.replace(/(\n[ ]{0,3}(<(hr)\b([^<>])*?\/?>)[ \t]*(?=\n{2,}))/g, o.subParser("hashElement")(e, r, t)), 
    e = e.replace(/(<!--[\s\S]*?-->)/g, o.subParser("hashElement")(e, r, t)), e = e.replace(/(?:\n\n)([ ]{0,3}(?:<([?%])[^\r]*?\2>)[ \t]*(?=\n{2,}))/g, o.subParser("hashElement")(e, r, t));
}), o.subParser("hashHTMLSpans", function(e, r, t) {
    for (var n = o.helper.matchRecursiveRegExp(e, "<code\\b[^>]*>", "</code>", "gi"), s = 0; s < n.length; ++s) e = e.replace(n[s][0], "~L" + (t.gHtmlSpans.push(n[s][0]) - 1) + "L");
    return e;
}), o.subParser("unhashHTMLSpans", function(e, r, t) {
    for (var n = 0; n < t.gHtmlSpans.length; ++n) e = e.replace("~L" + n + "L", t.gHtmlSpans[n]);
    return e;
}), o.subParser("hashPreCodeTags", function(e, r, t) {
    return e = o.helper.replaceRecursiveRegExp(e, function(e, r, n, s) {
        var a = n + o.subParser("encodeCode")(r) + s;
        return "\n\n~G" + (t.ghCodeBlocks.push({
            text: e,
            codeblock: a
        }) - 1) + "G\n\n";
    }, "^(?: |\\t){0,3}<pre\\b[^>]*>\\s*<code\\b[^>]*>", "^(?: |\\t){0,3}</code>\\s*</pre>", "gim");
}), o.subParser("headers", function(e, r, t) {
    function n(e) {
        var r, n = e.replace(/[^\w]/g, "").toLowerCase();
        return t.hashLinkCounts[n] ? r = n + "-" + t.hashLinkCounts[n]++ : (r = n, t.hashLinkCounts[n] = 1), 
        !0 === s && (s = "section"), o.helper.isString(s) ? s + r : r;
    }
    e = t.converter._dispatch("headers.before", e, r, t);
    var s = r.prefixHeaderId, a = isNaN(parseInt(r.headerLevelStart)) ? 1 : parseInt(r.headerLevelStart), i = r.smoothLivePreview ? /^(.+)[ \t]*\n={2,}[ \t]*\n+/gm : /^(.+)[ \t]*\n=+[ \t]*\n+/gm, l = r.smoothLivePreview ? /^(.+)[ \t]*\n-{2,}[ \t]*\n+/gm : /^(.+)[ \t]*\n-+[ \t]*\n+/gm;
    return e = e.replace(i, function(e, s) {
        var i = o.subParser("spanGamut")(s, r, t), l = r.noHeaderId ? "" : ' id="' + n(s) + '"', c = a, u = "<h" + c + l + ">" + i + "</h" + c + ">";
        return o.subParser("hashBlock")(u, r, t);
    }), e = e.replace(l, function(e, s) {
        var i = o.subParser("spanGamut")(s, r, t), l = r.noHeaderId ? "" : ' id="' + n(s) + '"', c = a + 1, u = "<h" + c + l + ">" + i + "</h" + c + ">";
        return o.subParser("hashBlock")(u, r, t);
    }), e = e.replace(/^(#{1,6})[ \t]*(.+?)[ \t]*#*\n+/gm, function(e, s, i) {
        var l = o.subParser("spanGamut")(i, r, t), c = r.noHeaderId ? "" : ' id="' + n(i) + '"', u = a - 1 + s.length, p = "<h" + u + c + ">" + l + "</h" + u + ">";
        return o.subParser("hashBlock")(p, r, t);
    }), e = t.converter._dispatch("headers.after", e, r, t);
}), o.subParser("images", function(e, r, t) {
    function n(e, r, n, s, a, i, l, c) {
        var u = t.gUrls, p = t.gTitles, h = t.gDimensions;
        if (n = n.toLowerCase(), c || (c = ""), "" === s || null === s) {
            if ("" !== n && null !== n || (n = r.toLowerCase().replace(/ ?\n/g, " ")), s = "#" + n, 
            o.helper.isUndefined(u[n])) return e;
            s = u[n], o.helper.isUndefined(p[n]) || (c = p[n]), o.helper.isUndefined(h[n]) || (a = h[n].width, 
            i = h[n].height);
        }
        r = r.replace(/"/g, "&quot;"), r = o.helper.escapeCharacters(r, "*_", !1);
        var d = '<img src="' + (s = o.helper.escapeCharacters(s, "*_", !1)) + '" alt="' + r + '"';
        return c && (c = c.replace(/"/g, "&quot;"), d += ' title="' + (c = o.helper.escapeCharacters(c, "*_", !1)) + '"'), 
        a && i && (d += ' width="' + (a = "*" === a ? "auto" : a) + '"', d += ' height="' + (i = "*" === i ? "auto" : i) + '"'), 
        d += " />";
    }
    var s = /!\[(.*?)]\s?\([ \t]*()<?(\S+?)>?(?: =([*\d]+[A-Za-z%]{0,4})x([*\d]+[A-Za-z%]{0,4}))?[ \t]*(?:(['"])(.*?)\6[ \t]*)?\)/g, a = /!\[([^\]]*?)] ?(?:\n *)?\[(.*?)]()()()()()/g;
    return e = (e = t.converter._dispatch("images.before", e, r, t)).replace(a, n), 
    e = e.replace(s, n), e = t.converter._dispatch("images.after", e, r, t);
}), o.subParser("italicsAndBold", function(e, r, t) {
    return e = t.converter._dispatch("italicsAndBold.before", e, r, t), e = r.literalMidWordUnderscores ? (e = (e = (e = e.replace(/(^|\s|>|\b)__(?=\S)([\s\S]+?)__(?=\b|<|\s|$)/gm, "$1<strong>$2</strong>")).replace(/(^|\s|>|\b)_(?=\S)([\s\S]+?)_(?=\b|<|\s|$)/gm, "$1<em>$2</em>")).replace(/(\*\*)(?=\S)([^\r]*?\S[*]*)\1/g, "<strong>$2</strong>")).replace(/(\*)(?=\S)([^\r]*?\S)\1/g, "<em>$2</em>") : (e = e.replace(/(\*\*|__)(?=\S)([^\r]*?\S[*_]*)\1/g, "<strong>$2</strong>")).replace(/(\*|_)(?=\S)([^\r]*?\S)\1/g, "<em>$2</em>"), 
    e = t.converter._dispatch("italicsAndBold.after", e, r, t);
}), o.subParser("lists", function(e, r, t) {
    function n(e, n) {
        t.gListLevel++, e = e.replace(/\n{2,}$/, "\n"), e += "~0";
        var s = /(\n)?(^[ \t]*)([*+-]|\d+[.])[ \t]+((\[(x|X| )?])?[ \t]*[^\r]+?(\n{1,2}))(?=\n*(~0|\2([*+-]|\d+[.])[ \t]+))/gm, a = /\n[ \t]*\n(?!~0)/.test(e);
        return e = e.replace(s, function(e, n, s, i, l, c, u) {
            u = u && "" !== u.trim();
            var p = o.subParser("outdent")(l, r, t), h = "";
            return c && r.tasklists && (h = ' class="task-list-item" style="list-style-type: none;"', 
            p = p.replace(/^[ \t]*\[(x|X| )?]/m, function() {
                var e = '<input type="checkbox" disabled style="margin: 0px 0.35em 0.25em -1.6em; vertical-align: middle;"';
                return u && (e += " checked"), e += ">";
            })), n || p.search(/\n{2,}/) > -1 ? (p = o.subParser("githubCodeBlocks")(p, r, t), 
            p = o.subParser("blockGamut")(p, r, t)) : (p = (p = o.subParser("lists")(p, r, t)).replace(/\n$/, ""), 
            p = a ? o.subParser("paragraphs")(p, r, t) : o.subParser("spanGamut")(p, r, t)), 
            p = "\n<li" + h + ">" + p + "</li>\n";
        }), e = e.replace(/~0/g, ""), t.gListLevel--, n && (e = e.replace(/\s+$/, "")), 
        e;
    }
    function s(e, r, t) {
        var s = "ul" === r ? /^ {0,2}\d+\.[ \t]/gm : /^ {0,2}[*+-][ \t]/gm, a = [], o = "";
        if (-1 !== e.search(s)) {
            !function e(a) {
                var i = a.search(s);
                -1 !== i ? (o += "\n\n<" + r + ">" + n(a.slice(0, i), !!t) + "</" + r + ">\n\n", 
                s = "ul" == (r = "ul" === r ? "ol" : "ul") ? /^ {0,2}\d+\.[ \t]/gm : /^ {0,2}[*+-][ \t]/gm, 
                e(a.slice(i))) : o += "\n\n<" + r + ">" + n(a, !!t) + "</" + r + ">\n\n";
            }(e);
            for (var i = 0; i < a.length; ++i) ;
        } else o = "\n\n<" + r + ">" + n(e, !!t) + "</" + r + ">\n\n";
        return o;
    }
    e = t.converter._dispatch("lists.before", e, r, t), e += "~0";
    var a = /^(([ ]{0,3}([*+-]|\d+[.])[ \t]+)[^\r]+?(~0|\n{2,}(?=\S)(?![ \t]*(?:[*+-]|\d+[.])[ \t]+)))/gm;
    return t.gListLevel ? e = e.replace(a, function(e, r, t) {
        return s(r, t.search(/[*+-]/g) > -1 ? "ul" : "ol", !0);
    }) : (a = /(\n\n|^\n?)(([ ]{0,3}([*+-]|\d+[.])[ \t]+)[^\r]+?(~0|\n{2,}(?=\S)(?![ \t]*(?:[*+-]|\d+[.])[ \t]+)))/gm, 
    e = e.replace(a, function(e, r, t, n) {
        return s(t, n.search(/[*+-]/g) > -1 ? "ul" : "ol");
    })), e = e.replace(/~0/, ""), e = t.converter._dispatch("lists.after", e, r, t);
}), o.subParser("outdent", function(e) {
    return e = e.replace(/^(\t|[ ]{1,4})/gm, "~0"), e = e.replace(/~0/g, "");
}), o.subParser("paragraphs", function(e, r, t) {
    for (var n = (e = (e = (e = t.converter._dispatch("paragraphs.before", e, r, t)).replace(/^\n+/g, "")).replace(/\n+$/g, "")).split(/\n{2,}/g), s = [], a = n.length, i = 0; i < a; i++) {
        var l = n[i];
        l.search(/~(K|G)(\d+)\1/g) >= 0 ? s.push(l) : (l = (l = o.subParser("spanGamut")(l, r, t)).replace(/^([ \t]*)/g, "<p>"), 
        l += "</p>", s.push(l));
    }
    for (a = s.length, i = 0; i < a; i++) {
        for (var c = "", u = s[i], p = !1; u.search(/~(K|G)(\d+)\1/) >= 0; ) {
            var h = RegExp.$1, d = RegExp.$2;
            c = (c = "K" === h ? t.gHtmlBlocks[d] : p ? o.subParser("encodeCode")(t.ghCodeBlocks[d].text) : t.ghCodeBlocks[d].codeblock).replace(/\$/g, "$$$$"), 
            u = u.replace(/(\n\n)?~(K|G)\d+\2(\n\n)?/, c), /^<pre\b[^>]*>\s*<code\b[^>]*>/.test(u) && (p = !0);
        }
        s[i] = u;
    }
    return e = s.join("\n\n"), e = e.replace(/^\n+/g, ""), e = e.replace(/\n+$/g, ""), 
    t.converter._dispatch("paragraphs.after", e, r, t);
}), o.subParser("runExtension", function(e, r, t, n) {
    if (e.filter) r = e.filter(r, n.converter, t); else if (e.regex) {
        var s = e.regex;
        !s instanceof RegExp && (s = new RegExp(s, "g")), r = r.replace(s, e.replace);
    }
    return r;
}), o.subParser("spanGamut", function(e, r, t) {
    return e = t.converter._dispatch("spanGamut.before", e, r, t), e = o.subParser("codeSpans")(e, r, t), 
    e = o.subParser("escapeSpecialCharsWithinTagAttributes")(e, r, t), e = o.subParser("encodeBackslashEscapes")(e, r, t), 
    e = o.subParser("images")(e, r, t), e = o.subParser("anchors")(e, r, t), e = o.subParser("autoLinks")(e, r, t), 
    e = o.subParser("encodeAmpsAndAngles")(e, r, t), e = o.subParser("italicsAndBold")(e, r, t), 
    e = o.subParser("strikethrough")(e, r, t), e = e.replace(/  +\n/g, " <br />\n"), 
    e = t.converter._dispatch("spanGamut.after", e, r, t);
}), o.subParser("strikethrough", function(e, r, t) {
    return r.strikethrough && (e = (e = t.converter._dispatch("strikethrough.before", e, r, t)).replace(/(?:~T){2}([\s\S]+?)(?:~T){2}/g, "<del>$1</del>"), 
    e = t.converter._dispatch("strikethrough.after", e, r, t)), e;
}), o.subParser("stripBlankLines", function(e) {
    return e.replace(/^[ \t]+$/gm, "");
}), o.subParser("stripLinkDefinitions", function(e, r, t) {
    var n = /^ {0,3}\[(.+)]:[ \t]*\n?[ \t]*<?(\S+?)>?(?: =([*\d]+[A-Za-z%]{0,4})x([*\d]+[A-Za-z%]{0,4}))?[ \t]*\n?[ \t]*(?:(\n*)["|'(](.+?)["|')][ \t]*)?(?:\n+|(?=~0))/gm;
    return e += "~0", e = e.replace(n, function(e, n, s, a, i, l, c) {
        return n = n.toLowerCase(), t.gUrls[n] = o.subParser("encodeAmpsAndAngles")(s), 
        l ? l + c : (c && (t.gTitles[n] = c.replace(/"|'/g, "&quot;")), r.parseImgDimensions && a && i && (t.gDimensions[n] = {
            width: a,
            height: i
        }), "");
    }), e = e.replace(/~0/, "");
}), o.subParser("tables", function(e, r, t) {
    function n(e) {
        return /^:[ \t]*--*$/.test(e) ? ' style="text-align:left;"' : /^--*[ \t]*:[ \t]*$/.test(e) ? ' style="text-align:right;"' : /^:[ \t]*--*[ \t]*:$/.test(e) ? ' style="text-align:center;"' : "";
    }
    function s(e, n) {
        var s = "";
        return e = e.trim(), r.tableHeaderId && (s = ' id="' + e.replace(/ /g, "_").toLowerCase() + '"'), 
        e = o.subParser("spanGamut")(e, r, t), "<th" + s + n + ">" + e + "</th>\n";
    }
    function a(e, n) {
        return "<td" + n + ">" + o.subParser("spanGamut")(e, r, t) + "</td>\n";
    }
    function i(e, r) {
        for (var t = "<table>\n<thead>\n<tr>\n", n = e.length, s = 0; s < n; ++s) t += e[s];
        for (t += "</tr>\n</thead>\n<tbody>\n", s = 0; s < r.length; ++s) {
            t += "<tr>\n";
            for (var a = 0; a < n; ++a) t += r[s][a];
            t += "</tr>\n";
        }
        return t += "</tbody>\n</table>\n";
    }
    if (!r.tables) return e;
    var l = /^[ \t]{0,3}\|?.+\|.+\n[ \t]{0,3}\|?[ \t]*:?[ \t]*(?:-|=){2,}[ \t]*:?[ \t]*\|[ \t]*:?[ \t]*(?:-|=){2,}[\s\S]+?(?:\n\n|~0)/gm;
    return e = t.converter._dispatch("tables.before", e, r, t), e = e.replace(l, function(e) {
        var r, t = e.split("\n");
        for (r = 0; r < t.length; ++r) /^[ \t]{0,3}\|/.test(t[r]) && (t[r] = t[r].replace(/^[ \t]{0,3}\|/, "")), 
        /\|[ \t]*$/.test(t[r]) && (t[r] = t[r].replace(/\|[ \t]*$/, ""));
        var l = t[0].split("|").map(function(e) {
            return e.trim();
        }), c = t[1].split("|").map(function(e) {
            return e.trim();
        }), u = [], p = [], h = [], d = [];
        for (t.shift(), t.shift(), r = 0; r < t.length; ++r) "" !== t[r].trim() && u.push(t[r].split("|").map(function(e) {
            return e.trim();
        }));
        if (l.length < c.length) return e;
        for (r = 0; r < c.length; ++r) h.push(n(c[r]));
        for (r = 0; r < l.length; ++r) o.helper.isUndefined(h[r]) && (h[r] = ""), p.push(s(l[r], h[r]));
        for (r = 0; r < u.length; ++r) {
            for (var f = [], g = 0; g < p.length; ++g) o.helper.isUndefined(u[r][g]), f.push(a(u[r][g], h[g]));
            d.push(f);
        }
        return i(p, d);
    }), e = t.converter._dispatch("tables.after", e, r, t);
}), o.subParser("unescapeSpecialChars", function(e) {
    return e = e.replace(/~E(\d+)E/g, function(e, r) {
        var t = parseInt(r);
        return String.fromCharCode(t);
    });
}), module.exports = o;