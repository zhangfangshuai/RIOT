riot.tag2("t-error",'<div class="content" onclick="{popUrl}"><div class="box middle"><div class="e">{text_page_error}</div><div class="t">{text_hotLine} <a href="wtai://wp//mc;12345678901">12345678901</a></div><div class="tip">{errs}<p></p></div></div></div>','t-error .content,[data-is="t-error"] .content{ position: relative; display: block; width:100%; height:100%; } t-error .box,[data-is="t-error"] .box{ width: 100%; height: 100%; text-align: center; background-color: #f4f4f4; color: #7d7d7d; } t-error .e,[data-is="t-error"] .e{ font-size: 1.33rem } t-error .t,[data-is="t-error"] .t{ font-size: 1rem; margin-top: .75rem; } t-error .t a,[data-is="t-error"] .t a{ color: #007dff; } t-error .tip,[data-is="t-error"] .tip{ font-size: .9rem; margin-top: 2rem; } t-error .tip p,[data-is="t-error"] .tip p{ font-size: .9rem; color: red; }',"",function(r){this.text_page_error=LANG.text_page_error,this.text_hotLine=LANG.text_hotLine,this.errs=APP.error,this.popUrl=function(){popUrl()}});
riot.tag2("t-intro",'<div class="content"><div class="page-modal center middle"><p>{text_intro}</p></div><div class="foot"><div class="btn middle" onclick="{toNext}">{text_btn}</div></div></div>','t-intro .content,[data-is="t-intro"] .content{ position: relative; display: block; width:100%; height:100%; padding: 0 .67rem; } t-intro .page-modal,[data-is="t-intro"] .page-modal{ width: 100%; height: 80%; } t-intro .page-modal p,[data-is="t-intro"] .page-modal p{ font-family: \'QH\'; font-weight: 600; font-size: 1.8rem; color: #3257a9; } t-intro .foot,[data-is="t-intro"] .foot{ width: 95.55%; height: 8rem; padding: 0 1.1rem; position: absolute; bottom: 0; } t-intro .btn,[data-is="t-intro"] .btn{ width: 100%; height: 4rem; text-align: center; background-color: #3257a9; color: white; font-size: 1.4rem; border-radius: .2rem; } t-intro .btn:active,[data-is="t-intro"] .btn:active{ background-color: #06266f; }',"",function(t){var i=this,o=["ball-loading","ring-loading","ringball-loading","linego-loading","dot-loading","ballflex-loading","balllight-loading","line-loading","lineboth-loading","prog-loading","geer-loading","ballhide-loading","ballcollide-loading","rollgradient-loading","rolllack-loading","rollelongate-loading","heartbeat-loading","flip-loading","flipcube-loading"];i.text_intro=LANG.text_intro,i.text_btn=LANG.text_btn,i.toNext=function(){var t=parseInt(Math.random()*(o.length+1));i.modalMsgBus.trigger(o[t]),i.modalMsgBus.trigger("flipcube-loading")}});
riot.tag2("t-main",'<div class="center pos-abs" riot-style="{moveA}"><div if="{showA}" class="main-content" ref="tagSlotA"></div></div><div class="center pos-abs" riot-style="{moveB}"><div if="{showB}" class="main-content" ref="tagSlotB"></div></div>','t-main .pos-abs,[data-is="t-main"] .pos-abs{ position: absolute; width: 100%; height: 100%; } t-main .main-content,[data-is="t-main"] .main-content{ position: relative; width: 100%; height: 100%; }',"",function(t){var o=this;o.switching=!1,o.cSlot="tagSlotA",o.cPage="",o.pages=[],o.showA=!1,o.showB=!1,o.moveA={left:"0rem"},o.moveB={left:width},o.on("mount",function(){return APP.data.online?o.mainMsgBus.trigger("go","intro"):(APP.error=LANG.neterr,o.mainMsgBus.trigger("go","error"))}),o.on("unmount",function(){o.mainMsgBus.off("back"),o.mainMsgBus.off("go")}),o.mainMsgBus.on("back",function(){if(!o.switching)return o.pages.length>0?o.mainMsgBus.trigger("go",o.pages.pop(),!0):void 0}),o.mainMsgBus.on("go",function(t,i){if(!o.switching){if(t==o.pages[o.pages.length-1])return console.log("trigger back"),o.mainMsgBus.trigger("back");o.switching=!0;var e=function(e){var n="tagSlotA"===o.cSlot;o.update({showA:!0,showB:!0,moveA:{left:n?"0rem":i?"-"+width:width},moveB:{left:n?i?"-"+width:width:"0rem"}}),riot.mount(o.refs[n?"tagSlotB":"tagSlotA"],e),i?o.move(!1,o.cPage):(o.move(!0,o.cPage),o.cPage&&o.pages.push(o.cPage)),o.cPage=t};switch(t){case"intro":return loadTag("tags/t-intro.tag",function(){e("t-intro")});case"error":return loadTag("tags/t-error.tag",function(){e("t-error")})}}}),o.move=function(t,i){var e={left:"0rem"},n={left:"0rem",transition:"left .33s","-moz-transition":"left .33s","-webkit-transition":"left .33s"},a={left:"-"+width,transition:"left .33s","-moz-transition":"left .33s","-webkit-transition":"left .33s"},s={left:width,transition:"left .33s","-moz-transition":"left .33s","-webkit-transition":"left .33s"},r="tagSlotA"===o.cSlot?"tagSlotB":"tagSlotA";setTimeout(function(){"tagSlotB"===r?o.update({moveA:t?a:s,moveB:i?n:e,cSlot:r}):o.update({moveA:i?n:e,moveB:t?a:s,cSlot:r})},i?50:0),setTimeout(function(){o.update({showA:"tagSlotA"===o.cSlot,showB:"tagSlotB"===o.cSlot,switching:!1})},i?350:0)}});
riot.tag2("t-modal",'<div class="overlay {unol: ifol}" if="{show}"></div><div class="wrap" if="{show && current===\'ballLoading\'}"><div class="fs-ball-holder fs-ball-1"><div class="fs-ball-a"></div></div><div class="fs-ball-holder fs-ball-2"><div class="fs-ball-b"></div></div><div class="fs-ball-holder fs-ball-3"><div class="fs-ball-c"></div></div><div class="fs-ball-holder fs-ball-4"><div class="fs-ball-d"></div></div><div class="fs-ball-holder fs-ball-5"><div class="fs-ball-e"></div></div></div><div class="wrap" if="{show && current==\'ringLoading\'}"><div class="fs-ring"></div></div><div class="wrap" if="{show && current==\'ringdotLoading\'}"><div class="ring-loading"><div class="fs-ring"></div></div></div><div class="wrap" if="{show && current==\'ringballLoading\'}"><div class="fs-rbring"><div class="fs-rbball-holder fs-ringball-1"><div class="fs-rbball"></div></div></div></div><div class="wrap linego-wrap" if="{show && current==\'linegoLoading\'}"><span></span><span></span><span></span><span></span><span></span></div><div class="wrap dot-wrap" if="{show && current==\'dotLoading\'}"><span></span><span></span><span></span><span></span><span></span></div><div class="wrap ball-flex-wrap" if="{show && current==\'ballFlexLoading\'}"><span></span><span></span><span></span><span></span><span></span></div><div class="wrap ball-light-wrap" if="{show && current==\'ballLightLoading\'}"><span></span><span></span><span></span><span></span><span></span></div><div class="wrap line-wrap" if="{show && current==\'lineLoading\'}"><span></span><span></span><span></span><span></span><span></span></div><div class="wrap lineboth-wrap" if="{show && current==\'lineBothLoading\'}"><span></span><span></span><span></span><span></span><span></span></div><div class="wrap prog-wrap" if="{show && current==\'progLoading\'}"><span></span></div><div class="wrap geer-wrap" if="{show && current==\'geerLoading\'}"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></div><div class="wrap ballhide-wrap" if="{show && current==\'ballHideLoading\'}"><div class="bh-holder"><span></span></div><div class="bh-holder"><span></span></div><div class="bh-holder"><span></span></div><div class="bh-holder"><span></span></div><div class="bh-holder"><span></span></div><div class="bh-holder"><span></span></div></div><div class="wrap ballcollide-wrap" if="{show && current==\'ballCollideLoading\'}"><span></span><span></span></div><div class="wrap rollgradient-wrap" if="{show && current==\'rollGradientLoading\'}"><span></span></div><div class="wrap rolllack-wrap" if="{show && current==\'rollLackLoading\'}"><span></span></div><div class="wrap rollelongate-wrap" if="{show && current==\'rollElongateLoading\'}"><span></span></div><div class="wrap heartbeat-wrap" if="{show && current==\'heartBeatLoading\'}"><span></span></div><div class="wrap flip-wrap" if="{show && current==\'flipLoading\'}"><span></span></div><div class="wrap flipcube-wrap" if="{show && current==\'flipCubeLoading\'}"><span></span><span></span><span></span><span></span></div>','t-modal .overlay,[data-is="t-modal"] .overlay{ position: absolute; width: 100%; height: 100%; top: 0; right: 0; bottom: 0; left: 0; background-color: #353535; opacity: .2; z-index: 200; } t-modal .unol,[data-is="t-modal"] .unol{ background: initial; } t-modal .bgw,[data-is="t-modal"] .bgw{ background-color: white; } t-modal .wrap,[data-is="t-modal"] .wrap{ position: absolute; display: block; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 5rem; height: 5rem; text-align: center; border-radius: .8rem; z-index: 201; } t-modal .fs-ball-holder,[data-is="t-modal"] .fs-ball-holder{ position: absolute; width: 1rem; height: 4rem; left: 3rem; top: 1.3rem; } t-modal .fs-ball-a,[data-is="t-modal"] .fs-ball-a,t-modal .fs-ball-b,[data-is="t-modal"] .fs-ball-b,t-modal .fs-ball-c,[data-is="t-modal"] .fs-ball-c,t-modal .fs-ball-d,[data-is="t-modal"] .fs-ball-d,t-modal .fs-ball-e,[data-is="t-modal"] .fs-ball-e{ position: absolute; border-radius: 50%; background: #3d77e0; } t-modal .fs-ball-a,[data-is="t-modal"] .fs-ball-a{ top: -.75rem; left: -.3rem; width: .7rem; height: .7rem; } t-modal .fs-ball-b,[data-is="t-modal"] .fs-ball-b{ top: -.65rem; left: -.2rem; width: .6rem; height: .6rem; } t-modal .fs-ball-c,[data-is="t-modal"] .fs-ball-c{ top: -.55rem; left: -.1rem; width: .5rem; height: .5rem; } t-modal .fs-ball-d,[data-is="t-modal"] .fs-ball-d{ top: -.45rem; left: 0rem; width: .4rem; height: .4rem; } t-modal .fs-ball-e,[data-is="t-modal"] .fs-ball-e{ top: -.35rem; left: .1rem; width: .3rem; height: .3rem; } t-modal .fs-ball-1,[data-is="t-modal"] .fs-ball-1{ animation: fs-ball-loading 1.5s .1s ease infinite; } t-modal .fs-ball-2,[data-is="t-modal"] .fs-ball-2{ animation: fs-ball-loading 1.5s .2s ease infinite; } t-modal .fs-ball-3,[data-is="t-modal"] .fs-ball-3{ animation: fs-ball-loading 1.5s .28s ease infinite; } t-modal .fs-ball-4,[data-is="t-modal"] .fs-ball-4{ animation: fs-ball-loading 1.5s .36s ease infinite; } t-modal .fs-ball-5,[data-is="t-modal"] .fs-ball-5{ animation: fs-ball-loading 1.5s .4s ease infinite; } @keyframes fs-ball-loading { 100% { transform: rotate(360deg) } } t-modal .fs-rbring,[data-is="t-modal"] .fs-rbring{ position: relative; width: 5rem; height: 5rem; margin: 1rem auto; border: .25rem solid #3d77e0; border-radius: 100%; } t-modal .fs-rbball-holder,[data-is="t-modal"] .fs-rbball-holder{ position: absolute; width: 1rem; height: 4rem; left: 1.75rem; top: .25rem; } t-modal .fs-rbball,[data-is="t-modal"] .fs-rbball{ position: absolute; top: -.9rem; left: -.3rem; width: 1rem; height: 1rem; border-radius: 50%; background: #f0ffff; } t-modal .fs-ringball-1,[data-is="t-modal"] .fs-ringball-1{ animation: fs-ringball-loading 1.5s cubic-bezier(.5, .5, .5, .5) infinite; } @keyframes fs-ringball-loading { 100% { transform: rotate(360deg); } } t-modal .fs-ring,[data-is="t-modal"] .fs-ring{ width: 5rem; height: 5rem; margin: 1rem auto; border: .8rem dashed #3cacef; border-radius: 50%; animation: fs-ring-loading 1.5s linear infinite; } @keyframes fs-ring-loading { 100% { transform: rotate(360deg); } } t-modal .linego-wrap,[data-is="t-modal"] .linego-wrap{ width: 80%; height: 5rem; text-align: initial; } t-modal .linego-wrap span,[data-is="t-modal"] .linego-wrap span{ display: inline-block; opacity: 0; width: .7rem; height: .7rem; border-radius: 50%; background-color: #ffffff; animation: fs-linego-load 2s infinite; } t-modal .linego-wrap span:nth-child(1),[data-is="t-modal"] .linego-wrap span:nth-child(1){ animation-delay: .8s; } t-modal .linego-wrap span:nth-child(2),[data-is="t-modal"] .linego-wrap span:nth-child(2){ animation-delay: .65s; } t-modal .linego-wrap span:nth-child(3),[data-is="t-modal"] .linego-wrap span:nth-child(3){ animation-delay: .5s; } t-modal .linego-wrap span:nth-child(4),[data-is="t-modal"] .linego-wrap span:nth-child(4){ animation-delay: .35s; } t-modal .linego-wrap span:nth-child(5),[data-is="t-modal"] .linego-wrap span:nth-child(5){ animation-delay: .2s; } @keyframes fs-linego-load { 50% { transform: translateX(11rem); opacity: 1; } 100% { transform: translateX(21rem); opacity: 0; } } t-modal .fs-ring,[data-is="t-modal"] .fs-ring{ position: relative; top: 2rem; margin: 0 auto; width: .5rem; height: .5rem; padding: 1.5rem; border: .3rem solid #3d77e0; border-right: .25rem dotted #3d77e0; border-radius: 50%; } t-modal .fs-ring-1,[data-is="t-modal"] .fs-ring-1{ animation: fs-ringdot-load 1s linear 0s infinite; } @keyframes fs-ringdot-load { 100% { transform: rotate(360deg); } } t-modal .dot-wrap,[data-is="t-modal"] .dot-wrap{ width: 10rem; height: 5rem; } t-modal .dot-wrap span,[data-is="t-modal"] .dot-wrap span{ display: inline-block; width: .2rem; height: .2rem; opacity: .2; margin-right: .5rem; border-radius: 50%; background-color: #ffffff; animation: fs-dot-load 1s ease infinite; } t-modal .dot-wrap span:nth-child(1),[data-is="t-modal"] .dot-wrap span:nth-child(1){ animation-delay: 0.13s; } t-modal .dot-wrap span:nth-child(2),[data-is="t-modal"] .dot-wrap span:nth-child(2){ animation-delay: 0.26s; } t-modal .dot-wrap span:nth-child(3),[data-is="t-modal"] .dot-wrap span:nth-child(3){ animation-delay: 0.39s; } t-modal .dot-wrap span:nth-child(4),[data-is="t-modal"] .dot-wrap span:nth-child(4){ animation-delay: 0.52s; } t-modal .dot-wrap span:nth-child(5),[data-is="t-modal"] .dot-wrap span:nth-child(5){ animation-delay: 0.65s; margin-right: 0; } @keyframes fs-dot-load { 30% { opacity: 1; transform: scale(2.5); } 100% { opacity: .2; transform: scale(1); } } t-modal .ball-flex-wrap,[data-is="t-modal"] .ball-flex-wrap{ width: 5rem; height: 5rem; text-align: left; } t-modal .ball-flex-wrap span,[data-is="t-modal"] .ball-flex-wrap span{ position: absolute; left: 0; width: .5rem; height: .5rem; border-radius: 50%; background-color: #ffffff; animation: fs-ballflex-load 1s ease-in-out infinite alternate; } t-modal .ball-flex-wrap span:nth-child(1),[data-is="t-modal"] .ball-flex-wrap span:nth-child(1){ animation-delay: 0.13s; } t-modal .ball-flex-wrap span:nth-child(2),[data-is="t-modal"] .ball-flex-wrap span:nth-child(2){ animation-delay: 0.26s; } t-modal .ball-flex-wrap span:nth-child(3),[data-is="t-modal"] .ball-flex-wrap span:nth-child(3){ animation-delay: 0.39s; } t-modal .ball-flex-wrap span:nth-child(4),[data-is="t-modal"] .ball-flex-wrap span:nth-child(4){ animation-delay: 0.52s; } t-modal .ball-flex-wrap span:nth-child(5),[data-is="t-modal"] .ball-flex-wrap span:nth-child(5){ animation-delay: 0.65s; } @keyframes fs-ballflex-load { 0% { transform: translateX(0); } 100% { transform: translateX(5rem); } } t-modal .ball-light-wrap span,[data-is="t-modal"] .ball-light-wrap span{ display: inline-block; width: .5rem; height: .5rem; border-radius: 50%; margin-right: .5rem; background-color: #ffffff; animation: fs-balllight-load 6s cubic-bezier(1,0,1,-.2) infinite; } t-modal .ball-light-wrap span:nth-child(1),[data-is="t-modal"] .ball-light-wrap span:nth-child(1){ animation-delay: .5s; } t-modal .ball-light-wrap span:nth-child(2),[data-is="t-modal"] .ball-light-wrap span:nth-child(2){ animation-delay: 1s; } t-modal .ball-light-wrap span:nth-child(3),[data-is="t-modal"] .ball-light-wrap span:nth-child(3){ animation-delay: 1.5s; } t-modal .ball-light-wrap span:nth-child(4),[data-is="t-modal"] .ball-light-wrap span:nth-child(4){ animation-delay: 2s; } t-modal .ball-light-wrap span:nth-child(5),[data-is="t-modal"] .ball-light-wrap span:nth-child(5){ animation-delay: 2.5s; margin-right: 0; } @keyframes fs-balllight-load { 0% { background-color: #3d77e0; } 50% { background-color: #ffffff; } } t-modal .line-wrap,[data-is="t-modal"] .line-wrap{ height: 3rem; } t-modal .line-wrap span,[data-is="t-modal"] .line-wrap span{ display: inline-block; margin-top: 2.5rem; width: .5rem; height: 1rem; margin-top: 2rem; border-radius: .25rem; margin-right: .3rem; background-color: #ffffff; animation: fs-line-load 1s linear infinite; } t-modal .line-wrap span:nth-child(2),[data-is="t-modal"] .line-wrap span:nth-child(2){ animation-delay: .2s } t-modal .line-wrap span:nth-child(3),[data-is="t-modal"] .line-wrap span:nth-child(3){ animation-delay: .4s } t-modal .line-wrap span:nth-child(4),[data-is="t-modal"] .line-wrap span:nth-child(4){ animation-delay: .6s } t-modal .line-wrap span:nth-child(5),[data-is="t-modal"] .line-wrap span:nth-child(5){ animation-delay: .8s; margin-right: 0; } @keyframes fs-line-load { 50% { height: 2rem; margin-top: 1rem; background-color: #3d77e0; } 100% { height: 1rem; margin-top: 2rem; background-color: #ffffff; } } t-modal .lineboth-wrap span,[data-is="t-modal"] .lineboth-wrap span{ display: inline-block; width: .5rem; height: 1.5rem; margin-right: .3rem; background-color: #3d77e0; animation: fs-lineboth-load 1s ease-in-out infinite; } t-modal .lineboth-wrap span:nth-child(2),[data-is="t-modal"] .lineboth-wrap span:nth-child(2){ animation-delay: .1s; } t-modal .lineboth-wrap span:nth-child(3),[data-is="t-modal"] .lineboth-wrap span:nth-child(3){ animation-delay: .2s; } t-modal .lineboth-wrap span:nth-child(4),[data-is="t-modal"] .lineboth-wrap span:nth-child(4){ animation-delay: .3s; } t-modal .lineboth-wrap span:nth-child(5),[data-is="t-modal"] .lineboth-wrap span:nth-child(5){ animation-delay: .4s; margin-right: 0; } @keyframes fs-lineboth-load { 25% { transform: scaleY(2.5); background-color: antiquewhite; } 50% { transform: scaleY(1); background-color: #3d77e0; } } t-modal .prog-wrap,[data-is="t-modal"] .prog-wrap{ width: 7rem; height: .5rem; border-radius: .25rem; background-color: white; overflow: hidden; } t-modal .prog-wrap span,[data-is="t-modal"] .prog-wrap span{ display: block; width: 3rem; height: .5rem; border-radius: .25rem; background-color: #3d77e0; animation: fs-prog-load 1s ease infinite; } @keyframes fs-prog-load { 0% { transform: translateX(-3rem); } 50% { transform: translateX(1rem); } 100% { transform: translateX(7rem); } } t-modal .geer-wrap span,[data-is="t-modal"] .geer-wrap span{ display: inline-block; width: 1rem; height: .5rem; border-top-left-radius: .25rem; border-bottom-left-radius: .25rem; background-color: #ffffff; position: absolute; animation: fs-geer-load 1.04s linear infinite; } t-modal .geer-wrap span:nth-child(1),[data-is="t-modal"] .geer-wrap span:nth-child(1){ left: 0; top: 50%; animation-delay: .13s; } t-modal .geer-wrap span:nth-child(2),[data-is="t-modal"] .geer-wrap span:nth-child(2){ left: 10%; top: 20%; transform: rotate(45deg); animation-delay: .26s; } t-modal .geer-wrap span:nth-child(3),[data-is="t-modal"] .geer-wrap span:nth-child(3){ left: 40%; top: 10%; transform: rotate(90deg); animation-delay: .39s; } t-modal .geer-wrap span:nth-child(4),[data-is="t-modal"] .geer-wrap span:nth-child(4){ right: 10%; top: 20%; transform: rotate(135deg); animation-delay: .52s; } t-modal .geer-wrap span:nth-child(5),[data-is="t-modal"] .geer-wrap span:nth-child(5){ right: 0; top: 50%; transform: rotate(180deg); animation-delay: .65s; } t-modal .geer-wrap span:nth-child(6),[data-is="t-modal"] .geer-wrap span:nth-child(6){ right: 10%; bottom: 10%; transform: rotate(225deg); animation-delay: .78s; } t-modal .geer-wrap span:nth-child(7),[data-is="t-modal"] .geer-wrap span:nth-child(7){ left: 40%; bottom: 0; transform: rotate(270deg); animation-delay: .91s; } t-modal .geer-wrap span:nth-child(8),[data-is="t-modal"] .geer-wrap span:nth-child(8){ left: 10%; bottom: 10%; transform: rotate(315deg); animation-delay: 1.04s; } @keyframes fs-geer-load { 0% { background-color: #3d77e0; } 100% { background-color: #ffffff; } } t-modal .bh-holder,[data-is="t-modal"] .bh-holder{ position: absolute; left: 50%; width: .5rem; height: 5rem; opacity: 0; animation: fs-ballhide-load 2s linear infinite; } t-modal .ballhide-wrap div:nth-of-type(1),[data-is="t-modal"] .ballhide-wrap div:nth-of-type(1){ animation-delay: .13s; } t-modal .ballhide-wrap div:nth-of-type(2),[data-is="t-modal"] .ballhide-wrap div:nth-of-type(2){ animation-delay: .26s; } t-modal .ballhide-wrap div:nth-of-type(3),[data-is="t-modal"] .ballhide-wrap div:nth-of-type(3){ animation-delay: .39s; } t-modal .ballhide-wrap div:nth-of-type(4),[data-is="t-modal"] .ballhide-wrap div:nth-of-type(4){ animation-delay: .52s; } t-modal .ballhide-wrap div:nth-of-type(5),[data-is="t-modal"] .ballhide-wrap div:nth-of-type(5){ animation-delay: .65s; } t-modal .bh-holder span,[data-is="t-modal"] .bh-holder span{ position: absolute; bottom: 0; width: .5rem; height: .5rem; border-radius: 50%; background-color: #3d77e0; } @keyframes fs-ballhide-load { 0% { opacity: 1; transform: rotate(0); } 50% { opacity: 1; transform: rotate(360deg); } 50.1% { opacity: 0; } 100% { opacity: 0; transform: rotate(360deg); } } @keyframes fs-ballhide-ball-load { 0% { background-color: #3d77e0; } 100% { background-color: lightblue; } } t-modal .ballcollide-wrap span,[data-is="t-modal"] .ballcollide-wrap span{ display: inline-block; width: 1rem; height: 1rem; border-radius: 50%; background-color: #3d77e0; } t-modal .ballcollide-wrap span:nth-child(1),[data-is="t-modal"] .ballcollide-wrap span:nth-child(1){ background-color: lightcoral; animation: fs-ballcolide-load-1 1s ease-in infinite; } t-modal .ballcollide-wrap span:nth-child(2),[data-is="t-modal"] .ballcollide-wrap span:nth-child(2){ background-color: lightcoral; animation: fs-ballcolide-load-2 1s ease-in infinite; } @keyframes fs-ballcolide-load-1 { 0% { transform: translateX(0rem); background-color: lightyellow; } 25% { transform: translateX(-4rem); background-color: lightcoral; } 50% { transform: translateX(0rem); background-color: lightgreen; } 100% { transform: translateX(0rem); background-color: lightgreen; } } @keyframes fs-ballcolide-load-2 { 0% { transform: translateX(0); background-color: #3d77e0; } 50% { transform: translateX(0); background-color: #3d77e0; } 50.1% { transform: translateX(0); background-color: lightcyan; } 75% { transform: translateX(4rem); background-color: lightseagreen; } 100% { transform: translateX(0rem); background-color: lightseagreen; } } t-modal .rollgradient-wrap span,[data-is="t-modal"] .rollgradient-wrap span{ display: block; width: 5rem; height: 5rem; text-indent: -9999em; border-radius: 50%; background-color: #ffffff; background: -moz-linear-gradient(left, #ffffff 10%, rgba(255, 255, 255, 0) 42%); background: -webkit-linear-gradient(left, #ffffff 10%, rgba(255, 255, 255, 0) 41%); background: -o-linear-gradient(left, #ffffff 10%, rgba(255, 255, 255, 0) 42%); background: -ms-linear-gradient(left, #ffffff 10%, rgba(255, 255, 255, 0) 42%); background: linear-gradient(to right, #ffffff 10%, rgba(255, 255, 255, 0) 42%); animation: fs-rollgradient-load 1.4s infinite linear; -webkit-animation: fs-rollgradient-load 1.4s infinite linear; -webkit-transform: translateZ(0); -ms-transform: translateZ(0); transform: translateZ(0); } t-modal .rollgradient-wrap span:before,[data-is="t-modal"] .rollgradient-wrap span:before{ width: 50%; height: 50%; background-color: #ffffff; border-radius: 100% 0 0 0; position: absolute; top: 0; left: 0; content: \'\' } t-modal .rollgradient-wrap span:after,[data-is="t-modal"] .rollgradient-wrap span:after{ background-color: #c3c3c3; width: 75%; height: 75%; border-radius: 50%; content: \'\'; margin: auto; position: absolute; top: 0; left: 0; bottom: 0; right: 0; } @keyframes fs-rollgradient-load { 0% { -webkit-transform: rotate(0deg); transform: rotate(0deg); } 100% { -webkit-transform: rotate(360deg); transform: rotate(360deg); } } t-modal .rolllack-wrap span,[data-is="t-modal"] .rolllack-wrap span{ display: block; width: 5rem; height: 5rem; border-radius: 50%; border-left: .5rem solid rgba(255,255,255,0.2); border-top: .5rem solid rgba(255,255,255,0.2); border-right: .5rem solid rgba(255,255,255,0.2); border-bottom: .5rem solid rgba(255,255,255,1); animation: fs-rolllack-load 1s linear infinite; } @keyframes fs-rolllack-load { 100% { -webkit-transform: rotate(360deg); transform: rotate(360deg); } } t-modal .rollelongate-wrap span,[data-is="t-modal"] .rollelongate-wrap span{ display: block; width: 5rem; height: 5rem; border-radius: 50%; border: .5rem solid #ffffff; animation: fs-rollelongate-parent-load 8s linear infinite; } t-modal whitesmoke .rollelongate-wrap span:before,[data-is="t-modal"] whitesmoke .rollelongate-wrap span:before{ width: 3rem; height: 5.5rem; border-radius: 5rem 0 0 5rem; background-color: #c3c3c3; position: absolute; top: -.8rem; left: -.9rem; content: \'\'; transform-origin: right center; -webkit-transform-origin: right center; transform: rotate(30deg); animation: fs-rollelongate-load 1.6s ease-in-out infinite; -webkit-animation: fs-rollelongate-load 1.6s ease-in-out infinite; } t-modal .rollelongate-wrap span:after,[data-is="t-modal"] .rollelongate-wrap span:after{ width: 3rem; height: 5.5rem; border-radius: 0 5rem 5rem 0; background-color: #c3c3c3; position: absolute; top: -.8rem; content: \'\'; transform-origin: left center; -webkit-transform-origin: left center; animation: fs-rollelongate-load 1.6s .2s ease-in-out infinite; -webkit-animation: fs-rollelongate-load 1.6s .5s ease-in-out infinite; } @keyframes fs-rollelongate-load { 0% { -webkit-transform: rotate(0deg); transform: rotate(0deg); } 100% { -webkit-transform: rotate(360deg); transform: rotate(360deg); } } @keyframes fs-rollelongate-parent-load { 0% { -webkit-transform: rotate(0deg); transform: rotate(0deg); } 10% { -webkit-transform: rotate(0deg); transform: rotate(0deg); } 20% { -webkit-transform: rotate(72deg); transform: rotate(72deg); } 30% { -webkit-transform: rotate(72deg); transform: rotate(72deg); } 40% { -webkit-transform: rotate(144deg); transform: rotate(144deg); } 50% { -webkit-transform: rotate(144deg); transform: rotate(144deg); } 60% { -webkit-transform: rotate(216deg); transform: rotate(216deg); } 70% { -webkit-transform: rotate(216deg); transform: rotate(216deg); } 80% { -webkit-transform: rotate(288deg); transform: rotate(288deg); } 90% { -webkit-transform: rotate(288deg); transform: rotate(288deg); } 100% { -webkit-transform: rotate(360deg); transform: rotate(360deg); } } t-modal .heartbeat-wrap span,[data-is="t-modal"] .heartbeat-wrap span{ display: block; width: 3rem; height: 3rem; border-radius: 50%; margin: 0 auto; background-color: whitesmoke; animation: fs-heartbeat-load 1s ease-in-out infinite; } t-modal .heartbeat-wrap span:after,[data-is="t-modal"] .heartbeat-wrap span:after{ position: absolute; top: 1rem; left: 1rem; width: 1rem; height: 1rem; border-radius: 50%; content: \'\'; background-color: #fad7ed; animation: fs-heartbeat-after-load 1s ease-in-out infinite; } @keyframes fs-heartbeat-load { 25% { transform: scale(1.5); } 35% { transform: scale(1.3); } 40% { transform: scale(1.5); } 50% { transform: scale(1); } } @keyframes fs-heartbeat-after-load { 40% { opacity: 0; transform: scale(4.5); } } t-modal .flip-wrap span,[data-is="t-modal"] .flip-wrap span{ display: block; width: 4rem; height: 4rem; border-radius: .4rem; background-color: #3d77e0; animation: fs-flip-load 2s ease-in-out infinite; } @keyframes fs-flip-load { 25% { background-color: aquamarine; transform: perspective(8rem) rotateX(-180deg) rotateY(0deg); } 50% { background-color: bisque; transform: perspective(8rem) rotateX(-180deg) rotateY(-180deg); } 75% { background-color: burlywood; transform: perspective(8rem) rotateX(0deg) rotateY(-180deg); } 100% { background-color: #3d77e0; transform: perspective(8rem) rotateX(0deg) rotateY(-360deg); } } t-modal .flipcube-wrap,[data-is="t-modal"] .flipcube-wrap{ top: 45%; left: 39%; transform: rotateZ(45deg); } t-modal .flipcube-wrap span,[data-is="t-modal"] .flipcube-wrap span{ display: inline-block; position: relative; width: 50%; height: 50%; transform: scale(1.1); } t-modal .flipcube-wrap span:nth-child(2),[data-is="t-modal"] .flipcube-wrap span:nth-child(2){ transform: scale(1.1) rotateZ(90deg); } t-modal .flipcube-wrap span:nth-child(3),[data-is="t-modal"] .flipcube-wrap span:nth-child(3){ transform: scale(1.1) rotateZ(270deg); } t-modal .flipcube-wrap span:nth-child(4),[data-is="t-modal"] .flipcube-wrap span:nth-child(4){ transform: scale(1.1) rotateZ(180deg); } t-modal .flipcube-wrap span:before,[data-is="t-modal"] .flipcube-wrap span:before{ position: absolute; content: \'\'; top: 0; left: 0; width: 100%; height: 100%; background-color: #3d77e0; transform-origin: 100% 100%; -webkit-transform-origin: 100% 100%; animation: fs-flipcube-load 2.4s linear infinite both; -webkit-animation: fs-flipcube-load 2.4s linear infinite both; } t-modal .flipcube-wrap span:nth-child(2):before,[data-is="t-modal"] .flipcube-wrap span:nth-child(2):before{ animation-delay: 0.3s; -webkit-animation-delay: 0.3s; } t-modal .flipcube-wrap span:nth-child(4):before,[data-is="t-modal"] .flipcube-wrap span:nth-child(4):before{ animation-delay: 0.6s; -webkit-animation-delay: 0.6s; } t-modal .flipcube-wrap span:nth-child(3):before,[data-is="t-modal"] .flipcube-wrap span:nth-child(3):before{ animation-delay: 0.9s; -webkit-animation-delay: 0.9s; } @-webkit-keyframes fs-flipcube-load { 0%, 10% { -webkit-transform: perspective(140px) rotateX(-180deg); transform: perspective(140px) rotateX(-180deg); opacity: 0; } 25%, 75% { -webkit-transform:perspective(140px) rotateX(0deg); transform:perspective(140px) rotateX(0deg); opacity:1; } 90%, 100% { -webkit-transform:perspective(140px) rotateY(180deg); transform:perspective(140px) rotateY(180deg); opacity:0 } }',"",function(a){var t=this;t.show=!1,t.ifol=!1,t.on("unmount",function(){t.modalMsgBus.off("*")}),t.modalMsgBus.on("*",function(a,l){switch(a){case"close":t.update({show:!1});break;case"ringball-loading":t.update({show:!0,current:"ringballLoading"});break;case"ring-loading":t.update({show:!0,current:"ringLoading"});break;case"ball-loading":t.update({show:!0,current:"ballLoading"});break;case"linego-loading":t.update({show:!0,current:"linegoLoading"});break;case"dot-loading":t.update({show:!0,current:"dotLoading"});break;case"ballflex-loading":t.update({show:!0,current:"ballFlexLoading"});break;case"balllight-loading":t.update({show:!0,current:"ballLightLoading"});break;case"line-loading":t.update({show:!0,current:"lineLoading"});break;case"lineboth-loading":t.update({show:!0,current:"lineBothLoading"});break;case"prog-loading":t.update({show:!0,current:"progLoading"});break;case"geer-loading":t.update({show:!0,current:"geerLoading"});break;case"ballhide-loading":t.update({show:!0,current:"ballHideLoading"});break;case"ballcollide-loading":t.update({show:!0,current:"ballCollideLoading"});break;case"rollgradient-loading":t.update({show:!0,current:"rollGradientLoading"});break;case"rolllack-loading":t.update({show:!0,current:"rollLackLoading"});break;case"rollelongate-loading":t.update({show:!0,current:"rollElongateLoading"});break;case"heartbeat-loading":t.update({show:!0,current:"heartBeatLoading"});break;case"flip-loading":t.update({show:!0,current:"flipLoading"});break;case"flipcube-loading":t.update({show:!0,current:"flipCubeLoading"})}})});