$(window).load(function() {
  var menu = new Vue({
    el: "#menu",
    data: {
      mobileSize: 540,
      isDesktop: true,
      menuHeight: 0
    },
    created() {
      $(window).on("resize", window, this.changeLayout);
      this.changeLayout();
    },
    destroyed() {
      $(window).off("resize", window, this.changeLayout);
    },
    mounted() {
      $("#menu ul li a").mouseover(function(e) {
        $(this).parent().addClass("menu_focus");
      }).mouseout(function(e) {
        $(this).parent().removeClass("menu_focus");
      });
    },
    methods: {
      changeLayout() {
        var current_width = window.innerWidth;
        this.isDesktop = (current_width > this.mobileSize);
        this.menuHeight = window.innerHeight;
      }
    }
  });

  var contents = new Vue({
    el: "#contents",
    data: {
      mobileSize: 540,
      isDesktop: true,
      contentsWidth: 0
    },
    created() {
      $(window).on("resize", window, this.changeLayout);
      this.changeLayout();
    },
    destroyed() {
      $(window).off("resize", window, this.changeLayout);
    },
    methods: {
      changeLayout() {
        var current_width = window.innerWidth;
        this.isDesktop = (current_width > this.mobileSize);
        this.contentsWidth = (this.isDesktop) ? current_width - $("#menu").width() : current_width;
      }
    }
  });
});
