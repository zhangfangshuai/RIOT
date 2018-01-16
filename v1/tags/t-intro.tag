<t-intro>
  <div class="content">
      <div class="page-modal center">
          <p>{text_intro}</p>
      </div>
      <div class="foot">
          <div class="btn center" onclick={toNext}>{text_btn}</div>
      </div>
  </div>
  <script>
      var self = this
      var index = 0
      var loadtype = ['ball-loading', 'ring-loading', 'ringball-loading', 'linego-loading', 'dot-loading',
                      'balllight-loading', 'line-loading', 'lineboth-loading', 'prog-loading',
                      'geer-loading', 'ballhide-loading', 'ballcollide-loading', 'rollgradient-loading', 'rolllack-loading',
                      'heartbeat-loading', 'flip-loading', 'flipcube-loading']

      self.text_intro = LANG.text_intro
      self.text_btn = LANG.text_btn

      self.toNext = function() {
          var index = parseInt(Math.random() * (loadtype.length + 1))   // 生成0到 loadtype.length随机整数
          self.loadMsgBus.trigger(loadtype[index])
          // self.loadMsgBus.trigger('geer-loading')
          setTimeout(function(){
              self.loadMsgBus.trigger('close')
              self.modalMsgBus.trigger('notice')
          }, 3000)
      }
  </script>
  <style>
      .content {
          position: relative;
          display: block;
          width:100vw;
          height:100vh;
          padding: 0 .67rem;
      }

      .page-modal {
          width: 100%;
          height: 84%;
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
