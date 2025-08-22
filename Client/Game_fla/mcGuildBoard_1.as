// AQW - PRIME
// Client By AE
// Edited by g14k
// Long Live the Biladerios
// original by alter

//mcGuildBoard_1

package Game_fla
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import fl.motion.Color;
    import flash.geom.ColorTransform;
    import fl.motion.AdjustColor;
    import flash.filters.ColorMatrixFilter;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.display.*;
    import flash.external.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.events.*;
    import fl.motion.*;
    import flash.utils.*;
    import flash.filters.*;

    public dynamic class mcGuildBoard_1 extends MovieClip 
    {

        public var rootClass:*;
        public var tTitle:TextField;
        public var btnClose:SimpleButton;
        public var PlayerList:Array;
        public var Loaded:int = 0;
        public var ItemLoaded:int = 0;
        public var txtLoad:TextField;
        public var txtGuild:TextField;
        public var txtGuilds:TextField;
        public var btnSearch:SimpleButton;
        public var btnExplore:SimpleButton;
        public var btnApply:SimpleButton;
        public var Counter:int = 0;
        public var playerList:MovieClip;
        public var Element:*;
        public var color:Color = new Color();
        public var cntMask:MovieClip;
        public var SBar:MovieClip;
        public var hRun:Number;
        public var dRun:Number;
        public var oy:Number;
        public var mDown:Boolean;
        public var mbY:int;
        public var mbD:int;
        public var mhY:int;
        public var mcStatistics:MovieClip;
        private var defaultCT:ColorTransform;
        private var greyCT:ColorTransform;
        public var SelectedGuildID:int = 0;
        public var SelectedGuildName:String = "";
        private var ButtonColor:AdjustColor;
        private var Filter:ColorMatrixFilter;

        public function mcGuildBoard_1()
        {
			super();
			addFrameScript(0, frame1);
			rootClass = stage.getChildAt(0);
			defaultCT = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
			greyCT = new ColorTransform(0.4, 0.4, 0.4, 1, -20, -20, -20, 0);
			ButtonColor = new AdjustColor();
        }

        internal function frame1():*
        {
			tTitle.text = "Guild List Board";
			rootClass.sfc.sendXtMessage("zm", "guild", ["gll"], "str", -1);
			SBar.buttonMode = true;
			playerList.mask = cntMask;
			btnApply.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true);
			btnClose.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true);
			btnSearch.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true);
			//btnExplore.addEventListener(MouseEvent.CLICK, onMouseEventClick, false, 0, true);
        }

        internal function initScroll():void
        {
            mDown = false;
            hRun = (SBar.bar.b.height - SBar.h.height);
            dRun = (playerList.height - cntMask.height + 20);
            oy = playerList.y;
            if (Counter > 8)
            {
				SBar.transform.colorTransform = defaultCT;
                SBar.h.addEventListener(MouseEvent.MOUSE_DOWN, onScrDown, false, 0, true);
				stage.addEventListener(MouseEvent.MOUSE_UP, onScrUp, false, 0, true);
				playerList.addEventListener(Event.ENTER_FRAME, dEF, false, 0, true);
                SBar.h.addEventListener(Event.ENTER_FRAME, hEF, false, 0, true);
            }
            else
            {
                SBar.transform.colorTransform = greyCT;
                if (SBar.h.hasEventListener(MouseEvent.MOUSE_DOWN))
                {
                    SBar.h.removeEventListener(MouseEvent.MOUSE_DOWN, onScrDown);
                };
                if (stage.hasEventListener(MouseEvent.MOUSE_UP))
                {
                    stage.removeEventListener(MouseEvent.MOUSE_UP, onScrUp);
                };
                if (SBar.h.hasEventListener(Event.ENTER_FRAME))
                {
                    SBar.h.removeEventListener(Event.ENTER_FRAME, hEF);
                };
                if (playerList.hasEventListener(Event.ENTER_FRAME))
                {
                    playerList.removeEventListener(Event.ENTER_FRAME, dEF);
                };
            };
        }

        public function onScrDown(_arg_1:MouseEvent):*
        {
            mbY = int(mouseY);
            (mhY = int(SBar.h.y));
            (mDown = true);
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
                _local_2 = SBar;
                mbD = (int(mouseY) - mbY);
                _local_2.h.y = (mhY + mbD);
                if ((_local_2.h.y + _local_2.h.height) > _local_2.bar.b.height)
                {
                    _local_2.h.y = int((_local_2.bar.b.height - _local_2.h.height));
                };
                if (_local_2.h.y < 0)
                {
                    _local_2.h.y = 0;
                };
            };
        }

        public function dEF(_arg_1:Event):*
        {
            var _local_2:* = SBar;
            var _local_3:* = playerList;
            var _local_4:* = (-(_local_2.h.y) / hRun);
            var _local_5:* = (int((_local_4 * dRun)) + oy);
            if (Math.abs((_local_5 - _local_3.y)) > 0.2)
            {
                _local_3.y = (_local_3.y + (_local_5 - _local_3.y));
            }
            else
            {
                _local_3.y = _local_5;
            };
        }

        public function distributeList(guild:Array, totalGuilds:int):void
        {
            var i:int;
            try
            {
                i = (playerList.numChildren - 1);
                while (i >= 0)
                {
                    if ((playerList.getChildAt(i) is MovieClip))
                    {
                        playerList.removeChildAt(i);
                    };
                    i--;
                };
            }
            catch(e)
            {
            };
			try
			{
				txtGuilds.text = (guild.length + " / " + totalGuilds);
				mcStatistics.intRun.text = guild.length;
				mcStatistics.intDisband.text = (totalGuilds - guild.length);
				mcStatistics.intTotal.text = totalGuilds;
				onGuildLoadComplete(guild);
			}
			catch(e)
            {
            };
        }

        public function onGuildLoadComplete(guildBoard:Array):*
        {
			updateApplyButton();
            var statusColor:*;
			var guildObj:*
            playerList.y = 145;
            SBar.h.y = 0;
			Counter = 0;
            while (Counter < guildBoard.length)
			{
				guildObj = guildBoard[Counter];
				txtLoad.text = "";
				initScroll();
                statusColor = "#FFFFFF";
                switch (guildObj.Status)
                {
                    case "Open":
                        statusColor = "#00FF00";
                        break;
                    case "Close":
                        statusColor = "#FF0000";
                        break;
                    case "Petition":
                        statusColor = "#FFFFFF";
                        break;
                };
				Element = (playerList.addChild(new GuildListElement(rootClass)) as MovieClip);
				//Element.x = -15.3;
				Element.y = (Counter * 30 + -6.1);
				Element.GuildID = guildObj.id;
				Element.txtName.htmlText = guildObj.Name;
				Element.txtOwner.htmlText = guildObj.Master;
                Element.txtSlot.htmlText = (guildObj.Members + " / " + guildObj.MaxMembers);
                Element.txtStatus.htmlText = "<font color='"+ statusColor +"'>" + guildObj.Status + "</font>";
                Element.txtLvl.htmlText = "LvL " + guildObj.Level;
				Element.buttonMode = true;
				Element.txtName.mouseEnabled = false;
				Element.txtOwner.mouseEnabled = false;
				Element.txtSlot.mouseEnabled = false;
				Element.txtStatus.mouseEnabled = false;
				Element.txtLvl.mouseEnabled = false;
				Element.addEventListener(MouseEvent.CLICK, onPlayerClick, false, 0, true);
				Element.addEventListener(MouseEvent.MOUSE_OVER, onPlayerHover, false, 0, true);
				Element.addEventListener(MouseEvent.MOUSE_OUT, onPlayerOut, false, 0, true);
				Counter++
            };
        }

        public function onPlayerClick(_arg_1:MouseEvent):*
        {
            rootClass.mixer.playSound("Click");
            if (SelectedGuildID == 0 || SelectedGuildID != MovieClip(_arg_1.currentTarget).GuildID)
            {
                SelectedGuildID = MovieClip(_arg_1.currentTarget).GuildID;
            }
            else if (SelectedGuildID == MovieClip(_arg_1.currentTarget).GuildID)
			{
				SelectedGuildID = 0;
			};
            (SelectedGuildName = MovieClip(_arg_1.currentTarget).txtName.text);
            updateApplyButton();
        }

        public function onPlayerHover(_arg_1:MouseEvent):*
        {
            color.brightness = 0.1;
            MovieClip(_arg_1.currentTarget).transform.colorTransform = color;
        }

        public function onPlayerOut(_arg_1:MouseEvent):*
        {
            color.brightness = 0;
            MovieClip(_arg_1.currentTarget).transform.colorTransform = color;
        }

        public function onMouseEventClick(_arg_1:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
            switch (_arg_1.currentTarget.name)
            {
                case "btnApply":
                    if (SelectedGuildID > 0)
                    {
                        rootClass.sfc.sendXtMessage("zm", "guild", ["gpa", SelectedGuildID], "str", -1);
                    }
                    else
                    {
                        rootClass.MsgBox.notify("You don't have a guild selected!");
                    };
                    return;
                case "btnSearch":
                    if (txtGuild.text == "")
                    {
                        rootClass.sfc.sendXtMessage("zm", "guild", ["gll"], "str", -1);
                    }
                    else
                    {
                        rootClass.sfc.sendXtMessage("zm", "guild", ["gsl", txtGuild.text], "str", -1);
                    };
                    return;
                case "btnExplore":
                    if (SelectedGuildID != 0)
                    {
                        navigateToURL(new URLRequest((rootClass.getGuildPath() + SelectedGuildName)), "_blank");
                    }
                    else
                    {
                        navigateToURL(new URLRequest(rootClass.getGuildsPath()), "_blank");
                    };
                    return;
                case "btnClose":
                    MovieClip(parent).onClose();
				return;
            };
        }

        public function updateApplyButton():void
        {
            if (SelectedGuildID > 0)
            {
                Filter = new ColorMatrixFilter(ButtonColor.CalculateFinalFlatArray());
				btnApply.filters = [Filter];
				ButtonColor.brightness = 0;
                ButtonColor.hue = 0;
                ButtonColor.saturation = 0;
                ButtonColor.contrast = 0;
            }
            else
            {
				Filter = new ColorMatrixFilter(ButtonColor.CalculateFinalFlatArray());
				btnApply.filters = [Filter];
				ButtonColor.brightness = 0;
				ButtonColor.contrast = 0;
                ButtonColor.saturation = -100;
                ButtonColor.hue = 0;
            };
        }

        public function fClose():void
        {
            MovieClip(parent).onClose();
        }
    }
}