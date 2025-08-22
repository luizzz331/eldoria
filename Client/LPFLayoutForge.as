// AQW - PRIME
// Client By AE
// Edited by g14k
// Long Live the Biladerios

//LPFLayoutForge

package 
{
    import flash.display.MovieClip;
    import flash.display.*;
    import flash.text.*;

    public class LPFLayoutForge extends LPFLayout 
    {

        private var aSel:String = "";
        private var bSel:String = "";
        public var iSel:Object;
        public var eSel:Object;
		public var forgeinfo:Object;
        public var itemsInv:Array;
        public var itemsForge:Array;
        public var forgePanel:MovieClip;
        public var rootClass:MovieClip;

        public function LPFLayoutForge():void
        {
            x = 0;
            y = 0;
            panels = [];
            fData = {};
        }

        override public function fOpen(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:MovieClip;

            rootClass = MovieClip(stage.getChildAt(0));
            fData = _arg_1.fData;
            sMode = _arg_1.sMode;
            if (("itemsInv" in fData))
            {
                itemsInv = fData.itemsInv;
            };
            if (("itemsForge" in fData))
            {
                itemsForge = fData.itemsForge;
            };
			if (("forgeinfo" in fData))
            {
                forgeinfo = fData.forgeinfo;
            };
            _local_2 = _arg_1.r;
            var _local_5:* = "";
            x = _local_2.x;
            y = _local_2.y;
            w = _local_2.w;
            h = _local_2.h;
            _local_3 = {};
            _local_3.panel = new LPFPanelForge();
            _local_5 = "Forge";
            _local_3.fData = {
                "items":itemsForge,
                "itemsInv":itemsInv,
				"objData":fData.objData,
                "sName":_local_5
            };
			if (forgeinfo != null)
            {
                _local_3.fData.forgeinfo = forgeinfo;
            };
            _local_3.r = {
                "x":30,
                "y":80,
                "w":900,
                "h":400
            };
			_local_3.closeType = "close";
            _local_3.isOpen = true;
            forgePanel = addPanel(_local_3);
            updatePreviewButtons();
            rootClass.dropStackBoost();
        }

        override public function fClose():void
        {
            var _local_1:MovieClip;
            rootClass.dropStackReset();
            while (panels.length > 0)
            {
                panels[0].mc.fClose();
                panels.shift();
            };
            if (parent != null)
            {
                _local_1 = MovieClip(parent);
                _local_1.removeChild(this);
                _local_1.onClose();
            };
        }

        override protected function handleUpdate(_arg_1:Object):Object
        {
            var _local_2:Object;
            var _local_3:Array;
            var _local_4:Object;
            var _local_5:*;
            var _local_6:*;
            var _local_7:Boolean;
            var _local_8:Object;
            trace(("LayoutINVENH.handleUpdate > " + _arg_1.eventType));
            var _local_9:Object = iSel;
			var forgeBar:Object;
			
            if (_arg_1.eventType == "sModeSet")
            {
                if (sMode != _arg_1.sModeBroadcast)
                {
                    sMode = _arg_1.sModeBroadcast;
                    iSel = null;
                    eSel = null;
                    _arg_1.iSel = iSel;
                    _local_3 = itemsInv;
                    if (sMode == "forge")
                    {
                        _local_3 = itemsForge;
                    };
                    _arg_1.fData = {"list":_local_3};
                };
            };
            if (_arg_1.eventType == "listItemASel")
            {
                iSel = null;
                aSel = _arg_1.fData.sType.toLowerCase();
                iSel = _arg_1.fData;
                _arg_1.fData = {
                    "iSel":iSel,
                    "oSel":_arg_1.fData
                };
                if (_local_9 == iSel)
                {
                    _local_7 = true;
                };
            };
            if (_arg_1.eventType == "refreshItems")
            {
				if (itemsInv.indexOf(iSel) == -1)
                {
                    iSel = null;
                };
                if (itemsInv.indexOf(eSel) == -1)
                {
                    eSel = null;
                };
                _arg_1.fData = {
                    "iSel":iSel,
                    "eSel":eSel
                };
            };
            if (_arg_1.eventType == "forgeItem")
            {
                if (iSel != null)
                {
					forgeBar = {};
					forgeBar.typ = "generic";
					forgeBar.dur = 3.5;
					forgeBar.txt = "Forging...";
					forgeBar.callback = onForgeRequest;
					forgeBar.args = {};
					rootClass.ui.mcCastBar.fOpenWith(forgeBar);
					//myAvatar.pMC.stopWalking();
					rootClass.chatF.submitMsg("/use", "emote", "");
                }
                else if (eSel != null)
				{
					rootClass.world.sendBuyItemRequest(eSel);
				};
            };
            if (_arg_1.eventType == "sellItem")
            {
                if (iSel != null)
                {
                    _local_4 = iSel;
                };
                _local_5 = new ModalMC();
                _local_6 = {};
                _local_6.strBody = (("Are you sure you want to sell '" + _local_4.sName) + "'?");
                _local_6.params = {"iSel":_local_4};
                _local_6.callback = onSellRequest;
                _local_6.glow = "white,medium";
                rootClass.ui.ModalStack.addChild(_local_5);
                _local_5.init(_local_6);
            };
            if (_arg_1.eventType == "buyBagSlots")
            {
                _local_7 = true;
                rootClass.world.loadMovieFront(rootClass.bagSpace, "Inline Asset");
                fClose();
            };
            if (_arg_1.eventType == "helpAC")
            {
                _local_7 = true;
                rootClass.world.loadMovieFront("interface/goldAC4.swf", "Inline Asset");
            };
            updatePreviewButtons(_local_8);
            _local_9 = null;
            if (!_local_7)
            {
                return (_arg_1);
            };
            return (null);
        }

        private function updatePreviewButtons(_arg_1:Object=null, _arg_2:Object=null):void
        {
            var _local_3:Object = {};
            if (((!(_arg_1 == null)) && (!(_arg_2 == null))))
            {
                _local_3 = _arg_2;
            }
            else
            {
                _local_3.eventType = "previewButton1Update";
                _local_3.fData = {};
                _local_3.fData.sText = "";
                _local_3.sMode = "grey";
                _local_3.buttonNewEventType = "";
                if (sMode == "forge")
                {
                    if (iSel != null)
                    {
                        _local_3.fData.sText = "Buy";
                        _local_3.buttonNewEventType = "buyItem";
                        _local_3.sMode = "red";
                    }
                    else
                    {
                        _local_3.fData.sText = "";
                        _local_3.buttonNewEventType = "";
                    };
                };
                if (sMode == "shopSell")
                {
                    if (iSel != null)
                    {
                        _local_3.fData.sText = "Sell";
                        _local_3.buttonNewEventType = "sellItem";
                        _local_3.sMode = "red";
                    }
                    else
                    {
                        _local_3.fData.sText = "";
                        _local_3.buttonNewEventType = "";
                    };
                };
            };
            notifyByEventType(_local_3);
        }
		
		private function onForgeRequest():void
		{
			rootClass.MsgBox.notify("Forge Sucess");
		}
		
        private function onSellRequest(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                rootClass.world.sendSellItemRequest(_arg_1.iSel);
            };
        }

        public function getTabStates(_arg_1:Object=null):Array
        {
            var _local_2:Object;
            var _local_3:Array = [{
                "sTag":"Show All",
                "icon":"iiroll",
                "state":-1,
                "filter":"*",
                "mc":{}
            }];
            if (_arg_1 != null)
            {
                for each (_local_2 in _local_3)
                {
                    if (_local_2.filter == _arg_1.sES)
                    {
                        return ([_local_2]);
                    };
                };
                return ([_local_3[0]]);
            };
            return (_local_3);
        }


    }
}//package 

