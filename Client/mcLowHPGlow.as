package 
{
    import flash.display.MovieClip;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.text.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.system.*;
    import flash.ui.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.accessibility.*;
    import flash.errors.*;

    public dynamic class mcLowHPGlow extends MovieClip 
    {

        public function mcLowHPGlow()
        {
            addFrameScript(0, frame1, frame10, 10, frame18, 18);
        }

        internal function frame1():*
        {
        }
		
		internal function frame10():*
        {
			stop();
        }

        internal function frame18():*
        {
            stop();
            this.visible = false;
        }
    }
}