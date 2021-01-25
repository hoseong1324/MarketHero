$(window).load(function() {
  var index_background = new Vue({
    el : "#index_background",
    data : {
      bgHeight : 0
    },
    created() {
      $(window).on("resize", window, this.changeHeight);
      this.changeHeight();
    },
    destroyed() {
      $(window).off("resize", window, this.changeHeight);
    },
    methods: {
        changeHeight() {
            this.bgHeight = window.innerHeight;
        }
    }
  });

  var index_stage = new Vue({
    el : "#index_stage",
    data : {
      stageHeight : 0
    },
    created() {
      $(window).on("resize", window, this.changeHeight);
      this.changeHeight();
    },
    destroyed() {
      $(window).off("resize", window, this.changeHeight);
    },
    methods: {
        changeHeight() {
            this.stageHeight = window.innerHeight;
        }
    }
  });
});
