// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//LPFFrameSimpleList

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.DisplayObject;
    import flash.text.*;

    public class LPFFrameSimpleList extends LPFFrame 
    {

        public var bg:MovieClip;
        public var iList:MovieClip;
        public var ti:TextField;
        private var rootClass:MovieClip;
        private var r:Object;

        public function LPFFrameSimpleList():void
        {
            x = 0;
            y = 0;
            fData = null;
        }

        override public function fOpen(_arg_1:Object):void
        {
            trace("simple list opened");
            rootClass = MovieClip(stage.getChildAt(0));
            if (("fData" in _arg_1))
            {
                fData = _arg_1.fData;
            };
            r = _arg_1.r;
            w = int(r.w);
            ti.autoSize = "left";
            if (("eventTypes" in _arg_1))
            {
                eventTypes = _arg_1.eventTypes;
            };
            if ((("msg" in fData) && (fData.msg.length > 0)))
            {
                ti.htmlText = fData.msg;
            };
            fDraw();
            positionBy(r);
            getLayout().registerForEvents(this, eventTypes);
        }

        override public function fClose():void
        {
            fData = null;
            getLayout().unregisterFrame(this);
            if (parent != null)
            {
                parent.removeChild(this);
            };
        }

        private function fDraw():void
        {
            var _local_1:LPFElementSimpleItem;
            var _local_2:DisplayObject;
            var _local_3:DisplayObject;
            var _local_4:Array;
            var _local_5:Object;
            var _local_6:int;
            while (iList.numChildren > 0)
            {
                iList.removeChildAt(0);
            };
            if (((!(fData == null)) && (!(fData.turnin == null))))
            {
                _local_4 = fData.turnin;
                _local_6 = 0;
                while (_local_6 < _local_4.length)
                {
                    _local_5 = _local_4[_local_6];
                    _local_1 = new LPFElementSimpleItem();
                    _local_2 = iList.addChild(_local_1);
                    _local_1.fOpen({"fData":_local_5});
                    if (_local_6 > 0)
                    {
                        _local_3 = iList.getChildAt((_local_6 - 1));
                        _local_2.y = ((_local_3.y + _local_3.height) + 4);
                    };
                    _local_2.x = int(((w / 2) - (_local_2.width / 2)));
                    _local_6++;
                };
                bg.height = (int((iList.height + (iList.y * 2))) + 1);
                bg.width = int(w);
                ti.width = int((w - 2));
                if (ti.htmlText.length > 0)
                {
                    ti.y = (bg.height + 2);
                    ti.visible = true;
                }
                else
                {
                    ti.visible = false;
                };
                visible = true;
            }
            else
            {
                visible = false;
            };
        }

        override public function notify(_arg_1:Object):void
        {
            if (_arg_1.eventType == "listItemASel")
            {
                fData = null;
                if (((!(_arg_1.fData == null)) && (!(_arg_1.fData.oSel == null))))
                {
                    fData = _arg_1.fData.oSel;
                };
                fDraw();
                positionBy(r);
            };
            if (_arg_1.eventType == "refreshItems")
            {
                fDraw();
                positionBy(r);
            };
        }


    }
}//package 

