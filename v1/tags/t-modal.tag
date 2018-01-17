<t-modal>
    <div class="overlay {unol: ifol}" if="{show}" riot-style="{overlay}"></div>

    <div class="content" if="{show}" riot-style="{modal}">
        <div class="notice" if="{current=='notice'}">
            <div class="notice-text center"><p>弹窗信息</p></div>
            <div class="notice-close" onclick="{close}">
                <p>我知道了</p>
            </div>
        </div>
    </div>

    <script>
        var self = this
        self.switching = false
        self.show = false
        self.current = ''

        self.close = function() {
            self.amplify(false, '')
        }

        self.on('unmount', function() {
            self.modalMsgBus.off('*')
        })
        self.modalMsgBus.on('*', function(e, data) {
            if (self.switching) {
                return
            }
            self.switching = true
            var setModal = function(modalName) {
                self.update({
                    show: true
                })
                self.amplify(true, modalName)
            }

            switch (e) {
                case 'notice':
                    setModal('notice')
                    break
            }
        })

        self.amplify = function(ampflag, cModal) {
            var amp = {
                    'animation': 'amp .33s linear',
                    '-webkit-animation': 'amp .33s linear',
                    'animation-fill-mode': 'forwards',
                    '-webkit-animation-fill-mode': 'forwards'
                },
                light = {
                    'animation': 'light-ol .23s linear',
                    '-webkit-animation': 'light-ol .23s linear',
                    'animation-fill-mode': 'forwards',
                    '-webkit-animation-fill-mode': 'forwards'
                }
                ampReserve = {
                    'animation': 'ampReserve .15s linear',
                    '-webkit-animation': 'ampReserve .15s linear',
                    'animation-fill-mode': 'forwards',
                    '-webkit-animation-fill-mode': 'forwards'
                },
                dark = {
                    'opacity': '0'
                },
                initModal = {
                    'animation': 'initModal .01s linear',
                    '-webkit-animation': 'initModal .01s linear',
                    'animation-fill-mode': 'forwards',
                    '-webkit-animation-fill-mode': 'forwards'
                }
            setTimeout(function(){
                self.update({
                    modal: ampflag ? amp : ampReserve,
                    overlay: ampflag ? light : dark,
                    current: cModal,
                    switching: false
                })
            }, 50)
            if(!ampflag) {
                setTimeout(function() {
                  self.update({
                    'show': ampflag,
                    'modal': initModal
                  })
                }, 230)
            }
        }


    </script>
    <style>
        .overlay {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background-color: #000000;
            opacity: 0;
            z-index: 200;
        }

        .content {
            position: absolute;
            display: block;
            width: 25.833rem;
            height: 23.25rem;
            top: 13.15rem;
            left: 2.1rem;
            text-align: center;
            opacity: 0;
            background-color: #ffffff;
            z-index: 201;
        }

        .content p {
            color: #97999d;
        }

        .notice {
            display: block;
            width: 100%;
            height: 100%;
        }
        .notice-text {
            width: 100%;
            height: 81.85%;
        }
        .notice-text p {
            color: darkgrey;
            font-size: 1.5rem;
        }
        .notice-close {
            width: 100%;
            height: 18.15%;
            background: #f3f2f7;
        }
        .notice-close p {
            width: 100%;
            line-height: 4.17rem;
            font-size: 1.5rem;
            color: #0a79ff;
        }
        @keyframes amp {
            0% {
                opacity: 0;
                transform: scale(0);
                -webkit-transform: scale(0);
            }
            100% {
                opacity: 1;
                transform: scale(1);
                -webkit-transform: scale(1);
            }
        }
        @keyframes ampReserve {
            0% {
                opacity: 1;
                transform: scale(1);
                -webkit-transform: scale(1);
            }
            100% {
                opacity: 0;
                transform: scale(0);
                -webkit-transform: scale(0);
            }
        }
        @keyframes light-ol {
            0% {
                opacity: 0;
            }
            100% {
                opacity: .5;
            }
        }
        @keyframes initModal {
            0%, 100% {
                opacity: 0;
                transform: scale(0);
                -webkit-transform: scale(0);
            }
        }
    </style>
</t-modal>
