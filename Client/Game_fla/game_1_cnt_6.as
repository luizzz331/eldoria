﻿// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//Game_fla.game_1_cnt_6

package Game_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.utils.Dictionary;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import flash.events.MouseEvent;
    import flash.events.Event;
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

    public dynamic class game_1_cnt_6 extends MovieClip 
    {
	
        public var btnMac:SimpleButton;
        public var mcTitle:MovieClip;
        public var mcForgotPassword:SimpleButton;
        public var il:MovieClip;
        public var chkUserName:MovieClip;
        public var chkPassword:MovieClip;
        public var ni:TextField;
        public var btnCreate:SimpleButton;
        public var btnWindows:SimpleButton;
        public var mcManageAccount:SimpleButton;
        public var mcPassword:MovieClip;
        public var pi:TextField;
        public var fbConnect:MovieClip;
        public var mcOr:MovieClip;
        public var btnFBLogin:SimpleButton;
        public var sl:ServerList;
        public var ModalStack:MovieClip;
        public var warning:MovieClip;
        public var mcLogo:MovieClip;
        public var btnLogin:SimpleButton;
        public var __setTabDict:Dictionary = new Dictionary(true);
		public var CharacterList:MovieClip;
		public var CreateCharacter:MovieClip;

        public function game_1_cnt_6()
        {
            addFrameScript(0, frame1, 9, frame10, 27, frame28, 37, frame38, 46, frame47, 59, frame60, 69, frame70, 79, frame80, 1, frame2, 2, frame3, 3, frame4, 4, frame5, 5, frame6, 6, frame7);
        }

        public function onCreateClick(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest("https://www.aq.com/landing/"), "_blank");
            btnCreate.removeEventListener(MouseEvent.CLICK, onCreateClick);
        }

        public function getWin(_arg_1:Event):*
        {
            navigateToURL(new URLRequest("http://launch.artix.com/latest/ArtixSetup.msi"), "_blank");
        }

        public function getMac(_arg_1:Event):*
        {
            navigateToURL(new URLRequest("http://launch.artix.com/latest/ArtixGames.dmg"), "_blank");
        }

        internal function __setTab_btnCreate_game_1_cnt():*
        {
            if (((__setTabDict[btnCreate] == undefined) || (!((int(__setTabDict[btnCreate]) >= 1) && (int(__setTabDict[btnCreate]) <= 7)))))
            {
                __setTabDict[btnCreate] = currentFrame;
                btnCreate.tabIndex = 3;
            };
        }

        internal function __setTab_btnLogin_game_1_cnt():*
        {
            if (((__setTabDict[btnLogin] == undefined) || (!((int(__setTabDict[btnLogin]) >= 1) && (int(__setTabDict[btnLogin]) <= 7)))))
            {
                __setTabDict[btnLogin] = currentFrame;
                btnLogin.tabIndex = 3;
            };
        }

        internal function __setTab_btnFBLogin_game_1_cnt():*
        {
            if (((__setTabDict[btnFBLogin] == undefined) || (!((int(__setTabDict[btnFBLogin]) >= 1) && (int(__setTabDict[btnFBLogin]) <= 7)))))
            {
                __setTabDict[btnFBLogin] = currentFrame;
                btnFBLogin.tabIndex = 3;
            };
        }

        internal function frame1():*
        {
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
            FacebookConnect.StopPoll();
            btnCreate.addEventListener(MouseEvent.CLICK, onCreateClick, false, 0, true);
            MovieClip(parent).initLogin();
            try
            {
                mcLogo.txtTitle.htmlText = ('<font color="#FFB231">New Release:</font> ' + MovieClip(parent).sTitle);
            }
            catch(e:Error)
            {
                trace("no sTitle");
            };
            stop();
        }

        internal function frame10():*
        {
            stop();
        }

        internal function frame28():*
        {
            MovieClip(parent).showTracking("3");
            FacebookConnect.StopPoll();
            stop();
        }

        internal function frame38():*
        {
            btnWindows.addEventListener(MouseEvent.CLICK, getWin);
            btnMac.addEventListener(MouseEvent.CLICK, getMac);
        }

        internal function frame47():*
        {
            stop();
        }

        internal function frame60():*
        {
            stop();
        }
		
		internal function frame70():*
        {
            stop();
        }
		
		internal function frame80():*
        {
            stop();
        }

        internal function frame2():*
        {
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
        }

        internal function frame3():*
        {
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
        }

        internal function frame4():*
        {
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
        }

        internal function frame5():*
        {
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
        }

        internal function frame6():*
        {
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
        }

        internal function frame7():*
        {
            __setTab_btnFBLogin_game_1_cnt();
            __setTab_btnLogin_game_1_cnt();
            __setTab_btnCreate_game_1_cnt();
        }


    }
}//package Game_fla

