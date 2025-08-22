// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//LPFPanelTrade

package 
{
    import flash.geom.Point;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.geom.*;

    public class LPFPanelTrade extends LPFPanel 
    {

        public var mainClass:* = MovieClip(Game.root);

        public function LPFPanelTrade():void
        {
            x = 0;
            y = 0;
            frames = [];
            fData = {};
        }

        override public function fOpen(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:int;
            var _local_4:*;
            fData = _arg_1.fData;
            drawBG(LPFPanelBg4);
            bg.tTitle.text = "Trade";
            bg.tPane1.text = "Your Inventory";
            bg.tPane2.text = (mainClass.world.myAvatar.objData.strUsername + "'s Offer");
            bg.tPane3.text = (fData.tradeUser + "'s Offer");
            _local_2 = _arg_1.r;
            _local_4 = 15;
            x = (_local_2.x + _local_4);
            if (_local_2.y > -1)
            {
                y = _local_2.y;
            }
            else
            {
                _local_3 = fParent.numChildren;
                if (_local_3 > 1)
                {
                    y = ((fParent.getChildAt((_local_3 - 2)).y + fParent.getChildAt((_local_3 - 2)).height) + 10);
                }
                else
                {
                    y = 10;
                };
            };
            var _local_5:Point = new Point(0, 0);
            _local_5 = bg.localToGlobal(_local_5);
            bg.y = (bg.y - int((_local_5.y - _local_5.y)));
            w = _local_2.w;
            h = _local_2.h;
            xo = (x + _local_4);
            yo = y;
            width = (width - (_local_4 * 2));
            height = (height - _local_4);
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
            var _local_6:Object = {};
            _local_6 = {};
            _local_6.frame = new LPFFrameBackdrop();
            _local_6.fData = null;
            _local_6.r = {
                "x":30,
                "y":37,
                "w":290,
                "h":320
            };
            addFrame(_local_6);
            _local_6 = {};
            _local_6.frame = new LPFFrameBackdrop();
            _local_6.fData = null;
            _local_6.r = {
                "x":348,
                "y":37,
                "w":290,
                "h":239
            };
            addFrame(_local_6);
            _local_6 = {};
            _local_6.frame = new LPFFrameBackdrop();
            _local_6.fData = null;
            _local_6.r = {
                "x":670,
                "y":37,
                "w":290,
                "h":239
            };
            addFrame(_local_6);
            var _local_7:int = 41;
            _local_6 = {};
            _local_6.frame = new LPFFrameListViewTabbed();
            _local_6.fData = {"list":fData.itemsB};
            _local_6.r = {
                "x":353,
                "y":_local_7,
                "w":265,
                "h":225
            };
            _local_6.tabStates = MovieClip(fParent).getTabStates();
            _local_6.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Enhancement", "Sword", "Axe", "Dagger", "Claw", "Gun", "Bow", "Mace", "Spear", "Polearm", "Scythe", "Staff", "Wand", "Shield", "Class", "Armor", "Helm", "Cape", "Earrings", "Ring", "Necklace", "Egg", "Pet", "House", "Wall Item", "Floor Item"];
            _local_6.filterMap = {
                "Weapon":["Shield", "Sword", "Axe", "Dagger", "Claw", "Gun", "Bow", "Mace", "Spear", "Polearm", "Scythe", "Staff", "Wand"],
                "ar":["Class", "Armor"],
                "he":["Helm"],
                "ba":["Cape", "Wings"],
                "pe":["Egg", "Pet"],
                "am":["Earrings", "Ring", "Necklace"],
                "it":["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                "enh":["Enhancement"]
            };
            _local_6.sName = "offer";
            _local_6.itemEventType = "offerSel";
            _local_6.tabEventType = "categorySelMyOffer";
            _local_6.eventTypes = ["refreshItems", "refreshBank", "categorySelMyOffer"];
            _local_6.onDemand = true;
            _local_6.openBlank = false;
            _local_6.allowDesel = true;
            mainClass.tradeItem1 = _local_6.frame;
            addFrame(_local_6);
            var _local_8:* = 41;
            _local_6 = {};
            _local_6.frame = new LPFFrameListViewTabbed();
            _local_6.fData = {"list":fData.itemsC};
            _local_6.r = {
                "x":675,
                "y":_local_8,
                "w":265,
                "h":225
            };
            _local_6.tabStates = MovieClip(fParent).getTabStates();
            _local_6.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Enhancement", "Sword", "Axe", "Dagger", "Claw", "Gun", "Bow", "Mace", "Spear", "Polearm", "Scythe", "Staff", "Wand", "Shield", "Class", "Armor", "Helm", "Cape", "Earrings", "Ring", "Necklace", "Egg", "Pet", "House", "Wall Item", "Floor Item"];
            _local_6.filterMap = {
                "Weapon":["Shield", "Sword", "Axe", "Dagger", "Claw", "Gun", "Bow", "Mace", "Spear", "Polearm", "Scythe", "Staff", "Wand"],
                "ar":["Class", "Armor"],
                "he":["Helm"],
                "ba":["Cape", "Wings"],
                "pe":["Egg", "Pet"],
                "am":["Earrings", "Ring", "Necklace"],
                "it":["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                "enh":["Enhancement"]
            };
            _local_6.sName = "their";
            _local_6.itemEventType = "otherSel";
            _local_6.tabEventType = "categorySelTheirOffer";
            _local_6.eventTypes = ["refreshItems", "refreshBank", "categorySelTheirOffer"];
            _local_6.onDemand = true;
            _local_6.openBlank = false;
            _local_6.allowDesel = true;
            mainClass.tradeItem2 = _local_6.frame;
            addFrame(_local_6);
            _local_6.eventTypes = ["refreshItems", "refreshBank", "refreshSlots"];
            _local_6.isBank = true;
            addFrame(_local_6);
            _local_7 = 41;
            _local_6 = {};
            _local_6.frame = new LPFFrameListViewTabbed();
            _local_6.fData = {"list":fData.itemsI};
            _local_6.r = {
                "x":37,
                "y":_local_7,
                "w":265,
                "h":311
            };
            _local_6.tabStates = MovieClip(fParent).getTabStates();
            _local_6.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Enhancement", "Sword", "Axe", "Dagger", "Claw", "Gun", "Bow", "Mace", "Spear", "Polearm", "Scythe", "Staff", "Wand", "Shield", "Class", "Armor", "Helm", "Cape", "Earrings", "Ring", "Necklace", "Egg", "Pet", "House", "Wall Item", "Floor Item"];
            _local_6.filterMap = {
                "Weapon":["Shield", "Sword", "Axe", "Dagger", "Claw", "Gun", "Bow", "Mace", "Spear", "Polearm", "Scythe", "Staff", "Wand"],
                "ar":["Class", "Armor"],
                "he":["Helm"],
                "ba":["Cape", "Wings"],
                "pe":["Egg", "Pet"],
                "am":["Earrings", "Ring", "Necklace"],
                "it":["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                "enh":["Enhancement"]
            };
            _local_6.sName = "inventory";
            _local_6.itemEventType = "inventorySel";
            _local_6.eventTypes = ["refreshItems", "refreshInventory"];
            _local_6.openBlank = false;
            _local_6.allowDesel = true;
            mainClass.tradeItem3 = _local_6.frame;
            addFrame(_local_6);
            _local_6 = {};
            _local_6.frame = new LPFFrameSimpleText();
            _local_6.fData = {"msg":""};
            _local_6.r = {
                "x":-1,
                "y":42,
                "w":200,
                "h":-1,
                "center":true
            };
            addFrame(_local_6);
            _local_6 = {};
            _local_6.frame = new LPFFrameGenericButton();
            _local_6.fData = null;
            _local_6.r = {
                "x":127,
                "y":365,
                "w":100,
                "h":-1
            };
            _local_6.eventTypes = ["previewButton1Update"];
            addFrame(_local_6);
            bg.btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
        }


    }
}//package 

