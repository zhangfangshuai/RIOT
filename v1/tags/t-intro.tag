<t-intro>
  <div class="content">
      <div class="page-modal center middle">
          <p>{text_intro}</p>
      </div>
      <div class="foot">
          <div class="btn middle" onclick={toNext}>{text_btn}</div>
      </div>
  </div>
  <script>
      var self = this
      var index = 0
      var loadtype = ['ball-loading', 'ring-loading', 'ringball-loading', 'linego-loading', 'dot-loading',
                      'ballflex-loading', 'balllight-loading', 'line-loading', 'lineboth-loading', 'prog-loading',
                      'geer-loading', 'ballhide-loading', 'ballcollide-loading', 'rollgradient-loading', 'rolllack-loading',
                      'rollelongate-loading', 'heartbeat-loading', 'flip-loading', 'flipcube-loading']

      self.text_intro = LANG.text_intro
      self.text_btn = LANG.text_btn

      self.toNext = function() {
          var loadindex = parseInt(Math.random() * (loadtype.length + 1))   // 生成loadtype.length随机整数
          index = index >= loadtype.length ? 0 : index ++
          self.modalMsgBus.trigger(loadtype[loadindex])
          // self.modalMsgBus.trigger('flipcube-loading')
          setTimeout(function(){
            self.modalMsgBus.trigger('close')
          }, 4000)
      }
  </script>
  <style>
      .content {
          position: relative;
          display: block;
          width:100%;
          height:100%;
          padding: 0 .67rem;
      }

      .page-modal {
          width: 100%;
          height: 80%;
      }

      .page-modal p {
          font-family: 'QH';
          font-weight: 600;
          font-size: 1.8rem;
          color: #3257a9;
      }

      .foot {
          width: 95.55%;
          height: 8rem;
          padding: 0 1.1rem;
          position: absolute;
          bottom: 0;
      }

      .btn {
          width: 100%;
          height: 4rem;
          text-align: center;
          background-color: #3257a9;
          color: white;
          font-size: 1.4rem;
          border-radius: .2rem;
      }

      .btn:active {
          background-color: #06266f;
      }
  </style>
</t-intro>
