// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//Game_fla.chkBox_32

package Game_fla
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public dynamic class chkBox_32 extends MovieClip 
    {

        public var checkmark:MovieClip;
        public var bitChecked:Boolean;

        public function chkBox_32()
        {
            addFrameScript(0, frame1);
        }

        public function onClick(_arg_1:MouseEvent):*
        {
            bitChecked = (!(bitChecked));
            checkmark.visible = bitChecked;
        }

        internal function frame1():*
        {
            checkmark.mouseEnabled = false;
            checkmark.visible = bitChecked;
            this.addEventListener(MouseEvent.CLICK, onClick);
        }


    }
}//package Game_fla

