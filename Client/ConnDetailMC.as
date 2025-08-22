// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//ConnDetailMC

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import flash.utils.Timer;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import flash.events.Event;

    public class ConnDetailMC extends MovieClip 
    {

        public var mcPct:TextField;
        public var txtBack:TextField;
        public var mcSpinner:MovieClip;
        public var txtDetail:TextField;
        public var mcSpinner2:MovieClip;
        public var btnBack:SimpleButton;
        private var timerConnDetail:Timer = new Timer(10000, 1);
        public var rootClass:MovieClip;
        private var minutes:int;
        private var countDownTimer:Timer;
        private var firstJoin:Boolean = false;
        private var doLink:Boolean = false;

        public function ConnDetailMC(_arg_1:MovieClip)
        {
            rootClass = _arg_1;
            txtBack.mouseEnabled = false;
            mcPct.visible = false;
            btnBack.addEventListener(MouseEvent.CLICK, onBackClick, false, 0, true);
            timerConnDetail.removeEventListener(TimerEvent.TIMER, showBackButton);
            timerConnDetail.addEventListener(TimerEvent.TIMER, showBackButton, false, 0, true);
        }

        internal function onBackClick(_arg_1:MouseEvent=null):void
        {
            rootClass.logout();
            if (doLink)
            {
                navigateToURL(new URLRequest("http://www.aq.com/help/aw-accounts-locked.asp"), "_blank");
                doLink = false;
            };
            hideConn();
        }

        public function showConn(_arg_1:String, _arg_2:Boolean=false):void
        {
            btnBack.visible = false;
            txtBack.visible = false;
            txtBack.text = "Cancel";
            txtDetail.text = _arg_1;
            firstJoin = _arg_2;
            if (stage == null)
            {
                rootClass.addChild(this);
            };
            if (!timerConnDetail.running)
            {
                timerConnDetail.reset();
                timerConnDetail.start();
            };
        }

        public function showDisconnect(_arg_1:String):void
        {
            btnBack.visible = true;
            txtBack.visible = true;
            txtBack.text = "Back";
            txtDetail.text = _arg_1;
            mcSpinner.visible = false;
            mcPct.visible = false;
            if (stage == null)
            {
                rootClass.addChild(this);
            };
            if (timerConnDetail.running)
            {
                timerConnDetail.stop();
            };
        }

        public function showBackButton(_arg_1:TimerEvent=null):void
        {
            btnBack.visible = true;
            txtBack.visible = true;
        }

        public function showError(_arg_1:String):void
        {
            if (stage == null)
            {
                rootClass.addChild(this);
            };
            if (((_arg_1.indexOf("banned") > -1) || (_arg_1.indexOf("disabled") > -1)))
            {
                doLink = true;
            };
            txtDetail.htmlText = _arg_1;
            if (firstJoin)
            {
                txtBack.text = "Try Again";
            }
            else
            {
                if (doLink)
                {
                    txtBack.text = "Contact Us";
                }
                else
                {
                    txtBack.text = "Back";
                };
            };
            showBackButton();
        }

        public function hideConn():void
        {
            if (stage != null)
            {
                rootClass.removeChild(this);
            };
        }

        public function showCountDown(_arg_1:int):void
        {
            countDownTimer = new Timer(60000, 1);
            minutes = _arg_1;
            this.addEventListener(Event.REMOVED_FROM_STAGE, onRemove, false, 0, true);
            countDownTimer.addEventListener(TimerEvent.TIMER, onCountdown, false, 0, true);
            countDownTimer.start();
        }

        private function onRemove(_arg_1:Event):void
        {
            countDownTimer.removeEventListener(TimerEvent.TIMER, onCountdown);
        }

        private function onCountdown(_arg_1:TimerEvent):void
        {
            minutes--;
            countDownTimer.stop();
            if (minutes > 0)
            {
                countDownTimer.reset();
                countDownTimer.start();
            }
            else
            {
                countDownTimer.removeEventListener(TimerEvent.TIMER, onCountdown);
            };
        }


    }
}//package 

