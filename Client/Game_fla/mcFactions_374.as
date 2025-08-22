// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//Game_fla.mcFactions_374

package Game_fla
{
    import flash.display.MovieClip;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.net.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.ui.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.xml.*;

    public dynamic class mcFactions_374 extends MovieClip 
    {

        public var fList:MovieClip;
        public var aMask:MovieClip;
        public var bMask:MovieClip;
        public var bg:MovieClip;
        public var scr:MovieClip;

        public function mcFactions_374()
        {
            addFrameScript(4, frame5, 9, frame10, 17, frame18);
        }

        internal function frame5():*
        {
            stop();
        }

        internal function frame10():*
        {
            MovieClip(parent).showFactionList();
        }

        internal function frame18():*
        {
            stop();
        }


    }
}//package Game_fla

