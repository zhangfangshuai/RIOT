<t-modal>
    <div class="overlay {bg: ifbg}" if="{show}"></div>

    <div class="wrap ball-wrap" if="{show && current==='ballLoading'}">
        <div class="fs-ball-holder fs-ball-1">
            <div class="fs-ball-a"></div>
        </div>
        <div class="fs-ball-holder fs-ball-2">
            <div class="fs-ball-b"></div>
        </div>
        <div class="fs-ball-holder fs-ball-3">
            <div class="fs-ball-c"></div>
        </div>
        <div class="fs-ball-holder fs-ball-4">
            <div class="fs-ball-d"></div>
        </div>
        <div class="fs-ball-holder fs-ball-5">
            <div class="fs-ball-e"></div>
        </div>
    </div>

    <div class="wrap rload-wrap" if="{show && current=='ringLoading'}">
        <div class="fs-ring fs-ring-1"></div>
    </div>

    <div class="wrap rbload-wrap" if="{show && current=='ringballLoading'}">
        <div class="fs-rbring">
            <div class="fs-rbball-holder fs-ringball-1">
                <div class="fs-rbball"></div>
            </div>
        </div>
    </div>

    <div class="wrap linego-wrap" if="{show && current=='linegoLoading'}">
        <div class="fs-linego fs-linego-1"></div>
        <div class="fs-linego fs-linego-2"></div>
        <div class="fs-linego fs-linego-3"></div>
        <div class="fs-linego fs-linego-4"></div>
        <div class="fs-linego fs-linego-5"></div>
    </div>
    <script>
        var self = this

        self.show = false
        self.ifbg = false

        self.close = function() {
            self.update({
                show: false,
            })
        }

        self.on('unmount', function() {
            self.modalMsgBus.off('*')
        })

        self.modalMsgBus.on('*', function(e, data) {
            switch (e) {
                case 'ringball-loading':
                    self.update({
                        show: true,
                        current: 'ringballLoading'
                    })
                    break
                case 'ring-loading':
                    self.update({
                        show: true,
                        current: 'ringLoading'
                    })
                    break
                case 'ball-loading':
                    self.update({
                        show: true,
                        current: 'ballLoading'
                    })
                    break
                case 'linego-loading':
                    self.update({
                        show: true,
                        current: 'linegoLoading'
                    })
                    break
                case 'close':
                    self.update({
                        show: false
                    })
                    break
            }
        })
    </script>
    <style>
        /*animation: name duration timing-function delay iteration-count direction;*/
        .overlay {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background-color: #353535;
            opacity: .5;
            z-index: 200;
        }
        .bg {
            background: initial;
        }
        .wrap {
            position: absolute;
            display: block;
            background-color: #ffffff;
            border-radius: .8rem;
            z-index: 201;
        }
        .rload-wrap, .rbload-wrap, .ball-wrap  {
            width: 7rem;
            height: 7rem;
            top: 20rem;
            left: 11.5rem;
        }
        .linego-wrap {
            width: 100%;
            height: 7rem;
            top: 20rem;
            padding: 3rem 0;
            background-color: initial;
        }


        .fs-ball-holder {
            position: absolute;
            width: 1rem;
            height: 4rem;
            left: 3rem;
            top: 1.3rem;
        }
        .fs-ball-a, .fs-ball-b, .fs-ballc, .fs-ball-d, .fs-ball-e {
            position: absolute;
            border-radius: 50%;
            background: #3d77e0;
        }
        .fs-ball-a {
            top: -.75rem;
            left: -.3rem;
            width: 1.5rem;
            height: 1.5rem;
        }
        .fs-ball-b {
            top: -.65rem;
            left: -.2rem;
            width: 1.3rem;
            height: 1.3rem;
        }
        .fs-ball-c {
            top: -.55rem;
            left: -.1rem;
            width: 1.1rem;
            height: 1.1rem;
        }
        .fs-ball-d {
            top: -.45rem;
            left: 0rem;
            width: .9rem;
            height: .9rem;
        }
        .fs-ball-e {
            top: -.35rem;
            left: .1rem;
            width: .7rem;
            height: .7rem;
        }
        .fs-ball-1 {
            animation: fs-ball-loading 1.5s .05s ease infinite;
        }
        .fs-ball-2 {
            animation: fs-ball-loading 1.5s .23s ease infinite;
        }
        .fs-ball-3 {
            animation: fs-ball-loading 1.5s .28s ease infinite;
        }
        .fs-ball-4 {
            animation: fs-ball-loading 1.5s .38s ease infinite;
        }
        .fs-ball-5 {
            animation: fs-ball-loading 1.5s .48s ease infinite;
        }
        @keyframes fs-ball-loading {
            100% {
                transform: rotate(360deg)
            }
        }


        .fs-rbring {
            position: relative;
            width: 5rem;
            height: 5rem;
            margin: 1rem auto;
            border: .4rem solid #3d77e0;
            border-radius: 100%;
        }
        .fs-rbball-holder {
            position: absolute;
            width: 1.5rem;
            height: 4.3rem;
            left: 1.3rem;
            top: -.1rem;
        }
        .fs-rbball {
            position: absolute;
            top: -.9rem;
            left: -.3rem;
            width: 1.5rem;
            height: 1.5rem;
            border-radius: 50%;
            background: #3d77e0;
        }
        .fs-ringball-1 {
            animation: fs-ringball-loading 1.5s cubic-bezier(.5, .5, .5, .5) infinite;
        }
        @keyframes fs-ringball-loading {
            50% {
                transform: rotate(180deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }


        .fs-ring {
            width: 5rem;
            height: 5rem;
            margin: 1rem auto;
            border: .8rem dashed #3cacef;
            border-radius: 50%;
        }
        .fs-ring-1 {
            animation: fs-ring-loading 1.5s cubic-bezier(.5, .5, .5, .5) infinite;
        }
        @keyframes fs-ring-loading {
            50% {
                transform: rotate(180deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }


        .fs-linego {
            display: inline-block;
            opacity: 0;
            width: 1.3rem;
            height: 1.3rem;
            border-radius: 50%;
            transform: translateX(0rem);
            background-color: #00ddff;
        }
        .fs-linego-1 {
            animation: fs-linego-loading 3s .8s infinite;
        }
        .fs-linego-2 {
            animation: fs-linego-loading 3s .65s infinite;
        }
        .fs-linego-3 {
            animation: fs-linego-loading 3s .5s infinite;
        }
        .fs-linego-4 {
            animation: fs-linego-loading 3s .35s infinite;
        }
        .fs-linego-5 {
            animation: fs-linego-loading 3s .2s infinite;
        }
        @keyframes fs-linego-loading {
            50% {
                transform: translateX(11rem);
                opacity: 1;
            }
            100% {
                transform: translateX(21rem);
                opacity: 0;
            }
        }
    </style>
</t-modal>
