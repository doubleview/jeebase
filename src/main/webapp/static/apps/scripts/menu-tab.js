/**
 * Created by 胡成超 on 2016/9/29.
 */
$(function () {
    function t(t) {
        var e = 0;
        return $(t).each(function () {
            e += $(this).outerWidth(!0)
        }),
            e
    }

    function e(e) {
        var a = t($(e).prevAll())
            , i = t($(e).nextAll())
            , n = t($(".content-tabs").children().not(".menu-tabs"))
            , s = $(".content-tabs").outerWidth(!0) - n
            , r = 0;
        if ($(".page-tabs-content").outerWidth() < s)
            r = 0;
        else if (i <= s - $(e).outerWidth(!0) - $(e).next().outerWidth(!0)) {
            if (s - $(e).next().outerWidth(!0) > i) {
                r = a;
                for (var o = e; r - $(o).outerWidth() > $(".page-tabs-content").outerWidth() - s;)
                    r -= $(o).prev().outerWidth(),
                        o = $(o).prev()
            }
        } else
            a > s - $(e).outerWidth(!0) - $(e).prev().outerWidth(!0) && (r = a - $(e).prev().outerWidth(!0));
        $(".page-tabs-content").animate({
            marginLeft: 0 - r + "px"
        }, "fast")
    }

    function a() {
        var e = Math.abs(parseInt($(".page-tabs-content").css("margin-left")))
            , a = t($(".content-tabs").children().not(".menu-tabs"))
            , i = $(".content-tabs").outerWidth(!0) - a
            , n = 0;
        if ($(".page-tabs-content").width() < i)
            return !1;
        for (var s = $(".menu-tab:first"), r = 0; r + $(s).outerWidth(!0) <= e;)
            r += $(s).outerWidth(!0),
                s = $(s).next();
        if (r = 0,
            t($(s).prevAll()) > i) {
            for (; r + $(s).outerWidth(!0) < i && s.length > 0;)
                r += $(s).outerWidth(!0),
                    s = $(s).prev();
            n = t($(s).prevAll())
        }
        $(".page-tabs-content").animate({
            marginLeft: 0 - n + "px"
        }, "fast")
    }

    function i() {
        var e = Math.abs(parseInt($(".page-tabs-content").css("margin-left")))
            , a = t($(".content-tabs").children().not(".menu-tabs"))
            , i = $(".content-tabs").outerWidth(!0) - a
            , n = 0;
        if ($(".page-tabs-content").width() < i)
            return !1;
        for (var s = $(".menu-tab:first"), r = 0; r + $(s).outerWidth(!0) <= e;)
            r += $(s).outerWidth(!0),
                s = $(s).next();
        for (r = 0; r + $(s).outerWidth(!0) < i && s.length > 0;)
            r += $(s).outerWidth(!0),
                s = $(s).next();
        n = t($(s).prevAll()),
        n > 0 && $(".page-tabs-content").animate({
            marginLeft: 0 - n + "px"
        }, "fast")
    }

    function n() {
        var t = $(this).attr("href")
            , a = $(this).data("index")
            , i = $.trim($(this).text())
            , n = !0;
        if (void 0 == t || 0 == $.trim(t).length)
            return !1;

        if ($(".menu-tab").each(function () {
                return $(this).data("id") == t ? ($(this).hasClass("active") || ($(this).addClass("active").siblings(".menu-tab").removeClass("active"),
                    e(this),
                    $(".J_mainContent .menu-iframe").each(function () {
                        return $(this).data("id") == t ? ($(this).show().siblings(".menu-iframe").hide(),
                            !1) : void 0
                    })),
                    n = !1,
                    !1) : void 0
            }),
                n) {
            var s = '<a href="javascript:;" class="active menu-tab" data-id="' + t + '">' + i + ' <i class="fa fa-times-circle"></i></a>';
            $(".menu-tab").removeClass("active");
            var r = '<iframe class="menu-iframe" name="iframe' + a + '" width="100%" height="100%" src="' + t + '?v=4.0" frameborder="0" data-id="' + t + '" seamless></iframe>';
            $(".J_mainContent").find("iframe.menu-iframe").hide().parents(".J_mainContent").append(r);
            var o = layer.load();
            $(".J_mainContent iframe:visible").load(function () {
                layer.close(o)
            }),
                $(".menu-tabs .page-tabs-content").append(s),
                e($(".menu-tab.active"))
        }
        return !1
    }

    function s() {
        var t = $(this).parents(".menu-tab").data("id")
            , a = $(this).parents(".menu-tab").width();
        if ($(this).parents(".menu-tab").hasClass("active")) {
            if ($(this).parents(".menu-tab").next(".menu-tab").size()) {
                var i = $(this).parents(".menu-tab").next(".menu-tab:eq(0)").data("id");
                $(this).parents(".menu-tab").next(".menu-tab:eq(0)").addClass("active"),
                    $(".J_mainContent .menu-iframe").each(function () {
                        return $(this).data("id") == i ? ($(this).show().siblings(".menu-iframe").hide(),
                            !1) : void 0
                    });
                var n = parseInt($(".page-tabs-content").css("margin-left"));
                0 > n && $(".page-tabs-content").animate({
                    marginLeft: n + a + "px"
                }, "fast"),
                    $(this).parents(".menu-tab").remove(),
                    $(".J_mainContent .menu-iframe").each(function () {
                        return $(this).data("id") == t ? ($(this).remove(),
                            !1) : void 0
                    })
            }
            if ($(this).parents(".menu-tab").prev(".menu-tab").size()) {
                var i = $(this).parents(".menu-tab").prev(".menu-tab:last").data("id");
                $(this).parents(".menu-tab").prev(".menu-tab:last").addClass("active"),
                    $(".J_mainContent .menu-iframe").each(function () {
                        return $(this).data("id") == i ? ($(this).show().siblings(".menu-iframe").hide(),
                            !1) : void 0
                    }),
                    $(this).parents(".menu-tab").remove(),
                    $(".J_mainContent .menu-iframe").each(function () {
                        return $(this).data("id") == t ? ($(this).remove(),
                            !1) : void 0
                    })
            }
        } else
            $(this).parents(".menu-tab").remove(),
                $(".J_mainContent .menu-iframe").each(function () {
                    return $(this).data("id") == t ? ($(this).remove(),
                        !1) : void 0
                }),
                e($(".menu-tab.active"));
        return !1
    }

    function r() {
        $(".page-tabs-content").children("[data-id]").not(":first").not(".active").each(function () {
            $('.menu-iframe[data-id="' + $(this).data("id") + '"]').remove(),
                $(this).remove()
        }),
            $(".page-tabs-content").css("margin-left", "0")
    }

    function o() {
        e($(".menu-tab.active"))
    }

    function d() {
        if (!$(this).hasClass("active")) {
            var t = $(this).data("id");
            $(".J_mainContent .menu-iframe").each(function () {
                return $(this).data("id") == t ? ($(this).show().siblings(".menu-iframe").hide(),
                    !1) : void 0
            }),
                $(this).addClass("active").siblings(".menu-tab").removeClass("active"),
                e(this)
        }
    }

    function c() {
        var t = $('.menu-iframe[data-id="' + $(this).data("id") + '"]')
            , e = t.attr("src")
            , a = layer.load();
        t.attr("src", e).load(function () {
            layer.close(a)
        })
    }

    $(".menu-item").each(function (t) {
        $(this).attr("data-index") || $(this).attr("data-index", t)
    }),
        $(".menu-item").on("click", n),
        $(".menu-tabs").on("click", ".menu-tab i", s),
        $(".close-other").on("click", r),
        $(".show-active").on("click", o),
        $(".menu-tabs").on("click", ".menu-tab", d),
        $(".menu-tabs").on("dblclick", ".menu-tab", c),
        $(".tab-left").on("click", a),
        $(".tab-right").on("click", i),
        $(".close-all").on("click", function () {
            $(".page-tabs-content").children("[data-id]").not(":first").each(function () {
                $('.menu-iframe[data-id="' + $(this).data("id") + '"]').remove(),
                    $(this).remove()
            }),
                $(".page-tabs-content").children("[data-id]:first").each(function () {
                    $('.menu-iframe[data-id="' + $(this).data("id") + '"]').show(),
                        $(this).addClass("active")
                }),
                $(".page-tabs-content").css("margin-left", "0")
        })
});
