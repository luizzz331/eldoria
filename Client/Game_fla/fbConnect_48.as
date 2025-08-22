// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//Game_fla.fbConnect_48

package Game_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;

    public dynamic class fbConnect_48 extends MovieClip 
    {

        public var btnFBLink:SimpleButton;
        public var strPassword:TextField;
        public var strUsername:TextField;
        public var btnClose:SimpleButton;
        public var frame:MovieClip;
        public var btnFBCreate:SimpleButton;

        public function fbConnect_48()
        {
            addFrameScript(0, frame1);
        }

        internal function frame1():*
        {
            this.visible = false;
        }


    }
}//package Game_fla

