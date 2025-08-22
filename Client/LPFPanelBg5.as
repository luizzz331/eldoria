// AQW - PRIME
// Client By AE
// Edited by g14k
// Long Live the Biladerios

//LPFPanelBg3

package 
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;

    public dynamic class LPFPanelBg5 extends MovieClip 
    {

        public var btnClose:SimpleButton;
        public var tPane1:TextField;
		public var tPane2:TextField;
        public var tTitle:TextField;
        public var bg:MovieClip;
		public var rootClass:MovieClip = MovieClip(Game.root);
		
		public function LPFPanelBg5()
		{
			addFrameScript(0, frame1);
		}
		
		internal function frame1()
		{
			tTitle.mouseEnabled = false;
            tPane1.mouseEnabled = false;
            tPane2.mouseEnabled = false;
			stop();
		}

    }
}