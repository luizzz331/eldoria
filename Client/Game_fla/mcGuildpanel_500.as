// AQW - PRIME
// Client By AE
// Edited by g14k
// Long Live the Biladerios

//Game_fla.mcGuildpanel_500

package Game_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
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

    public dynamic class mcGuildpanel_500 extends MovieClip 
    {
		
		public var mcProgress:MovieClip;
		public var mcCommands:MovieClip;
		public var mcMOTD:MovieClip;
		public var mcRecords:MovieClip;
		public var mcGuildXPBar:MovieClip;
		public var btnHelpCommand:SimpleButton;
		public var btnEmergency:MovieClip;
		public var btnShop:SimpleButton;
		public var guildPendingDisplay:MovieClip;
		public var li:mcGuildListItem;
		public var i:int;
		public var guild:*;
		public var btnBuySlots:MovieClip;
		public var btnHall:SimpleButton;
		public var btnPending:SimpleButton;
		public var btnInit:SimpleButton;
        public var btnClose:SimpleButton;
        public var tMemCount:TextField;
        public var cntMask:MovieClip;
        public var tTitle:TextField;
        public var tSlots:TextField;
        public var bg:MovieClip;
        public var guildDisplay:MovieClip;
        public var mcBuyButtons:MovieClip;
		public var maxGuildSlots:int = 100;
		public var rootClass:MovieClip = MovieClip(Game.root);
		public var hRun:Number;
        public var dRun:Number;
        public var oy:Number;
        public var mbY:int;
        public var mhY:int;
        public var mbD:int;
        public var mDown:Boolean;
		public var scr:MovieClip;

        public function mcGuildpanel_500()
        {
            addFrameScript(0, frame1, 1, frame2);
			guild = rootClass.world.myAvatar.objData.guild;
        }
		
		private function onMouseEventClick(mouse:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
			if (rootClass.world.coolDown("buttonClick"))
			{
				switch (mouse.currentTarget.name)
				{
					case "btnEmergency":
						rootClass.sfc.sendXtMessage("zm", "guild", ["gs"], "str", -1);
					break;
					case "btnShop":
						rootClass.world.sendLoadShopRequest(100);
					break;
					case "btnBuySlots":
						if (mcCommands.visible)
						{
							mcCommands.visible = false;
						}
						mcBuyButtons.visible = true;
					break;
					case "btnHall":
						rootClass.world.gotoTown("GuildHall", "Enter", "Spawn");
					break;
					case "btnHelpCommand":
						if (mcBuyButtons.visible)
						{
							mcBuyButtons.visible = false;
						}
						mcCommands.visible = true;
					break;
					case "btnDecline":
						rootClass.sfc.sendXtMessage("zm", "guild", ["gda", MovieClip(mouse.target.parent).tName.text], "str", -1);
					return;
					case "btnAccept":
						rootClass.sfc.sendXtMessage("zm", "guild", ["gaa", MovieClip(mouse.target.parent).tName.text], "str", -1);
					return;
					case "btnInit":
						gotoAndStop("Init");
					return;
					case "btnPending":
						gotoAndStop("Pending");
					return;
					case "btnClose":
						MovieClip(parent).onClose();
					return;
				};
			};
        }
		
		private function onBuySlots(mouse:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
			if (rootClass.world.coolDown("buttonClick"))
			{
				switch (mouse.currentTarget.name)
				{
					case "btnCloseBuy":
						mcBuyButtons.visible = false;
					break;
					case "btnRest":
						if ((maxGuildSlots - int(guild.MaxMembers) * 200) > guild.Fame)
						{
							rootClass.MsgBox.notify("You do not have enough Guild Fame to purchase this.");
						}
						else
						{
							rootClass.world.addMemSlots(maxGuildSlots - int(guild.MaxMembers));
						};
					break;
					case "btnOne":
						rootClass.world.addMemSlots(1);
					break;
				};
			};
		}
		
		private function initBtn():void
		{
			//remove
			btnEmergency.removeEventListener(MouseEvent.MOUSE_OVER, onMouseEventClick);
			btnShop.removeEventListener(MouseEvent.MOUSE_OVER, onMouseEventClick);
			btnBuySlots.removeEventListener(MouseEvent.MOUSE_OVER, onMouseEventClick);
			btnPending.removeEventListener(MouseEvent.MOUSE_OVER, onMouseEventClick);
			btnInit.removeEventListener(MouseEvent.MOUSE_OVER, onMouseEventClick);
			btnHelpCommand.removeEventListener(MouseEvent.MOUSE_OVER, onMouseEventClick);
			btnHall.removeEventListener(MouseEvent.MOUSE_OVER, onMouseEventClick);
			btnClose.removeEventListener(MouseEvent.MOUSE_OVER, onMouseEventClick);
			//add
			btnEmergency.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true);
			btnShop.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true);
			btnBuySlots.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true);
			btnPending.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true);
            btnInit.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true);
            btnHelpCommand.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true);
            btnHall.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true);
            btnClose.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true);
		}
		
		private function onScrDown(_arg_1:MouseEvent):*
        {
            mbY = int(mouseY);
            mhY = int(scr.h.y);
            mDown = true;
        }

        private function onScrUp(_arg_1:MouseEvent):void
        {
            mDown = false;
        }

        private function hEF(_arg_1:Event):*
        {
            var _local_2:*;
            if (mDown)
            {
                _local_2 = scr;
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

        private function dEF(_arg_1:Event):*
        {
            var _local_2:* = scr;
            var _local_3:* = guildDisplay;
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
		
		private function initGuildXP():void
		{
			mcProgress.mcGuildXPBar.mcGuildXP.scaleX = 0;
			mcProgress.mcGuildXPBar.removeEventListener(MouseEvent.MOUSE_OVER, onGuildXPBarMouseOver);
            mcProgress.mcGuildXPBar.removeEventListener(MouseEvent.MOUSE_OUT, onGuildXPBarMouseOut);
            mcProgress.mcGuildXPBar.strXP.visible = false;
            mcProgress.mcGuildXPBar.addEventListener(MouseEvent.MOUSE_OVER, onGuildXPBarMouseOver);
            mcProgress.mcGuildXPBar.addEventListener(MouseEvent.MOUSE_OUT, onGuildXPBarMouseOut);
			updateGuildXPBar();
		}
		
		private function updateGuildXPBar():void
        {
			mcBuyButtons.btnCloseBuy.removeEventListener(MouseEvent.CLICK, onBuySlots);
			mcBuyButtons.btnOne.removeEventListener(MouseEvent.CLICK, onBuySlots);
            mcBuyButtons.btnRest.removeEventListener(MouseEvent.CLICK, onBuySlots);
			mcBuyButtons.btnOne.addEventListener(MouseEvent.CLICK, onBuySlots, false, 0, true);
			mcBuyButtons.btnCloseBuy.addEventListener(MouseEvent.CLICK, onBuySlots, false, 0, true);
			mcBuyButtons.btnRest.addEventListener(MouseEvent.CLICK, onBuySlots, false, 0, true);
            var Exp:int = guild.Exp;
            var ExpToLevel:int = guild.ExpToLevel;
            var percent:int = (Exp / ExpToLevel * 100);
            mcProgress.mcGuildXPBar.mcGuildXP.scaleX = (guild.Exp / guild.ExpToLevel);
            if (percent >= 100)
            {
                percent = 100;
            };
            mcProgress.mcGuildXPBar.strXP.text = (Exp + " / " + ExpToLevel + " (" + percent + ")%");
        }
		
		public function onGuildXPBarMouseOver(_arg_1:MouseEvent):*
        {
            MovieClip(_arg_1.currentTarget).strXP.visible = true;
        }

        public function onGuildXPBarMouseOut(_arg_1:MouseEvent):*
        {
            MovieClip(_arg_1.currentTarget).strXP.visible = false;
        }
		
		private function initGuildRecords():void
		{
			var warWins:int = guild.WarWins;
			var warLoses:int = guild.WarLoses;
			var warPercentage:int = (warWins / warLoses * 100);
			if (warPercentage >= 100)
            {
                warPercentage = 100;
            };
			
			var raidWins:int = guild.RaidWins;
			var raidLoses:int = guild.RaidLoses;
			var raidPercentage:int = (raidWins / raidLoses * 100);
			if (raidPercentage >= 100)
            {
                raidPercentage = 100;
            };
			
			mcRecords.txtWars.htmlText = (warWins + " / " + warLoses + " (" + warPercentage + ")%");
			mcRecords.txtRaids.htmlText = (raidWins + " / " + raidLoses + " (" + raidPercentage + ")%");
		}
		
		private function initMOTD():void
		{
			mcMOTD.txtMOTD.text = guild.MOTD;
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
		
		
        public function updateGuildWindow():void
        {
            var avaiableSlots:int;
            if (rootClass.world.myAvatar.objData.guildRank == 3 && guild.MaxMembers < maxGuildSlots)
            {              
				avaiableSlots = maxGuildSlots - int(guild.MaxMembers);
                tSlots.text = String(guild.MaxMembers) + "/" + String(maxGuildSlots);
                mcBuyButtons.txtRest.text = "(" + String(avaiableSlots) + ")";
                mcBuyButtons.txtRestCost.text = String(rootClass.strNumWithCommas(avaiableSlots * 200)) + String(" Fame");
                mcBuyButtons.txtCoins.text = String(rootClass.strNumWithCommas(guild.Fame));
            }
            else
            {
                tSlots.text = ((String(rootClass.world.myAvatar.objData.guild.MaxMembers) + "/") + String(maxGuildSlots));
                btnBuySlots.visible = false;
				btnEmergency.visible = false;
            };
        }
		
		public function initGuildProgress():void
		{
			mcProgress.strLevel.text = "< Level " + guild.Level + ">";
			initGuildXP();
		}
		
		internal function frame1():*
		{
			mcCommands.visible = false;
			mcBuyButtons.visible = false;
			initBtn();
			updateGuildWindow();
			initMOTD();
			initGuildProgress();
			initGuildRecords();
			stop();
		}
		
		internal function frame2():*
		{
			initBtn();
			
			var _local_1:int;
            try
            {
                _local_1 = (guildPendingDisplay.numChildren - 1);
                while (_local_1 >= 0)
                {
                    if ((guildPendingDisplay.getChildAt(_local_1) is MovieClip))
                    {
                        guildPendingDisplay.removeChildAt(_local_1);
                    };
                    _local_1--;
                };
            }
            catch(e)
            {
            };
			
			i = 0;
			while (i < guild.pl.length)
			{
				li = new mcGuildListItem();
				li.btnDecline.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true), 
				li.btnAccept.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true), 
				li.x = 0;
				li.y = 17 + i;
				li.tName.text = String(guild.pl[i].userName);
                li.tRank.text = getRank(guild.pl[i].Rank);
                li.tServer.text = guild.pl[i].Server;
                li.tLevel.text = String(guild.pl[i].Level);
				li.tContribution.text = guild.pl[i].Contribution;
				guildPendingDisplay.addChild(li);
				i++;
			};
			guildPendingDisplay.mask = cntMask;
			if (guildPendingDisplay.height > cntMask.height)
			{
				scr.visible = true;
				scr.hit.alpha = 0;
				scr.h.height = int(cntMask.height / guildDisplay.height * scr.b.height);
				hRun = (scr.b.height - scr.h.height);
                dRun = (guildDisplay.height - cntMask.height + 5);
                oy = guildDisplay.y;
                scr.hit.addEventListener(MouseEvent.MOUSE_DOWN, onScrDown, false, 0, true);
                stage.addEventListener(MouseEvent.MOUSE_UP, onScrUp, false, 0, true);
                scr.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
                guildDisplay.addEventListener(Event.ENTER_FRAME, dEF, false, 0, true);
			}
			else
			{
				scr.visible = false;
			};
			mDown = false;
			stop();
		}
		
    }
}