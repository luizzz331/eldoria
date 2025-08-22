// AQW - PRIME
// Client By AE
// Edited by g14k
// Long Live the Biladerios

//CharacterList

package 
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;

    public dynamic class CharacterList extends MovieClip 
    {

        public var rootClass:MovieClip = MovieClip(stage.getChildAt(0));
        public var mcCharacterList0:MovieClip;
        public var mcCharacterList1:MovieClip;
		public var List:MovieClip;
		public var mcStatistics:MovieClip;
		public var mcSelectMSG:MovieClip;
        public var btnConfirm:SimpleButton;
        public var btnLogout:SimpleButton;
		public var txtName:TextField;
		public var txtCharacter:TextField;
		public var txtJob:TextField;
		public var txtGuild:TextField;
		public var txtLevel:TextField;
		public var pMC:AvatarMC2;

        public function CharacterList()
        {
            addFrameScript(0, frame1);
        }

        internal function frame1():*
        {
			rootClass.loadTitle();
            rootClass.initSelect();
            btnLogout.removeEventListener(MouseEvent.CLICK, rootClass.onClick);
            btnLogout.addEventListener(MouseEvent.CLICK, rootClass.onClick, false, 0, true);
			mcStatistics.btnConfirm.removeEventListener(MouseEvent.CLICK, rootClass.onClick);
			mcStatistics.btnConfirm.addEventListener(MouseEvent.CLICK, rootClass.onClick, false, 0, true);
			mcStatistics.txtName.mouseEnabled = false;
			mcStatistics.txtCharacter.mouseEnabled = false;
			mcStatistics.txtJob.mouseEnabled = false;
			mcStatistics.txtGuild.mouseEnabled = false;
			mcStatistics.txtLevel.mouseEnabled = false;
            stop();
        }

    }
}