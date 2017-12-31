<t-error>
    <div class="content" onclick={popUrl}>
      <div class="box middle">
          <div class="e">{text_page_error}</div>
          <div class="t">{text_hotLine} <a href="wtai://wp//mc;12345678901">12345678901</a> </div>
          <div class="tip">{errs}<p></p></div>
      </div>
    </div>
    <script>
        var self = this
        self.text_page_error = LANG.text_page_error
        self.text_hotLine = LANG.text_hotLine
        self.errs = APP.error

        self.popUrl = function() {
            popUrl()
        }
    </script>
    <style>
        .content {
            position: relative;
            display: block;
            width:100%;
            height:100%;
        }
        .box {
            width: 100%;
            height: 100%;
            text-align: center;
            background-color: #f4f4f4;
            color: #7d7d7d;
        }

        .e {
            font-size: 1.33rem
        }

        .t {
            font-size: 1rem;
            margin-top: .75rem;
        }

        .t a {
            color: #007dff;
        }
        .tip {
            font-size: .9rem;
            margin-top: 2rem;
        }
        .tip p {
            font-size: .9rem;
            color: red;
        }
    </style>
</t-error>
