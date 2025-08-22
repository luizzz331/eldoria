// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//LPFPanelBank

package 
{
    import flash.events.MouseEvent;
    import flash.events.FocusEvent;
    import flash.geom.Point;
    import flash.display.MovieClip;
    import flash.text.*;

    public class LPFPanelBank extends LPFPanel 
    {

        public function LPFPanelBank():void
        {
            x = 0;
            y = 0;
            frames = [];
            fData = {};
        }

        override public function fOpen(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_6:int;
            fData = _arg_1.fData;
            drawBG(LPFPanelBg3);
            bg.tTitle.text = "Bank";
            bg.tPane1.text = "Bank Items";
            bg.tPane2.text = "";
            bg.tPane3.text = "Inventory Items";
            bg.tSearch.visible = true;
            bg.mcSearch.visible = true;
            bg.mcSearch.addEventListener(MouseEvent.CLICK, onSearch, false, 0, true);
            bg.tSearch.addEventListener(FocusEvent.FOCUS_IN, clearText, false, 0, true);
            _local_2 = _arg_1.r;
            x = _local_2.x;
            if (_local_2.y > -1)
            {
                y = _local_2.y;
            }
            else
            {
                _local_6 = fParent.numChildren;
                if (_local_6 > 1)
                {
                    y = ((fParent.getChildAt((_local_6 - 2)).y + fParent.getChildAt((_local_6 - 2)).height) + 10);
                }
                else
                {
                    y = 10;
                };
            };
            var _local_3:Point = new Point(0, 0);
            _local_3 = bg.localToGlobal(_local_3);
            bg.y = (bg.y - int((_local_2.y - _local_3.y)));
            w = _local_2.w;
            h = _local_2.h;
            xo = x;
            yo = y;
            if (("closeType" in _arg_1))
            {
                closeType = _arg_1.closeType;
            };
            if (("hideDir" in _arg_1))
            {
                hideDir = _arg_1.hideDir;
            };
            if (("hidePad" in _arg_1))
            {
                hidePad = _arg_1.hidePad;
            };
            if (("xBuffer" in _arg_1))
            {
                xBuffer = _arg_1.xBuffer;
            };
            if (("isOpen" in _arg_1))
            {
                isOpen = _arg_1.isOpen;
            };
            var _local_4:Object = {};
            _local_4 = {};
            _local_4.frame = new LPFFrameBackdrop();
            _local_4.fData = null;
            _local_4.r = {
                "x":(14 + 1),
                "y":40,
                "w":290,
                "h":310
            };
            addFrame(_local_4);
            var _local_5:int = 46;
            _local_4 = {};
            _local_4.frame = new LPFFrameListViewTabbed();
            _local_4.fData = {
                "list":fData.itemsB,
                "isBank":true
            };
            _local_4.r = {
                "x":(20 + 1),
                "y":_local_5,
                "w":265,
                "h":304
            };
            _local_4.tabStates = MovieClip(fParent).getTabStates(null, ["*"]);
            _local_4.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Enhancement", "Sword", "Axe", "Dagger", "Claw", "Gun", "Bow", "Mace", "Spear", "Polearm", "Scythe", "Staff", "Wand", "Class", "Armor", "Helm", "Cape", "Ring", "Necklace", "Egg", "Pet", "House", "Wall Item", "Floor Item"];
            _local_4.filterMap = {
                "Weapon":["Sword", "Axe", "Dagger", "Claw", "Gun", "Bow", "Mace", "Spear", "Polearm", "Scythe", "Staff", "Wand"],
                "ar":["Class", "Armor"],
                "he":["Helm"],
                "ba":["Cape"],
                "pe":["Egg", "Pet"],
                "am":["Shield", "Necklace"],
                "it":["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                "enh":["Enhancement"]
            };
            _local_4.sName = "bank";
            _local_4.itemEventType = "bankSel";
            _local_4.tabEventType = "categorySel";
            _local_4.eventTypes = ["refreshItems", "refreshBank", "categorySel"];
            _local_4.onDemand = true;
            _local_4.openBlank = true;
            _local_4.allowDesel = true;
            addFrame(_local_4);
            _local_4 = {};
            _local_4.frame = new LPFFrameSlotDisplay();
            _local_4.fData = {};
            _local_4.fData.avatar = fData.avatar;
            _local_4.r = {
                "x":96,
                "y":-40,
                "w":-1,
                "h":24
            };
            _local_4.eventTypes = ["refreshItems", "refreshBank", "refreshSlots"];
            _local_4.isBank = true;
            addFrame(_local_4);
            _local_4 = {};
            _local_4.frame = new LPFFrameBackdrop();
            _local_4.fData = null;
            _local_4.r = {
                "x":(14 + 581),
                "y":40,
                "w":290,
                "h":310
            };
            addFrame(_local_4);
            _local_4 = {};
            _local_4.frame = new LPFFrameGoldDisplay();
            _local_4.fData = fData.objData;
            _local_4.r = {
                "x":-1,
                "y":-70,
                "w":-1,
                "h":24,
                "center":true,
                "centerOn":740,
                "shiftAmount":0
            };
            _local_4.eventTypes = ["refreshCoins"];
            addFrame(_local_4);
            _local_4 = {};
            _local_4.frame = new LPFFrameSlotDisplay();
            _local_4.fData = fData.objData;
            _local_4.fData.list = fData.itemsI;
            _local_4.r = {
                "x":(32 + 581),
                "y":-40,
                "w":-1,
                "h":24
            };
            _local_4.eventTypes = ["refreshItems", "refreshSlots"];
            addFrame(_local_4);
            /*_local_4 = {};
            _local_4.frame = new LPFFrameGenericButton();
            _local_4.fData = {"sText":"Add Space"};
            _local_4.r = {
                "x":(185 + 581),
                "y":-38,
                "w":-1,
                "h":-1
            };
            _local_4.buttonNewEventType = ["buyBagSlots"];
            addFrame(_local_4);*/
            _local_5 = 46;
            _local_4 = {};
            _local_4.frame = new LPFFrameListViewTabbed();
            _local_4.fData = {"list":fData.itemsI};
            _local_4.r = {
                "x":(20 + 581),
                "y":_local_5,
                "w":265,
                "h":270
            };
            _local_4.tabStates = MovieClip(fParent).getTabStates();
            _local_4.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Enhancement", "Sword", "Axe", "Dagger", "Claw", "Gun", "Bow", "Mace", "Spear", "Polearm", "Scythe", "Staff", "Wand", "Shield", "Class", "Armor", "Helm", "Cape", "Ring", "Necklace", "Egg", "Pet", "House", "Wall Item", "Floor Item"];
            _local_4.filterMap = {
                "Weapon":["Sword", "Axe", "Dagger", "Claw", "Gun", "Bow", "Mace", "Spear", "Polearm", "Scythe", "Staff", "Wand"],
                "ar":["Class", "Armor"],
                "he":["Helm"],
                "ba":["Cape"],
                "pe":["Egg", "Pet"],
                "am":["Shield", "Necklace"],
                "it":["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                "enh":["Enhancement"]
            };
            _local_4.sName = "inventory";
            _local_4.itemEventType = "inventorySel";
            _local_4.eventTypes = ["refreshItems", "refreshInventory"];
            _local_4.allowDesel = true;
            _local_4.refreshTabs = true;
            addFrame(_local_4);
            _local_4 = {};
            _local_4.frame = new LPFFrameSimpleText();
            //_local_4.fData = {"msg":"<p align='center'>Select an item from your Inventory (right) to move that item to the Bank (left), and vice-versa.<br>Selecting an item from both lists allows you to perform a swap.</p>"};
            _local_4.fData = {"msg":"<p align='center'>Select an item from your Inventory (right) to move that item to the Bank (left), and vice-versa.</p>"};
            _local_4.r = {
                "x":-1,
                "y":10,
                "w":200,
                "h":-1,
                "center":true
            };
            addFrame(_local_4);
            _local_4 = {};
            _local_4.frame = new LPFFrameGenericButton();
            _local_4.fData = null;
            _local_4.r = {
                "x":455,
                "y":363.5,
                "w":-1,
                "h":-1,
                "center":false
            };
            _local_4.eventTypes = ["previewButton1Update"];
            addFrame(_local_4);
            bg.btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
            if (!(("showDragonLeft" in _arg_1) && (_arg_1.showDragonLeft == true)))
            {
                bg.dragonLeft.visible = false;
            };
            if (!(("showDragonRight" in _arg_1) && (_arg_1.showDragonRight == true)))
            {
                bg.dragonRight.visible = false;
            };
        }

        internal function onSearch(_arg_1:MouseEvent):void
        {
            MovieClip(stage.getChildAt(0)).world.bankinfo.search(bg.tSearch.text.toLowerCase());
        }

        internal function clearText(_arg_1:FocusEvent):void
        {
            if (bg.tSearch.text == "search")
            {
                bg.tSearch.text = "";
            };
        }


    }
}//package 

