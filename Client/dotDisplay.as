// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//dotDisplay

package 
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

    public dynamic class dotDisplay extends MovieClip 
    {

        public var t:MovieClip;
        public var hpDisplay:int;
        public var randNum:Number;

        public function dotDisplay()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 18, this.frame19, 19, this.frame20, 41, this.frame42, 42, this.frame43, 61, this.frame62, 62, this.frame63, 83, this.frame84, 84, this.frame85, 110, this.frame111, 111, this.frame112, 132, this.frame133, 133, this.frame134, 162, this.frame163, 163, this.frame164, 184, this.frame185, 185, this.frame186, 211, this.frame212, 212, this.frame213, 233, this.frame234);
        }

        public function init():void
        {
            if (this.randNum < 0)
            {
                this.randNum = Math.random();
            };
            if (this.randNum <= 0.1)
            {
                gotoAndPlay("dot1");
            }
            else
            {
                if (((this.randNum <= 0.2) && (this.randNum > 0.1)))
                {
                    gotoAndPlay("dot2");
                }
                else
                {
                    if (((this.randNum <= 0.3) && (this.randNum > 0.2)))
                    {
                        gotoAndPlay("dot3");
                    }
                    else
                    {
                        if (((this.randNum <= 0.4) && (this.randNum > 0.3)))
                        {
                            gotoAndPlay("dot4");
                        }
                        else
                        {
                            if (((this.randNum <= 0.5) && (this.randNum > 0.4)))
                            {
                                gotoAndPlay("dot5");
                            }
                            else
                            {
                                if (((this.randNum <= 0.6) && (this.randNum > 0.5)))
                                {
                                    gotoAndPlay("dot6");
                                }
                                else
                                {
                                    if (((this.randNum <= 0.7) && (this.randNum > 0.6)))
                                    {
                                        gotoAndPlay("dot7");
                                    }
                                    else
                                    {
                                        if (((this.randNum <= 0.8) && (this.randNum > 0.7)))
                                        {
                                            gotoAndPlay("dot8");
                                        }
                                        else
                                        {
                                            if (((this.randNum <= 0.9) && (this.randNum > 0.8)))
                                            {
                                                gotoAndPlay("dot9");
                                            }
                                            else
                                            {
                                                if (((this.randNum <= 1) && (this.randNum > 0.9)))
                                                {
                                                    gotoAndPlay("dot10");
                                                }
                                                else
                                                {
                                                    gotoAndPlay("dot1");
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        public function setText():void
        {
            if (this.hpDisplay > 0)
            {
                this.t.ti.textColor = 0xEE9900;
            };
            this.t.ti.text = Math.abs(this.hpDisplay);
        }

        internal function frame1():*
        {
            this.randNum = -1;
            stop();
        }

        internal function frame3():*
        {
            this.setText();
        }

        internal function frame19():*
        {
            MovieClip(parent).removeChild(this);
            stop();
        }

        internal function frame20():*
        {
            this.setText();
        }

        internal function frame42():*
        {
            MovieClip(parent).removeChild(this);
            stop();
        }

        internal function frame43():*
        {
            this.setText();
        }

        internal function frame62():*
        {
            MovieClip(parent).removeChild(this);
            stop();
        }

        internal function frame63():*
        {
            this.setText();
        }

        internal function frame84():*
        {
            MovieClip(parent).removeChild(this);
            stop();
        }

        internal function frame85():*
        {
            this.setText();
        }

        internal function frame111():*
        {
            MovieClip(parent).removeChild(this);
            stop();
        }

        internal function frame112():*
        {
            this.setText();
        }

        internal function frame133():*
        {
            MovieClip(parent).removeChild(this);
            stop();
        }

        internal function frame134():*
        {
            this.setText();
        }

        internal function frame163():*
        {
            MovieClip(parent).removeChild(this);
            stop();
        }

        internal function frame164():*
        {
            this.setText();
        }

        internal function frame185():*
        {
            MovieClip(parent).removeChild(this);
            stop();
        }

        internal function frame186():*
        {
            this.setText();
        }

        internal function frame212():*
        {
            MovieClip(parent).removeChild(this);
            stop();
        }

        internal function frame213():*
        {
            this.setText();
        }

        internal function frame234():*
        {
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 

