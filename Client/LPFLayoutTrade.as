// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//LPFLayoutTrade

package 
{
    import flash.display.MovieClip;
    import flash.display.*;
    import flash.text.*;

    public class LPFLayoutTrade extends LPFLayout 
    {

        public var eSel:Object;
        public var aSel:Object;
        public var iSel:Object;
        public var bSel:Object;
        public var cSel:Object;
        public var itemsI:Array;
        public var itemsB:Array;
        public var itemsC:Array;
        public var bankPanel:MovieClip;
        public var rootClass:MovieClip;
        public var notify:Boolean;
        public var previewPanel:MovieClip;

        public function LPFLayoutTrade():void
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
            notify = true;
            rootClass = MovieClip(stage.getChildAt(0));
            fData = _arg_1.fData;
            sMode = _arg_1.sMode;
            if (("itemsI" in fData))
            {
                itemsI = fData.itemsI;
            };
            if (("itemsB" in fData))
            {
                itemsB = fData.itemsB;
            };
            if (("itemsC" in fData))
            {
                itemsC = fData.itemsC;
            };
            _local_2 = _arg_1.r;
            var _local_5:* = "";
            x = _local_2.x;
            y = _local_2.y;
            w = _local_2.w;
            h = _local_2.h;
            _local_3 = {};
            _local_3.panel = new LPFPanelTrade();
            _local_3.fData = {
                "itemsI":itemsI,
                "itemsB":itemsB,
                "itemsC":itemsC,
                "avatar":rootClass.world.myAvatar,
                "objData":fData.objData,
                "tradeUser":fData.tradeUser
            };
            _local_3.r = {
                "x":-15,
                "y":80,
                "w":900,
                "h":400
            };
            _local_3.isOpen = true;
            bankPanel = addPanel(_local_3);
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
            if (notify)
            {
                rootClass.sfc.sendXtMessage("zm", "tradeCancel", [fData.tradeId], "str", rootClass.world.curRoom);
            };
        }

        override protected function handleUpdate(_arg_1:Object):Object
        {
            var _local_2:Object;
            var _local_3:Boolean;
            var _local_6:Object;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_4:Object = iSel;
            var _local_5:Object = bSel;
            if (_arg_1.eventType == "inventorySel")
            {
                iSel = _arg_1.fData;
                if (_local_4 == iSel)
                {
                    iSel = null;
                };
                _arg_1.fData = {"iSel":iSel};
            };
            if (_arg_1.eventType == "offerSel")
            {
                bSel = _arg_1.fData;
                if (_local_5 == bSel)
                {
                    bSel = null;
                };
                _arg_1.fData = {"bSel":bSel};
            };
            if (_arg_1.eventType == "otherSel")
            {
                cSel = _arg_1.fData;
                if (_local_5 == cSel)
                {
                    cSel = null;
                };
                _arg_1.fData = {"cSel":cSel};
            };
            if (((_arg_1.eventType == "categorySelMyOffer") || (_arg_1.eventType == "categorySelTheirOffer")))
            {
                bSel = null;
                if (rootClass.world.tradeHasRequested(_arg_1.fData.types))
                {
                    _arg_1.eventType = "refreshBank";
                }
                else
                {
                    _arg_1.fData.loadPending = true;
                    _arg_1.fData.msg = "Loading...";
                    rootClass.world.sendLoadOfferRequest(_arg_1.fData.types);
                };
            };
            if (_arg_1.eventType == "refreshBank")
            {
            };
            if (_arg_1.eventType == "refreshInventory")
            {
            };
            if (_arg_1.eventType == "clickPreview")
            {
                if (!rootClass.isGreedyModalInStack())
                {
                    eSel = null;
                    iSel = null;
                    aSel = _arg_1.fData.sType.toLowerCase();
                    bSel = "";
                    if (aSel == "fortification")
                    {
                        eSel = _arg_1.fData;
                    }
                    else
                    {
                        iSel = _arg_1.fData;
                    };
                    if (_arg_1.fData.sType.toLowerCase() == "fortification")
                    {
                        _arg_1.tabStates = getTabStates(_arg_1.fData);
                    }
                    else
                    {
                        _arg_1.tabStates = getTabStates({"sES":"enh"});
                    };
                    _arg_1.fData = {
                        "iSel":iSel,
                        "eSel":eSel,
                        "oSel":_arg_1.fData
                    };
                    previewPanel.fShow(_arg_1);
                };
            };
            if (_arg_1.eventType == "lockOffer")
            {
                rootClass.sfc.sendXtMessage("zm", "tradeLock", [fData.tradeId, rootClass.ctrlTrade.txtMyGold.text, rootClass.ctrlTrade.txtMyCoins.text], "str", rootClass.world.curRoom);
            };
            if (_arg_1.eventType == "unlockOffer")
            {
                rootClass.sfc.sendXtMessage("zm", "tradeUnlock", [fData.tradeId], "str", rootClass.world.curRoom);
            };
            if (_arg_1.eventType == "completeTrade")
            {
                rootClass.sfc.sendXtMessage("zm", "tradeDeal", [fData.tradeId], "str", rootClass.world.curRoom);
            };
            if (_arg_1.eventType == "refreshItems")
            {
            };
            if (_arg_1.eventType == "sendTradeFromInvRequest")
            {
                _local_9 = ((iSel.iQty != null) ? iSel.iQty : 1);
                if (((_local_9 > 1) && (!(iSel.sES == "ar"))))
                {
                    _local_7 = new ModalMC();
                    _local_8 = {};
                    _local_8.params = {};
                    _local_8.strBody = "Please specify item quantity you want to trade.";
                    _local_8.callback = qtyRequest;
                    if (_local_9 > 1)
                    {
                        _local_8.qtySel = {
                            "min":1,
                            "max":_local_9
                        };
                    };
                    _local_8.glow = "white,medium";
                    _local_8.greedy = true;
                    rootClass.ui.ModalStack.addChild(_local_7);
                    _local_7.init(_local_8);
                }
                else
                {
                    iSel.TradeID = fData.tradeId;
                    iSel.Quantity = _local_9;
                    rootClass.world.sendTradeFromInvRequest(iSel);
                    iSel = null;
                };
            };
            if (_arg_1.eventType == "sendTradeToInvRequest")
            {
                bSel.TradeID = fData.tradeId;
                rootClass.world.sendTradeToInvRequest(bSel);
                bSel = null;
            };
            if (_arg_1.eventType == "sendTradeSwapInvRequest")
            {
                bSel.TradeID = fData.tradeId;
                rootClass.world.sendTradeSwapInvRequest(bSel, iSel);
                iSel = null;
                bSel = null;
            };
            updatePreviewButtons(_local_6);
            _local_4 = null;
            _local_5 = null;
            if (!_local_3)
            {
                return (_arg_1);
            };
            return (null);
        }

        public function qtyRequest(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                iSel.TradeID = fData.tradeId;
                iSel.Quantity = 1;
                if (_arg_1.iQty != null)
                {
                    iSel.Quantity = _arg_1.iQty;
                };
                rootClass.world.sendTradeFromInvRequest(iSel);
                iSel = null;
            };
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
                if (((!(iSel == null)) && (bSel == null)))
                {
                    _local_3.fData.sText = "Add to Offer >";
                    _local_3.buttonNewEventType = "sendTradeFromInvRequest";
                    _local_3.sMode = "red";
                }
                else
                {
                    if (((iSel == null) && (!(bSel == null))))
                    {
                        _local_3.fData.sText = "< To Inventory";
                        _local_3.buttonNewEventType = "sendTradeToInvRequest";
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

        public function getTabStates(_arg_1:Object=null, _arg_2:Array=null):Array
        {
            var _local_3:String;
            var _local_4:int;
            var _local_5:Object;
            var _local_7:*;
            var _local_6:Array = [{
                "sTag":"Show All",
                "icon":"iipack",
                "state":-1,
                "filter":"*",
                "mc":{}
            }, {
                "sTag":"Show only weapons",
                "icon":"iwsword",
                "state":-1,
                "filter":"Weapon",
                "mc":{}
            }, {
                "sTag":"Show only armor",
                "icon":"iiclass",
                "state":-1,
                "filter":"ar",
                "mc":{}
            }, {
                "sTag":"Show only helms",
                "icon":"iihelm",
                "state":-1,
                "filter":"he",
                "mc":{}
            }, {
                "sTag":"Show only capes",
                "icon":"iicape",
                "state":-1,
                "filter":"ba",
                "mc":{}
            }, {
                "sTag":"Show only pets",
                "icon":"iipet",
                "state":-1,
                "filter":"pe",
                "mc":{}
            }, {
                "sTag":"Show only accessories",
                "icon":"iin1",
                "state":-1,
                "filter":"am",
                "mc":{}
            }, {
                "sTag":"Show only items",
                "icon":"iibag",
                "state":-1,
                "filter":"it",
                "mc":{}
            }];
            if (_arg_2 != null)
            {
                for each (_local_3 in _arg_2)
                {
                    _local_4 = 0;
                    while (_local_4 < _local_6.length)
                    {
                        if (_local_6[_local_4].filter == _local_3)
                        {
                            _local_7 = _local_4;
                            _local_4--;
                            _local_6.splice(_local_7, 1);
                        };
                        _local_4++;
                    };
                };
            };
            if (_arg_1 != null)
            {
                for each (_local_5 in _local_6)
                {
                    if (_local_5.filter == _arg_1.sES)
                    {
                        return ([_local_5]);
                    };
                };
                return ([_local_6[0]]);
            };
            return (_local_6);
        }


    }
}//package 

