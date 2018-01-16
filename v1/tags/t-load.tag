<t-load>
    <div class="overlay {unol: ifol}" if="{show}"></div>

    <div class="wrap" if="{show && current==='ballLoading'}">
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

    <div class="wrap" if="{show && current=='ringLoading'}">
        <div class="fs-ring"></div>
    </div>

    <div class="wrap" if="{show && current=='ringdotLoading'}">
        <div class="ring-loading">
            <div class="fs-ring"></div>
        </div>
    </div>

    <div class="wrap" if="{show && current=='ringballLoading'}">
        <div class="fs-rbring">
            <div class="fs-rbball-holder fs-ringball-1">
                <div class="fs-rbball"></div>
            </div>
        </div>
    </div>

    <div class="wrap linego-wrap" if="{show && current=='linegoLoading'}">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div>

    <div class="wrap dot-wrap" if="{show && current=='dotLoading'}">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div>

    <div class="wrap ball-flex-wrap" if="{show && current=='ballFlexLoading'}">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div>

    <div class="wrap ball-light-wrap" if="{show && current=='ballLightLoading'}">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div>

    <div class="wrap line-wrap" if="{show && current=='lineLoading'}">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div>
    <div class="wrap lineboth-wrap" if="{show && current=='lineBothLoading'}">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div>

    <div class="wrap prog-wrap" if="{show && current=='progLoading'}">
        <span></span>
    </div>

    <div class="wrap geer-wrap" if="{show && current=='geerLoading'}">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div>

    <div class="wrap ballhide-wrap" if="{show && current=='ballHideLoading'}">
        <div class="bh-holder">
            <span></span>
        </div>
        <div class="bh-holder">
            <span></span>
        </div>
        <div class="bh-holder">
            <span></span>
        </div>
        <div class="bh-holder">
            <span></span>
        </div>
        <div class="bh-holder">
            <span></span>
        </div>
        <div class="bh-holder">
            <span></span>
        </div>
    </div>

    <div class="wrap ballcollide-wrap" if="{show && current=='ballCollideLoading'}">
        <span></span>
        <span></span>
    </div>

    <div class="wrap rollgradient-wrap" if="{show && current=='rollGradientLoading'}">
        <span></span>
    </div>

    <div class="wrap rolllack-wrap" if="{show && current=='rollLackLoading'}">
        <span></span>
    </div>

    <div class="wrap rollelongate-wrap" if="{show && current=='rollElongateLoading'}">
        <span></span>
    </div>

    <div class="wrap heartbeat-wrap" if="{show && current=='heartBeatLoading'}">
        <span></span>
    </div>

    <div class="wrap flip-wrap" if="{show && current=='flipLoading'}">
        <span></span>
    </div>

    <div class="wrap flipcube-wrap" if="{show && current=='flipCubeLoading'}">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div>
    <script>
        var self = this
        self.show = false
        self.ifol = false


        self.on('unmount', function() {
            self.loadMsgBus.off('*')
        })

        self.loadMsgBus.on('*', function(e, data) {
            switch (e) {
                case 'close':
                    self.update({
                        show: false
                    })
                    break
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
                case 'dot-loading':
                    self.update({
                        show: true,
                        current: 'dotLoading'
                    })
                    break
                case 'ballflex-loading':
                    self.update({
                        show: true,
                        current: 'ballFlexLoading'
                    })
                    break
                case 'balllight-loading':
                    self.update({
                        show: true,
                        current: 'ballLightLoading'
                    })
                    break
                case 'line-loading':
                    self.update({
                        show: true,
                        current: 'lineLoading'
                    })
                    break
                case 'lineboth-loading':
                    self.update({
                        show: true,
                        current: 'lineBothLoading'
                    })
                    break
                case 'prog-loading':
                    self.update({
                        show: true,
                        current: 'progLoading'
                    })
                    break
                case 'geer-loading':
                    self.update({
                        show: true,
                        current: 'geerLoading'
                    })
                    break
                case 'ballhide-loading':
                    self.update({
                        show: true,
                        current: 'ballHideLoading'
                    })
                    break
                case 'ballcollide-loading':
                    self.update({
                        show: true,
                        current: 'ballCollideLoading'
                    })
                    break
                case 'rollgradient-loading':
                    self.update({
                        show: true,
                        current: 'rollGradientLoading'
                    })
                    break
                case 'rolllack-loading':
                    self.update({
                        show: true,
                        current: 'rollLackLoading'
                    })
                    break
                case 'rollelongate-loading':
                    self.update({
                        show: true,
                        current: 'rollElongateLoading'
                    })
                    break
                case 'heartbeat-loading':
                    self.update({
                        show: true,
                        current: 'heartBeatLoading'
                    })
                    break
                case 'flip-loading':
                    self.update({
                        show: true,
                        current: 'flipLoading'
                    })
                    break
                case 'flipcube-loading':
                    self.update({
                        show: true,
                        current: 'flipCubeLoading'
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
            opacity: .2;
            z-index: 200;
        }
        .unol {
            background: initial;
        }
        .bgw {
            background-color: white;
        }
        .wrap {
            position: absolute;
            display: block;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);

            width: 5rem;
            height: 5rem;
            text-align: center;
            border-radius: .8rem;
            z-index: 201;
        }


        .fs-ball-holder {
            position: absolute;
            width: 1rem;
            height: 4rem;
            left: 2rem;
        }
        .fs-ball-a, .fs-ball-b, .fs-ball-c, .fs-ball-d, .fs-ball-e {
            position: absolute;
            border-radius: 50%;
            background: #3d77e0;
        }
        .fs-ball-a {
            top: -.75rem;
            left: -.3rem;
            width: .7rem;
            height: .7rem;
        }
        .fs-ball-b {
            top: -.65rem;
            left: -.2rem;
            width: .6rem;
            height: .6rem;
        }
        .fs-ball-c {
            top: -.55rem;
            left: -.1rem;
            width: .5rem;
            height: .5rem;
        }
        .fs-ball-d {
            top: -.45rem;
            left: 0rem;
            width: .4rem;
            height: .4rem;
        }
        .fs-ball-e {
            top: -.35rem;
            left: .1rem;
            width: .3rem;
            height: .3rem;
        }
        .fs-ball-1 {
            animation: fs-ball-loading 1.5s .1s ease infinite;
        }
        .fs-ball-2 {
            animation: fs-ball-loading 1.5s .2s ease infinite;
        }
        .fs-ball-3 {
            animation: fs-ball-loading 1.5s .28s ease infinite;
        }
        .fs-ball-4 {
            animation: fs-ball-loading 1.5s .36s ease infinite;
        }
        .fs-ball-5 {
            animation: fs-ball-loading 1.5s .4s ease infinite;
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
            border: .25rem solid #3d77e0;
            border-radius: 100%;
        }
        .fs-rbball-holder {
            position: absolute;
            width: 1rem;
            height: 4rem;
            left: 1.75rem;
            top: .25rem;
        }
        .fs-rbball {
            position: absolute;
            top: -.9rem;
            left: -.3rem;
            width: 1rem;
            height: 1rem;
            border-radius: 50%;
            background: #f0ffff;
        }
        .fs-ringball-1 {
            animation: fs-ringball-loading 1.5s cubic-bezier(.5, .5, .5, .5) infinite;
        }
        @keyframes fs-ringball-loading {
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
            animation: fs-ring-loading 1.5s linear infinite;
        }
        @keyframes fs-ring-loading {
            100% {
                transform: rotate(360deg);
            }
        }


        .linego-wrap {
            width: 80%;
            height: 5rem;
            text-align: initial;
        }
        .linego-wrap span {
            display: inline-block;
            opacity: 0;
            width: .7rem;
            height: .7rem;
            border-radius: 50%;
            background-color: #ffffff;
            animation: fs-linego-load 2s infinite;
        }
        .linego-wrap span:nth-child(1) { animation-delay: .8s; }
        .linego-wrap span:nth-child(2) { animation-delay: .65s; }
        .linego-wrap span:nth-child(3) { animation-delay: .5s; }
        .linego-wrap span:nth-child(4) { animation-delay: .35s; }
        .linego-wrap span:nth-child(5) { animation-delay: .2s; }
        @keyframes fs-linego-load {
            50% {
                transform: translateX(11rem);
                opacity: 1;
            }
            100% {
                transform: translateX(21rem);
                opacity: 0;
            }
        }



        .fs-ring {
            position: relative;
            top: 2rem;
            margin: 0 auto;

            width: .5rem;
            height: .5rem;
            padding: 1.5rem;
            border: .3rem solid #3d77e0;
            border-right: .25rem dotted #3d77e0;
            border-radius: 50%;
        }
        .fs-ring-1 {
            animation: fs-ringdot-load 1s linear 0s infinite;
        }
        @keyframes fs-ringdot-load {
            100% {
                transform: rotate(360deg);
            }
        }



        .dot-wrap {
            width: 10rem;
            height: 5rem;
        }
        .dot-wrap span {
            display: inline-block;
            width: .2rem;
            height: .2rem;
            opacity: .2;
            margin-right: .5rem;
            border-radius: 50%;
            background-color: #ffffff;
            animation: fs-dot-load 1s ease infinite;
        }
        .dot-wrap span:nth-child(1){ animation-delay: 0.13s; }
        .dot-wrap span:nth-child(2){ animation-delay: 0.26s; }
        .dot-wrap span:nth-child(3){ animation-delay: 0.39s; }
        .dot-wrap span:nth-child(4){ animation-delay: 0.52s; }
        .dot-wrap span:nth-child(5){ animation-delay: 0.65s; margin-right: 0; }
        @keyframes fs-dot-load {
            30% {
                opacity: 1;
                transform: scale(2.5);
            }
            100% {
                opacity: .2;
                transform: scale(1);
            }
        }


        .ball-flex-wrap {
            width: 5rem;
            height: 5rem;
            text-align: left;
        }
        .ball-flex-wrap span {
            position: absolute;
            left: 0;
            width: .5rem;
            height: .5rem;
            border-radius: 50%;
            background-color: #ffffff;
            animation: fs-ballflex-load 1s ease-in-out infinite alternate;
        }
        .ball-flex-wrap span:nth-child(1){ animation-delay: 0.13s; }
        .ball-flex-wrap span:nth-child(2){ animation-delay: 0.26s; }
        .ball-flex-wrap span:nth-child(3){ animation-delay: 0.39s; }
        .ball-flex-wrap span:nth-child(4){ animation-delay: 0.52s; }
        .ball-flex-wrap span:nth-child(5){ animation-delay: 0.65s; }
        @keyframes fs-ballflex-load {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(5rem);
            }
        }


        .ball-light-wrap span {
            display: inline-block;
            width: .5rem;
            height: .5rem;
            border-radius: 50%;
            margin-right: .5rem;
            background-color: #ffffff;
            animation: fs-balllight-load 6s cubic-bezier(1,0,1,-.2) infinite;
        }
        .ball-light-wrap span:nth-child(1){ animation-delay: .5s; }
        .ball-light-wrap span:nth-child(2){ animation-delay: 1s; }
        .ball-light-wrap span:nth-child(3){ animation-delay: 1.5s; }
        .ball-light-wrap span:nth-child(4){ animation-delay: 2s; }
        .ball-light-wrap span:nth-child(5){ animation-delay: 2.5s; margin-right: 0; }
        @keyframes fs-balllight-load {
            0% {
                background-color: #3d77e0;
            }
            50% {
                background-color: #ffffff;
            }
        }


        .line-wrap {
            /* height = span.height + keyframes.margin-top ;可以保持底部不抖动 */
            height: 3rem;
        }
        .line-wrap span {
            display: inline-block;
            margin-top: 2.5rem;
            width: .5rem;
            height: 1rem;
            margin-top: 2rem;
            border-radius: .25rem;
            margin-right: .3rem;
            background-color: #ffffff;
            animation: fs-line-load 1s linear infinite;
        }
        .line-wrap span:nth-child(2){ animation-delay: .2s }
        .line-wrap span:nth-child(3){ animation-delay: .4s }
        .line-wrap span:nth-child(4){ animation-delay: .6s }
        .line-wrap span:nth-child(5){ animation-delay: .8s; margin-right: 0; }
        @keyframes fs-line-load {
            50% {
                height: 2rem;
                margin-top: 1rem;
                background-color: #3d77e0;
            }
            100% {
                height: 1rem;
                margin-top: 2rem;
                background-color: #ffffff;
            }
        }



        .lineboth-wrap span {
            display: inline-block;
            width: .5rem;
            height: 1.5rem;
            margin-right: .3rem;
            background-color: #3d77e0;
            animation: fs-lineboth-load 1s ease-in-out infinite;
        }
        .lineboth-wrap span:nth-child(2) { animation-delay: .1s; }
        .lineboth-wrap span:nth-child(3) { animation-delay: .2s; }
        .lineboth-wrap span:nth-child(4) { animation-delay: .3s; }
        .lineboth-wrap span:nth-child(5) { animation-delay: .4s; margin-right: 0; }
        @keyframes fs-lineboth-load {
            25% {
                transform: scaleY(2.5);
                background-color: antiquewhite;
            }
            50% {
                transform: scaleY(1);
                background-color: #3d77e0;
            }
        }




        .prog-wrap {
            width: 7rem;
            height: .5rem;
            border-radius: .25rem;
            background-color: white;
            overflow: hidden;
        }
        .prog-wrap span {
            display: block;
            width: 3rem;
            height: .5rem;
            border-radius: .25rem;
            background-color: #3d77e0;
            animation: fs-prog-load 1s ease infinite;
        }
        @keyframes fs-prog-load {
            0% {
                transform: translateX(-3rem);
            }
            50% {
                transform: translateX(1rem);
            }
            100% {
                transform: translateX(7rem);
            }
        }


        .geer-wrap span {
            display: inline-block;
            width: 1rem;
            height: .5rem;
            border-top-left-radius: .25rem;
            border-bottom-left-radius: .25rem;
            background-color: #ffffff;
            position: absolute;
            animation: fs-geer-load 1.04s linear infinite;
        }
        .geer-wrap span:nth-child(1) {
            left: 0;
            top: 50%;
            animation-delay: .13s;

        }
        .geer-wrap span:nth-child(2) {
            left: 10%;
            top: 20%;
            transform: rotate(45deg);
            animation-delay: .26s;
        }
        .geer-wrap span:nth-child(3) {
            left: 40%;
            top: 10%;
            transform: rotate(90deg);
            animation-delay: .39s;
        }
        .geer-wrap span:nth-child(4) {
            right: 10%;
            top: 20%;
            transform: rotate(135deg);
            animation-delay: .52s;
        }
        .geer-wrap span:nth-child(5) {
            right: 0;
            top: 50%;
            transform: rotate(180deg);
            animation-delay: .65s;
        }
        .geer-wrap span:nth-child(6) {
            right: 10%;
            bottom: 10%;
            transform: rotate(225deg);
            animation-delay: .78s;
        }
        .geer-wrap span:nth-child(7) {
            left: 40%;
            bottom: 0;
            transform: rotate(270deg);
            animation-delay: .91s;
        }
        .geer-wrap span:nth-child(8) {
            left: 10%;
            bottom: 10%;
            transform: rotate(315deg);
            animation-delay: 1.04s;
        }
        @keyframes fs-geer-load {
            0% {
                background-color: #3d77e0;
            }
            100% {
                background-color: #ffffff;
            }
        }



        .bh-holder {
            position: absolute;
            left: 50%;
            width: .5rem;
            height: 5rem;
            opacity: 0;
            animation: fs-ballhide-load 2s linear infinite;
        }
        .ballhide-wrap div:nth-of-type(1) { animation-delay: .13s; }
        .ballhide-wrap div:nth-of-type(2) { animation-delay: .26s; }
        .ballhide-wrap div:nth-of-type(3) { animation-delay: .39s; }
        .ballhide-wrap div:nth-of-type(4) { animation-delay: .52s; }
        .ballhide-wrap div:nth-of-type(5) { animation-delay: .65s; }

        .bh-holder span{
            position: absolute;
            bottom: 0;
            width: .5rem;
            height: .5rem;
            border-radius: 50%;
            background-color: #3d77e0;
            /*animation: fs-ballhide-ball-load 2s linear infinite;*/
        }
        @keyframes fs-ballhide-load {
            0% {
                opacity: 1;
                transform: rotate(0);
            }
            50% {
                opacity: 1;
                transform: rotate(360deg);
            }
            50.1% {
                opacity: 0;
            }
            100% {
                opacity: 0;
                transform: rotate(360deg);
            }
        }
        @keyframes fs-ballhide-ball-load {
            0% {
                background-color: #3d77e0;
            }
            100% {
                background-color: lightblue;
            }
        }


        .ballcollide-wrap span {
            display: inline-block;
            width: 1rem;
            height: 1rem;
            border-radius: 50%;
            background-color: #3d77e0;
        }
        .ballcollide-wrap span:nth-child(1) {
            background-color: lightcoral;
            animation: fs-ballcolide-load-1 1s ease-in infinite;
        }
        .ballcollide-wrap span:nth-child(2) {
            background-color: lightcoral;
            animation: fs-ballcolide-load-2 1s ease-in infinite;
        }
        @keyframes fs-ballcolide-load-1 {
            0% {
                transform: translateX(0rem);
                background-color: lightyellow;
            }
            25% {
                transform: translateX(-4rem);
                background-color: lightcoral;
            }
            50% {
              transform: translateX(0rem);
              background-color: lightgreen;
            }
            100% {
              transform: translateX(0rem);
              background-color: lightgreen;
            }
        }
        @keyframes fs-ballcolide-load-2 {
            0% {
                transform: translateX(0);
                background-color: #3d77e0;
            }
            50% {
                transform: translateX(0);
                background-color: #3d77e0;
            }
            50.1% {
                transform: translateX(0);
                background-color: lightcyan;
            }
            75% {
                transform: translateX(4rem);
                background-color: lightseagreen;
            }
            100% {
                transform: translateX(0rem);
                background-color: lightseagreen;
            }
        }



        .rollgradient-wrap span{
            display: block;
            width: 5rem;
            height: 5rem;
            text-indent: -9999em;
            border-radius: 50%;
            background-color: #ffffff;
            /*linear-gradient有hack，注意适配*/
            background: -moz-linear-gradient(left, #ffffff 10%, rgba(255, 255, 255, 0) 42%);
            background: -webkit-linear-gradient(left, #ffffff 10%, rgba(255, 255, 255, 0) 41%);
            background: -o-linear-gradient(left, #ffffff 10%, rgba(255, 255, 255, 0) 42%);
            background: -ms-linear-gradient(left, #ffffff 10%, rgba(255, 255, 255, 0) 42%);
            background: linear-gradient(to right, #ffffff 10%, rgba(255, 255, 255, 0) 42%);
            animation: fs-rollgradient-load 1.4s infinite linear;
            -webkit-animation: fs-rollgradient-load 1.4s infinite linear;
            -webkit-transform: translateZ(0);
            -ms-transform: translateZ(0);
            transform: translateZ(0);
        }
        /*最底层*/
        .rollgradient-wrap span:before {
            width: 50%;
            height: 50%;
            background-color: #ffffff;
            border-radius: 100% 0 0 0;
            position: absolute;
            top: 0;
            left: 0;
            content: ''
        }
        /*最上层*/
        .rollgradient-wrap span:after {
            background-color: #c3c3c3;
            width: 75%;
            height: 75%;
            border-radius: 50%;
            content: '';
            margin: auto;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
        }
        @keyframes fs-rollgradient-load {
          0% {
              -webkit-transform: rotate(0deg);
              transform: rotate(0deg);
          }
          100% {
              -webkit-transform: rotate(360deg);
              transform: rotate(360deg);
          }
        }



        .rolllack-wrap span {
            display: block;
            width: 5rem;
            height: 5rem;
            border-radius: 50%;
            border-left: .5rem solid rgba(255,255,255,0.2);
            border-top: .5rem solid rgba(255,255,255,0.2);
            border-right: .5rem solid rgba(255,255,255,0.2);
            border-bottom: .5rem solid rgba(255,255,255,1);
            animation: fs-rolllack-load 1s linear infinite;
        }
        @keyframes fs-rolllack-load {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }



        .rollelongate-wrap span {
            display: block;
            width: 5rem;
            height: 5rem;
            border-radius: 50%;
            border: .5rem solid #ffffff;
            animation: fs-rollelongate-parent-load 8s linear infinite;
        }
        .rollelongate-wrap span:before {
            width: 3rem;
            height: 5.5rem;
            border-radius: 5rem 0 0 5rem;
            background-color: #c3c3c3;
            position: absolute;
            /*top: -.3rem;*/   /*如果.rollelongate-wrap span的animation不开用这个*/
            top: -.8rem;
            left: -.9rem;
            content: '';
            transform-origin: right center;
            -webkit-transform-origin: right center;
            transform: rotate(30deg);
            animation: fs-rollelongate-load 1.6s ease-in-out infinite;
            -webkit-animation: fs-rollelongate-load 1.6s ease-in-out infinite;
        }
        .rollelongate-wrap span:after {
            width: 3rem;
            height: 5.5rem;
            border-radius: 0 5rem 5rem 0;
            background-color: #c3c3c3;
            position: absolute;
            /*top: -.2rem;*/   /*如果.rollelongate-wrap span的animation不开用这个*/
            top: -.8rem;
            content: '';
            transform-origin: left center;
            -webkit-transform-origin: left center;
            animation: fs-rollelongate-load 1.6s .2s ease-in-out infinite;
            -webkit-animation: fs-rollelongate-load 1.6s .5s ease-in-out infinite;
        }
        @keyframes fs-rollelongate-load {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        @keyframes fs-rollelongate-parent-load {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            10% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            20% {
                -webkit-transform: rotate(72deg);
                transform: rotate(72deg);
            }
            30% {
                -webkit-transform: rotate(72deg);
                transform: rotate(72deg);
            }
            40% {
                -webkit-transform: rotate(144deg);
                transform: rotate(144deg);
            }
            50% {
                -webkit-transform: rotate(144deg);
                transform: rotate(144deg);
            }
            60% {
                -webkit-transform: rotate(216deg);
                transform: rotate(216deg);
            }
            70% {
                -webkit-transform: rotate(216deg);
                transform: rotate(216deg);
            }
            80% {
                -webkit-transform: rotate(288deg);
                transform: rotate(288deg);
            }
            90% {
                -webkit-transform: rotate(288deg);
                transform: rotate(288deg);
            }
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }



        .heartbeat-wrap span {
            display: block;
            width: 3rem;
            height: 3rem;
            border-radius: 50%;
            margin: 0 auto;
            background-color: whitesmoke;
            animation: fs-heartbeat-load 1s ease-in-out infinite;
        }
        .heartbeat-wrap span:after {
            position: absolute;
            top: 1rem;
            left: 1rem;
            width: 1rem;
            height: 1rem;
            border-radius: 50%;
            content: '';  /*必须要写*/
            background-color: #fad7ed;
            animation: fs-heartbeat-after-load 1s ease-in-out infinite;
        }
        @keyframes fs-heartbeat-load {
            25% {
                transform: scale(1.5);
            }
            35% {
                transform: scale(1.3);
            }
            40% {
                transform: scale(1.5);
            }
            50% {
                transform: scale(1);
            }
        }
        @keyframes fs-heartbeat-after-load {
            40% {
                opacity: 0;
                transform: scale(4.5);
            }
        }



        .flip-wrap span {
            display: block;
            width: 4rem;
            height: 4rem;
            border-radius: .4rem;
            background-color: #3d77e0;
            animation: fs-flip-load 2s ease-in-out infinite;
        }
        @keyframes fs-flip-load {
            25% {
                /*perspective 元素距离视图的距离*/
                background-color: aquamarine;
                transform: perspective(8rem) rotateX(-180deg) rotateY(0deg);
            }
            50% {
                background-color: bisque;
                transform: perspective(8rem) rotateX(-180deg) rotateY(-180deg);
            }
            75% {
                background-color: burlywood;
                transform: perspective(8rem) rotateX(0deg) rotateY(-180deg);
            }
            100% {
                background-color: #3d77e0;
                transform: perspective(8rem) rotateX(0deg) rotateY(-360deg);
            }
        }


        .flipcube-wrap {
            top: 45%;
            left: 39%;
            transform: rotateZ(45deg);
        }
        .flipcube-wrap span {
            display: inline-block;
            position: relative;
            width: 50%;
            height: 50%;
            transform: scale(1.1);
        }
        .flipcube-wrap span:nth-child(2) { transform: scale(1.1) rotateZ(90deg); }
        .flipcube-wrap span:nth-child(3) { transform: scale(1.1) rotateZ(270deg); }
        .flipcube-wrap span:nth-child(4) { transform: scale(1.1) rotateZ(180deg); }
        .flipcube-wrap span:before {
            position: absolute;
            content: '';
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #3d77e0;
            transform-origin: 100% 100%;
            -webkit-transform-origin: 100% 100%;
            animation: fs-flipcube-load 2.4s linear infinite both;
            -webkit-animation: fs-flipcube-load 2.4s linear infinite both;
        }
        .flipcube-wrap span:nth-child(2):before { animation-delay: 0.3s; -webkit-animation-delay: 0.3s; }
        .flipcube-wrap span:nth-child(4):before { animation-delay: 0.6s; -webkit-animation-delay: 0.6s; }
        .flipcube-wrap span:nth-child(3):before { animation-delay: 0.9s; -webkit-animation-delay: 0.9s; }
        @-webkit-keyframes fs-flipcube-load {
            0%, 10% {
                -webkit-transform: perspective(140px) rotateX(-180deg);
                transform: perspective(140px) rotateX(-180deg);
                opacity: 0;
            }
            25%, 75% {
                -webkit-transform:perspective(140px) rotateX(0deg);
                transform:perspective(140px) rotateX(0deg);
                opacity:1;
            }
            90%, 100% {
                -webkit-transform:perspective(140px) rotateY(180deg);
                transform:perspective(140px) rotateY(180deg);
                opacity:0
            }
        }
    </style>
</t-load>
