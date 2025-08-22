// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//LPFPanelBg4

package 
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;

    public dynamic class LPFPanelBg4 extends MovieClip 
    {

        public var rootClass:MovieClip;
        public var bg:MovieClip;
        public var btnLock:SimpleButton;
        public var btnDeal:SimpleButton;
        public var btnClose:SimpleButton;
        public var tTitle:TextField;
        public var tPane1:TextField;
        public var tPane2:TextField;
        public var tPane3:TextField;
        public var txtMyGold:TextField;
        public var txtMyCoins:TextField;
        public var txtTargetGold:TextField;
        public var txtTargetCoins:TextField;
        public var txtLock:TextField;
        public var txtDeal:TextField;

        public function LPFPanelBg4()
        {
            addFrameScript(1, frame2);
            rootClass = MovieClip(Game.root);
            super();
        }

        internal function frame2():*
        {
            tTitle.mouseEnabled = false;
            tPane1.mouseEnabled = false;
            tPane2.mouseEnabled = false;
            tPane3.mouseEnabled = false;
            txtLock.mouseEnabled = false;
            txtDeal.mouseEnabled = false;
            txtLock.text = "Lock";
            txtDeal.text = "Deal";
            txtMyGold.restrict = "0-9";
            txtMyCoins.restrict = "0-9";
            btnDeal.alpha = 0.5;
            btnDeal.mouseEnabled = false;
            btnLock.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnDeal.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            rootClass.ctrlTrade = this;
            stop();
        }

        private function onClick(_arg_1:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
            switch (_arg_1.currentTarget.name)
            {
                case "btnLock":
                    if (txtLock.text == "Lock")
                    {
                        if (txtMyCoins.length == 0)
                        {
                            txtMyCoins.text = "0";
                        };
                        if (txtMyGold.length == 0)
                        {
                            txtMyGold.text = "0";
                        };
                        MovieClip(rootClass.ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"lockOffer"});
                    }
                    else
                    {
                        MovieClip(rootClass.ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"unlockOffer"});
                    };
                    return;
                case "btnDeal":
                    MovieClip(rootClass.ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"completeTrade"});
                    return;
            };
        }


    }
}//package 

