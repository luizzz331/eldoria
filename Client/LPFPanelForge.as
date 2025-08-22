// AQW - PRIME
// Client By AE
// Edited by g14k
// Long Live the Biladerios

//LPFPanelForge

package 
{
    import flash.geom.Point;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.geom.*;

    public class LPFPanelForge extends LPFPanel 
    {

        public function LPFPanelForge():void
        {
            x = 0;
            y = 0;
            frames = [];
            fData = {};
        }

        override public function fOpen(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:Object;
            fData = _arg_1.fData;
            drawBG(LPFPanelBg5);
            bg.tTitle.text = "Forge";
            bg.tPane1.text = "Requirements";
            bg.tPane2.text = "Forge List";
            _local_3 = _arg_1.r;
            x = _local_3.x;
            if (_local_3.y > -1)
            {
                y = _local_3.y;
            }
            else
            {
                _local_2 = fParent.numChildren;
                if (_local_2 > 1)
                {
                    y = ((fParent.getChildAt((_local_2 - 2)).y + fParent.getChildAt((_local_2 - 2)).height) + 10);
                }
                else
                {
                    y = 10;
                };
            };
            var _local_4:Point = new Point(0, 0);
            _local_4 = bg.localToGlobal(_local_4);
            bg.y = (bg.y - int((_local_3.y - _local_4.y)));
            w = _local_3.w;
            h = _local_3.h;
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
            var _local_5:Object = {};
            _local_5 = {};
            _local_5.frame = new LPFFrameBackdrop();
            _local_5.fData = null;
            _local_5.r = {
                "x":15,
                "y":36,
                "w":1,
                "h":1
            };
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameBackdrop();
            _local_5.fData = null;
            _local_5.r = {
                "x":15,
                "y":244,
                "w":1,
                "h":1
            };
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameEnhText();
            _local_5.fData = null;
            _local_5.r = {
                "x":9999,
                "y":245,
                "w":-1,
                "h":-1
            };
            _local_5.eventTypes = ["listItemASel"];
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameBackdrop();
            _local_5.fData = null;
            _local_5.r = {
                "x":463,
                "y":44,
                "w":290,
                "h":310
            };
            addFrame(_local_5);
            _local_5 = {};
            _local_5.frame = new LPFFrameListViewTabbed();
            _local_5.fData = {"list":fData.items};
            _local_5.r = {
                "x":463,
                "y":50,
                "w":265,
                "h":270
            };
            _local_5.tabStates = MovieClip(fParent).getTabStates();
            _local_5.sortOrder = ["Note", "Resource", "Item", "Quest Item", "ServerUse", "Enhancement", "Sword", "Axe", "Dagger", "Claw", "Gun", "Bow", "Mace", "Spear", "Polearm", "Scythe", "Staff", "Wand", "Shield", "Class", "Armor", "Helm", "Cape", "Earrings", "Ring", "Necklace", "Egg", "Pet", "House", "Wall Item", "Floor Item"];
            _local_5.filterMap = {
                "Weapon":["Shield", "Sword", "Axe", "Dagger", "Claw", "Gun", "Bow", "Mace", "Spear", "Polearm", "Scythe", "Staff", "Wand"],
                "ar":["Class", "Armor"],
                "he":["Helm"],
                "ba":["Cape"],
                "pe":["Egg", "Pet"],
                "am":["Earrings", "Ring", "Necklace"],
                "it":["Note", "Resource", "Item", "Quest Item", "ServerUse", "House", "Wall Item", "Floor Item"],
                "enh":["Enhancement"]
            };
            _local_5.sName = "itemListA";
            _local_5.itemEventType = "listItemASel";
			_local_3.eventTypes = ["listItemASel", "refreshItems"];
            _local_3.filter = "sES";
            addFrame(_local_5);
            bg.btnClose.addEventListener(MouseEvent.CLICK, onCloseClick, false, 0, true);
        }
    }
}