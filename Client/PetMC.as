﻿// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//PetMC

package 
{
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.geom.ColorTransform;
    import flash.utils.Timer;
    import flash.events.Event;

    public class PetMC extends MovieClip 
    {

        public var defaultmc:MovieClip;
        public var pname:MovieClip;
        public var shadow:MovieClip;
        internal var ldr:Loader = new Loader();
        internal var WORLD:MovieClip;
        internal var xDep:*;
        internal var yDep:*;
        internal var xTar:*;
        internal var yTar:Number;
        internal var ox:*;
        internal var oy:*;
        internal var px:*;
        internal var py:*;
        internal var tx:*;
        internal var ty:Number;
        internal var nDuration:*;
        internal var nXStep:*;
        internal var nYStep:Number;
        internal var cbx:*;
        internal var cby:Number;
        internal var defaultCT:ColorTransform;
        internal var iniTimer:Timer;
        public var spFX:Object;
        public var pAV:Avatar;
        public var mcChar:MovieClip;

        public function PetMC()
        {
            defaultCT = MovieClip(this).transform.colorTransform;
            spFX = {};
            super();
            pname.visible = false;
            pname.ti.text = "";
        }

        public function init():*
        {
        }

        private function linearTween(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*):Number
        {
            return (((_arg_3 * _arg_1) / _arg_4) + _arg_2);
        }

        public function walkTo(_arg_1:*, _arg_2:*, _arg_3:*):void
        {
            var _local_4:Number;
            this.xDep = this.x;
            this.yDep = this.y;
            this.xTar = _arg_1;
            this.yTar = _arg_2;
            this.nDuration = Math.round((Math.sqrt((Math.pow((xTar - this.x), 2) + Math.pow((yTar - this.y), 2))) / _arg_3));
            if (this.nDuration)
            {
                this.nXStep = 0;
                this.nYStep = 0;
                _local_4 = (this.xDep - this.xTar);
                if ((_local_4 < 0))
                {
                    this.turn("right");
                }
                else
                {
                    this.turn("left");
                };
                if (!this.mcChar.onMove)
                {
                    this.mcChar.onMove = true;
                    this.mcChar.gotoAndPlay("Walk");
                };
                this.addEventListener(Event.ENTER_FRAME, onEnterFrameWalk, false, 0, true);
            };
        }

        private function onEnterFrameWalk(_arg_1:Event):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:Boolean;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            if (((this.nXStep <= this.nDuration) || ((this.nYStep <= this.nDuration) && (this.mcChar.onMove))))
            {
                _local_2 = this.x;
                _local_3 = this.y;
                this.x = linearTween(this.nXStep, this.xDep, (this.xTar - this.xDep), this.nDuration);
                this.y = linearTween(this.nYStep, this.yDep, (this.yTar - this.yDep), this.nDuration);
                _local_4 = false;
                _local_5 = 0;
                while (_local_5 < WORLD.arrSolid.length)
                {
                    if (this.shadow.hitTestObject(WORLD.arrSolid[_local_5].shadow))
                    {
                        _local_4 = true;
                        _local_5 = WORLD.arrSolid.length;
                    };
                    _local_5++;
                };
                if (_local_4)
                {
                    _local_6 = this.y;
                    this.y = _local_3;
                    _local_4 = false;
                    _local_7 = 0;
                    while (_local_7 < WORLD.arrSolid.length)
                    {
                        if (this.shadow.hitTestObject(WORLD.arrSolid[_local_7].shadow))
                        {
                            this.y = _local_6;
                            _local_4 = true;
                            break;
                        };
                        _local_7++;
                    };
                    if (_local_4)
                    {
                        this.x = _local_2;
                        _local_4 = false;
                        _local_8 = 0;
                        while (_local_8 < WORLD.arrSolid.length)
                        {
                            if (this.shadow.hitTestObject(WORLD.arrSolid[_local_8].shadow))
                            {
                                _local_4 = true;
                                break;
                            };
                            _local_8++;
                        };
                        if (_local_4)
                        {
                            this.x = _local_2;
                            this.y = _local_3;
                            this.stopWalking();
                        }
                        else
                        {
                            if (this.nYStep <= this.nDuration)
                            {
                                this.nYStep++;
                            };
                        };
                    }
                    else
                    {
                        if (this.nXStep <= this.nDuration)
                        {
                            this.nXStep++;
                        };
                    };
                }
                else
                {
                    if (this.nXStep <= this.nDuration)
                    {
                        this.nXStep++;
                    };
                    if (this.nYStep <= this.nDuration)
                    {
                        this.nYStep++;
                    };
                };
                if ((((Math.round(_local_2) == Math.round(this.x)) && (Math.round(_local_3) == Math.round(this.y))) && ((this.nXStep > 1) || (this.nYStep > 1))))
                {
                    this.stopWalking();
                };
            }
            else
            {
                this.stopWalking();
            };
        }

        public function stopWalking():void
        {
            if (((!(this.mcChar == null)) && (this.mcChar.onMove)))
            {
                this.mcChar.onMove = false;
                this.mcChar.gotoAndPlay("Idle");
                this.removeEventListener(Event.ENTER_FRAME, onEnterFrameWalk);
            };
        }

        public function turn(_arg_1:String):void
        {
            if ((((_arg_1 == "right") && (this.mcChar.scaleX < 0)) || ((_arg_1 == "left") && (this.mcChar.scaleX > 0))))
            {
                this.mcChar.scaleX = (this.mcChar.scaleX * -1);
            };
        }

        public function scale(_arg_1:Number):void
        {
            if (this.mcChar != null)
            {
                if ((this.mcChar.scaleX >= 0))
                {
                    this.mcChar.scaleX = _arg_1;
                }
                else
                {
                    this.mcChar.scaleX = -(_arg_1);
                };
                this.mcChar.scaleY = _arg_1;
                this.shadow.scaleX = (this.shadow.scaleY = _arg_1);
                this.pname.y = (-(this.mcChar.height) - 10);
            };
        }


    }
}//package 

