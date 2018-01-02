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
      var loadtype = ['ball-loading', 'ring-loading', 'ringball-loading', 'linego-loading']

      self.text_intro = LANG.text_intro
      self.text_btn = LANG.text_btn

      self.toNext = function() {
          var loadindex = parseInt(Math.random() * 4)   // 生成[0-3]随机整数
          self.modalMsgBus.trigger(loadtype[loadindex])
          self.modalMsgBus.trigger('creep-loading')
          setTimeout(function(){
              self.modalMsgBus.trigger('close')
          }, 2000)
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
