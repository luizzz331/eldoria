// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//DFrame2MC

package 
{
    import flash.display.MovieClip;
    import flash.display.DisplayObject;
    import flash.filters.GlowFilter;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class DFrame2MC extends MovieClip 
    {

        public var cnt:MovieClip;
        internal var world:MovieClip;
        internal var rootClass:MovieClip;
        internal var fData:Object = null;
        internal var isOpen:Boolean = false;
        internal var iniFrameT:int = 0;
        internal var iniFrameC:int = 0;
        internal var durFrameT:int = 35;
        internal var durFrameC:int = 0;
        internal var mc:MovieClip;
        internal var rarityCA:Array = [0x666666, 0xFFFFFF, 0x66FF00, 2663679, 0xFF00FF, 0xFFCC00, 0xFF0000];
        public var fWidth:int = 250;
        public var fHeight:int = 86;
        public var fX:int = 0;
        public var fY:int = 0;

        public function DFrame2MC(_arg_1:Object):void
        {
            addFrameScript(3, frame4, 11, frame12);
            fData = _arg_1;
        }

        public function init():*
        {
            var AssetClass:Class;
            var mcIcon:DisplayObject;
            mc = MovieClip(this);
            rootClass = MovieClip(stage.getChildAt(0));
            mc.cnt.strName.autoSize = "left";
            mc.cnt.strName.text = fData.sName;
            if (fData.iStk > 1)
            {
                mc.cnt.strName.text = (mc.cnt.strName.text + (" x" + fData.iQty));
            };
            mc.cnt.bg.width = Math.max(((mc.cnt.strName.x + int(mc.cnt.strName.textWidth)) + 15), 250);
            mc.cnt.ybtn.bg.width = Math.round((mc.cnt.bg.width / 2));
            mc.cnt.nbtn.bg.width = Math.round((mc.cnt.bg.width - mc.cnt.ybtn.bg.width));
            mc.cnt.nbtn.x = mc.cnt.ybtn.width;
            mc.cnt.ybtn.ti.x = (((mc.cnt.ybtn.bg.width / 2) - (mc.cnt.ybtn.ti.textWidth / 2)) + 4);
            mc.cnt.nbtn.ti.x = (((mc.cnt.nbtn.bg.width / 2) - (mc.cnt.nbtn.ti.textWidth / 2)) - 4);
            mc.cnt.ybtn.ti.mouseEnabled = false;
            mc.cnt.nbtn.ti.mouseEnabled = false;
            mc.cnt.strType.text = rootClass.getDisplaysType(fData);
            var mcFilter:* = mc.cnt.bg.filters;
            mc.cnt.icon.removeAllChildren();
            var sIcon:String = "";
            if (fData.sType.toLowerCase() == "enhancement")
            {
                sIcon = rootClass.getIconBySlot(fData.sES);
            }
            else
            {
                if (((fData.sType.toLowerCase() == "serveruse") || (fData.sType.toLowerCase() == "clientuse")))
                {
                    if (((("sFile" in fData) && (fData.sFile.length > 0)) && (!(rootClass.world.getClass(fData.sFile) == null))))
                    {
                        sIcon = fData.sFile;
                    }
                    else
                    {
                        sIcon = fData.sIcon;
                    };
                }
                else
                {
                    if ((((fData.sIcon == null) || (fData.sIcon == "")) || (fData.sIcon == "none")))
                    {
                        if (fData.sLink.toLowerCase() != "none")
                        {
                            sIcon = "iidesign";
                        }
                        else
                        {
                            sIcon = "iibag";
                        };
                    }
                    else
                    {
                        sIcon = fData.sIcon;
                    };
                };
            };
            try
            {
                AssetClass = (rootClass.world.getClass(sIcon) as Class);
                mcIcon = mc.cnt.icon.addChild(new (AssetClass)());
            }
            catch(e:Error)
            {
                AssetClass = (rootClass.world.getClass("iibag") as Class);
                mcIcon = mc.cnt.icon.addChild(new (AssetClass)());
            };
            mcIcon.scaleX = (mcIcon.scaleY = 0.5);
            mcFilter = mc.cnt.icon.filters;
            mcFilter = new GlowFilter(rarityCA[fData.iRty], 1, 8, 8, 2, 1, false, false);
            mc.cnt.icon.filters = [mcFilter];
			mc.cnt.previewHit.buttonMode = true;
			mc.cnt.previewHit.addEventListener(MouseEvent.CLICK, onPreviewClick, false, 0, true);
			mc.cnt.previewHit.addEventListener(MouseEvent.MOUSE_OVER, previewMouseOver, false, 0, true);
            mc.cnt.previewHit.addEventListener(MouseEvent.MOUSE_OUT, previewMouseOut, false, 0, true);
			mc.cnt.ybtn.buttonMode = true;
            mc.cnt.nbtn.buttonMode = true;
            mc.cnt.ybtn.addEventListener(MouseEvent.CLICK, yClick, false, 0, true);
            mc.cnt.ybtn.addEventListener(MouseEvent.MOUSE_OVER, yMouseOver, false, 0, true);
            mc.cnt.ybtn.addEventListener(MouseEvent.MOUSE_OUT, yMouseOut, false, 0, true);
            mc.cnt.nbtn.addEventListener(MouseEvent.CLICK, nClick, false, 0, true);
            mc.cnt.nbtn.addEventListener(MouseEvent.MOUSE_OVER, nMouseOver, false, 0, true);
            mc.cnt.nbtn.addEventListener(MouseEvent.MOUSE_OUT, nMouseOut, false, 0, true);
        }
		
		private function onPreviewClick(eve:MouseEvent):*
        {
			rootClass.mixer.playSound("Click");
            rootClass.world.showMiniPreview(fData);
        }
		
		
        private function previewMouseOver(eve:MouseEvent):*
        {
            rootClass.ui.ToolTip.openWith({"str":"Click to Preview"});
        }

        private function previewMouseOut(eve:MouseEvent):*
        {
            rootClass.ui.ToolTip.close();
        }
		
        private function yClick(_arg_1:MouseEvent):*
        {
            var _local_3:Object;
            var _local_4:*;
            var _local_5:*;
            var _local_2:Boolean = true;
            for each (_local_3 in rootClass.world.myAvatar.items)
            {
                if (((_local_3.ItemID == fData.ItemID) && (_local_3.iQty < _local_3.iStk)))
                {
                    _local_2 = false;
                };
            };
            if (((_local_2) && (rootClass.world.myAvatar.items.length < rootClass.world.myAvatar.objData.iBagSlots)))
            {
                _local_2 = false;
            };
            if (((rootClass.isHouseItem(fData)) && (rootClass.world.myAvatar.houseitems.length >= rootClass.world.myAvatar.objData.iHouseSlots)))
            {
                rootClass.MsgBox.notify("House Inventory Full!");
            }
            else
            {
                if (_local_2)
                {
                    rootClass.MsgBox.notify("Item Inventory Full!");
                }
                else
                {
                    _local_4 = MovieClip(_arg_1.currentTarget);
                    _local_5 = MovieClip(_local_4.parent.parent);
                    setCT(_local_4.bg, 3385873);
                    _local_5.cnt.ybtn.mouseEnabled = false;
                    _local_5.cnt.ybtn.mouseChildren = false;
                    rootClass.sfc.sendXtMessage("zm", "getDrop", [fData.ItemID], "str", rootClass.world.curRoom);
                };
            };
        }

        private function nClick(_arg_1:MouseEvent):*
        {
            rootClass.sfc.sendXtMessage("zm", "denyDrop", [fData.ItemID], "str", rootClass.world.curRoom);
            killButtons();
            rootClass.mixer.playSound("Click");
        }
		
		private function yMouseOver(_arg_1:MouseEvent):*
        {
            var _local_2:* = MovieClip(_arg_1.currentTarget);
            setCT(_local_2.bg, 0x222222);
        }

        private function yMouseOut(_arg_1:MouseEvent):*
        {
            var _local_2:* = MovieClip(_arg_1.currentTarget);
            setCT(_local_2.bg, 0);
        }

        private function nMouseOver(_arg_1:MouseEvent):*
        {
            var _local_2:* = MovieClip(_arg_1.currentTarget);
            setCT(_local_2.bg, 0x222222);
        }

        private function nMouseOut(_arg_1:MouseEvent):*
        {
            var _local_2:* = MovieClip(_arg_1.currentTarget);
            setCT(_local_2.bg, 0);
        }

        private function killButtons():void
        {
            mc.cnt.previewHit.removeEventListener(MouseEvent.CLICK, onPreviewClick);
			mc.cnt.previewHit.removeEventListener(MouseEvent.MOUSE_OVER, previewMouseOver);
            mc.cnt.previewHit.removeEventListener(MouseEvent.MOUSE_OUT, previewMouseOut);
            mc.cnt.ybtn.removeEventListener(MouseEvent.CLICK, yClick);
            mc.cnt.ybtn.removeEventListener(MouseEvent.MOUSE_OVER, yMouseOver);
            mc.cnt.ybtn.removeEventListener(MouseEvent.MOUSE_OUT, yMouseOut);
            mc.cnt.nbtn.removeEventListener(MouseEvent.CLICK, nClick);
            mc.cnt.nbtn.removeEventListener(MouseEvent.MOUSE_OVER, nMouseOver);
            mc.cnt.nbtn.removeEventListener(MouseEvent.MOUSE_OUT, nMouseOut);
        }

        public function fClose():void
        {
            killButtons();
            MovieClip(this).parent.removeChild(this);
        }

        private function setCT(_arg_1:*, _arg_2:*):*
        {
            var _local_3:* = _arg_1.transform.colorTransform;
            _local_3.color = _arg_2;
            _arg_1.transform.colorTransform = _local_3;
        }

        internal function frame4():*
        {
            stop();
        }

        internal function frame12():*
        {
            fClose();
        }


    }
}//package 

