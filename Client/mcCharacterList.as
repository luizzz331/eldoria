// AQW - PRIME
// Client By AE
// Edited by g14k
// Long Live the Biladerios

//mcCharacterList

package 
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;

    public dynamic class mcCharacterList extends MovieClip 
    {

        public var rootClass:MovieClip = MovieClip(stage.getChildAt(0));
        public var mcCharacterList0:MovieClip;
        public var mcCharacterList1:MovieClip;
        public var btnPlay:SimpleButton;
        public var btnLogout:SimpleButton;
        public var txtName:TextField;

        public function mcCharacterList()
        {
            addFrameScript(0, frame1);
        }

        internal function frame1():*
        {
            rootClass.initSelect();
            btnPlay.addEventListener(MouseEvent.CLICK, rootClass.onClick, false, 0, true);
            btnLogout.addEventListener(MouseEvent.CLICK, rootClass.onClick, false, 0, true);
            stop();
        }

        public function onCharacterClick(_arg_1:MouseEvent):void
        {
            var _local_2:* = _arg_1.currentTarget;
            rootClass.selectCharacter(_local_2.charindex);
            if (_local_2.txtCharacter.text != "Create a Character" && _local_2.txtCharacter.text != "Purchase Slot")
            {
                rootClass.mcLogin.selectedCharacter = _local_2.charindex;
            };
            rootClass.mixer.playSound("Click");
        }

        public function onBuySlotClick(_arg_1:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
            rootClass.MsgBox.notify("Purchase the Prime Character Slot in game to expand your character slot.");
        }


    }
}//package 

