/**
 * Created by 胡成超 on 2016/9/29.
 */
$(function () {

    function getAllWidth(t) {
        var e = 0;
        return $(t).each(function () {
            e += $(this).outerWidth(!0)
        }),
            e
    }

    /**
     * 调节菜单宽度
     * @param e
     */
    function jusifyWidth(e) {
        var a = getAllWidth($(e).prevAll())
            , i = getAllWidth($(e).nextAll())
            , n = getAllWidth($(".content-tabs").children().not(".menu-tabs"))
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

    /**
     * 向左移动菜单栏
     * @returns {boolean}
     */
    function moveLeft() {
        var e = Math.abs(parseInt($(".page-tabs-content").css("margin-left")))
            , a = getAllWidth($(".content-tabs").children().not(".menu-tabs"))
            , i = $(".content-tabs").outerWidth(!0) - a
            , n = 0;
        if ($(".page-tabs-content").width() < i)
            return !1;
        for (var s = $(".menu-tab:first"), r = 0; r + $(s).outerWidth(!0) <= e;)
            r += $(s).outerWidth(!0),
                s = $(s).next();
        if (r = 0,
            getAllWidth($(s).prevAll()) > i) {
            for (; r + $(s).outerWidth(!0) < i && s.length > 0;)
                r += $(s).outerWidth(!0),
                    s = $(s).prev();
            n = getAllWidth($(s).prevAll())
        }
        $(".page-tabs-content").animate({
            marginLeft: 0 - n + "px"
        }, "fast")
    }

    /**
     * 向右移动菜单栏
     * @returns {boolean}
     */
    function moveRight() {
        var e = Math.abs(parseInt($(".page-tabs-content").css("margin-left")))
            , a = getAllWidth($(".content-tabs").children().not(".menu-tabs"))
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
        n = getAllWidth($(s).prevAll()),
        n > 0 && $(".page-tabs-content").animate({
            marginLeft: 0 - n + "px"
        }, "fast")
    }

    /**
     * 显示菜单内容
     * @returns {boolean}
     */
    function showMenuContent() {
        var t = $(this).attr("href")
            , a = $(this).data("index")
            , i = $.trim($(this).text())
            , n = !0;
        if (void 0 == t || 0 == $.trim(t).length)
            return !1;


        if ($(".menu-tab").each(function () {
                return $(this).data("id") == t ? ($(this).hasClass("active") || ($(this).addClass("active").siblings(".menu-tab").removeClass("active"),
                    jusifyWidth(this),
                    $(".menu-content .menu-iframe").each(function () {
                        return $(this).data("id") == t ? ($(this).show().siblings(".menu-iframe").hide(),
                            !1) : void 0
                    })),
                    n = !1,
                    !1) : void 0
            }),
                n) {
            var s = '<a href="javascript:;" class="active menu-tab" data-id="' + t + '">' + i + ' <i class="fa fa-times-circle"></i></a>';
            $(".menu-tab").removeClass("active");
            var r = '<iframe class="menu-iframe" name="iframe' + a + '" width="100%" height="99%" src="' + t + '?v=4.0" frameborder="0" data-id="' + t + '" seamless></iframe>';
            $(".menu-content").find("iframe.menu-iframe").hide().parents(".menu-content").append(r);
            var o = layer.load();
            $(".menu-content iframe:visible").load(function () {
                layer.close(o)
            }),
                $(".menu-tabs .page-tabs-content").append(s),
                jusifyWidth($(".menu-tab.active"))
        }
        return !1
    }

    /**
     * 移除菜单内容
     * @returns {boolean}
     */
    function removeMenuContent() {
        var t = $(this).parents(".menu-tab").data("id")
            , a = $(this).parents(".menu-tab").width();
        if ($(this).parents(".menu-tab").hasClass("active")) {
            if ($(this).parents(".menu-tab").next(".menu-tab").size()) {
                var i = $(this).parents(".menu-tab").next(".menu-tab:eq(0)").data("id");
                $(this).parents(".menu-tab").next(".menu-tab:eq(0)").addClass("active"),
                    $(".menu-content .menu-iframe").each(function () {
                        return $(this).data("id") == i ? ($(this).show().siblings(".menu-iframe").hide(),
                            !1) : void 0
                    });
                var n = parseInt($(".page-tabs-content").css("margin-left"));
                0 > n && $(".page-tabs-content").animate({
                    marginLeft: n + a + "px"
                }, "fast"),
                    $(this).parents(".menu-tab").remove(),
                    $(".menu-content .menu-iframe").each(function () {
                        return $(this).data("id") == t ? ($(this).remove(),
                            !1) : void 0
                    })
            }
            if ($(this).parents(".menu-tab").prev(".menu-tab").size()) {
                var i = $(this).parents(".menu-tab").prev(".menu-tab:last").data("id");
                $(this).parents(".menu-tab").prev(".menu-tab:last").addClass("active"),
                    $(".menu-content .menu-iframe").each(function () {
                        return $(this).data("id") == i ? ($(this).show().siblings(".menu-iframe").hide(),
                            !1) : void 0
                    }),
                    $(this).parents(".menu-tab").remove(),
                    $(".menu-content .menu-iframe").each(function () {
                        return $(this).data("id") == t ? ($(this).remove(),
                            !1) : void 0
                    })
            }
        } else
            $(this).parents(".menu-tab").remove(),
                $(".menu-content .menu-iframe").each(function () {
                    return $(this).data("id") == t ? ($(this).remove(),
                        !1) : void 0
                }),
                jusifyWidth($(".menu-tab.active"));
        return !1
    }

    /**
     * 关闭非活动菜单
     */
    function closeOther() {
        $(".page-tabs-content").children("[data-id]").not(":first").not(".active").each(function () {
            $('.menu-iframe[data-id="' + $(this).data("id") + '"]').remove(),
                $(this).remove()
        }),
            $(".page-tabs-content").css("margin-left", "0")
    }


    function showActive() {
        jusifyWidth($(".menu-tab.active"))
    }

    /**
     * 显示活动菜单
     */
    function menuToActive() {
        if (!$(this).hasClass("active")) {
            var t = $(this).data("id");
            $(".menu-content .menu-iframe").each(function () {
                return $(this).data("id") == t ? ($(this).show().siblings(".menu-iframe").hide(),
                    !1) : void 0
            }),
                $(this).addClass("active").siblings(".menu-tab").removeClass("active"),
                jusifyWidth(this)
        }
    }

    /**
     * 刷新菜单内容
     */
    function menuFlush() {
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
        $(".menu-item").on("click", showMenuContent),
        $(".menu-tabs").on("click", ".menu-tab i", removeMenuContent),
        $(".close-other").on("click", closeOther),
        $(".show-active").on("click", showActive),
        $(".menu-tabs").on("click", ".menu-tab", menuToActive),
        $(".menu-tabs").on("dblclick", ".menu-tab", menuFlush),
        $(".tab-left").on("click", moveLeft),
        $(".tab-right").on("click", moveRight),
        $(".close-all").on("click", function () {
            //移除所有菜单内容
            $(".page-tabs-content").children("[data-id]").not(":first").each(function () {
                $('.menu-iframe[data-id="' + $(this).data("id") + '"]').remove(),
                    $(this).remove()
            }),
                //显示首页内容
                $(".page-tabs-content").children("[data-id]:first").each(function () {
                    $('.menu-iframe[data-id="' + $(this).data("id") + '"]').show(),
                        $(this).addClass("active")
                }),
                $(".page-tabs-content").css("margin-left", "0")
        })
});
