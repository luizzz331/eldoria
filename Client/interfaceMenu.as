﻿// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//interfaceMenu

package 
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;

    public class interfaceMenu extends MovieClip 
    {

        public var mcMenu:MovieClip;
        private var currentPos:Number;
        private var h:Number = 25.2;
        private var w:Number = 118.25;
        public var btnOpen:String = "";
        private var rootClass:MovieClip;

        public function interfaceMenu(_arg_1:Array, _arg_2:String, _arg_3:MovieClip)
        {
            var _local_4:MovieClip;
            var _local_5:uint;
            super();
            btnOpen = _arg_2;
            rootClass = _arg_3;
            mcMenu = new MovieClip();
            _local_4 = (new menuBottom() as MovieClip);
            _local_4.height--;
            _local_4.width--;
            _local_4.x = (_local_4.x - 43);
            _local_4.y = (_local_4.y - 10.7);
            currentPos = (_local_4.y - 2);
            mcMenu.addChild(_local_4);
            _local_4 = (new menuListItem() as MovieClip);
            _local_4.x = (_local_4.x + 17);
            _local_4.height = h;
            _local_4.width = w;
            _local_4.mTxt.text = _arg_1[0].txt;
            _local_4.y = ((currentPos - (h >> 1)) + 1);
            _local_4.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            _local_4.buttonMode = true;
            _local_4.mouseChildren = false;
            _local_4.name = _arg_1[0].fct;
            currentPos = _local_4.y;
            mcMenu.addChild(_local_4);
            _local_5 = 1;
            while (_local_5 < (_arg_1.length - 1))
            {
                _local_4 = (new menuListItem() as MovieClip);
                _local_4.x = (_local_4.x + 17);
                _local_4.height = h;
                _local_4.width = w;
                _local_4.y = ((currentPos - h) + 1);
                currentPos = _local_4.y;
                _local_4.mTxt.text = _arg_1[_local_5].txt;
                _local_4.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
                _local_4.buttonMode = true;
                _local_4.mouseChildren = false;
                _local_4.name = _arg_1[_local_5].fct;
                mcMenu.addChild(_local_4);
                _local_5++;
            };
            _local_4 = (new menuTop() as MovieClip);
            _local_4.height--;
            _local_4.width--;
            _local_4.y = (currentPos - _local_4.height);
            _local_4.txt.text = _arg_1[(_arg_1.length - 1)].txt;
            _local_4.x = (_local_4.x + 17);
            mcMenu.addChild(_local_4);
        }

        private function onClick(_arg_1:MouseEvent):void
        {
            var _local_3:Function;
            var _local_2:Array = _arg_1.currentTarget.name.split(".");
            switch (_local_2.length)
            {
                case 1:
                    _local_3 = this[_arg_1.currentTarget.name];
                    break;
                case 2:
                    _local_3 = rootClass[_local_2[1]];
                    break;
                case 3:
                    _local_3 = rootClass.world[_local_2[2]];
                    break;
            };
            (_local_3());
        }

        private function charPage():void
        {
            var _local_1:String = rootClass.world.myAvatar.objData.strUsername;
            if (rootClass.params.strSourceID == "BBGames")
            {
                navigateToURL(new URLRequest(("http://www.aq.com/embed/bbgames/aw-character.asp?id=" + _local_1)), "_blank");
            }
            else
            {
                navigateToURL(new URLRequest(("http://www.aq.com/aw-character.asp?id=" + _local_1)), "_blank");
            };
        }

        private function toggleTempInventory():void
        {
            if (!rootClass.world.uiLock)
            {
                if (rootClass.ui.mcPopup.currentLabel == "Temp")
                {
                    rootClass.ui.mcPopup.onClose();
                }
                else
                {
                    rootClass.ui.mcPopup.fOpen("Temp");
                };
            };
        }

        private function toggleInventory():void
        {
            if (!rootClass.world.uiLock)
            {
                if (rootClass.ui.mcPopup.currentLabel == "Inventory")
                {
                    MovieClip(rootClass.ui.mcPopup.getChildByName("mcInventory")).fClose();
                }
                else
                {
                    rootClass.ui.mcPopup.fOpen("Inventory");
                };
            };
        }


    }
}//package 

