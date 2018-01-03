<t-main>
    <div class="center pos-abs" riot-style="{moveA}">
        <div if="{showA}" class="main-content" ref="tagSlotA"></div>
    </div>
    <div class="center pos-abs" riot-style="{moveB}">
        <div if="{showB}" class="main-content" ref="tagSlotB"></div>
    </div>
    <script>
        var self = this
        self.switching = false
        self.cSlot = 'tagSlotA'
        self.cPage = ''
        self.pages = []
        self.showA = false
        self.showB = false
        self.moveA = {
            'left': '0rem'
        }
        self.moveB = {
            'left': width
        }
        self.on('mount', function() {
            if (APP.data.online) {
                return self.mainMsgBus.trigger('go', 'intro')
            } else {
                APP.error = LANG.neterr
                return self.mainMsgBus.trigger('go', 'error')
            }
        })

        self.on('unmount', function() {
            self.mainMsgBus.off('back')
            self.mainMsgBus.off('go')
        })
        self.mainMsgBus.on('back', function() {
            if (self.switching) {
                return
            }
            if (self.pages.length > 0) {
                return self.mainMsgBus.trigger('go', self.pages.pop(), true)
            }
        })
        self.mainMsgBus.on('go', function(ref, noPush) {
            if (self.switching) {
                return
            }
            if (ref == self.pages[self.pages.length - 1]) {
                console.log('trigger back')
                return self.mainMsgBus.trigger('back')
            }
            self.switching = true
            var setTag = function(tagName) {
                var cSlotIsA = self.cSlot === 'tagSlotA'
                self.update({
                    showA: true,
                    showB: true,
                    moveA: {
                        'left': cSlotIsA ? '0rem' : noPush ? '-' + width : width
                    },
                    moveB: {
                        'left': !cSlotIsA ? '0rem' : noPush ? '-' + width : width
                    }
                })
                riot.mount(self.refs[cSlotIsA ? 'tagSlotB' : 'tagSlotA'], tagName)
                if (!noPush) {
                    self.move(true, self.cPage)
                    if (self.cPage) {
                        self.pages.push(self.cPage)
                    }
                } else {
                    self.move(false, self.cPage)
                }
                self.cPage = ref
            }
            switch (ref) {
                case 'intro':
                    return loadTag('tags/t-intro.tag', function() {
                        setTag('t-intro')
                    })
                case 'error':
                    return loadTag('tags/t-error.tag', function() {
                        setTag('t-error')
                    })
            }
        })
        self.move = function(moveLeft, cPage) {
            var toMNow = {
                    'left': '0rem'
                },
                toM = {
                    'left': '0rem',
                    'transition': 'left .33s',
                    '-moz-transition': 'left .33s',
                    '-webkit-transition': 'left .33s'
                },
                toL = {
                    'left': '-' + width,
                    'transition': 'left .33s',
                    '-moz-transition': 'left .33s',
                    '-webkit-transition': 'left .33s'
                },
                toR = {
                    'left': width,
                    'transition': 'left .33s',
                    '-moz-transition': 'left .33s',
                    '-webkit-transition': 'left .33s'
                },
                showSlot = self.cSlot === 'tagSlotA' ? 'tagSlotB' : 'tagSlotA'
            setTimeout(function() {
                if (showSlot === 'tagSlotB') {
                    self.update({
                        moveA: moveLeft ? toL : toR,
                        moveB: cPage ? toM : toMNow,
                        cSlot: showSlot
                    })
                } else {
                    self.update({
                        moveA: cPage ? toM : toMNow,
                        moveB: moveLeft ? toL : toR,
                        cSlot: showSlot
                    })
                }
            }, cPage ? 50 : 0);
            setTimeout(function() {
                self.update({
                    showA: self.cSlot === 'tagSlotA',
                    showB: self.cSlot === 'tagSlotB',
                    switching: false
                })
            }, cPage ? 350 : 0)
        }
    </script>
    <style>
        .pos-abs {
            position: absolute;
            width: 100%;
            height: 100%;
        }

        .main-content {
            position: relative;
            width: 100%;
            height: 100%;
        }
    </style>
</t-main>
