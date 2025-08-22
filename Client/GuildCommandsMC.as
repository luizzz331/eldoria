package
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;

    public dynamic class GuildCommandsMC extends MovieClip 
    {
		
		public var rootClass:MovieClip;
        public var btnMember:SimpleButton;
        public var btnOfficer:SimpleButton;
        public var btnLeader:SimpleButton;
		public var btnClose:SimpleButton;

        public function GuildCommandsMC()
        {
            addFrameScript(0, frame1, 1, frame2, 2, frame3);
            (rootClass = MovieClip(Game.root));
            super();
        }

        internal function frame1():*
        {
            initButtons();
            stop();
        }

        internal function frame2():*
        {
            initButtons();
            stop();
        }

        internal function frame3():*
        {
            initButtons();
            stop();
        }

        public function initButtons():*
        {
			btnClose.addEventListener(MouseEvent.CLICK, onMouseEventClick);
            btnMember.addEventListener(MouseEvent.CLICK, onMouseEventClick);
            btnOfficer.addEventListener(MouseEvent.CLICK, onMouseEventClick);
            btnLeader.addEventListener(MouseEvent.CLICK, onMouseEventClick);
        }

        public function onMouseEventClick(_arg_1:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
            switch (_arg_1.currentTarget.name)
            {
				case "btnClose":
					this.visible = false;
				break;
                case "btnMember":
                    gotoAndStop(1);
                    return;
                case "btnOfficer":
                    gotoAndStop(2);
                    return;
                case "btnLeader":
                    gotoAndStop(3);
                    return;
            };
        }


    }
}