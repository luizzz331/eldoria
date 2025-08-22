// AQW - PRIME
// Client By AE
// Edited by g14k
// Long Live the Biladerios

//Game_fla.mcPopup_328

package Game_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.Event;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.events.MouseEvent;
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

    public dynamic class mcPopup_328 extends MovieClip 
    {
		
		public var mcRedeem:MovieClip;
		public var mcGuildBoard:MovieClip;
		public var tradeId:int;
        public var tradeUser:String;
        public var mcCharpanel:CharpanelMC;
        public var mcBag:SimpleButton;
        public var mcHouseShop:HouseShop;
        public var mcCustomize:MovieClip;
        public var mcMap:MovieClip;
        public var mcTempInventory:TempInventory;
        public var mcPVPPanel:PVPPanelMC;
        public var mcHouseItemHandle:HouseItemHandleMC;
        public var reportMC:MovieClip;
        public var mcHouseOptions:MovieClip;
        public var mcBook:MovieClip;
        public var cnt:FactionsMC;
        public var mcHouseMenu:HouseMenu;
        public var mcCustomizeArmor:MovieClip;
        public var GuildBG:MovieClip;
        public var mcNews:MovieClip;
        public var rootClass:MovieClip;
        public var world:MovieClip;
        public var fData:Object;
        public var layout:LPFLayout;
        public var guild:*;
        public var li:mcGuildListItem;
        public var onlineCount:int;
        public var Rank:int;
        public var maxGuildSlots:int;
        public var i:*;
        public var hRun:Number;
        public var dRun:Number;
        public var oy:Number;
        public var mbY:int;
        public var mhY:int;
        public var mbD:int;
        public var mDown:Boolean;

        public function mcPopup_328()
        {
            addFrameScript(0, frame1, 1, frame2, 6, frame7, 14, frame15, 23, frame24, 29, frame30, 39, frame40, 48, frame49, 57, frame58, 64, frame65, 71, frame72, 78, frame79, 86, frame87, 94, frame95, 102, frame103, 111, frame112, 120, frame121, 128, frame129, 138, frame139, 148, frame149, 159, frame160, 169, frame170, 179, frame180, 189, frame190, 199, frame200);
        }

        public function fOpen(_arg_1:String, _arg_2:Object=null):void
        {
            if (currentLabel != _arg_1)
            {
                fClose();
                if (_arg_2 != null)
                {
                    fData = _arg_2;
                };
                gotoAndStop(_arg_1);
                visible = true;
            };
        }

        public function fClose():*
        {
            var _local_1:MovieClip = MovieClip(this);
            if (_local_1.mcHouseMenu != null)
            {
                _local_1.mcHouseMenu.fClose();
            };
            if (getChildByName("mcInventory") != null)
            {
                MovieClip(getChildByName("mcInventory")).fClose();
            };
            if (getChildByName("mcShop") != null)
            {
                MovieClip(getChildByName("mcShop")).fClose();
            };
            if (getChildByName("mcBank") != null)
            {
                MovieClip(getChildByName("mcBank")).fClose();
            };
            if (getChildByName("mcCharpanel") != null)
            {
                MovieClip(getChildByName("mcCharpanel")).fClose();
            };
			if (getChildByName("mcTrade") != null)
            {
                MovieClip(getChildByName("mcTrade")).fClose();
            };
			if (getChildByName("mcForge") != null)
            {
                MovieClip(getChildByName("mcForge")).fClose();
            };
        }

        public function onClose(_arg_1:Event=null):void
        {
            trace("mcPopup.onClose >");
            if (((!(currentLabel == "Init")) && (!(currentFrame == 1))))
            {
                fClose();
                MovieClip(Game.root).mixer.playSound("Click");
                if ((((world.isMyHouse()) && (!(world.mapLoadInProgress))) && (!(currentLabel == "House"))))
                {
                    gotoAndPlay("House");
                }
                else
                {
                    trace(" > init");
                    gotoAndPlay("Init");
                };
            };
        }
		
        public function loadMap(_arg_1:String):*
        {
            mcMap.removeChildAt(0);
            var _local_2:Loader = new Loader();
            _local_2.load(new URLRequest((Game.serverFilePath + _arg_1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcMap.addChild(_local_2);
        }

        public function loadNews(_arg_1:String):*
        {
            mcNews.removeChildAt(0);
            var _local_2:Loader = new Loader();
            _local_2.load(new URLRequest((Game.serverFilePath + _arg_1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcNews.addChild(_local_2);
        }

        public function loadBook(_arg_1:String):*
        {
            trace((Game.serverFilePath + _arg_1));
            rootClass.sfc.sendXtMessage("zm", "book", [], "str", 1);
            mcBook.removeChildAt(0);
            var _local_2:Loader = new Loader();
            _local_2.load(new URLRequest((Game.serverFilePath + _arg_1)), new LoaderContext(false, ApplicationDomain.currentDomain));
            mcBook.addChild(_local_2);
        }

        public function getRank(_arg_1:int):String
        {
            var _local_2:* = "";
            switch (Number(_arg_1))
            {
                case 0:
                    _local_2 = "Duffer";
                    break;
                case 1:
                    _local_2 = "Member";
                    break;
                case 2:
                    _local_2 = "Commander";
                    break;
                case 3:
                    _local_2 = "Master";
                    break;
            };
            return (_local_2);
        }

        public function onGClose(_arg_1:MouseEvent):void
        {
            GuildBG.scr.hit.removeEventListener(MouseEvent.MOUSE_DOWN, onScrDown);
            stage.removeEventListener(MouseEvent.MOUSE_UP, onScrUp);
            GuildBG.scr.h.removeEventListener(Event.ENTER_FRAME, hEF);
            GuildBG.guildDisplay.removeEventListener(Event.ENTER_FRAME, dEF);
            fClose();
        }

        public function onScrDown(_arg_1:MouseEvent):*
        {
            mbY = int(mouseY);
            mhY = int(GuildBG.scr.h.y);
            mDown = true;
        }

        public function onScrUp(_arg_1:MouseEvent):void
        {
            mDown = false;
        }

        public function hEF(_arg_1:Event):*
        {
            var _local_2:*;
            if (mDown)
            {
                _local_2 = GuildBG.scr;
                mbD = (int(mouseY) - mbY);
                _local_2.h.y = (mhY + mbD);
                if ((_local_2.h.y + _local_2.h.height) > _local_2.b.height)
                {
                    _local_2.h.y = int((_local_2.b.height - _local_2.h.height));
                };
                if (_local_2.h.y < 0)
                {
                    _local_2.h.y = 0;
                };
            };
        }

        public function dEF(_arg_1:Event):*
        {
            var _local_2:* = GuildBG.scr;
            var _local_3:* = GuildBG.guildDisplay;
            var _local_4:* = (-(_local_2.h.y) / hRun);
            var _local_5:* = (int((_local_4 * dRun)) + oy);
            if (Math.abs((_local_5 - _local_3.y)) > 0.2)
            {
                _local_3.y = (_local_3.y + ((_local_5 - _local_3.y) / 4));
            }
            else
            {
                _local_3.y = _local_5;
            };
        }
		
        internal function frame1():*
        {
			
            rootClass = MovieClip(stage.getChildAt(0));
            world = (rootClass.world as MovieClip);
            fData = {};
            visible = false;
            stop();
        }

        internal function frame2():*
        {
			
            fData = {};
            visible = false;
            if (rootClass.mcO != null)
            {
                this.removeChild(rootClass.mcO);
            };
            stop();
        }

        internal function frame7():*
        {
			
            layout = (addChild(new LPFLayoutInvShopEnh()) as LPFLayoutInvShopEnh);
            layout.name = "mcInventory";
            layout.fOpen({
                "fData":{
                    "itemsInv":world.myAvatar.items,
                    "objData":world.myAvatar.objData
                },
                "r":{
                    "x":0,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"inventory"
            });
            layout = null;
            stop();
        }

        internal function frame15():*
        {
			
            stop();
        }

        internal function frame24():*
        {
			
            layout = (addChild(new LPFLayoutInvShopEnh()) as LPFLayoutInvShopEnh);
            layout.name = "mcShop";
            layout.fOpen({
                "fData":{
                    "itemsShop":world.shopinfo.items,
                    "itemsInv":world.myAvatar.items,
                    "objData":world.myAvatar.objData,
                    "shopinfo":world.shopinfo
                },
                "r":{
                    "x":0,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"shopBuy"
            });
            layout = null;
            stop();
        }

        internal function frame30():*
        {
			
            layout = (addChild(new LPFLayoutMergeShop()) as LPFLayoutMergeShop);
            layout.name = "mcShop";
            layout.fOpen({
                "fData":{
                    "itemsShop":world.shopinfo.items,
                    "itemsInv":world.myAvatar.items,
                    "objData":world.myAvatar.objData
                },
                "r":{
                    "x":0,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"shopBuy"
            });
            layout = null;
            stop();
        }

        internal function frame40():*
        {
			
            stop();
        }

        internal function frame49():*
        {
			
            layout = (addChild(new LPFLayoutBank()) as LPFLayoutBank);
            layout.name = "mcBank";
            layout.fOpen({
                "fData":{
                    "itemsB":world.bankinfo.items,
                    "itemsI":world.myAvatar.items,
                    "objData":world.myAvatar.objData
                },
                "r":{
                    "x":0,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"bank"
            });
            layout = null;
            stop();
        }

        internal function frame58():*
        {
			
            loadMap(rootClass.world.objInfo.sMap);
            stop();
        }

        internal function frame65():*
        {
			
            loadNews(rootClass.world.objInfo.sNews);
            stop();
        }

        internal function frame72():*
        {
			
            loadBook(rootClass.world.objInfo.sBook);
            stop();
        }

        internal function frame79():*
        {
			
            rootClass.mcO = ((rootClass.mcO == null) ? (new mcOption(rootClass) as MovieClip) : rootClass.mcO);
            this.addChild(rootClass.mcO);
            rootClass.mcO.x = 600;
            rootClass.mcO.y = 100;
            if (fData.Account == null)
            {
                rootClass.mcO.Init();
            }
            else
            {
                if (fData.Account != null)
                {
                    delete fData.Account;
                    rootClass.mcO.InitAccount();
                };
            };
            stop();
        }

        internal function frame87():*
        {
			
            stop();
        }

        internal function frame95():*
        {
			
            stop();
        }

        internal function frame103():*
        {
			
            stop();
        }

        internal function frame112():*
        {
			
            stop();
        }

        internal function frame121():*
        {
			
            mcHouseMenu.visible = false;
            mcHouseItemHandle.visible = false;
            mcHouseMenu.fOpen("default");
            stop();
        }

        internal function frame129():*
        {
			
            stop();
        }

        internal function frame139():*
        {
			
            stop();
        }

        internal function frame149():*
        {
			
            stop();
        }

        internal function frame160():*
        {
			
            guild = rootClass.world.myAvatar.objData.guild;
            GuildBG.tTitle.text = guild.Name;
            onlineCount = 0;
            maxGuildSlots = 125;
            i = 0;
            while (i < guild.ul.length)
            {
                li = new mcGuildListItem();
                li.x = 0;
                li.y = (i * 17);
                li.tName.text = String(guild.ul[i].userName);
                li.tRank.text = getRank(guild.ul[i].Rank);
                li.tServer.text = guild.ul[i].Server;
                li.tLevel.text = String(guild.ul[i].Level);
				li.tContribution.text = String(rootClass.strNumWithCommas(guild.ul[i].Contribution));
				li.btnAccept.visible = false;
				li.btnDecline.visible = false;
                if (guild.ul[i].Server.toLowerCase() != "offline")
                {
                    onlineCount++;
                };
                GuildBG.guildDisplay.addChild(li);
                i++;
            };
            GuildBG.tMemCount.text = (((String(onlineCount) + "/") + String(guild.ul.length)) + " Online");
            GuildBG.guildDisplay.mask = GuildBG.cntMask;
            if (GuildBG.guildDisplay.height > GuildBG.cntMask.height)
            {
                GuildBG.scr.visible = true;
                GuildBG.scr.hit.alpha = 0;
                GuildBG.scr.h.height = int(((GuildBG.cntMask.height / GuildBG.guildDisplay.height) * GuildBG.scr.b.height));
                hRun = (GuildBG.scr.b.height - GuildBG.scr.h.height);
                dRun = ((GuildBG.guildDisplay.height - GuildBG.cntMask.height) + 5);
                oy = GuildBG.guildDisplay.y;
                GuildBG.scr.hit.addEventListener(MouseEvent.MOUSE_DOWN, onScrDown, false, 0, true);
                stage.addEventListener(MouseEvent.MOUSE_UP, onScrUp, false, 0, true);
                GuildBG.scr.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
                GuildBG.guildDisplay.addEventListener(Event.ENTER_FRAME, dEF, false, 0, true);
            }
            else
            {
                GuildBG.scr.visible = false;
            };
            mDown = false;
        }

		internal function frame170():*
        {
			
            var _local_1:MovieClip;
            var _local_2:MovieClip;
            var _local_3:MovieClip;
            layout = (addChild(new LPFLayoutTrade()) as LPFLayoutTrade);
            layout.name = "mcTrade";
            layout.fOpen({
                "fData":{
                    "itemsB":rootClass.world.tradeinfo.itemsA,
                    "itemsC":rootClass.world.tradeinfo.itemsB,
                    "itemsI":rootClass.world.myAvatar.items,
                    "objData":rootClass.world.myAvatar.objData,
                    "tradeId":tradeId,
                    "tradeUser":tradeUser
                },
                "r":{
                    "x":0,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"trade"
            });
            layout = null;
            stop();
        }
		
		internal function frame180():*
		{
			stop();
		}
		
		internal function frame190():*
        {
            layout = (addChild(new LPFLayoutForge()) as LPFLayoutForge);
            layout.name = "mcForge";
            layout.fOpen(
			{
                "fData":
				{
                    "itemsForge":world.forgeinfo.items,
                    "itemsInv":world.myAvatar.items,
                    "objData":world.myAvatar.objData,
                    "forgeinfo":world.forgeinfo
                },
                "r":
				{
                    "x":0,
                    "y":0,
                    "w":stage.stageWidth,
                    "h":stage.stageHeight
                },
                "sMode":"forge"
            });
            layout = null;
            stop();
        }
		
		internal function frame200():*
		{
			stop();
		}
		
    }
}