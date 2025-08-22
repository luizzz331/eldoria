﻿// AQW - PRIME
// Client By AE
// Edited by g14k
// Long Live the Biladerios

//World

package 
{
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.display.BitmapData;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;
    import flash.utils.Timer;
    import flash.geom.ColorTransform;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLRequest;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.display.Bitmap;
    import flash.geom.Matrix;
    import flash.media.Sound;
    import flash.utils.getQualifiedClassName;
    import flash.display.Sprite;
    import flash.display.Graphics;
    import flash.text.TextFormat;
    import flash.filters.GlowFilter;
    import flash.utils.*;
    import flash.external.*;

    public class World extends MovieClip 
    {

        public static var currentInstance:World;

        private const TICK_MAX:* = 24;

        public var uiLock:Boolean = false;
        public var objInfo:Object = new Object();
        public var objSession:Object = new Object();
        public var objResponse:Object = new Object();
        public var objQuestString:*;
        internal var FEATURE_COLLISION:Boolean = true;
        internal var CELL_MODE:String = "normal";
        public var SCALE:Number = 1;
        public var WALKSPEED:Number = 8;
        internal var bitWalk:Boolean = false;
        internal var lastWalk:Date = new Date();
        public var strAreaName:String;
        public var strMapName:String;
        public var strMapFileName:String;
        public var intType:int;
        public var intKillCount:int;
        public var objLock:*;
        public var objExtra:*;
        public var objHouseData:*;
        public var objGuildData:*;
        public var returnInfo:Object;
        public var strFrame:String = "";
        public var strPad:String = "";
        public var spawnPoint:Object = new Object();
        public var FG:MovieClip;
        public var CHARS:MovieClip;
        public var TRASH:MovieClip;
        public var map:MovieClip;
        public var mapBoundsMC:MovieClip = null;
        public var zSortArr:Array = new Array();
        public var ldr_map:Loader = new Loader();
        internal var preLMC:*;
        internal var zManager:MovieClip;
        public var EFAO:Object = {
            "zc":0,
            "zn":1,
            "xpc":0,
            "xpn":50,
            "xpb":false
        };
        public var arrEvent:Array;
        public var arrEventR:Array;
        public var arrSolid:Array;
        public var arrSolidR:Array;
        public var avatars:Object = new Object();
        public var myAvatar:Avatar;
        public var mondef:Array;
        public var monswf:Array;
        public var monmap:Array;
        public var monsters:Array = new Array();
		public var combatAnims:Array = ["Attack1", "Attack2", "Attack3", "Attack4", "Hit", "Knockout", "Getup", "Stab", "Thrash", "Castgood", "Castmagic", "Cast1", "Cast2", "Cast3", "Sword/ShieldFight", "Sword/ShieldAttack1", "Sword/ShieldAttack2", "ShieldBlock", "DuelWield/DaggerFight", "DuelWield/DaggerAttack1", "DuelWield/DaggerAttack2", "FistweaponFight", "FistweaponAttack1", "FistweaponAttack2", "PolearmFight", "PolearmAttack1", "PolearmAttack2", "RangedFight", "RangedAttack1", "RangedAttack2", "GunFight", "GunAttack1", "GunAttack2", "UnarmedFight", "UnarmedAttack1", "UnarmedAttack2", "KickAttack", "FlipAttack", "Dodge"];
		public var staticAnims:Array = ["Fall", "Knockout", "Die"];
        public var bankController:BankController;
        public var forgeinfo:Object;
        public var shopinfo:Object;
        public var shopBuyItem:Object;
        public var enhShopID:int = -1;
        public var enhShopItems:Array;
        public var enhItem:Object;
        public var hairshopinfo:Object;
        public var mapEvents:Object;
        public var adData:Object;
        public var cellMap:Object;
        private var tbmd:BitmapData;
        public var scrollData:Object;
        public var loaderD:ApplicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
        public var loaderC:LoaderContext = new LoaderContext(false, loaderD);
        public var loaderContents:* = [];
        public var loaderContentsFileNames:* = [];
        public var loaderQueue:Array = [];
        public var playerDomains:Object = {};
        public var loaderManager:Object = {
            "i0":{
                "n":"i0",
                "loaderData":null,
                "timer":new Timer(5000, 1),
                "ldr":new Loader(),
                "free":true,
                "url":""
            },
            "i1":{
                "n":"i1",
                "loaderData":null,
                "timer":new Timer(5000, 1),
                "ldr":new Loader(),
                "free":true,
                "url":""
            },
            "i2":{
                "n":"i2",
                "loaderData":null,
                "timer":new Timer(5000, 1),
                "ldr":new Loader(),
                "free":true,
                "url":""
            },
            "i3":{
                "n":"i3",
                "loaderData":null,
                "timer":new Timer(5000, 1),
                "ldr":new Loader(),
                "free":true,
                "url":""
            },
            "i4":{
                "n":"i4",
                "loaderData":null,
                "timer":new Timer(5000, 1),
                "ldr":new Loader(),
                "free":true,
                "url":""
            },
            "i5":{
                "n":"i5",
                "loaderData":null,
                "timer":new Timer(5000, 1),
                "ldr":new Loader(),
                "free":true,
                "url":""
            }
        };
        public var mapLoadInProgress:Boolean = false;
        private var mapW:int = 960;
        private var mapH:int = 550;
        private var mapNW:int = mapW;
        private var mapNH:int = mapH;
        private var mapBmps:Array = [];
        private var mapTimer:Timer = new Timer(2000);
        public var actions:Object = new Object();
        internal var restTimer:Timer = new Timer(2000, 1);
        internal var AATestTimer:Timer = new Timer(700, 1);
        internal var connTestTimer:Timer = new Timer(5000, 1);
        internal var autoActionTimer:Timer = new Timer(2000, 1);
        internal var afkTimer:Timer = new Timer(120000, 1);
        internal var mvTimer:Timer = new Timer(1000, 1);
        internal var mvTimerObj:Object;
        internal var actionTimer:Timer;
        internal var actionMap:Array = new Array();
        internal var autoAction:Object;
        internal var actionReady:Boolean = false;
        internal var actionResults:Object = new Object();
        internal var actionResultsMon:Object = new Object();
        internal var actionID:Number = 0;
        internal var actionIDLimit:Number = 30;
        internal var actionIDMon:Number = 0;
        internal var actionIDLimitMon:Number = 30;
        internal var actionDamage:*;
        internal var actionRangeSpamTS:Number = 0;
        internal var actionResultID:Number = 0;
        internal var actionResultIDLimit:Number = 30;
        internal var minLatencyOneWay:* = 20;
        internal var TcpAckDel:* = 170;
        internal var connMsgOut:* = false;
        public var mData:mapData;
        public var cHandle:cutsceneHandler;
        public var sController:soundController;
        public var chaosNames:Array = new Array();
        public var hideAllCapes:Boolean = false;
        public var hideOtherPets:Boolean = false;
        public var showAnimations:Boolean = true;
        public var showMonsters:Boolean = true;
        public var lock:Object = {
			"loadForge":{
                "cd":3000,
                "ts":0
            },
			"buttonClick":{
				"cd": 1000,
				"ts":0
			},
			"showEmoticon":{
				"cd":2500,
				"ts":0
			},
            "loadShop":{
                "cd":3000,
                "ts":0
            },
            "loadEnhShop":{
                "cd":3000,
                "ts":0
            },
            "loadHairShop":{
                "cd":3000,
                "ts":0
            },
            "equipItem":{
                "cd":1500,
                "ts":0
            },
            "unequipItem":{
                "cd":1500,
                "ts":0
            },
            "buyItem":{
                "cd":1000,
                "ts":0
            },
            "sellItem":{
                "cd":1000,
                "ts":0
            },
            "getMapItem":{
                "cd":1000,
                "ts":0
            },
            "tryQuestComplete":{
                "cd":1250,
                "ts":0
            },
            "abandonQuest":{
                "cd":1000,
                "ts":0
            },
			"acceptQuest":{
                "cd":1000,
                "ts":0
            },
            "doIA":{
                "cd":1000,
                "ts":0
            },
            "rest":{
                "cd":1900,
                "ts":0
            },
            "who":{
                "cd":3000,
                "ts":0
            },
            "tfer":{
                "cd":3000,
                "ts":0
            }
        };
        public var invTree:Object = {};
        public var uoTree:Object = {};
        public var monTree:Object = {};
        public var waveTree:Object = {};
        public var questTree:Object = {};
        public var enhPatternTree:Object = {};
        public var defaultCT:ColorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
        public var whiteCT:ColorTransform = new ColorTransform(1, 1, 1, 1, 0xFF, 0xFF, 0xFF, 0);
        public var iconCT:ColorTransform = new ColorTransform(0.5, 0.5, 0.5, 1, -50, -50, -50, 0);
        public var rarityCA:Array = [0x666666, 0xFFFFFF, 0x66FF00, 2663679, 0xFF00FF, 0xFFCC00, 0xFF0000];
        public var deathCT:ColorTransform = new ColorTransform(0.7, 0.7, 1, 1, -20, -20, 20, 0);
        public var monCT:ColorTransform = new ColorTransform(1, 1, 1, 1, 30, 0, 0, 0);
        public var avtCT:ColorTransform = new ColorTransform(1, 1, 1, 1, 40, 40, 70, 0);
        public var avtWCT:ColorTransform = new ColorTransform(0, 0, 0, 0, 0xFF, 0xFF, 0xFF, 0);
        public var avtMCT:ColorTransform = new ColorTransform(0, 0, 0, 0, 30, 0, 0, 0);
        public var avtPCT:ColorTransform = new ColorTransform(0, 0, 0, 0, 40, 40, 70, 0);
		//Aura effects
		public var blindCT:ColorTransform = new ColorTransform(1, 1, 1, 1, 0x00, 0x00, 0x00, 0);
        public var statusPoisonCT:ColorTransform = new ColorTransform(-0.3, -0.3, -0.3, 0, 0, 100, 0, 0);// poison
        public var statusParalyzeCT:ColorTransform = new ColorTransform(-0.3, -0.3, -0.3, 0, 100, 100, 0, 0);// paralyze
        public var statusBurnCT:ColorTransform = new ColorTransform(-0.3, -0.3, -0.3, 0, 20, 0, 0, 0);// burn
        public var statusFreezeCT:ColorTransform = new ColorTransform(-0.3, -0.3, -0.3, 0, -50, 80, 0xFF, 0);// freeze
        public var statusStoneCT:ColorTransform = new ColorTransform(-1.3, -1.3, -1.3, 0, 100, 100, 100, 0);// stone / petrify
		//
        public var GCD:int = 1500;
        public var GCDO:int = 1500;
        public var GCDTS:Number = 0;
        public var curRoom:int = 1;
        public var modID:int = -1;
        public var partyID:int = -1;
        public var guildID:int = -1;
        public var bPvP:Boolean = false;
        public var partyMembers:Array = [];
        public var partyOwner:String = "";
        public var areaUsers:Array = [];
        public var showHPBar:Boolean = false;
        public var rootClass:MovieClip;
        public var PVPMaps:Array = [
		{
            "nam":"Greenguard Arena",
            "desc":"This arena is for one on one duels.",
            "warzone":"greenguardarena",
            "label":"usorthem",
            "icon":"swords",
            "hidden":false
        }, 
		{
            "nam":"Bludrut Brawl",
            "desc":"A larger map requiring communication, coordination, and a whole lot of DPS.",
            "warzone":"bludrutbrawl",
            "label":"bludrutbrawl",
            "icon":"tower",
            "hidden":false
        }, 
		{
            "nam":"Guildwar!",
            "desc":"Needs Description!",
            "warzone":"guildwar",
            "label":"guildwar",
            "icon":"swords",
            "hidden":true
        }];
        public var PVPQueue:Object = {
            "warzone":"",
            "ts":-1,
            "avgWait":-1
        };
        public var PVPResults:Object = {
            "pvpScore":[],
            "team":0
        };
        public var PVPFactions:Array = [];
        public var bookData:Object;
        public var arrHouseItemQueue:* = [];
        public var ldr_House:Loader = new Loader();
        private var ticksum:Number = 0;
        private var ticklist:* = new Array();
        private var bfps:Boolean = false;
        private var fpsTS:Number = 0;
        private var fpsQualityCounter:int = 0;
        private var fpsArrayQuality:Array = new Array();
        internal var arrQuality:Array = new Array("LOW", "MEDIUM", "HIGH");
		public var tradeinfo:Object = {
            "itemsA":[],
            "itemsB":[],
            "hasRequested":{}
        };

        public function World(_arg_1:MovieClip)
        {
            rootClass = _arg_1;
            currentInstance = this;
            bankController = new BankController();
            map = new MovieClip();
            this.addChild(map);
            CHARS = new MovieClip();
            var _local_2:DisplayObject = this.addChild(CHARS);
            CHARS.mouseEnabled = false;
            _local_2.x = 0;
            _local_2.y = 0;
            rootClass.ui.monsterIcon.redX.visible = false;
            TRASH = new MovieClip();
            this.addChild(TRASH);
            TRASH.mouseEnabled = false;
            TRASH.visible = false;
            TRASH.y = -1000;
            zManager = new MovieClip();
            this.addChild(zManager);
            FG = new MovieClip();
            this.addChild(FG);
            zManager.removeEventListener(Event.ENTER_FRAME, onZmanagerEnterFrame);
            autoActionTimer.removeEventListener("timer", autoActionHandler);
            restTimer.removeEventListener("timer", restRequest);
            AATestTimer.removeEventListener("timer", AATest);
            connTestTimer.removeEventListener("timer", connTest);
            afkTimer.removeEventListener("timer", afkTimerHandler);
            mvTimer.removeEventListener("timer", mvTimerHandler);
            mapTimer.removeEventListener(TimerEvent.TIMER, mapResizeCheck);
            zManager.addEventListener(Event.ENTER_FRAME, onZmanagerEnterFrame, false, 0, true);
            autoActionTimer.addEventListener(TimerEvent.TIMER_COMPLETE, autoActionHandler);
            restTimer.addEventListener("timer", restRequest);
            AATestTimer.addEventListener("timer", AATest);
            connTestTimer.addEventListener("timer", connTest);
            afkTimer.addEventListener("timer", afkTimerHandler);
            mvTimer.addEventListener("timer", mvTimerHandler);
            mapTimer.addEventListener(TimerEvent.TIMER, mapResizeCheck, false, 0, true);
            mapTimer.start();
            initLoaders();
            initCutscenes();
        }

        public static function get GameRoot():MovieClip
        {
            return (currentInstance.rootClass);
        }

        public static function get Bank():BankController
        {
            return (currentInstance.bankController);
        }


        public function initGuildhallData(_arg_1:Array):void
        {
            var _local_3:*;
            trace(("gd: " + _arg_1));
            var _local_2:uint;
            while (_local_2 < _arg_1.length)
            {
                trace(("i: " + _local_2));
                for (_local_3 in _arg_1[_local_2])
                {
                    trace(((((("gd[" + _local_2) + "].[") + _local_3) + "]: ") + _arg_1[_local_2][_local_3]));
                };
                _local_2++;
            };
        }

        public function killTimers():void
        {
            autoActionTimer.reset();
            restTimer.reset();
            AATestTimer.reset();
            connTestTimer.reset();
            afkTimer.reset();
            rootClass.chatF.mute.timer.reset();
            autoActionTimer.removeEventListener("timer", autoActionHandler);
            restTimer.removeEventListener("timer", restRequest);
            AATestTimer.removeEventListener("timer", AATest);
            connTestTimer.removeEventListener("timer", connTest);
            afkTimer.removeEventListener("timer", afkTimerHandler);
            mvTimer.removeEventListener("timer", mvTimerHandler);
            rootClass.chatF.mute.timer.removeEventListener("timer", rootClass.chatF.unmuteMe);
        }

        public function killListeners():void
        {
            zManager.removeEventListener(Event.ENTER_FRAME, onZmanagerEnterFrame);
            removeChild(zManager);
        }

        public function queueLoad(_arg_1:*):*
        {
            _arg_1.retries = 1;
            loaderQueue.push(_arg_1);
            var _local_2:* = getFreeLoader();
            if (_local_2 != null)
            {
                loadNext(_local_2);
            };
        }

        public function loaderCallback(_arg_1:Event):*
        {
            var _local_2:* = _arg_1.target.loader;
            var _local_3:* = getLoaderHost(_local_2);
            if (_local_3 != null)
            {
                if (_local_3.callBackA != null)
                {
                    _local_3.callBackA(_arg_1);
                };
            };
            closeLoader(_local_3, true);
        }

        public function loaderErrorHandler(_arg_1:IOErrorEvent):*
        {
            var _local_2:String = _arg_1.toString();
            var _local_3:String = _local_2.substr((_local_2.indexOf("URL: ") + 5));
            _local_3 = _local_3.substr(0, (_local_3.length - 1));
            var _local_4:* = getLoaderHostByURL(_local_3);
            if (_local_4 != null)
            {
                if (_local_4.callBackB != null)
                {
                    _local_4.callBackB(_arg_1);
                };
            };
            closeLoader(_local_4, false, false);
        }

        private function loaderProgressHandler(_arg_1:Event):*
        {
            var _local_2:* = _arg_1.currentTarget;
            var _local_3:* = getLoaderHostByLoaderInfo(_local_2);
            if (_local_3 != null)
            {
                _local_3.isOpen = true;
            };
        }

        private function loaderTimerComplete(_arg_1:TimerEvent):void
        {
            var _local_2:* = getLoaderHostByTimer(Timer(_arg_1.currentTarget));
            if (_local_2 != null)
            {
                _local_2.timer.reset();
                if (!_local_2.isOpen)
                {
                    if (_local_2.loaderData.retries-- > 0)
                    {
                        loaderQueue.push(_local_2.loaderData);
                    };
                    closeLoader(_local_2, false, true);
                };
            };
        }

        public function getLoaderHost(_arg_1:*):*
        {
            var _local_2:*;
            for (_local_2 in loaderManager)
            {
                if (loaderManager[_local_2].ldr == _arg_1)
                {
                    return (loaderManager[_local_2]);
                };
            };
            return (null);
        }

        public function getLoaderHostByLoaderInfo(_arg_1:*):Object
        {
            var _local_2:*;
            for (_local_2 in loaderManager)
            {
                if (loaderManager[_local_2].ldr.contentLoaderInfo == _arg_1)
                {
                    return (loaderManager[_local_2]);
                };
            };
            return (null);
        }

        public function getLoaderHostByTimer(_arg_1:Timer):Object
        {
            var _local_2:*;
            for (_local_2 in loaderManager)
            {
                if (loaderManager[_local_2].timer == _arg_1)
                {
                    return (loaderManager[_local_2]);
                };
            };
            return (null);
        }

        public function getLoaderHostByURL(_arg_1:String):Object
        {
            var _local_2:*;
            for (_local_2 in loaderManager)
            {
                if (_arg_1.indexOf(loaderManager[_local_2].url) > -1)
                {
                    return (loaderManager[_local_2]);
                };
            };
            return (null);
        }

        public function getFreeLoader():Object
        {
            var _local_1:*;
            if (loaderQueue.length > 0)
            {
                for (_local_1 in loaderManager)
                {
                    if (loaderManager[_local_1].free)
                    {
                        loaderManager[_local_1].free = false;
                        return (loaderManager[_local_1]);
                    };
                };
                return (null);
            };
            return (null);
        }

        public function closeLoader(_arg_1:Object, _arg_2:Boolean=true, _arg_3:Boolean=true, _arg_4:Boolean=true):void
        {
            if (_arg_3)
            {
                try
                {
                    _arg_1.ldr.unload();
                }
                catch(e:Error)
                {
                };
            };
            _arg_1.free = true;
            _arg_1.isOpen = false;
            _arg_1.loaderData = null;
            _arg_1.timer.reset();
            var _local_5:* = getFreeLoader();
            if (((!(_local_5 == null)) && (_arg_4)))
            {
                loadNext(_local_5);
            };
        }

        public function initLoaders():void
        {
            var _local_1:Object;
            var _local_2:*;
            for (_local_2 in loaderManager)
            {
                _local_1 = loaderManager[_local_2];
                _local_1.timer.addEventListener(TimerEvent.TIMER_COMPLETE, loaderTimerComplete, false, 0, true);
                _local_1.ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, loaderCallback, false, 0, true);
                _local_1.ldr.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loaderErrorHandler, false, 0, true);
                _local_1.ldr.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loaderProgressHandler, false, 0, true);
            };
        }

        public function clearLoaders(clearPlayerDomains:Boolean=false):*
        {
            var lmi:Object;
            var i:* = undefined;
            for (i in loaderManager)
            {
                lmi = loaderManager[i];
                try
                {
                    lmi.ldr.close();
                }
                catch(e:Error)
                {
                };
                try
                {
                    lmi.ldr.unload();
                }
                catch(e:Error)
                {
                };
                lmi.free = true;
                lmi.isOpen = false;
                lmi.loaderData = null;
                lmi.timer.reset();
                lmi.callBackA = null;
                lmi.callBackB = null;
            };
            if (clearPlayerDomains)
            {
                playerDomains = {};
            };
            loaderD = new ApplicationDomain(ApplicationDomain.currentDomain);
            loaderC = new LoaderContext(false, loaderD);
            loaderQueue = [];
        }

        public function killLoaders():*
        {
            var _local_1:Object;
            var _local_2:*;
            for (_local_2 in loaderManager)
            {
                _local_1 = loaderManager[_local_2];
                _local_1.free = true;
                _local_1.isOpen = false;
                _local_1.loaderData = null;
                _local_1.timer.reset();
                _local_1.callBackA = null;
                _local_1.callBackB = null;
            };
            loaderQueue = [];
        }

        public function loadNext(_arg_1:Object):*
        {
            if (loaderQueue.length > 0)
            {
                loadNextWith(_arg_1, loaderQueue.shift());
            };
        }

        private function loadNextWith(_arg_1:Object, _arg_2:Object):void
        {
            var _local_3:URLRequest;
            var _local_4:LoaderContext = loaderC;
            if (_arg_1 != null)
            {
                _arg_1.free = false;
                if (_arg_2.callBackA != null)
                {
                    _arg_1.callBackA = _arg_2.callBackA;
                }
                else
                {
                    _arg_1.callBackA = null;
                };
                if (_arg_2.callBackB != null)
                {
                    _arg_1.callBackB = _arg_2.callBackB;
                }
                else
                {
                    _arg_1.callBackB = null;
                };
                if ((((!(_arg_2.avt == null)) && (_arg_2.avt == myAvatar)) && (!(_arg_2.sES == null))))
                {
                    _local_4 = mapPlayerAssetClass(_arg_2.sES);
                };
                _local_3 = new URLRequest(_arg_2.strFile);
                _arg_1.ldr.load(_local_3, _local_4);
                _arg_1.url = _local_3.url;
                _arg_1.isOpen = false;
                _arg_1.loaderData = _arg_2;
                _arg_1.timer.reset();
                _arg_1.timer.start();
            }
            else
            {
                trace();
                trace("** No available loader found, event flow may terminate");
                trace();
            };
        }

        private function mapPlayerAssetClass(_arg_1:String):LoaderContext
        {
            if (playerDomains[_arg_1] == null)
            {
                playerDomains[_arg_1] = {};
                playerDomains[_arg_1].loaderD = new ApplicationDomain(ApplicationDomain.currentDomain);
                playerDomains[_arg_1].loaderC = new LoaderContext(false, playerDomains[_arg_1].loaderD);
            };
            return (playerDomains[_arg_1].loaderC);
        }

        public function getClass(_arg_1:String):Class
        {
            var _local_3:Class;
            var _local_4:String;
            var _local_2:Object = {};
            try
            {
                _local_3 = (getDefinitionByName(_arg_1) as Class);
                if (_local_3 != null)
                {
                    return (_local_3);
                };
            }
            catch(e:Error)
            {
            };
            try
            {
                _local_3 = (rootClass.assetsDomain.getDefinition(_arg_1) as Class);
                if (_local_3 != null)
                {
                    return (_local_3);
                };
            }
            catch(e:Error)
            {
            };
            try
            {
                _local_3 = (loaderD.getDefinition(_arg_1) as Class);
                if (_local_3 != null)
                {
                    return (_local_3);
                };
            }
            catch(e:Error)
            {
            };
            for (_local_4 in playerDomains)
            {
                if (playerDomains[_local_4].loaderD.hasDefinition(_arg_1))
                {
                    return (playerDomains[_local_4].loaderD.getDefinition(_arg_1) as Class);
                };
            };
            trace((("getClass() could not find " + _arg_1) + "!"));
            return (null);
        }

        public function loadMap(_arg_1:String):*
        {
            if (_arg_1.indexOf("cdn.aqworlds.com") == -1)
            {
                _arg_1 = ((rootClass.getFilePath() + "maps/") + _arg_1);
            };
            trace(("loadMap: " + _arg_1));
            rootClass.mcConnDetail.showConn("Loading Map Files...");
            if (map != null)
            {
                map.gotoAndStop("Wait");
                this.removeChild(map);
                map = null;
            };
            ldr_map.contentLoaderInfo.removeEventListener(Event.COMPLETE, onMapLoadComplete);
            ldr_map.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onMapLoadError);
            ldr_map.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onMapLoadProgress);
            ldr_map = new Loader();
            ldr_map.contentLoaderInfo.addEventListener(Event.COMPLETE, onMapLoadComplete, false, 0, true);
            ldr_map.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onMapLoadError, false, 0, true);
            ldr_map.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onMapLoadProgress, false, 0, true);
            ldr_map.load(new URLRequest(_arg_1));
            rootClass.clearPopups();
        }

        public function removeMapListeners():void
        {
            ldr_map.contentLoaderInfo.removeEventListener(Event.COMPLETE, onMapLoadComplete);
            ldr_map.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onMapLoadError);
            ldr_map.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onMapLoadProgress);
        }

        private function onMapLoadProgress(_arg_1:ProgressEvent):void
        {
            var _local_2:int = int(Math.floor(((_arg_1.bytesLoaded / _arg_1.bytesTotal) * 100)));
            rootClass.mcConnDetail.showConn((("Loading Map... " + _local_2) + "%"));
        }

        private function onMapLoadError(_arg_1:IOErrorEvent):*
        {
            trace(("Mapload failed: " + _arg_1));
            mapLoadInProgress = false;
            rootClass.mcConnDetail.showError("Loading Map Files... Failed!");
        }

        private function onMapLoadComplete(_arg_1:Event):*
        {
            trace(("Mapload complete: " + _arg_1));
            trace(_arg_1.target.url);
            rootClass.ui.visible = true;
            mapLoadInProgress = false;
            map = MovieClip(ldr_map.content);
            addChildAt(map, 0).x = 0;
            CHARS.x = 0;
            resetSpawnPoint();
            if (((!(mondef == null)) && (mondef.length)))
            {
                initMonsters(mondef, monmap);
            }
            else
            {
                enterMap();
            };
            if (isMyHouse())
            {
                rootClass.ui.mcPopup.fOpen("House");
            };
        }

        public function reloadCurrentMap():void
        {
            clearMonstersAndProps();
            loadMap(((strMapFileName + "?") + Math.random()));
        }

        public function enterMap():void
        {
            var _local_1:* = uoTreeLeaf(rootClass.sfc.myUserName);
            if (((intType == 0) || (returnInfo == null)))
            {
                trace(((("moving to cell: " + _local_1.strFrame) + " pad: ") + _local_1.strPad));
                moveToCell(_local_1.strFrame, _local_1.strPad);
            }
            else
            {
                moveToCell(returnInfo.strCell, returnInfo.strPad);
                returnInfo = null;
            };
            initMapEvents();
            rootClass.mcConnDetail.hideConn();
            rootClass.ui.mcInterface.areaList.visible = true;
            if (myAvatar != null)
            {
                rootClass.showPortrait(myAvatar);
            };
        }

        public function setReturnInfo(_arg_1:String, _arg_2:String, _arg_3:String):void
        {
            returnInfo = new Object();
            returnInfo.strMap = _arg_1;
            returnInfo.strCell = _arg_2;
            returnInfo.strPad = _arg_3;
        }

        public function exitCell():void
        {
            mvTimerKill();
            exitCombat();
            rootClass.clearPopups(["House"]);
            if (myAvatar != null)
            {
                myAvatar.targets = {};
                if (myAvatar.pMC != null)
                {
                    myAvatar.pMC.stopWalking();
                };
                if (myAvatar.petMC != null)
                {
                    myAvatar.petMC.stopWalking();
                };
                if (myAvatar.target != null)
                {
                    setTarget(null);
                };
            };
            if (strFrame != "Wait")
            {
                clearMonstersAndProps();
                hideAllAvatars();
            };
            rootClass.sfcSocial = false;
            rootClass.ui.mcInterface.areaList.gotoAndStop("init");
        }

        public function moveToCell(_arg_1:String, _arg_2:String, _arg_3:Boolean=false):void
        {
            var _local_4:*;
            var _local_5:*;
            afkPostpone();
            if ((((objLock == null) || (objLock[_arg_1] == null)) || (objLock[_arg_1] <= intKillCount)))
            {
                if (uoTree[rootClass.sfc.myUserName].freeze == null)
                {
                    _local_4 = [];
                    actionReady = false;
                    bitWalk = false;
                    _local_5 = {};
                    _local_5.strFrame = _arg_1;
                    _local_5.strPad = _arg_2;
                    if (_arg_2.toLowerCase() != "none")
                    {
                        _local_5.tx = 0;
                        _local_5.ty = 0;
                    };
                    uoTreeLeafSet(rootClass.sfc.myUserName, _local_5);
                    strFrame = _arg_1;
                    strPad = _arg_2;
                    if (((strAreaName.indexOf("battleon") < 0) || (strAreaName.indexOf("battleontown") > -1)))
                    {
                        rootClass.menuClose();
                    };
                    if (!_arg_3)
                    {
                        rootClass.sfc.sendXtMessage("zm", "moveToCell", [_arg_1, _arg_2], "str", curRoom);
                    };
                    exitCell();
                    map.gotoAndPlay("Blank");
                };
            };
        }

        public function moveToCellByIDa(_arg_1:int):void
        {
            rootClass.sfc.sendXtMessage("zm", "mtcid", [_arg_1], "str", curRoom);
        }

        public function moveToCellByIDb(_arg_1:int):void
        {
            var _local_2:MovieClip;
            var _local_3:int;
            while (_local_3 < arrEvent.length)
            {
                _local_2 = (arrEvent[_local_3] as MovieClip);
                if (((("tID" in _local_2) && (_local_2.tID == _arg_1)) || ((_local_2.name.indexOf("ia") == 0) && (int(_local_2.name.substr(2)) == _arg_1))))
                {
                    moveToCell(_local_2.tCell, _local_2.tPad, true);
                };
                _local_3++;
            };
        }

        public function hideAllAvatars():void
        {
            var _local_1:*;
            for (_local_1 in avatars)
            {
                if (((!(avatars[_local_1] == null)) && (!(avatars[_local_1].pMC == null))))
                {
                    avatars[_local_1].hideMC();
                };
            };
        }

        public function clearAllAvatars():void
        {
            var _local_1:String;
            for (_local_1 in avatars)
            {
                destroyAvatar(Number(_local_1));
            };
            avatars = new Object();
        }

        public function clearMonstersAndProps():void
        {
            var _local_2:DisplayObject;
            var _local_3:*;
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < CHARS.numChildren)
            {
                _local_2 = CHARS.getChildAt(_local_1);
                if (((_local_2.hasOwnProperty("isProp")) && (MovieClip(_local_2).isProp)))
                {
                    CHARS.removeChild(_local_2);
                    _local_1--;
                }
                else
                {
                    if (((_local_2.hasOwnProperty("isHouseItem")) && (MovieClip(_local_2).isHouseItem)))
                    {
                        _local_2.removeEventListener(MouseEvent.MOUSE_DOWN, onHouseItemClick);
                        CHARS.removeChild(_local_2);
                        _local_1--;
                    }
                    else
                    {
                        if (((_local_2.hasOwnProperty("isMonster")) && (MovieClip(_local_2).isMonster)))
                        {
                            MovieClip(_local_2).fClose();
                            _local_1--;
                        };
                    };
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < TRASH.numChildren)
            {
                _local_2 = TRASH.getChildAt(_local_1);
                if (((_local_2.hasOwnProperty("isMonster")) && (MovieClip(_local_2).isMonster)))
                {
                    MovieClip(_local_2).fClose();
                    _local_1--;
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < monsters.length)
            {
                monsters[_local_1].pMC = null;
                _local_1++;
            };
            while (rootClass.ui.mcPadNames.numChildren)
            {
                _local_3 = rootClass.ui.mcPadNames.getChildAt(0);
                MovieClip(_local_3).stop();
                rootClass.ui.mcPadNames.removeChild(_local_3);
            };
        }

        public function setMapEvents(_arg_1:Object):void
        {
            mapEvents = _arg_1;
        }

        public function initMapEvents():void
        {
            if ((("eventUpdate" in map) && (!(mapEvents == null))))
            {
                map.eventUpdate({
                    "cmd":"event",
                    "args":mapEvents
                });
            };
            mapEvents = null;
        }

        public function setCellMap(_arg_1:Object):void
        {
            cellMap = _arg_1;
        }

        public function updateCellMap(_arg_1:Object):void
        {
            var _local_3:String;
            var _local_4:MovieClip;
            var _local_5:String;
            var _local_2:Object = {};
            for (_local_3 in cellMap)
            {
                _local_2 = cellMap[_local_3];
                if (((!(_local_2.ias == null)) && (!(_local_2.ias[_arg_1.ID] == null))))
                {
                    for (_local_5 in _arg_1)
                    {
                        _local_2.ias[_arg_1.ID][_local_5] = _arg_1[_local_5];
                    };
                };
            };
            try
            {
                _local_4 = MovieClip(CHARS.getChildByName(("ia" + _arg_1.ID)));
                _local_4.update();
                return;
            }
            catch(e:Error)
            {
            };
            try
            {
                _local_4 = MovieClip(map.getChildByName(("ia" + _arg_1.ID)));
                _local_4.update();
            }
            catch(e:Error)
            {
            };
        }

        public function onWalkClick():void
        {
            var aura:Object;
            var p:Point;
            var mvPT:* = undefined;
            var cLeaf:Object = myAvatar.dataLeaf;
            for each (aura in cLeaf.auras)
            {
                try
                {
                    if (aura.cat != null)
                    {	
						switch (aura.cat)
						{
							case "sleep":
							case "hex":
							case "paralyze":
							case "petrify":
							case "freeze":
							case "stun":
							case "stone":
							return;
						};
                    };
                }
                catch(e:Error)
                {
                    trace(("world.onWalkClick > " + e));
                };
            };
			if (myAvatar.onCasting == true)
            {
                rootClass.ui.mcCastBar.fClose();
                myAvatar.onCasting == false;
            };
            p = new Point(mouseX, mouseY);
            if (bitWalk)
            {
                afkPostpone();
                if (((((mouseX >= 0) && (mouseX <= 960)) && (mouseY >= 0)) && (mouseY <= 500)))
                {
                    p = CHARS.globalToLocal(p);
                    p.x = Math.round(p.x);
                    p.y = Math.round(p.y);
                    mvPT = myAvatar.pMC.simulateTo(p.x, p.y, WALKSPEED);
                    if (mvPT != null)
                    {
                        myAvatar.pMC.walkTo(mvPT.x, mvPT.y, WALKSPEED);
                        if (bPvP)
                        {
                            pushMove(myAvatar.pMC, mvPT.x, mvPT.y, WALKSPEED);
                        }
                        else
                        {
                            if (clickOnEventTest(mvPT.x, mvPT.y))
                            {
                                pushMove(myAvatar.pMC, mvPT.x, mvPT.y, WALKSPEED);
                            }
                            else
                            {
                                moveRequest({
                                    "mc":myAvatar.pMC,
                                    "tx":mvPT.x,
                                    "ty":mvPT.y,
                                    "sp":WALKSPEED
                                });
                            };
                        };
                    };
                };
            };
        }

        public function clickOnEventTest(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:Rectangle = myAvatar.pMC.shadow.getBounds(this);
            var _local_4:Rectangle = new Rectangle();
            _local_3.x = (_arg_1 - (_local_3.width / 2));
            _local_3.y = (_arg_2 - (_local_3.height / 2));
            var _local_5:int;
            while (_local_5 < arrEvent.length)
            {
                _local_4 = arrEvent[_local_5].shadow.getBounds(this);
                if (_local_3.intersects(_local_4))
                {
                    return (true);
                };
                _local_5++;
            };
            return (false);
        }

        public function moveRequest(_arg_1:Object):void
        {
            if (!mvTimer.running)
            {
                pushMove(_arg_1.mc, _arg_1.tx, _arg_1.ty, _arg_1.sp);
                mvTimer.reset();
                mvTimer.start();
            }
            else
            {
                mvTimerObj = _arg_1;
            };
        }

        public function mvTimerHandler(_arg_1:TimerEvent):void
        {
            var _local_2:Object = {};
            if (mvTimerObj != null)
            {
                pushMove(mvTimerObj.mc, mvTimerObj.tx, mvTimerObj.ty, mvTimerObj.sp);
                mvTimerObj = null;
                mvTimer.reset();
                mvTimer.start();
            };
        }

        public function mvTimerKill():void
        {
            mvTimer.reset();
            mvTimerObj = null;
        }

        public function pushMove(_arg_1:MovieClip, _arg_2:int, _arg_3:int, _arg_4:int):*
        {
            var _local_5:* = {};
            _local_5.tx = int(_arg_2);
            _local_5.ty = int(_arg_3);
            _local_5.sp = int(_arg_4);
            uoTreeLeafSet(rootClass.sfc.myUserName, _local_5);
            rootClass.sfc.sendXtMessage("zm", "mv", [_arg_2, _arg_3, _arg_4], "str", curRoom);
        }

        public function monstersToPads():*
        {
            var _local_1:*;
            var _local_2:*;
            for (_local_1 in monsters)
            {
                _local_2 = monsters[_local_1];
                if (((!(_local_2.objData == null)) && (_local_2.objData.strFrame == strFrame)))
                {
                    _local_2.pMC.walkTo(_local_2.pMC.ox, _local_2.pMC.oy, (WALKSPEED * 1.4));
                };
            };
        }

        public function updatePadNames():*
        {
            var _local_2:*;
            var _local_1:int;
            while (_local_1 < rootClass.ui.mcPadNames.numChildren)
            {
                _local_2 = MovieClip(rootClass.ui.mcPadNames.getChildAt(_local_1));
                if ((((objLock == null) || (objLock[_local_2.tCell] == null)) || (objLock[_local_2.tCell] <= intKillCount)))
                {
                    _local_2.cnt.lock.visible = false;
                }
                else
                {
                    _local_2.cnt.lock.visible = true;
                };
                _local_1++;
            };
        }

        public function cellSetup(_arg_1:Number, _arg_2:Number, _arg_3:String):void
        {
            var _local_4:Bitmap;
            var _local_9:DisplayObject;
            var _local_10:uint;
            var _local_11:DisplayObject;
            var _local_12:*;
            var _local_13:Array;
            var _local_14:Avatar;
            var _local_15:*;
            trace("cellSetup");
            CELL_MODE = _arg_3;
            SCALE = _arg_1;
            WALKSPEED = _arg_2;
            arrSolid = new Array();
            arrEvent = new Array();
            var _local_5:BitmapData = new BitmapData(960, 550, true, 0);
            var _local_6:Array = [];
            trace(("extra: " + objExtra["bMonName"]));
            var _local_7:* = (Number(objExtra["bMonName"]) == 1);
            var _local_8:int;
            while (_local_8 < map.numChildren)
            {
                _local_9 = map.getChildAt(_local_8);
                if ((_local_9 is MovieClip))
                {
                    if (MovieClip(_local_9).hasPads)
                    {
                        trace("movieclip has pads");
                        _local_10 = 0;
                        while (_local_10 < MovieClip(_local_9).numChildren)
                        {
                            _local_11 = MovieClip(_local_9).getChildAt(_local_10);
                            if ((((_local_11 is MovieClip) && (MovieClip(_local_11).isEvent)) && (!(MovieClip(_local_11).isProp))))
                            {
                                arrEvent.push(MovieClip(_local_11));
                            };
                            if (((_local_11 is MovieClip) && (MovieClip(_local_11).isSolid)))
                            {
                                arrSolid.push(MovieClip(_local_9));
                            };
                            _local_10++;
                        };
                    };
                };
                if (((_local_9 is MovieClip) && (MovieClip(_local_9).isSolid)))
                {
                    arrSolid.push(MovieClip(_local_9));
                };
                if (((_local_9 is MovieClip) && ("walk" in _local_9)))
                {
                    MovieClip(_local_9).btnWalkingArea.useHandCursor = false;
                };
                if ((((_local_9 is MovieClip) && (MovieClip(_local_9).isEvent)) && (!(MovieClip(_local_9).isProp))))
                {
                    arrEvent.push(MovieClip(_local_9));
                };
                if (((_local_9 is MovieClip) && (MovieClip(_local_9).isMonster)))
                {
                    _local_12 = [];
                    _local_13 = getMonsters(MovieClip(_local_9).MonMapID);
                    for each (_local_14 in _local_13)
                    {
                        if (_local_14 == null)
                        {
                            trace("No Monster Definition found for Pad!");
                        }
                        else
                        {
                            _local_14.pMC = createMonsterMC(MovieClip(_local_9), _local_14.objData.MonID, _local_7);
                            _local_14.pMC.scale(SCALE);
                            _local_14.pMC.pAV = _local_14;
                            _local_14.pMC.setData();
                            if (_local_14.dataLeaf == null)
                            {
                                TRASH.addChild(_local_14.pMC);
                            };
                        };
                    };
                };
                if (((_local_9 is MovieClip) && (MovieClip(_local_9).isProp)))
                {
                    _local_15 = CHARS.addChild(_local_9);
                    if (MovieClip(_local_15).isEvent)
                    {
                        arrEvent.push(MovieClip(_local_15));
                        MovieClip(_local_15).isEvent = false;
                    };
                    _local_8--;
                };
                if ((((((_local_9 is MovieClip) && (_local_9.width > 700)) && (!("isSolid" in _local_9))) && (!("walk" in _local_9))) && (!("btnSkip" in _local_9))))
                {
                    MovieClip(_local_9).mouseEnabled = false;
                    MovieClip(_local_9).mouseChildren = false;
                };
                if ((((((_local_9 is MovieClip) && (_local_9.width >= 960)) && (!("isSolid" in _local_9))) && (!("walk" in _local_9))) && (!("btnSkip" in _local_9))))
                {
                };
                _local_8++;
            };
            buildBoundingRects();
            if (map.bounds != null)
            {
                mapBoundsMC = (map.getChildByName("bounds") as MovieClip);
            };
            rebuildMapBMP(map);
            updateMonsters();
            updatePadNames();
            if (objHouseData != null)
            {
                updateHouseItems();
            };
            playerInit();
        }

        private function buildBoundingRects():void
        {
            var _local_2:Rectangle;
            var _local_3:MovieClip;
            var _local_1:int;
            arrEventR = [];
            arrSolidR = [];
            _local_1 = 0;
            while (_local_1 < arrEvent.length)
            {
                _local_3 = arrEvent[_local_1];
                _local_2 = _local_3.getBounds(rootClass.stage);
                arrEventR.push(_local_2);
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < arrSolid.length)
            {
                _local_3 = arrSolid[_local_1];
                _local_2 = _local_3.getBounds(rootClass.stage);
                arrSolidR.push(_local_2);
                _local_1++;
            };
        }

        public function killWalkObjects():void
        {
            var _local_2:DisplayObject;
            var _local_1:int;
            while (_local_1 < map.numChildren)
            {
                _local_2 = map.getChildAt(_local_1);
                if (((_local_2 is MovieClip) && (MovieClip(_local_2).isEvent)))
                {
                    removeEventListener("enter", MovieClip(_local_2).onEnter);
                };
                _local_1++;
            };
        }

        public function exitQuest():void
        {
            if (returnInfo != null)
            {
                rootClass.sfc.sendXtMessage("zm", "cmd", ["tfer", rootClass.sfc.myUserName, returnInfo.strMap, returnInfo.strCell, returnInfo.strPad], "str", curRoom);
            };
        }

        public function gotoTown(_arg_1:String, _arg_2:String, _arg_3:String):void
        {
            var _local_4:* = uoTree[rootClass.sfc.myUserName];
            if (_local_4.intState == 0)
            {
                rootClass.chatF.pushMsg("warning", "You are dead!", "SERVER", "", 0);
            }
            else
            {
                if (((!(rootClass.world.myAvatar.invLoaded)) || (!(rootClass.world.myAvatar.pMC.artLoaded()))))
                {
                    rootClass.MsgBox.notify("Character still being loaded.");
                }
                else
                {
                    if (coolDown("tfer"))
                    {
                        rootClass.MsgBox.notify(("Joining " + _arg_1));
                        setReturnInfo(_arg_1, _arg_2, _arg_3);
                        rootClass.sfc.sendXtMessage("zm", "cmd", ["tfer", rootClass.sfc.myUserName, _arg_1, _arg_2, _arg_3], "str", curRoom);
                        if (((strAreaName.indexOf("battleon") < 0) || (strAreaName.indexOf("battleontown") > -1)))
                        {
                            rootClass.menuClose();
                        };
                    }
                    else
                    {
                        rootClass.MsgBox.notify("You must wait 5 seconds before joining another map.");
                    };
                };
            };
        }

        public function gotoQuest(_arg_1:String, _arg_2:String, _arg_3:String):void
        {
            gotoTown(_arg_1, _arg_2, _arg_3);
        }

        public function openApop(_arg_1:*):*
        {
            var _local_2:MovieClip;
            if (((isMovieFront("Apop")) || ((!("frame" in _arg_1)) || (("frame" in _arg_1) && ("cnt" in _arg_1)))))
            {
                rootClass.menuClose();
                _local_2 = attachMovieFront("Apop");
                _local_2.update(_arg_1);
            };
        }

        public function setSpawnPoint(_arg_1:*, _arg_2:*):void
        {
            spawnPoint.strFrame = _arg_1;
            spawnPoint.strPad = _arg_2;
        }

        public function resetSpawnPoint():void
        {
            spawnPoint.strFrame = "Enter";
            spawnPoint.strPad = "Spawn";
        }

        public function initObjExtra(_arg_1:String):void
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:Array;
            objExtra = new Object();
            if (((!(_arg_1 == null)) && (!(_arg_1 == ""))))
            {
                _local_2 = _arg_1.split(",");
                _local_3 = 0;
                while (_local_3 < _local_2.length)
                {
                    _local_4 = _local_2[_local_3].split("=");
                    objExtra[_local_4[0]] = _local_4[1];
                    _local_3++;
                };
            };
        }

        public function initObjInfo(_arg_1:String):void
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:Array;
            objInfo = new Object();
            if (((!(_arg_1 == null)) && (!(_arg_1 == ""))))
            {
                _local_2 = _arg_1.split(",");
                _local_3 = 0;
                while (_local_3 < _local_2.length)
                {
                    _local_4 = _local_2[_local_3].split("=");
                    objInfo[_local_4[0]] = _local_4[1];
                    _local_3++;
                };
            };
        }

        private function rasterize(_arg_1:Array, _arg_2:Boolean=false):void
        {
            var _local_5:Object;
            var _local_6:Point;
            var _local_7:Matrix;
            var _local_8:String;
            var _local_9:DisplayObject;
            trace("rasterize");
            mapNW = rootClass.stage.stageWidth;
            trace("line 572");
            var _local_3:Number = (mapNW / mapW);
            var _local_4:int;
            mapNH = Math.round((mapH * _local_3));
            trace("line 577");
            for each (_local_5 in _arg_1)
            {
                _local_5.child.x = _local_5.x;
                if (_local_5.bmd != null)
                {
                    _local_5.bmd.dispose();
                };
                _local_5.bmd = new BitmapData(mapNW, mapNH, true, 0x999999);
                _local_6 = new Point(0, 0);
                _local_6 = _local_5.child.globalToLocal(_local_6);
                _local_7 = new Matrix((_local_3 * _local_5.child.transform.matrix.a), 0, 0, (_local_3 * _local_5.child.transform.matrix.d), -((_local_6.x * _local_3) * _local_5.child.transform.matrix.a), -((_local_6.y * _local_3) * _local_5.child.transform.matrix.d));
                _local_5.bmd.draw(_local_5.child, _local_7, _local_5.child.transform.colorTransform, null, new Rectangle(0, 0, mapNW, mapNH), false);
                _local_5.bm = new Bitmap(_local_5.bmd);
                _local_8 = String(("bmp" + _local_4));
                _local_9 = _local_5.child.parent.getChildByName(_local_8);
                if (_local_9 != null)
                {
                    _local_5.child.parent.removeChild(_local_9);
                };
                _local_5.bmDO = _local_5.child.parent.addChildAt(_local_5.bm, (_local_5.child.parent.getChildIndex(_local_5.child) + 1));
                _local_5.bmDO.name = _local_8;
                _local_5.bmDO.width = mapW;
                _local_5.bmDO.height = mapH;
                _local_5.child.visible = false;
                if (_arg_2)
                {
                    _local_5.child.x = (_local_5.child.x + 1200);
                };
                _local_4++;
            };
        }

        private function rebuildMapBMP(_arg_1:MovieClip):void
        {
            var _local_2:MovieClip;
            var _local_3:int;
            clearMapBmps();
            _local_3 = 0;
            while (_local_3 < _arg_1.numChildren)
            {
                _local_2 = (_arg_1.getChildAt(_local_3) as MovieClip);
                if (((((((((((((_local_2 is MovieClip) && (_local_2.width >= 960)) && (_local_2.name.toLowerCase().indexOf("bmp") == -1)) && (_local_2.name.toLowerCase().indexOf("cs") == -1)) && (_local_2.name.toLowerCase().indexOf("bounds") == -1)) && (((_local_2 as MovieClip) == null) || (MovieClip(_local_2).totalFrames < 15))) && (!("isSolid" in _local_2))) && (!("isFloor" in _local_2))) && (!("isWall" in _local_2))) && (!("walk" in _local_2))) && (!("btnSkip" in _local_2))) && (!("noBmp" in _local_2))))
                {
                    trace(("RASTERIZING " + _local_2.name));
                    mapBmps.push({
                        "child":_local_2,
                        "x":_local_2.x,
                        "bmDO":null
                    });
                };
                _local_3++;
            };
            rasterize(mapBmps);
        }

        private function mapResizeCheck(_arg_1:TimerEvent):void
        {
            if (((!(map == null)) && (mapBmps.length > 0)))
            {
                if (mapNW != rootClass.stage.stageWidth)
                {
                    rasterize(mapBmps);
                };
            };
        }

        private function clearMapBmps():void
        {
            var _local_1:Object;
            if (mapBmps.length > 0)
            {
                for each (_local_1 in mapBmps)
                {
                    _local_1.bmDO.parent.removeChild(_local_1.bmDO);
                    if (_local_1.bmd != null)
                    {
                        _local_1.bmd.dispose();
                    };
                    _local_1.child = null;
                    _local_1.bmd = null;
                    _local_1.bm = null;
                };
            };
            mapBmps = [];
        }

        public function initMap():mapData
        {
            mData = new mapData(rootClass);
            return (mData);
        }

        public function initCutscenes():cutsceneHandler
        {
            cHandle = new cutsceneHandler(rootClass);
            return (cHandle);
        }

        public function initSound(_arg_1:Sound):soundController
        {
            sController = new soundController(_arg_1, rootClass);
            return (sController);
        }

        public function gotoHouse(_arg_1:String):void
        {
            _arg_1 = _arg_1.toLowerCase();
            if (((!(objHouseData == null)) && (objHouseData.unm == _arg_1)))
            {
                return;
            };
            rootClass.sfc.sendXtMessage("zm", "house", [_arg_1], "str", 1);
        }

        public function isHouseEquipped():Boolean
        {
            var _local_1:int;
            while (_local_1 < myAvatar.houseitems.length)
            {
                if (myAvatar.houseitems[_local_1].bEquip == 1)
                {
                    return (true);
                };
                _local_1++;
            };
            return (false);
        }

        public function isMyHouse():*
        {
            return ((!(objHouseData == null)) && (objHouseData.unm == myAvatar.objData.strUsername.toLowerCase()));
        }

        public function showHouseOptions(_arg_1:String):void
        {
            var _local_2:MovieClip = rootClass.ui.mcPopup.mcHouseOptions;
            switch (_arg_1)
            {
                case "default":
                case "save":
                default:
                    _local_2.visible = true;
                    _local_2.bg.x = 0;
                    _local_2.cnt.x = 0;
                    _local_2.tTitle.x = 5;
                    _local_2.bExpand.x = 190;
                    _local_2.bg.visible = true;
                    _local_2.cnt.visible = true;
                    _local_2.tTitle.visible = true;
                    _local_2.bExpand.visible = false;
                    return;
                case "hide":
                    _local_2.visible = true;
                    _local_2.bg.x = 181;
                    _local_2.cnt.x = 181;
                    _local_2.tTitle.x = 186;
                    _local_2.bExpand.x = 120;
                    _local_2.bg.visible = false;
                    _local_2.cnt.visible = false;
                    _local_2.tTitle.visible = false;
                    _local_2.bExpand.visible = true;
            };
        }

        public function hideHouseOptions():void
        {
            var _local_2:int;
            var _local_1:MovieClip = rootClass.ui.mcPopup.mcHouseOptions;
            if (_local_1.visible)
            {
                _local_2 = 0;
                while (_local_2 < _local_1.numChildren)
                {
                    _local_1.getChildAt(_local_2).x = 190;
                    _local_2++;
                };
            };
            _local_1.visible = false;
        }

        public function onHouseOptionsDesignClick(_arg_1:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
            toggleHouseEdit();
        }

        public function onHouseOptionsSaveClick(_arg_1:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
            saveHouseSetup();
        }

        public function onHouseOptionsHideClick(_arg_1:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
            showHouseOptions("hide");
        }

        public function onHouseOptionsExpandClick(_arg_1:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
            showHouseOptions("default");
        }

        public function onHouseOptionsFloorClick(_arg_1:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
            showHouseInventory(70);
        }

        public function onHouseOptionsWallClick(_arg_1:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
            showHouseInventory(72);
        }

        public function onHouseOptionsMiscClick(_arg_1:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
            showHouseInventory(73);
        }

        public function onHouseOptionsHouseClick(_arg_1:MouseEvent):void
        {
            rootClass.mixer.playSound("Click");
            gotoTown("buyhouse", "Enter", "Spawn");
        }

        public function showHouseInventory(_arg_1:int):*
        {
            if (myAvatar.houseitems != null)
            {
                sendLoadShopRequest(_arg_1);
            };
        }

        public function toggleHouseEdit():void
        {
            if (((isMyHouse()) && (!(myAvatar.houseitems == null))))
            {
                if (rootClass.ui.mcPopup.mcHouseMenu.visible)
                {
                    rootClass.ui.mcPopup.mcHouseMenu.hideEditMenu();
                }
                else
                {
                    rootClass.ui.mcPopup.mcHouseMenu.showEditMenu();
                };
            };
        }

        public function loadHouseInventory():*
        {
            rootClass.sfc.sendXtMessage("zm", "loadHouseInventory", [], "str", curRoom);
        }

        public function updateHouseItems():void
        {
            var _local_1:int;
            var _local_2:Object;
            if (objHouseData != null)
            {
                if (isMyHouse())
                {
                    initEquippedItems(objHouseData.arrPlacement);
                };
                _local_1 = 0;
                while (_local_1 < objHouseData.arrPlacement.length)
                {
                    if (strFrame == objHouseData.arrPlacement[_local_1].c)
                    {
                        _local_2 = getHouseItem(objHouseData.arrPlacement[_local_1].ID);
                        if (_local_2 != null)
                        {
                            loadHouseItem(_local_2, objHouseData.arrPlacement[_local_1].x, objHouseData.arrPlacement[_local_1].y);
                        };
                    };
                    _local_1++;
                };
            };
        }

        public function attachHouseItem(_arg_1:Object):void
        {
            var _local_2:Class = (loaderD.getDefinition(_arg_1.item.sLink) as Class);
            var _local_3:* = new (_local_2)();
            _local_3.x = _arg_1.x;
            _local_3.y = _arg_1.y;
            _local_3.ItemID = _arg_1.item.ItemID;
            _local_3.item = _arg_1.item;
            _local_3.isHouseItem = true;
            _local_3.isStable = false;
            _local_3.addEventListener(MouseEvent.MOUSE_DOWN, onHouseItemClick, false, 0, true);
            var _local_4:MovieClip = (CHARS.addChild(_local_3) as MovieClip);
            _local_4.name = ("mc" + getQualifiedClassName(_local_4));
            houseItemValidate(_local_3);
        }

        public function onHouseItemClick(_arg_1:Event):void
        {
            var _local_2:MovieClip = (_arg_1.currentTarget as MovieClip);
            if (((isMyHouse()) && (rootClass.ui.mcPopup.mcHouseMenu.visible)))
            {
                rootClass.ui.mcPopup.mcHouseMenu.drawItemHandle(MovieClip(_arg_1.currentTarget));
                rootClass.ui.mcPopup.mcHouseMenu.onHandleMoveClick(_arg_1.clone());
            }
            else
            {
                if (((_local_2.btnButton == null) || (!(_local_2.btnButton.hasEventListener(MouseEvent.CLICK)))))
                {
                    onWalkClick();
                };
            };
        }

        public function houseItemValidate(_arg_1:MovieClip):void
        {
            var _local_3:int;
            var _local_4:DisplayObject;
            var _local_2:* = getHouseItem(_arg_1.ItemID);
            if (_local_2.sType == "Floor Item")
            {
                _arg_1.isStable = false;
                _arg_1.addEventListener(Event.ENTER_FRAME, onHouseItemEnterFrame);
            }
            else
            {
                if (_local_2.sType == "Wall Item")
                {
                    _arg_1.isStable = true;
                    _local_3 = 0;
                    while (_local_3 < map.numChildren)
                    {
                        _local_4 = map.getChildAt(_local_3);
                        if ((((_local_4 is MovieClip) && (MovieClip(_local_4).isFloor)) && (MovieClip(_local_4).hitTestObject(_arg_1))))
                        {
                            _arg_1.isStable = false;
                            break;
                        };
                        _local_3++;
                    };
                    if (!_arg_1.isStable)
                    {
                        _arg_1.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 100, 0, 0, 0);
                    }
                    else
                    {
                        _arg_1.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
                    };
                };
            };
        }

        public function onHouseItemEnterFrame(_arg_1:Event):void
        {
            var _local_4:DisplayObject;
            var _local_5:Rectangle;
            var _local_2:MovieClip = (_arg_1.currentTarget as MovieClip);
            var _local_3:int;
            while (_local_3 < map.numChildren)
            {
                _local_4 = map.getChildAt(_local_3);
                if ((((_local_4 is MovieClip) && (MovieClip(_local_4).isFloor)) && (MovieClip(_local_4).hitTestPoint(_local_2.x, _local_2.y))))
                {
                    _local_2.removeEventListener(Event.ENTER_FRAME, onHouseItemEnterFrame);
                    _local_2.isStable = true;
                    break;
                };
                _local_3++;
            };
            if (!_local_2.isStable)
            {
                _local_5 = _local_2.getBounds(rootClass.stage);
                if ((_local_5.y + (_local_5.height / 2)) > 495)
                {
                    _local_2.isStable = true;
                    _local_2.y = Math.ceil((_local_5.y - (_local_5.y - _local_2.y)));
                    _local_2.removeEventListener(Event.ENTER_FRAME, onHouseItemEnterFrame);
                }
                else
                {
                    _local_2.y = (_local_2.y + 10);
                };
                if (rootClass.ui.mcPopup.mcHouseMenu.visible)
                {
                    rootClass.ui.mcPopup.mcHouseMenu.drawItemHandle(_local_2);
                };
            };
        }

        public function initHouseData(_arg_1:Object):void
        {
            objHouseData = _arg_1;
            if (objHouseData != null)
            {
                objHouseData.arrPlacement = createItemPlacementArray(objHouseData.sHouseInfo);
                verifyItemQty();
            };
        }

        public function verifyItemQty():void
        {
            var _local_3:*;
            var _local_4:*;
            var _local_1:* = {};
            var _local_2:int;
            while (_local_2 < objHouseData.arrPlacement.length)
            {
                _local_3 = objHouseData.arrPlacement[_local_2].ID;
                if (_local_1[_local_3] == null)
                {
                    _local_1[_local_3] = 1;
                }
                else
                {
                    _local_1[_local_3]++;
                };
                _local_4 = getHouseItem(_local_3);
                if (((_local_4 == null) || (_local_4.iQty < _local_1[_local_3])))
                {
                    objHouseData.sHouseInfo = "";
                    objHouseData.arrPlacement = [];
                };
                _local_2++;
            };
        }

        public function getHouseItem(_arg_1:int):Object
        {
            var _local_2:int;
            var _local_3:int;
            if (isMyHouse())
            {
                _local_2 = 0;
                while (_local_2 < myAvatar.houseitems.length)
                {
                    if (myAvatar.houseitems[_local_2].ItemID == _arg_1)
                    {
                        return (myAvatar.houseitems[_local_2]);
                    };
                    _local_2++;
                };
            }
            else
            {
                _local_3 = 0;
                while (_local_3 < objHouseData.items.length)
                {
                    if (objHouseData.items[_local_3].ItemID == _arg_1)
                    {
                        return (objHouseData.items[_local_3]);
                    };
                    _local_3++;
                };
            };
            return (null);
        }

        public function removeSelectedItem():void
        {
            var _local_1:MovieClip;
            if (objHouseData.selectedMC == null)
            {
                rootClass.MsgBox.notify("Please selected an item to be removed.");
            }
            else
            {
                _local_1 = objHouseData.selectedMC;
                _local_1.removeEventListener(MouseEvent.MOUSE_DOWN, onHouseItemClick);
                unequipHouseItem(_local_1.ItemID);
                CHARS.removeChild(_local_1);
                delete objHouseData.selectedMC;
            };
        }

        public function equipHouse(_arg_1:Object):void
        {
            var _local_2:* = new ModalMC();
            var _local_3:* = {};
            _local_3.strBody = (("Are you sure you want to equip '" + _arg_1.sName) + "'? It will reset your house items?");
            _local_3.params = {"item":_arg_1};
            _local_3.callback = equipHouseRequest;
            rootClass.ui.ModalStack.addChild(_local_2);
            _local_2.init(_local_3);
        }

        public function equipHouseRequest(_arg_1:*):void
        {
            if (_arg_1.accept)
            {
                rootClass.world.sendEquipItemRequest(_arg_1.item);
                rootClass.world.equipHouseByID(_arg_1.item.ItemID);
            };
        }

        public function equipHouseByID(_arg_1:int):void
        {
            var _local_2:int;
            while (_local_2 < myAvatar.houseitems.length)
            {
                myAvatar.houseitems[_local_2].bEquip = ((myAvatar.houseitems[_local_2].ItemID == _arg_1) ? 1 : 0);
                _local_2++;
            };
        }

        public function saveHouseSetup():void
        {
            var _local_3:DisplayObject;
            var _local_1:int;
            while (_local_1 < objHouseData.arrPlacement.length)
            {
                if (strFrame == objHouseData.arrPlacement[_local_1].c)
                {
                    objHouseData.arrPlacement.splice(_local_1, 1);
                    _local_1--;
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < CHARS.numChildren)
            {
                _local_3 = CHARS.getChildAt(_local_1);
                if (((_local_3.hasOwnProperty("isHouseItem")) && (MovieClip(_local_3).isHouseItem)))
                {
                    if (MovieClip(_local_3).isStable)
                    {
                        objHouseData.arrPlacement.push({
                            "c":strFrame,
                            "ID":MovieClip(_local_3).ItemID,
                            "x":_local_3.x,
                            "y":_local_3.y
                        });
                    }
                    else
                    {
                        unequipHouseItem(MovieClip(_local_3).ItemID);
                        _local_3.removeEventListener(MouseEvent.MOUSE_DOWN, onHouseItemClick);
                        CHARS.removeChild(_local_3);
                    };
                };
                _local_1++;
            };
            var _local_2:String = createItemPlacementString(objHouseData.arrPlacement);
            trace(objHouseData.sHouseInfo);
            trace(_local_2);
            if (objHouseData.sHouseInfo != _local_2)
            {
                sendSaveHouseSetup(_local_2);
                objHouseData.sHouseInfo = _local_2;
            };
        }

        public function createItemPlacementString(_arg_1:Array):String
        {
            var _local_3:int;
            var _local_4:*;
            var _local_2:* = "";
            if (_arg_1.length > 0)
            {
                _local_3 = 0;
                while (_local_3 < _arg_1.length)
                {
                    for (_local_4 in _arg_1[_local_3])
                    {
                        _local_2 = ((((_local_2 + _local_4) + ":") + _arg_1[_local_3][_local_4]) + ",");
                    };
                    _local_2 = _local_2.substring(0, (_local_2.length - 1));
                    _local_2 = (_local_2 + "|");
                    _local_3++;
                };
                _local_2 = _local_2.substring(0, (_local_2.length - 1));
            };
            return (_local_2);
        }

        public function createItemPlacementArray(_arg_1:String):Array
        {
            var _local_3:*;
            var _local_4:int;
            var _local_5:*;
            var _local_6:*;
            var _local_7:int;
            var _local_2:Array = [];
            if (_arg_1.length > 0)
            {
                _local_3 = _arg_1.split("|");
                _local_4 = 0;
                while (_local_4 < _local_3.length)
                {
                    _local_5 = {};
                    _local_6 = _local_3[_local_4].split(",");
                    _local_7 = 0;
                    while (_local_7 < _local_6.length)
                    {
                        _local_5[_local_6[_local_7].split(":")[0]] = _local_6[_local_7].split(":")[1];
                        _local_7++;
                    };
                    _local_2.push(_local_5);
                    _local_4++;
                };
            };
            return (_local_2);
        }

        public function sendSaveHouseSetup(_arg_1:*):void
        {
            rootClass.sfc.sendXtMessage("zm", "housesave", [_arg_1], "str", 1);
        }

        public function initEquippedItems(_arg_1:*):void
        {
            var _local_3:int;
            var _local_2:int;
            while (_local_2 < myAvatar.houseitems.length)
            {
                if (myAvatar.houseitems[_local_2].sType != "House")
                {
                    myAvatar.houseitems[_local_2].bEquip = 0;
                    _local_3 = 0;
                    while (_local_3 < _arg_1.length)
                    {
                        if (myAvatar.houseitems[_local_2].ItemID == _arg_1[_local_3].ID)
                        {
                            myAvatar.houseitems[_local_2].bEquip = 1;
                        };
                        _local_3++;
                    };
                };
                _local_2++;
            };
        }

        public function initHouseInventory(_arg_1:*):void
        {
            myAvatar.houseitems = ((_arg_1.items == null) ? [] : _arg_1.items);
            initEquippedItems(createItemPlacementArray(_arg_1.sHouseInfo));
            var _local_2:Array = myAvatar.houseitems;
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                _local_2[_local_3].iQty = int(_local_2[_local_3].iQty);
                rootClass.world.invTree[_local_2[_local_3].ItemID] = _local_2[_local_3];
                _local_3++;
            };
        }

        public function unequipHouseItem(_arg_1:int):void
        {
            var _local_2:int;
            while (_local_2 < myAvatar.houseitems.length)
            {
                if (myAvatar.houseitems[_local_2].ItemID == _arg_1)
                {
                    myAvatar.houseitems[_local_2].bEquip = 0;
                };
                _local_2++;
            };
        }

        public function loadHouseItem(item:Object, x:int, y:int):void
        {
            try
            {
                attachHouseItem({
                    "item":item,
                    "x":x,
                    "y":y
                });
            }
            catch(err:Error)
            {
                arrHouseItemQueue.push({
                    "item":item,
                    "typ":"A",
                    "x":x,
                    "y":y
                });
                if (arrHouseItemQueue.length > 0)
                {
                    loadNextHouseItem();
                };
            };
        }

        public function loadNextHouseItem():void
        {
            ldr_House.load(new URLRequest((rootClass.getFilePath() + arrHouseItemQueue[0].item.sFile)), loaderC);
            if (!ldr_House.hasEventListener(Event.COMPLETE))
            {
                ldr_House.contentLoaderInfo.addEventListener(Event.COMPLETE, onHouseItemComplete);
            };
        }

        public function onHouseItemComplete(_arg_1:Event):void
        {
            var _local_2:* = arrHouseItemQueue[0];
            if (_local_2.typ == "A")
            {
                attachHouseItem(_local_2);
                arrHouseItemQueue.splice(0, 1);
                if (arrHouseItemQueue.length > 0)
                {
                    loadNextHouseItem();
                };
            }
            else
            {
                rootClass.ui.mcPopup.mcHouseMenu.previewHouseItem(_local_2);
                arrHouseItemQueue.splice(0, 1);
                if (arrHouseItemQueue.length > 0)
                {
                    loadNextHouseItemB();
                };
            };
        }

        public function loadHouseItemB(item:Object):void
        {
            try
            {
                rootClass.ui.mcPopup.mcHouseMenu.previewHouseItem({"item":item});
            }
            catch(err:Error)
            {
                rootClass.ui.mcPopup.mcHouseMenu.preview.t2.visible = true;
                rootClass.ui.mcPopup.mcHouseMenu.preview.cnt.visible = false;
                rootClass.ui.mcPopup.mcHouseMenu.preview.bAdd.visible = false;
                arrHouseItemQueue.push({
                    "item":item,
                    "typ":"B"
                });
                if (arrHouseItemQueue.length > 0)
                {
                    loadNextHouseItemB();
                };
            };
        }

        public function loadNextHouseItemB():void
        {
            var _local_1:Object = arrHouseItemQueue[0].item;
            var _local_2:String = _local_1.sFile;
            if (_local_1.sType == "House")
            {
                _local_2 = (("maps/" + _local_1.sFile.substr(0, -4)) + "_preview.swf");
            };
            ldr_House.load(new URLRequest((rootClass.getFilePath() + _local_2)), loaderC);
            if (!ldr_House.hasEventListener(Event.COMPLETE))
            {
                ldr_House.contentLoaderInfo.addEventListener(Event.COMPLETE, onHouseItemComplete);
            };
        }

        public function playerInit():*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:Array;
            var _local_6:int;
            trace("------------------------------ Player Init");
            trace((" > " + rootClass.sfc.ipAddress));
            trace(("sfc: " + rootClass.sfc));
            var _local_1:* = rootClass.sfc.getAllRooms();
            for (_local_2 in _local_1)
            {
                trace(("s: " + _local_2));
            };
            trace(("getroom: " + rootClass.sfc.getRoom(curRoom)));
            _local_3 = rootClass.sfc.getRoom(curRoom).getUserList();
            trace("line 6");
            _local_5 = [];
            _local_6 = 0;
            for (_local_4 in _local_3)
            {
                _local_5.push(_local_3[_local_4].getId());
            };
            if (_local_5.length > 0)
            {
                objectByIDArray(_local_5);
            };
            myAvatar = avatars[rootClass.sfc.myUserId];
            trace(("line 27: " + myAvatar));
            myAvatar.isMyAvatar = true;
            myAvatar.pMC.disablePNameMouse();
            rootClass.sfcSocial = true;
        }

        public function objectByIDArray(_arg_1:Array):*
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:*;
            var _local_5:String;
            var _local_6:Object;
            var _local_7:String;
            trace("** WORLD objectByIDArray >");
            var _local_8:Array = [];
            _local_2 = 0;
            while (_local_2 < _arg_1.length)
            {
                _local_3 = _arg_1[_local_2];
                _local_6 = getUoLeafById(_local_3);
                if (_local_6 != null)
                {
                    _local_5 = _local_6.uoName;
                    _local_7 = String(_local_6.strFrame);
                    if (_local_3 == rootClass.sfc.myUserId)
                    {
                        _local_7 = strFrame;
                    };
                    if (avatars[_local_3] == null)
                    {
                        avatars[_local_3] = new Avatar(rootClass);
                        avatars[_local_3].uid = _local_3;
                        avatars[_local_3].pnm = _local_5;
                    };
                    avatars[_local_3].dataLeaf = _local_6;
                    if (((avatars[_local_3].pMC == null) && (_local_7 == strFrame)))
                    {
                        avatars[_local_3].pMC = createAvatarMC(_local_3);
                        _local_8.push(_local_3);
                    };
                    updateUserDisplay(_local_3);
                }
                else
                {
                    trace(("login failed for uid: " + _local_3));
                };
                _local_2++;
            };
            if (_local_8.length > 0)
            {
                getUserDataByIds(_local_8);
            };
        }

        public function objectByID(_arg_1:Number):*
        {
            var _local_3:*;
            var _local_4:*;
            trace("** WORLD objectByID >");
            var _local_2:* = getUoLeafById(_arg_1);
            if (_local_2 != null)
            {
                _local_3 = _local_2.uoName;
                trace((" unm : " + _local_3));
                _local_4 = String(_local_2.strFrame);
                if (_arg_1 == rootClass.sfc.myUserId)
                {
                    _local_4 = strFrame;
                };
                if (avatars[_arg_1] == null)
                {
                    avatars[_arg_1] = new Avatar(rootClass);
                    avatars[_arg_1].uid = _arg_1;
                    avatars[_arg_1].pnm = _local_3;
                };
                avatars[_arg_1].dataLeaf = _local_2;
                if (((avatars[_arg_1].pMC == null) && (_local_4 == strFrame)))
                {
                    avatars[_arg_1].pMC = createAvatarMC(_arg_1);
                    getUserDataById(_arg_1);
                };
                updateUserDisplay(_arg_1);
            };
        }

        public function createAvatarMC(_arg_1:Number):AvatarMC
        {
            trace("** WORLD createAvatarMC >");
            var _local_2:AvatarMC = new AvatarMC();
            _local_2.name = ("a" + _arg_1);
            _local_2.x = -600;
            _local_2.y = 0;
            _local_2.pAV = avatars[_arg_1];
            _local_2.world = this;
            return (_local_2);
        }

        public function destroyAvatar(_arg_1:Number):*
        {
            if (avatars[_arg_1] != null)
            {
                if (avatars[_arg_1].pMC != null)
                {
                    if (!avatars[_arg_1].isMyAvatar)
                    {
                        avatars[_arg_1].pMC.fClose();
                        delete avatars[_arg_1];
                    };
                };
            };
        }

        public function updateUserDisplay(_arg_1:Number):*
        {
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            trace(("** WORLD updateUserDisplay > " + _arg_1));
            var _local_2:* = getMCByUserID(_arg_1);
            var _local_3:* = getUoLeafById(_arg_1);
            var _local_4:* = String(_local_3.strFrame);
            if (_local_4 == strFrame)
            {
                _local_2.tx = int(_local_3.tx);
                _local_2.ty = int(_local_3.ty);
                _local_5 = int(_local_3.intState);
                _local_6 = null;
                if (((("strPad" in _local_3) && (!(_local_3.strPad.toLowerCase() == "none"))) && (_local_3.strPad in map)))
                {
                    _local_6 = map[_local_3.strPad];
                };
                if (((!(_local_2.tx == 0)) || (!(_local_2.ty == 0))))
                {
                    if (!testTxTy(new Point(_local_2.tx, _local_2.ty), _local_2))
                    {
                        _local_7 = solveTxTy(new Point(_local_2.tx, _local_2.ty), _local_2);
                        if (_local_7 != null)
                        {
                            _local_2.x = _local_7.x;
                            _local_2.y = _local_7.y;
                        }
                        else
                        {
                            _local_2.x = int((960 / 2));
                            _local_2.y = int((550 / 2));
                        };
                    }
                    else
                    {
                        _local_2.x = _local_2.tx;
                        _local_2.y = _local_2.ty;
                    };
                }
                else
                {
                    if (_local_6 != null)
                    {
                        _local_2.x = int(((_local_6.x + int((Math.random() * 10))) - 5));
                        _local_2.y = int(((_local_6.y + int((Math.random() * 10))) - 5));
                    }
                    else
                    {
                        _local_2.x = int((960 / 2));
                        _local_2.y = int((550 / 2));
                    };
                };
                _local_2.scale(SCALE);
                if (_local_5)
                {
                    _local_2.mcChar.gotoAndStop("Idle");
                }
                else
                {
                    _local_2.mcChar.gotoAndStop("Dead");
                };
                if (showHPBar)
                {
                    _local_2.showHPBar();
                }
                else
                {
                    _local_2.hideHPBar();
                };
                if (_arg_1 == rootClass.sfc.myUserId)
                {
                    bitWalk = true;
                };
                if (((CELL_MODE == "normal") || (_arg_1 == rootClass.sfc.myUserId)))
                {
                    _local_2.pAV.showMC();
                }
                else
                {
                    _local_2.pAV.hideMC();
                };
                if ((((bPvP) && (!(_local_3.pvpTeam == null))) && (_local_3.pvpTeam > -1)))
                {
                    _local_2.mcChar.pvpFlag.visible = true;
                    _local_2.mcChar.pvpFlag.gotoAndStop(new Array("a", "b", "c")[_local_3.pvpTeam]);
                }
                else
                {
                    _local_2.mcChar.pvpFlag.visible = false;
                };
                if (_local_2.isLoaded)
                {
                    _local_2.gotoAndPlay("in2");
                }
                else
                {
                    _local_2.gotoAndPlay("hold");
                };
            };
        }

        public function repairAvatars():void
        {
            var _local_1:Avatar;
            rootClass.chatF.pushMsg("server", "Attempting to repair incomplete Avatars...", "SERVER", "", 0);
            var _local_2:Boolean;
            for each (_local_1 in avatars)
            {
                if (!_local_1.pMC.isLoaded)
                {
                    _local_2 = true;
                    if (_local_1.objData != null)
                    {
                        rootClass.chatF.pushMsg("server", (" > repairing " + _local_1.objData.strUsername), "SERVER", "", 0);
                        _local_1.initAvatar(_local_1.objData);
                    }
                    else
                    {
                        if (_local_1.pnm != null)
                        {
                            rootClass.chatF.pushMsg("warning", ((" *> Data load incomplete for " + _local_1.pnm) + ", repair cannot continue."), "SERVER", "", 0);
                        }
                        else
                        {
                            rootClass.chatF.pushMsg("warning", " *> Avatar instantiated but no data exists at all!", "SERVER", "", 0);
                        };
                    };
                };
            };
            if (!_local_2)
            {
                rootClass.chatF.pushMsg("server", " > No incomplete Avatars found!", "SERVER", "", 0);
            };
        }

        private function solveTxTy(_arg_1:Point, _arg_2:MovieClip):Point
        {
            var _local_6:Point;
            var _local_7:Point;
            var _local_10:int;
            var _local_3:int = 20;
            var _local_4:int = int((960 / _local_3));
            var _local_5:int = int((550 / _local_3));
            var _local_8:Array = [];
            var _local_9:int;
            while (_local_9 <= _local_4)
            {
                _local_10 = 0;
                while (_local_10 <= _local_5)
                {
                    _local_6 = new Point((_local_9 * _local_3), (_local_10 * _local_3));
                    if (testTxTy(_local_6, _arg_2))
                    {
                        _local_8.push({
                            "x":_local_6.x,
                            "y":_local_6.y,
                            "d":Math.abs(Point.distance(_arg_1, _local_6))
                        });
                    };
                    _local_10++;
                };
                _local_9++;
            };
            if (_local_8.length)
            {
                _local_8.sortOn(["d"], [Array.NUMERIC]);
                _local_7 = new Point(((_local_8[0].x + int((Math.random() * 10))) - 5), ((_local_8[0].y + int((Math.random() * 10))) - 5));
                while ((!(testTxTy(_local_7, _arg_2))))
                {
                    _local_7 = new Point(((_local_8[0].x + int((Math.random() * 10))) - 5), ((_local_8[0].y + int((Math.random() * 10))) - 5));
                };
                return (_local_7);
            };
            return (null);
        }

        private function testTxTy(_arg_1:Point, _arg_2:MovieClip):Boolean
        {
            var _local_3:int = _arg_2.shadow.width;
            var _local_4:int = _arg_2.shadow.height;
            var _local_5:int = int((_arg_1.x - (_local_3 / 2)));
            var _local_6:int = int((_arg_1.y - (_local_4 / 2)));
            var _local_7:Rectangle = new Rectangle(_local_5, _local_6, _local_3, _local_4);
            var _local_8:Rectangle;
            var _local_9:MovieClip;
            var _local_10:Boolean;
            var _local_11:int;
            while (_local_11 < arrSolid.length)
            {
                _local_9 = MovieClip(arrSolid[_local_11].shadow);
                _local_8 = new Rectangle(_local_9.x, _local_9.y, _local_9.width, _local_9.height);
                _local_10 = (!(_local_8.intersects(_local_7)));
                _local_11++;
            };
            return (_local_10);
        }

        public function updatePortrait(_arg_1:Avatar):*
        {
            var _local_2:Array;
            var _local_3:MovieClip;
            var _local_6:int;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_4:int;
            var _local_5:int;
            if (_arg_1 != myAvatar)
            {
                _local_2 = [rootClass.ui.mcPortraitTarget];
            }
            else
            {
                if (_arg_1 == myAvatar.target)
                {
                    _local_2 = [rootClass.ui.mcPortraitTarget, rootClass.ui.mcPortrait];
                }
                else
                {
                    _local_2 = [rootClass.ui.mcPortrait];
                };
            };
            _local_4 = 0;
            while (_local_4 < _local_2.length)
            {
                _local_7 = {};
                _local_3 = _local_2[_local_4];
                _local_3.strName.mouseEnabled = false;
                _local_3.strClass.mouseEnabled = false;
                if (_arg_1.npcType == "monster")
                {
                    _local_7 = monTree[_arg_1.objData.MonMapID];
                    _local_3.strName.text = _arg_1.objData.strMonName.toUpperCase();
                    _local_3.strClass.text = "Monster";
                    if (("stars" in _local_3))
                    {
                        _local_6 = int(Math.round((Math.pow((_arg_1.objData.intLevel * 1.3), 0.5) / 2)));
                        _local_5 = 1;
                        while (_local_5 < 6)
                        {
                            if (_local_5 <= _local_6)
                            {
                                _local_3.stars.getChildByName(("s" + _local_5)).visible = true;
                            }
                            else
                            {
                                _local_3.stars.getChildByName(("s" + _local_5)).visible = false;
                            };
                            _local_5++;
                        };
                    };
                };
                if (_arg_1.npcType == "player")
                {
                    _local_7 = uoTree[_arg_1.pnm];
                    _local_3.strName.text = _arg_1.objData.strUsername.toUpperCase();
                    _local_3.strClass.text = ((_arg_1.objData.strClassName + ", Rank ") + _arg_1.objData.iRank);
                    if (("stars" in _local_3))
                    {
                        _local_5 = 1;
                        while (_local_5 < 6)
                        {
                            _local_3.stars.getChildByName(("s" + _local_5)).visible = false;
                            _local_5++;
                        };
                    };
                };
                if (((_arg_1.npcType == "monster") || (_arg_1.npcType == "player")))
                {
                    _local_3.strLevel.text = _arg_1.objData.intLevel;
                    _local_8 = 0;
                    _local_9 = 0;
                    _local_10 = null;
                    _local_8 = _local_7.intHP;
                    _local_9 = _local_7.intHPMax;
                    _local_10 = _local_3.HP;
                    if (_local_7.intHP >= 0)
                    {
                        _local_10.strIntHP.text = String(_local_7.intHP);
                    }
                    else
                    {
                        _local_10.strIntHP.text = "X";
                    };
                    if (_local_8 < 0)
                    {
                        _local_8 = 0;
                    };
                    if (_local_8 > _local_9)
                    {
                        _local_8 = _local_9;
                    };
                    _local_10.intHPbar.x = Math.min(-(_local_10.intHPbar.width * (1 - (_local_8 / _local_9))), 0);
					if (_arg_1 == myAvatar)
                    {
                        /*if ((1 - (_local_8 / _local_9)) > 0.7)
                        {
							rootClass.ui.mcLowHPGlow.visible = true;
							rootClass.ui.mcLowHPGlow.gotoAndPlay("Init");
                        }
						else
						{
							rootClass.ui.mcLowHPGlow.visible = false;
							rootClass.ui.mcLowHPGlow.gotoAndPlay(11);
						};*/
                    };
                    _local_8 = _local_7.intMP;
                    _local_9 = _local_7.intMPMax;
                    _local_10 = _local_3.MP;
                    if (_local_7.intMP >= 0)
                    {
                        _local_10.strIntMP.text = String(_local_7.intMP);
                    }
                    else
                    {
                        _local_10.strIntMP.text = "X";
                    };
                    if (_local_8 < 0)
                    {
                        _local_8 = 0;
                    };
                    if (_local_8 > _local_9)
                    {
                        _local_8 = _local_9;
                    };
                    _local_10.intMPbar.x = Math.min(-(_local_10.intMPbar.width * (1 - (_local_8 / _local_9))), 0);
                };
                _local_4++;
            };
        }

        public function getAvatarByUserID(_arg_1:int):Avatar
        {
            var _local_2:String = String(_arg_1);
            if ((_local_2 in avatars))
            {
                return (avatars[_local_2]);
            };
            return (null);
        }

        public function getAvatarByUserName(_arg_1:String):Avatar
        {
            var _local_2:String;
            for (_local_2 in avatars)
            {
                if ((((!(avatars[_local_2] == null)) && (!(avatars[_local_2].pnm == null))) && (avatars[_local_2].pnm.toLowerCase() == _arg_1.toLowerCase())))
                {
                    return (avatars[_local_2]);
                };
            };
            return (null);
        }

        public function getMCByUserName(_arg_1:*):AvatarMC
        {
            var _local_2:String;
            for (_local_2 in avatars)
            {
                if ((((!(avatars[_local_2] == null)) && (!(avatars[_local_2].pnm == null))) && (avatars[_local_2].pnm.toLowerCase() == _arg_1.toLowerCase())))
                {
                    if (avatars[_local_2].pMC != null)
                    {
                        return (avatars[_local_2].pMC);
                    };
                };
            };
            return (null);
        }

        public function getMCByUserID(_arg_1:*):AvatarMC
        {
            if (((!(avatars[_arg_1] == undefined)) && (!(avatars[_arg_1].pMC == null))))
            {
                return (avatars[_arg_1].pMC);
            };
            return (null);
        }

        public function getUserByName(_arg_1:*):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_2:Array = rootClass.sfc.getAllRooms();
            for (_local_3 in _local_2)
            {
                _local_4 = _local_2[_local_3];
                for (_local_5 in _local_4.getUserList())
                {
                    _local_6 = _local_4.getUserList()[_local_5];
                    if (String(_local_6.getName()) == _arg_1)
                    {
                        return (_local_6);
                    };
                };
            };
            return (null);
        }

        public function getUserById(_arg_1:Number):*
        {
            return (rootClass.sfc.getRoom(curRoom).getUser(Number(_arg_1)));
        }

        public function getUoLeafById(_arg_1:*):Object
        {
            var _local_2:Object;
            for each (_local_2 in uoTree)
            {
                if (_local_2.entID == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getUoLeafByName(_arg_1:String):Object
        {
            var _local_2:Object;
            _arg_1 = _arg_1.toLowerCase();
            for each (_local_2 in uoTree)
            {
                if (_local_2.uoName == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getUserDataById(_arg_1:*):*
        {
            trace("** WORLD getUserDataById >");
            rootClass.sfc.sendXtMessage("zm", "retrieveUserData", [_arg_1], "str", curRoom);
        }

        public function getUserDataByIds(_arg_1:Array):*
        {
            trace("** WORLD getUserDataByIds >");
            rootClass.sfc.sendXtMessage("zm", "retrieveUserDatas", _arg_1, "str", curRoom);
        }

        public function getUsersByCell(_arg_1:String):Array
        {
            var _local_3:String;
            var _local_2:Array = [];
            for (_local_3 in avatars)
            {
                if (avatars[_local_3].dataLeaf.strFrame == _arg_1)
                {
                    _local_2.push(avatars[_local_3]);
                };
            };
            return (_local_2);
        }

        public function getAllAvatarsInCell():Array
        {
            var _local_1:Array = [];
            _local_1 = getMonstersByCell(myAvatar.dataLeaf.strFrame);
            return (_local_1.concat(getUsersByCell(myAvatar.dataLeaf.strFrame)));
        }

        private function lookAtValue(_arg_1:String, _arg_2:int):Number
        {
            return (parseInt(_arg_1.charAt(_arg_2), 36));
        }

        private function updateValue(_arg_1:*, _arg_2:int, _arg_3:Number):String
        {
            var _local_4:String;
            if (((_arg_3 >= 0) && (_arg_3 < 10)))
            {
                _local_4 = String(_arg_3);
            }
            else
            {
                if (((_arg_3 >= 10) && (_arg_3 < 36)))
                {
                    _local_4 = String.fromCharCode((_arg_3 + 55));
                }
                else
                {
                    _local_4 = "0";
                };
            };
            return (rootClass.strSetCharAt(_arg_1, _arg_2, _local_4));
        }

        public function getQuestValue(_arg_1:Number):Number
        {
            var _local_2:int;
            var _local_3:String;
            if (((!(myAvatar == null)) && (!(myAvatar.objData == null))))
            {
                _local_2 = int((_arg_1 / 100));
                _local_3 = ((_local_2 > 0) ? ("strQuests" + (_local_2 + 1)) : "strQuests");
                if (myAvatar.objData[_local_3] == null)
                {
                    return (-1);
                };
                return (lookAtValue(myAvatar.objData[_local_3], (_arg_1 - (_local_2 * 100))));
            };
            return (-1);
        }

        public function setQuestValue(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:int = int((_arg_1 / 100));
            var _local_4:String = ((_local_3 > 0) ? ("strQuests" + (_local_3 + 1)) : "strQuests");
            if ((_local_4 in myAvatar.objData))
            {
                myAvatar.objData[_local_4] = updateValue(myAvatar.objData[_local_4], (_arg_1 - (_local_3 * 100)), _arg_2);
            };
        }

        public function sendUpdateQuestRequest(_arg_1:Number, _arg_2:Number):void
        {
            rootClass.sfc.sendXtMessage("zm", "updateQuest", [_arg_1, _arg_2], "str", curRoom);
        }

        public function setHomeTownCurrent():void
        {
            rootClass.sfc.sendXtMessage("zm", "setHomeTown", [], "str", curRoom);
            myAvatar.objData.strHomeTown = myAvatar.objData.strMapName;
        }

        public function setHomeTown(_arg_1:String):void
        {
            rootClass.sfc.sendXtMessage("zm", "setHomeTown", [_arg_1], "str", curRoom);
            myAvatar.objData.strHomeTown = _arg_1;
        }

        public function sendBankFromInvRequest(_arg_1:Object):*
        {
            var _local_2:ModalMC;
            var _local_3:Object;
            if (_arg_1.bEquip == 1)
            {
                _local_2 = new ModalMC();
                _local_3 = {};
                _local_3.strBody = "You must unequip the item before storing it in the bank!";
                _local_3.params = {};
                _local_3.glow = "red,medium";
                _local_3.btns = "mono";
                rootClass.ui.ModalStack.addChild(_local_2);
                _local_2.init(_local_3);
            }
            else
            {
                if (((_arg_1.bCoins == 0) && (myAvatar.iBankCount >= myAvatar.objData.iBankSlots)))
                {
                    _local_2 = new ModalMC();
                    _local_3 = {};
                    _local_3.strBody = "You have exceeded your maximum bank storage for non-AC items!";
                    _local_3.params = {};
                    _local_3.glow = "red,medium";
                    _local_3.btns = "mono";
                    rootClass.ui.ModalStack.addChild(_local_2);
                    _local_2.init(_local_3);
                }
                else
                {
                    rootClass.sfc.sendXtMessage("zm", "bankFromInv", [_arg_1.ItemID, _arg_1.CharItemID], "str", curRoom);
                };
            };
        }

        public function sendBankToInvRequest(_arg_1:Object):*
        {
            var _local_2:*;
            var _local_3:*;
            if (myAvatar.items.length >= myAvatar.objData.iBagSlots)
            {
                _local_2 = new ModalMC();
                _local_3 = {};
                _local_3.strBody = "You have exceeded your maximum inventory storage!";
                _local_3.params = {};
                _local_3.glow = "red,medium";
                _local_3.btns = "mono";
                rootClass.ui.ModalStack.addChild(_local_2);
                _local_2.init(_local_3);
            }
            else
            {
                rootClass.sfc.sendXtMessage("zm", "bankToInv", [_arg_1.ItemID, _arg_1.CharItemID], "str", curRoom);
            };
        }

        public function sendBankSwapInvRequest(_arg_1:Object, _arg_2:Object):*
        {
            var _local_3:ModalMC;
            var _local_4:Object;
            if (_arg_2.bEquip == 1)
            {
                _local_3 = new ModalMC();
                _local_4 = {};
                _local_4.strBody = "You must unequip the item before storing it in the bank!";
                _local_4.params = {};
                _local_4.glow = "red,medium";
                _local_4.btns = "mono";
                rootClass.ui.ModalStack.addChild(_local_3);
                _local_3.init(_local_4);
            }
            else
            {
                if ((((_arg_2.bCoins == 0) && (_arg_1.bCoins == 1)) && (myAvatar.iBankCount >= myAvatar.objData.iBankSlots)))
                {
                    _local_3 = new ModalMC();
                    _local_4 = {};
                    _local_4.strBody = "You have exceeded your maximum bank storage for non-AC items!";
                    _local_4.params = {};
                    _local_4.glow = "red,medium";
                    _local_4.btns = "mono";
                    rootClass.ui.ModalStack.addChild(_local_3);
                    _local_3.init(_local_4);
                }
                else
                {
                    rootClass.sfc.sendXtMessage("zm", "bankSwapInv", [_arg_2.ItemID, _arg_2.CharItemID, _arg_1.ItemID, _arg_1.CharItemID], "str", curRoom);
                };
            };
        }

        public function getInventory(_arg_1:*):*
        {
            rootClass.sfc.sendXtMessage("zm", "retrieveInventory", [_arg_1], "str", curRoom);
        }

        public function sendChangeColorRequest(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            rootClass.sfc.sendXtMessage("zm", "changeColor", [_arg_1, _arg_2, _arg_3, _arg_4, hairshopinfo.HairShopID], "str", curRoom);
        }

        public function sendChangeArmorColorRequest(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            rootClass.sfc.sendXtMessage("zm", "changeArmorColor", [_arg_1, _arg_2, _arg_3], "str", curRoom);
        }

        public function sendLoadBankRequest(_arg_1:Array=null):void
        {
            if (_arg_1[0] == "*")
            {
                _arg_1 = ["All"];
            };
            bankinfo.addRequestedTypes(_arg_1);
            rootClass.sfc.sendXtMessage("zm", "loadBank", _arg_1, "str", curRoom);
        }

        public function sendReloadShopRequest(_arg_1:int):void
        {
            if ((((!(shopinfo == null)) && (shopinfo.ShopID == _arg_1)) && (!(shopinfo.bLimited == null))))
            {
                rootClass.sfc.sendXtMessage("zm", "reloadShop", [_arg_1], "str", curRoom);
            };
        }

        public function sendLoadShopRequest(_arg_1:int):void
        {
            if (shopinfo == null || shopinfo.ShopID != _arg_1 || shopinfo.bLimited)
            {
                if (coolDown("loadShop"))
                {
                    rootClass.menuClose();
                    rootClass.sfc.sendXtMessage("zm", "loadShop", [_arg_1], "str", curRoom);
                };
            }
            else
            {
                rootClass.menuClose();
                if (shopinfo.bGuild == 1 && myAvatar.objData.guild == null)
				{
					rootClass.MsgBox.notify("You dont have a guild.");
				}
                else if (shopinfo.bHouse == 1)
                {
                    rootClass.ui.mcPopup.fOpen("HouseShop");
				}
				else if (rootClass.isMergeShop(shopinfo))
				{
					rootClass.ui.mcPopup.fOpen("MergeShop");
				}
				else
				{
					rootClass.ui.mcPopup.fOpen("Shop");
				};
            };
        }
		
		public function senLoadForgeRequest():void
		{
			if (forgeinfo == null)
            {
                if (coolDown("loadForge"))
                {
                    rootClass.menuClose();
                    rootClass.sfc.sendXtMessage("zm", "loadForge", [], "str", curRoom);
                };
            }
            else
            {
                rootClass.menuClose();
				rootClass.ui.mcPopup.fOpen("Forge");
            };
		}

        public function sendLoadHairShopRequest(_arg_1:int):void
        {
            if (((hairshopinfo == null) || (!(hairshopinfo.HairShopID == _arg_1))))
            {
                rootClass.sfc.sendXtMessage("zm", "loadHairShop", [_arg_1], "str", curRoom);
            }
            else
            {
                rootClass.openCharacterCustomize();
            };
        }

        public function sendLoadEnhShopRequest(_arg_1:int):void
        {
            var _local_2:ModalMC = new ModalMC();
            var _local_3:Object = {};
            _local_3.strBody = "Old enhancement shops are disabled on the PTR.  Please visit Battleon for the new shops.";
            _local_3.params = {};
            _local_3.btns = "mono";
            rootClass.ui.ModalStack.addChild(_local_2);
            _local_2.init(_local_3);
        }

        public function sendEnhItemRequest(_arg_1:Object):void
        {
            enhItem = _arg_1;
            rootClass.sfc.sendXtMessage("zm", "enhanceItem", [_arg_1.ItemID, _arg_1.EnhID, enhShopID], "str", curRoom);
        }

        public function sendEnhItemRequestShop(_arg_1:Object, _arg_2:Object):void
        {
            if (coolDown("buyItem"))
            {
                enhItem = _arg_1;
                rootClass.sfc.sendXtMessage("zm", "enhanceItemShop", [_arg_1.ItemID, _arg_2.ItemID, shopinfo.ShopID], "str", curRoom);
            };
        }

        public function sendEnhItemRequestLocal(_arg_1:Object, _arg_2:Object):void
        {
            if (coolDown("buyItem"))
            {
                enhItem = _arg_1;
                rootClass.sfc.sendXtMessage("zm", "enhanceItemLocal", [_arg_1.ItemID, _arg_2.ItemID], "str", curRoom);
            };
        }

        public function sendBuyItemRequest(_arg_1:Object, _arg_2:int=1):void
        {
            if (this.coolDown("buyItem"))
            {
                if (((_arg_1.bStaff == 1) && (this.myAvatar.objData.intAccessLevel < 40)))
                {
                    this.rootClass.MsgBox.notify("Test Item: Cannot be purchased yet!");
                }
                else
                {
                    if (((!(this.shopinfo.sField == "")) && (!(this.getAchievement(this.shopinfo.sField, this.shopinfo.iIndex) == 1))))
                    {
                        this.rootClass.MsgBox.notify("Item Locked: Special requirement not met.");
                    }
                    else
                    {
                        if (((_arg_1.bUpg == 1) && (!(this.myAvatar.isUpgraded()))))
                        {
                            this.rootClass.showUpgradeWindow();
                        }
                        else
                        {
                            if (((_arg_1.FactionID > 1) && (this.myAvatar.getRep(_arg_1.FactionID) < _arg_1.iReqRep)))
                            {
                                this.rootClass.MsgBox.notify("Item Locked: Reputation Requirement not met.");
                            }
                            else
                            {
                                if (!this.rootClass.validateArmor(_arg_1))
                                {
                                    this.rootClass.MsgBox.notify("Item Locked: Class Requirement not met.");
                                }
                                else
                                {
                                    if (((_arg_1.iQSindex >= 0) && (this.getQuestValue(_arg_1.iQSindex) < int(_arg_1.iQSvalue))))
                                    {
                                        this.rootClass.MsgBox.notify("Item Locked: Quest Requirement not met.");
                                    }
                                    else
                                    {
                                        if ((((this.myAvatar.isItemInInventory(_arg_1.ItemID)) || (this.myAvatar.isItemInBank(_arg_1.ItemID))) && (this.myAvatar.isItemStackMaxed(_arg_1.ItemID))))
                                        {
                                            this.rootClass.MsgBox.notify((("You cannot have more than " + _arg_1.iStk) + " of that item!"));
                                        }
                                        else
                                        {
                                            if (((_arg_1.bCoins == 0) && (_arg_1.iCost > this.myAvatar.objData.intGold)))
                                            {
                                                this.rootClass.MsgBox.notify("Insufficient Funds!");
                                            }
                                            else
                                            {
                                                if (((_arg_1.bCoins == 1) && (_arg_1.iCost > this.myAvatar.objData.intCoins)))
                                                {
                                                    this.rootClass.MsgBox.notify("Insufficient Funds!");
                                                }
                                                else
                                                {
                                                    if ((((!(this.rootClass.isHouseItem(_arg_1))) && (this.myAvatar.items.length >= this.myAvatar.objData.iBagSlots)) || ((this.rootClass.isHouseItem(_arg_1)) && (this.myAvatar.houseitems.length >= this.myAvatar.objData.iHouseSlots))))
                                                    {
                                                        this.rootClass.MsgBox.notify("Inventory Full!");
                                                    }
                                                    else
                                                    {
                                                        if (((this.shopBuyItem == null) || (!(this.shopBuyItem.ShopItemID == _arg_1.ShopItemID))))
                                                        {
                                                            (this.shopBuyItem = _arg_1);
                                                        };
                                                        this.rootClass.sfc.sendXtMessage("zm", "buyItem", [this.shopBuyItem.ItemID, this.shopinfo.ShopID, this.shopBuyItem.ShopItemID, _arg_2], "str", this.curRoom);
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        public function sendSellItemRequest(_arg_1:Object, _arg_2:int=1):void
        {
            if (this.coolDown("sellItem"))
            {
                this.rootClass.sfc.sendXtMessage("zm", "sellItem", [_arg_1.ItemID, _arg_2, _arg_1.CharItemID], "str", this.curRoom);
            };
        }

        public function sendRemoveItemRequest(_arg_1:Object, _arg_2:int=1):void
        {
            if (_arg_2 == 1)
            {
                rootClass.sfc.sendXtMessage("zm", "removeItem", [_arg_1.ItemID, _arg_1.CharItemID], "str", curRoom);
            }
            else
            {
                rootClass.sfc.sendXtMessage("zm", "removeItem", [_arg_1.ItemID, _arg_1.CharItemID, _arg_2], "str", curRoom);
            };
        }

        public function sendRemoveTempItemRequest(_arg_1:int, _arg_2:int):void
        {
            rootClass.sfc.sendXtMessage("zm", "removeTempItem", [_arg_1, _arg_2], "str", curRoom);
            myAvatar.removeTempItem(_arg_1, _arg_2);
        }

        public function sendEquipItemRequest(_arg_1:Object):Boolean
        {
            var _local_2:Boolean = true;
            if (((!(_arg_1 == null)) && (!(myAvatar.isItemEquipped(_arg_1.ItemID)))))
            {
                if (coolDown("equipItem"))
                {
                    rootClass.sfc.sendXtMessage("zm", "equipItem", [_arg_1.CharItemID, _arg_1.ItemID], "str", curRoom);
                }
                else
                {
                    _local_2 = false;
                };
            }
            else
            {
                _local_2 = false;
            };
            return (_local_2);
        }

        public function sendForceEquipRequest(_arg_1:int):void
        {
            rootClass.sfc.sendXtMessage("zm", "forceEquipItem", [_arg_1], "str", curRoom);
        }

        public function sendUnequipItemRequest(_arg_1:Object):void
        {
            if (((!(_arg_1 == null)) && (myAvatar.isItemEquipped(_arg_1.ItemID))))
            {
                if (coolDown("unequipItem"))
                {
                    rootClass.sfc.sendXtMessage("zm", "unequipItem", [_arg_1.CharItemID, _arg_1.ItemID], "str", curRoom);
                };
            };
        }

        public function sendChangeClassRequest(_arg_1:int):void
        {
            rootClass.sfc.sendXtMessage("zm", "changeClass", [_arg_1], "str", curRoom);
        }

        public function selfMute(_arg_1:int=1):void
        {
            rootClass.sfc.sendXtMessage("zm", "cmd", ["mute", _arg_1, myAvatar.objData.strUsername.toLowerCase()], "str", rootClass.world.curRoom);
        }

        public function equipUseableItem(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_4:Object;
            var _local_3:int;
            _local_3 = 0;
            while (_local_3 < actions.active.length)
            {
                if (actions.active[_local_3].ref == "i1")
                {
                    _local_2 = actions.active[_local_3];
                };
                _local_3++;
            };
            _local_2.sArg1 = String(_arg_1.ItemID);
            _local_2.sArg2 = String(_arg_1.sDesc);
            rootClass.updateIcons(getActIcons(_local_2), [_arg_1.sFile], _arg_1);
            rootClass.updateActionObjIcon(_local_2);
            _local_3 = 0;
            while (_local_3 < myAvatar.items.length)
            {
                _local_4 = myAvatar.items[_local_3];
                if (((_local_4.sType.toLowerCase() == "item") && (!(_local_4.sLink.toLowerCase() == "none"))))
                {
                    if (_local_4.ItemID == _arg_1.ItemID)
                    {
                        _local_4.bEquip = 1;
                        rootClass.sfc.sendXtMessage("zm", "geia", [_local_4.sLink, _local_4.sMeta], "str", rootClass.world.curRoom);
                    }
                    else
                    {
                        _local_4.bEquip = 0;
                    };
                };
                _local_3++;
            };
            if (rootClass.ui.mcPopup.mcInventory != null)
            {
                rootClass.ui.mcPopup.mcInventory.mcItemList.refreshList();
                rootClass.ui.mcPopup.mcInventory.refreshDetail();
            };
        }

        public function unequipUseableItem(_arg_1:Object=null):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:int;
            _local_4 = 0;
            while (_local_4 < actions.active.length)
            {
                if (actions.active[_local_4].ref == "i1")
                {
                    _local_2 = actions.active[_local_4];
                };
                _local_4++;
            };
            _local_2.sArg1 = "";
            _local_2.sArg2 = "";
            rootClass.updateIcons(getActIcons(_local_2), ["icu1"], null);
            if (_arg_1 == null)
            {
                _local_4 = 0;
                while (_local_4 < myAvatar.items.length)
                {
                    _local_3 = myAvatar.items[_local_4];
                    if (String(_local_3.ItemID) == _local_2.sArg1)
                    {
                        _arg_1 = _local_3;
                    };
                    _local_4++;
                };
            };
            _arg_1.bEquip = 0;
            if (rootClass.ui.mcPopup.mcInventory != null)
            {
                rootClass.ui.mcPopup.mcInventory.mcItemList.refreshList();
                rootClass.ui.mcPopup.mcInventory.refreshDetail();
            };
        }

        public function tryUseItem(_arg_1:Object, qnty:int = 1):void
        {
            if (_arg_1.sType.toLowerCase() == "clientuse")
            {
                switch (_arg_1.sLink)
                {
                };
            }
            else
            {
                if (_arg_1.sType.toLowerCase() == "serveruse")
                {
                    sendUseItemRequest(_arg_1, qnty);
                };
            };
        }

        public function sendUseItemRequest(_arg_1:Object, qnty:int = 1):void
        {
            rootClass.sfc.sendXtMessage("zm", "serverUseItem", ["+", _arg_1.ItemID, qnty], "str", -1);
        }

        public function sendUseItemArrayRequest(_arg_1:Array):void
        {
            rootClass.sfc.sendXtMessage("zm", "serverUseItem", _arg_1, "str", -1);
        }

        public function bankHasRequested(_arg_1:Array):Boolean
        {
            return (bankinfo.hasRequested(_arg_1));
        }

        public function addItemsToBank(_arg_1:Array):void
        {
            bankinfo.addItemsToBank(_arg_1);
        }

        public function toggleBank():void
        {
            if (!uiLock)
            {
                if (rootClass.ui.mcPopup.currentLabel == "Bank")
                {
                    MovieClip(rootClass.ui.mcPopup.getChildByName("mcBank")).fClose();
                }
                else
                {
                    rootClass.ui.mcPopup.fOpen("Bank");
                };
            };
        }

        public function sendReport(_arg_1:Array):void
        {
            rootClass.sfc.sendXtMessage("zm", "cmd", _arg_1, "str", rootClass.world.curRoom);
        }

        public function sendWhoRequest():void
        {
            if (coolDown("who"))
            {
                rootClass.sfc.sendXtMessage("zm", "cmd", ["who"], "str", curRoom);
            };
        }

        public function sendRewardReferralRequest(_arg_1:*):void
        {
            rootClass.sfc.sendXtMessage("zm", "rewardReferral", [], "str", curRoom);
        }

        public function sendGetAdDataRequest():void
        {
            if (rootClass.world.myAvatar.objData.iDailyAds < rootClass.world.myAvatar.objData.iDailyAdCap)
            {
                rootClass.sfc.sendXtMessage("zm", "getAdData", [], "str", curRoom);
            };
        }

        public function sendGetAdRewardRequest():void
        {
            if (rootClass.world.myAvatar.objData.iDailyAds < rootClass.world.myAvatar.objData.iDailyAdCap)
            {
                rootClass.sfc.sendXtMessage("zm", "getAdReward", [], "str", curRoom);
            };
        }

        public function sendWarVarsRequest():void
        {
            rootClass.sfc.sendXtMessage("zm", "loadWarVars", [], "str", curRoom);
        }

        public function loadQuestStringData():void
        {
            rootClass.sfc.sendXtMessage("zm", "loadQuestStringData", [], "str", curRoom);
        }

        public function buyBagSlots(_arg_1:int):void
        {
            rootClass.sfc.sendXtMessage("zm", "buyBagSlots", [_arg_1], "str", curRoom);
        }

        public function buyBankSlots(_arg_1:int):void
        {
            rootClass.sfc.sendXtMessage("zm", "buyBankSlots", [_arg_1], "str", curRoom);
        }

        public function buyHouseSlots(_arg_1:int):void
        {
            rootClass.sfc.sendXtMessage("zm", "buyHouseSlots", [_arg_1], "str", curRoom);
        }

        public function sendLoadFriendsListRequest():*
        {
            rootClass.sfc.sendXtMessage("zm", "loadFriendsList", [], "str", curRoom);
        }

        public function sendLoadFactionRequest():*
        {
            rootClass.sfc.sendXtMessage("zm", "loadFactions", [], "str", curRoom);
        }

        public function initAchievements():void
        {
            var _local_2:* = myAvatar.objData;
            with (_local_2)
            {
                ip0 = uint(ip0);
                ia0 = uint(ia0);
                ia1 = uint(ia1);
                id0 = uint(id0);
                id1 = uint(id1);
                id2 = uint(id2);
                iw0 = uint(iw0);
                iw1 = uint(iw1);
                iw2 = uint(iw2);
                im0 = uint(im0);
                im1 = uint(im1);
                im2 = uint(im2);
                iq0 = uint(iq0);
            };
        }

        public function getAchievement(_arg_1:String, _arg_2:int):int
        {
            if (_arg_2 < 0 || _arg_2 > 31)
            {
                return (-1);
            };
            var _local_3:* = myAvatar.objData[_arg_1];
            if (_local_3 == null)
            {
                return (-1);
            };
            return (((_local_3 & Math.pow(2, _arg_2)) == 0) ? 0 : 1);
        }

        public function setAchievement(_arg_1:String, _arg_2:int, _arg_3:int=1):void
        {
            var _local_4:* = ["ia0", "iq0"];
            if (((((_local_4.indexOf(_arg_1) >= 0) && (_arg_2 >= 0)) && (_arg_2 < 32)) && (!(getAchievement(_arg_1, _arg_2) == _arg_3))))
            {
                rootClass.sfc.sendXtMessage("zm", "setAchievement", [_arg_1, _arg_2, _arg_3], "str", curRoom);
            };
        }

        public function updateAchievement(_arg_1:String, _arg_2:int, _arg_3:int):void
        {
            if (_arg_3 == 0)
            {
                myAvatar.objData[_arg_1] = (myAvatar.objData[_arg_1] & (~(Math.pow(2, _arg_2))));
            }
            else
            {
                if (_arg_3 == 1)
                {
                    myAvatar.objData[_arg_1] = (myAvatar.objData[_arg_1] | Math.pow(2, _arg_2));
                };
            };
            rootClass.readIA1Preferences();
        }

        public function showFriendsList():void
        {
            var _local_1:*;
            trace(("friends: " + myAvatar.friends));
            if (((!(myAvatar.friends == null)) && (myAvatar.friendsLoaded)))
            {
                _local_1 = {};
                _local_1.typ = "userListFriends";
                _local_1.ul = myAvatar.friends;
                rootClass.ui.mcOFrame.fOpenWith(_local_1);
            }
            else
            {
                myAvatar.friendsLoaded = true;
                rootClass.sfc.sendXtMessage("zm", "getfriendlist", [], "str", -1);
            };
        }
		
        public function showGuildList():void
        {
            if (myAvatar.objData.guild != null)
            {
                rootClass.ui.mcPopup.fOpen("GuildPanel");
            }
            else
            {
                rootClass.MsgBox.notify("Precisa criar ou entrar em uma guilda primeiro.");
            };
        }
		
        public function showIgnoreList():void
        {
            var _local_1:Object;
            if (((!(rootClass.chatF.ignoreList.data.users == null)) && (rootClass.chatF.ignoreList.data.users.length > 0)))
            {
                _local_1 = {};
                _local_1.typ = "userListIgnore";
                rootClass.ui.mcOFrame.fOpenWith(_local_1);
            }
            else
            {
                rootClass.chatF.pushMsg("warning", "Sua lista de bloqueios esta vazia!", "SERVER", "", 0);
            };
        }

        public function isModerator(_arg_1:String):void
        {
            rootClass.sfc.sendXtMessage("zm", "isModerator", [_arg_1], "str", -1);
        }

        public function toggleName(_arg_1:*, _arg_2:String):*
        {
            if (_arg_2 == "on")
            {
                getMCByUserID(_arg_1).pname.visible = true;
            };
            if (_arg_2 == "off")
            {
                getMCByUserID(_arg_1).pname.visible = false;
            };
        }

        public function toggleHPBar():void
        {
            var _local_1:String;
            var _local_2:MovieClip;
            var _local_3:Avatar;
            showHPBar = (!(showHPBar));
            for (_local_1 in avatars)
            {
                _local_3 = avatars[_local_1];
                if (_local_3.pMC != null)
                {
                    _local_2 = _local_3.pMC;
                    if (showHPBar)
                    {
                        _local_2.showHPBar();
                    }
                    else
                    {
                        _local_2.hideHPBar();
                    };
                };
            };
        }

        public function resPlayer():*
        {
            afkPostpone();
            rootClass.sfc.sendXtMessage("zm", "resPlayerTimed", [rootClass.sfc.myUserId], "str", curRoom);
        }

        public function showResCounter():*
        {
            trace("line 1131");
            var _local_1:* = MovieClip(rootClass.ui.mcRes);
            if (_local_1.currentLabel == "in")
            {
                return;
            };
            _local_1.gotoAndPlay("in");
            _local_1.resC = 10;
            trace("line 1136");
            trace("line 1146");
            if (_local_1.resTimer == null)
            {
                _local_1.resTimer = new Timer(1000);
                _local_1.resTimer.addEventListener("timer", resTimer);
            }
            else
            {
                _local_1.resTimer.reset();
            };
            trace("line 1153");
            _local_1.resTimer.start();
        }

        public function resTimer(_arg_1:TimerEvent):*
        {
            var _local_2:* = MovieClip(rootClass.ui.mcRes);
            _local_2.resC--;
            if (_local_2.resC > 0)
            {
                _local_2.mcTomb.ti.text = ("0" + _local_2.resC);
            }
            else
            {
                _local_2.mcTomb.ti.text = "00";
                _arg_1.target.reset();
                _local_2.visible = false;
                _local_2.gotoAndStop(1);
                resPlayer();
            };
        }

        public function danceRequest(_arg_1:*):*
        {
            var _local_2:*;
            if (_arg_1.accept)
            {
                rootClass.chatF.submitMsg(_arg_1.emote1, "emote", rootClass.sfc.myUserName);
            }
            else
            {
                _local_2 = {};
                _local_2.typ = "danceDenied";
                _local_2.cell = strFrame;
                rootClass.sfc.sendObjectToGroup(_local_2, [_arg_1.sender.getId()], curRoom);
            };
        }

        public function rest():void
        {
            if (!restTimer.running)
            {
				var animList:* = ["Rest", "Pant"];
				var randAni:* = animList[Math.floor((Math.random() * animList.length))];
				switch (randAni)
				{
					case "Rest":
						this.myAvatar.pMC.mcChar.gotoAndPlay("Rest");
						this.rootClass.sfc.sendXtMessage("zm", "emotea", ["rest"], "str", 1);
					break;
					case "Pant":
						this.myAvatar.pMC.mcChar.gotoAndPlay("Pant");
						this.rootClass.sfc.sendXtMessage("zm", "emotea", ["pant"], "str", 1);
					break;
				};
                restStart();
            };
        }

        public function restStart():*
        {
            afkPostpone();
            restTimer.reset();
            restTimer.start();
        }

        public function restRequest(_arg_1:TimerEvent):*
        {
            var _local_2:* = getUoLeafById(myAvatar.uid);
            if (((((!(_local_2.intHP == _local_2.intHPMax)) || (!(_local_2.intMP == _local_2.intMPMax))) && (myAvatar.pMC.mcChar.currentLabel == "Rest")) && (_local_2.intState == 1)))
            {
                if (coolDown("rest"))
                {
                    rootClass.sfc.sendXtMessage("zm", "restRequest", [""], "str", 1);
                    restTimer.reset();
                    restTimer.start();
                }
                else
                {
                    restStart();
                };
            }
            else
            {
                restTimer.reset();
            };
        }

        public function afkToggle():void
        {
            var _local_1:* = uoTree[rootClass.sfc.myUserName];
            if (_local_1 != null)
            {
                rootClass.sfc.sendXtMessage("zm", "afk", [(!(_local_1.afk))], "str", 1);
            };
        }

        public function afkTimerHandler(_arg_1:Event):void
        {
            var _local_2:* = uoTree[rootClass.sfc.myUserName];
            if (_local_2 != null)
            {
                rootClass.sfc.sendXtMessage("zm", "afk", [true], "str", 1);
            };
        }

        public function afkPostpone():void
        {
            afkTimer.reset();
            afkTimer.start();
            var _local_1:* = new Date().getTime();
            var _local_2:* = uoTree[rootClass.sfc.myUserName];
            if ((((!(_local_2 == null)) && (_local_2.afk)) && ((_local_2.afkts == null) || (_local_1 > (_local_2.afkts + 500)))))
            {
                rootClass.sfc.sendXtMessage("zm", "afk", [false], "str", 1);
                _local_2.afkts = _local_1;
            };
        }

        public function hideAllPets(_arg_1:Boolean=true):void
        {
            var _local_2:*;
            for (_local_2 in avatars)
            {
                if (!((!(_arg_1)) && (avatars[_local_2] == myAvatar)))
                {
                    if (avatars[_local_2] != null)
                    {
                        avatars[_local_2].unloadPet();
                    };
                };
            };
        }

        public function showAllPets(_arg_1:Boolean=true):void
        {
            var _local_2:*;
            var _local_3:Object;
            var _local_4:*;
            for (_local_2 in avatars)
            {
                if (!((!(_arg_1)) && (avatars[_local_2] == myAvatar)))
                {
                    _local_3 = getUoLeafById(_local_2);
                    _local_4 = String(_local_3.strFrame);
                    if (_local_4 == strFrame)
                    {
                        avatars[_local_2].loadPet();
                    };
                };
            };
        }

        public function updateMonsters():*
        {
            var _local_1:int;
            if (monmap != null)
            {
                _local_1 = 0;
                while (_local_1 < monmap.length)
                {
                    if (monmap[_local_1].strFrame == strFrame)
                    {
                        updateMonster(monmap[_local_1]);
                    };
                    _local_1++;
                };
            };
        }

        public function updateMonster(_arg_1:Object):void
        {
            var _local_2:* = getMonsterDefinition(_arg_1.MonID);
            var _local_3:* = getMonster(_arg_1.MonMapID);
            if (_local_3.pMC == null)
            {
                trace((">> Monster Pad Missing - MonMapID:" + _arg_1.MonMapID));
                return;
            };
            _local_3.objData.intMPMax = int(_local_3.objData.intMPMax);
            _local_3.objData.intHPMax = int(_local_3.objData.intMPMax);
            var _local_4:* = monTree[_arg_1.MonMapID];
            if (((!(_local_4.MonID == _local_3.objData.MonID)) || (_local_4.intState == 0)))
            {
                _local_3.pMC.visible = false;
            };
            if ((_local_3.pMC.x - myAvatar.pMC.x) >= 0)
            {
                _local_3.pMC.turn("left");
            };
            _local_3.pMC.updateNamePlate();
        }

        public function createMonsterMC(_arg_1:MovieClip, _arg_2:int, _arg_3:Boolean=false):MonsterMC
        {
            var _local_5:MonsterMC;
            var _local_6:int;
            var _local_7:Class;
            var _local_4:* = getMonsterDefinition(_arg_2);
            if (_arg_3)
            {
                _local_6 = int(Math.round((Math.random() * (chaosNames.length - 1))));
                trace("chaos names");
                trace(chaosNames);
                if (chaosNames[_local_6] != rootClass.world.myAvatar.objData.strUsername)
                {
                    _local_5 = new MonsterMC(chaosNames[_local_6]);
                }
                else
                {
                    _local_6 = ((_local_6 == 0) ? ++_local_6 : --_local_6);
                    _local_5 = new MonsterMC(chaosNames[_local_6]);
                };
                trace(("mon name: " + chaosNames[_local_6]));
            }
            else
            {
                if (Number((objExtra["bChar"] == 1)))
                {
                    _local_5 = new MonsterMC(myAvatar.objData.strUsername);
                }
                else
                {
                    _local_5 = new MonsterMC(_local_4.strMonName);
                };
            };
            CHARS.addChild(_local_5);
            _local_5.x = _arg_1.x;
            _local_5.y = _arg_1.y;
            _local_5.ox = _local_5.x;
            _local_5.oy = _local_5.y;
            if (Number((objExtra["bChar"] == 1)))
            {
                _local_5.removeChildAt(1);
                _local_5.addChildAt((new dummyMC() as MovieClip), 1);
                copyAvatarMC((_local_5.getChildAt(1) as MovieClip));
            }
            else
            {
                _local_7 = (loaderD.getDefinition(_local_4.strLinkage) as Class);
                _local_5.removeChildAt(1);
                _local_5.addChildAt(new (_local_7)(), 1);
            };
            _local_5.mouseEnabled = false;
            _local_5.bubble.mouseEnabled = (_local_5.bubble.mouseChildren = false);
            _local_5.init();
            if (("strDir" in _arg_1))
            {
                if (_arg_1.strDir == "static")
                {
                    _local_5.isStatic = true;
                };
            };
            if (("noMove" in _arg_1))
            {
                _local_5.noMove = _arg_1.noMove;
            };
            return (_local_5);
        }

        public function getMonDataById():*
        {
        }

        public function retrieveMonData():*
        {
            rootClass.sfc.sendXtMessage("zm", "retrieveMonData", [], "str", 1);
        }

        private function getMonID(_arg_1:int):int
        {
            var _local_2:String;
            var _local_3:*;
            for (_local_2 in monTree)
            {
                _local_3 = monTree[_local_2];
                if (_local_3.MonMapID == _arg_1)
                {
                    return (_local_3.MonID);
                };
            };
            return (-1);
        }

        private function getMonsterDefinition(_arg_1:int):Object
        {
            var _local_2:int;
            while (_local_2 < mondef.length)
            {
                if (mondef[_local_2].MonID == _arg_1)
                {
                    return (mondef[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function getMonster(_arg_1:int):Avatar
        {
            var _local_2:int;
            while (_local_2 < monsters.length)
            {
                if (((monsters[_local_2].objData.MonMapID == _arg_1) && (monsters[_local_2].objData.MonID == monTree[_arg_1].MonID)))
                {
                    return (monsters[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function getMonsters(_arg_1:int):Array
        {
            var _local_2:Array = [];
            var _local_3:int;
            while (_local_3 < monsters.length)
            {
                if (monsters[_local_3].objData.MonMapID == _arg_1)
                {
                    _local_2.push(monsters[_local_3]);
                };
                _local_3++;
            };
            if (_local_2.length > 0)
            {
                return (_local_2);
            };
            return (null);
        }

        public function getMonsterCluster(_arg_1:int):Array
        {
            var _local_2:* = [];
            var _local_3:int;
            while (_local_3 < monsters.length)
            {
                if (monsters[_local_3].objData.MonMapID == _arg_1)
                {
                    _local_2.push(monsters[_local_3]);
                };
                _local_3++;
            };
            return (_local_2);
        }

        public function getMonstersByCell(_arg_1:String):Array
        {
            var _local_2:Array = [];
            var _local_3:int;
            while (_local_3 < monsters.length)
            {
                if (((!(monsters[_local_3].dataLeaf == null)) && (monsters[_local_3].dataLeaf.strFrame == _arg_1)))
                {
                    _local_2.push(monsters[_local_3]);
                };
                _local_3++;
            };
            return (_local_2);
        }

        public function initMonsters(_arg_1:Array, _arg_2:Array):*
        {
            var _local_4:Object;
            var _local_5:int;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_3:int;
            if (((!(_arg_1 == null)) && (!(_arg_2 == null))))
            {
                monswf = new Array();
                monsters = new Array();
                _local_4 = null;
                _local_3 = 0;
                while (_local_3 < _arg_2.length)
                {
                    _local_5 = 0;
                    while (_local_5 < _arg_1.length)
                    {
                        if (_arg_2[_local_3].MonID == _arg_1[_local_5].MonID)
                        {
                            _local_4 = _arg_1[_local_5];
                        };
                        _local_5++;
                    };
                    monsters.push(new Avatar(rootClass));
                    _local_6 = monsters[(monsters.length - 1)];
                    _local_6.npcType = "monster";
                    if (_local_6.objData == null)
                    {
                        _local_6.objData = {};
                    };
                    for (_local_7 in _local_4)
                    {
                        _local_6.objData[_local_7] = _local_4[_local_7];
                    };
                    for (_local_7 in _arg_2[_local_3])
                    {
                        _local_6.objData[_local_7] = _arg_2[_local_3][_local_7];
                    };
                    _local_8 = monTree[String(_local_6.objData.MonMapID)];
                    _local_8.strFrame = String(_local_6.objData.strFrame);
                    if (_local_8.MonID == _local_6.objData.MonID)
                    {
                        _local_6.dataLeaf = monTree[_local_6.objData.MonMapID];
                    }
                    else
                    {
                        _local_6.dataLeaf = null;
                    };
                    _local_3++;
                };
                _local_3 = 0;
                while (_local_3 < _arg_1.length)
                {
                    trace(((((_local_3 + "  ") + rootClass.getFilePath()) + "mon/") + _arg_1[_local_3].strMonFileName));
                    queueLoad({
                        "strFile":((rootClass.getFilePath() + "mon/") + _arg_1[_local_3].strMonFileName),
                        "callBackA":onMonLoadComplete
                    });
                    _local_3++;
                };
            };
        }

        private function onMonLoadComplete(_arg_1:Event):*
        {
            monswf.push(MovieClip(Loader(_arg_1.target.loader).content));
            trace(((((("      >>>> successful " + Loader(_arg_1.target.loader).contentLoaderInfo.url) + " ") + monswf.length) + " / ") + mondef.length));
            if (monswf.length == mondef.length)
            {
                enterMap();
            };
        }

        public function toggleMonsters():*
        {
            var _local_1:DisplayObject;
            rootClass.ui.monsterIcon.redX.visible = showMonsters;
            showMonsters = (!(showMonsters));
            var _local_2:int;
            while (_local_2 < CHARS.numChildren)
            {
                _local_1 = CHARS.getChildAt(_local_2);
                if (((_local_1.hasOwnProperty("isMonster")) && (MovieClip(_local_1).isMonster)))
                {
                    MovieClip(_local_1).setVisible();
                };
                _local_2++;
            };
        }

        public function setTarget(_arg_1:*):*
        {
            if (((!(myAvatar == null)) && (!(myAvatar.target == _arg_1))))
            {
                if (myAvatar.target != null)
                {
                    if (myAvatar.target.npcType == "monster")
                    {
                        if ((((bPvP) && (!(myAvatar.target.dataLeaf.react == null))) && (myAvatar.target.dataLeaf.react[myAvatar.dataLeaf.pvpTeam] == 1)))
                        {
                            myAvatar.target.pMC.modulateColor(avtPCT, "-");
                        }
                        else
                        {
                            myAvatar.target.pMC.modulateColor(avtMCT, "-");
                        };
                    };
                    if (myAvatar.target.npcType == "player")
                    {
                        if (((bPvP) && (!(myAvatar.target.dataLeaf.pvpTeam == myAvatar.dataLeaf.pvpTeam))))
                        {
                            myAvatar.target.pMC.modulateColor(avtMCT, "-");
                        }
                        else
                        {
                            myAvatar.target.pMC.modulateColor(avtPCT, "-");
                        };
                    };
                };
                if (_arg_1 != null)
                {
                    if (((!(bPvP)) && (_arg_1.npcType == "player")))
                    {
                        if (autoActionTimer != null)
                        {
                            cancelAutoAttack();
                        };
                    };
                    myAvatar.target = _arg_1;
                    if (myAvatar.target.npcType == "monster")
                    {
                        if ((((bPvP) && (!(myAvatar.target.dataLeaf.react == null))) && (myAvatar.target.dataLeaf.react[myAvatar.dataLeaf.pvpTeam] == 1)))
                        {
                            myAvatar.target.pMC.modulateColor(avtPCT, "+");
                        }
                        else
                        {
                            myAvatar.target.pMC.modulateColor(avtMCT, "+");
                        };
                    };
                    if (myAvatar.target.npcType == "player")
                    {
                        if (((bPvP) && (!(myAvatar.target.dataLeaf.pvpTeam == myAvatar.dataLeaf.pvpTeam))))
                        {
                            myAvatar.target.pMC.modulateColor(avtMCT, "+");
                        }
                        else
                        {
                            myAvatar.target.pMC.modulateColor(avtPCT, "+");
                        };
                    };
                    rootClass.showPortraitTarget(_arg_1);
                }
                else
                {
                    rootClass.hidePortraitTarget();
                    if (myAvatar.dataLeaf.intState > 0)
                    {
                        exitCombat();
                    };
                    myAvatar.target = null;
                };
            };
        }

        public function cancelTarget():void
        {
            if (((!(autoActionTimer == null)) && (autoActionTimer.running)))
            {
                cancelAutoAttack();
                myAvatar.pMC.mcChar.gotoAndStop("Idle");
                return;
            };
            if (myAvatar.target != null)
            {
                setTarget(null);
                return;
            };
        }

        public function approachTarget():*
        {
            var _local_3:Object;
            var _local_5:Boolean;
            var _local_6:Point;
            var _local_7:Point;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:*;
            var _local_17:*;
            var _local_18:*;
            var _local_19:int;
            var _local_20:int;
            var _local_21:Array;
            var _local_22:Array;
            trace("approach target");
            var _local_1:Boolean = true;
            var _local_2:Object = uoTree[rootClass.sfc.myUserName];
            var _local_4:Object = getAutoAttack();
            if (myAvatar.target != null)
            {
                trace("target not null");
                if (myAvatar.target.npcType == "monster")
                {
                    _local_3 = monTree[myAvatar.target.objData.MonMapID];
                }
                else
                {
                    if (myAvatar.target.npcType == "player")
                    {
                        _local_3 = myAvatar.target.dataLeaf;
                    };
                };
                if ((((_local_3 == null) || (_local_2.intState == 0)) || (_local_3.intState == 0)))
                {
                    _local_1 = false;
                };
                trace(("bPvP ? " + bPvP));
                trace(("myAvatar.target.npcType ? " + (myAvatar.target.npcType == "player")));
                if ((((bPvP) && (((!(_local_3.react == null)) && (_local_3.react[_local_2.pvpTeam] == 1)) || (_local_2.pvpTeam == _local_3.pvpTeam))) || ((!(bPvP)) && (myAvatar.target.npcType == "player"))))
                {
                    _local_1 = false;
                };
                if (_local_1)
                {
                    rootClass.mixer.playSound("ClickBig");
                    if (_local_4 != null)
                    {
                        if (actionRangeCheck(_local_4))
                        {
                            testAction(_local_4);
                        }
                        else
                        {
                            actionReady = true;
                            _local_5 = false;
                            _local_6 = myAvatar.pMC.mcChar.localToGlobal(new Point(0, 0));
                            _local_7 = myAvatar.target.pMC.mcChar.localToGlobal(new Point(0, 0));
                            if (_local_4.range > 301)
                            {
                                _local_8 = Point.distance(_local_6, _local_7);
                                _local_9 = (_local_4.range * SCALE);
                                _local_9 = (_local_9 * 0.9);
                                if (_local_9 < _local_8)
                                {
                                    _local_7 = Point.interpolate(_local_6, _local_7, (_local_9 / _local_8));
                                };
                                _local_5 = (!(padHit(_local_7.x, _local_7.y, myAvatar.pMC.shadow.getBounds(rootClass.stage))));
                            }
                            else
                            {
                                _local_10 = 0;
                                while (((_local_10 < 100) && (!(_local_5))))
                                {
                                    _local_11 = int(int((50 + (Math.random() * 110))));
                                    if (_local_10 > 50)
                                    {
                                        _local_11 = (_local_11 * -1);
                                    };
                                    _local_12 = (((_local_7.x - _local_6.x) >= 0) ? -(_local_11) : _local_11);
                                    _local_13 = int(((Math.random() * 40) - 20));
                                    _local_12 = Math.ceil((_local_12 * SCALE));
                                    _local_13 = Math.floor((_local_13 * SCALE));
                                    _local_14 = (_local_7.x + _local_12);
                                    _local_15 = (_local_7.y + _local_13);
                                    _local_5 = (!(padHit(_local_14, _local_15, myAvatar.pMC.shadow.getBounds(rootClass.stage))));
                                    _local_10++;
                                };
                                _local_7.x = (_local_7.x + _local_12);
                                _local_7.y = (_local_7.y + _local_13);
                            };
                            if (_local_5)
                            {
                                myAvatar.pMC.walkTo(_local_7.x, _local_7.y, (WALKSPEED * 2));
                                pushMove(myAvatar.pMC, _local_7.x, _local_7.y, (WALKSPEED * 2));
                            }
                            else
                            {
                                rootClass.chatF.pushMsg("server", "No path found!", "SERVER", "", 0);
                            };
                        };
                    };
                };
            }
            else
            {
                trace("target null");
                _local_16 = myAvatar;
                _local_17 = null;
                _local_18 = null;
                _local_19 = (("tgtMin" in _local_4) ? _local_4.tgtMin : 1);
                _local_20 = (("tgtMax" in _local_4) ? _local_4.tgtMax : 1);
                _local_21 = [];
                _local_22 = getAllAvatarsInCell();
                for each (_local_17 in _local_22)
                {
                    _local_3 = _local_17.dataLeaf;
                    if ((((!(_local_3 == null)) && ((((!(bPvP)) && (_local_17.npcType == "monster")) || (((bPvP) && (_local_17.npcType == "player")) && (!(_local_2.pvpTeam == _local_3.pvpTeam)))) || ((((bPvP) && (_local_17.npcType == "monster")) && (!(_local_3.react == null))) && (_local_3.react[_local_2.pvpTeam] == 0)))) && (actionRangeCheck(_local_4, _local_17))))
                    {
                        setTarget(_local_17);
                        testAction(_local_4);
                        return;
                    };
                };
                rootClass.chatF.pushMsg("warning", "Nenhum alvo selecionado!", "SERVER", "", 0);
            };
        }

        public function padHit(_arg_1:int, _arg_2:int, _arg_3:Rectangle):Boolean
        {
            var _local_5:Rectangle;
            var _local_6:MovieClip;
            var _local_4:int;
            if (((((_arg_1 < 0) || (_arg_1 > 960)) || (_arg_2 < 10)) || (_arg_2 > 530)))
            {
                return (false);
            };
            _arg_3.x = int((_arg_1 - (_arg_3.width / 2)));
            _arg_3.y = int((_arg_2 - (_arg_3.height / 2)));
            _local_4 = 0;
            while (_local_4 < arrEvent.length)
            {
                _local_6 = arrEvent[_local_4];
                if ((("strSpawnCell" in _local_6) || ("tCell" in _local_6)))
                {
                    _local_5 = arrEventR[_local_4];
                    if (_arg_3.intersects(_local_5))
                    {
                        return (true);
                    };
                };
                _local_4++;
            };
            return (false);
        }

        public function drawRects(_arg_1:Array):void
        {
            var _local_5:Rectangle;
            var _local_2:Array = [0xFF0000, 0xFF00, 0xFF];
            var _local_3:Sprite = new Sprite();
            var _local_4:Graphics = _local_3.graphics;
            var _local_6:int;
            _local_6 = 0;
            while (_local_6 < _arg_1.length)
            {
                _local_5 = _arg_1[_local_6];
                _local_4.moveTo(_local_5.x, _local_5.y);
                _local_4.beginFill(_local_2[_local_6], 0.3);
                _local_4.lineTo((_local_5.x + _local_5.width), _local_5.y);
                _local_4.lineTo((_local_5.x + _local_5.width), (_local_5.y + _local_5.height));
                _local_4.lineTo(_local_5.x, (_local_5.y + _local_5.height));
                _local_4.lineTo(_local_5.x, _local_5.y);
                _local_4.endFill();
                _local_6++;
            };
        }

        public function testAction(actionObj:Object, forceAARangeError:Boolean=false):*
        {
            var tLeaf:Object;
            var aura:Object;
            var pet:* = undefined;
            var tgtOK:Boolean;
            var sAvt:Avatar;
            var to:Object;
            var now:Number;
            trace(("testAction > " + actionObj.nam));
            var a:int;
            var b:int;
            var c:int;
            var cLeaf:Object = uoTreeLeaf(rootClass.sfc.myUserName);
            var cAvt:* = myAvatar;
            var tAvt:* = null;
            var pAvt:* = null;
            var tgtMin:int = (("tgtMin" in actionObj) ? actionObj.tgtMin : 1);
            var tgtMax:int = (("tgtMax" in actionObj) ? actionObj.tgtMax : 1);
            var targets:Array = [];
            var scan:Array = getAllAvatarsInCell();
			var castObj:* = {};
            a = 0;
            while (a < scan.length)
            {
                tAvt = scan[a];
                if ((((tAvt.dataLeaf == null) || (tAvt.dataLeaf.intState == 0)) || ((tAvt.pMC == null) || (tAvt.pMC.x == null))))
                {
                    scan.splice(a, 1);
                    a = (a - 1);
                    if (tAvt == myAvatar.target)
                    {
                        setTarget(null);
                    };
                };
                a = (a + 1);
            };
            a = 0;
            tAvt = null;
            if (((!(myAvatar.target == null)) && (scan.indexOf(myAvatar.target) > -1)))
            {
                scan.unshift(scan.splice(scan.indexOf(myAvatar.target), 1)[0]);
            };
            afkPostpone();
            var errMsg:String = "none";
            var forceAAloop:Boolean;
            if (!actionTimeCheck(actionObj))
            {
                errMsg = (("Ability '" + actionObj.nam) + "' is not ready yet.");
            };
            if ((((errMsg == "none") && (!(actionObj.mp == null))) && (Math.round((actionObj.mp * cLeaf.sta["$cmc"])) > cLeaf.intMP)))
            {
                errMsg = "Not enough mana!";
            };
            if (((errMsg == "none") && (!(actionObj.sp == null))))
            {
                if (!checkSP(actionObj.sp, cLeaf))
                {
                    errMsg = "Not Enough Spirit Power!";
                };
            };
            if ((((errMsg == "none") && (actionObj.ref == "i1")) && (actionObj.sArg1 == "")))
            {
                errMsg = "No item assigned to that slot!";
            };
            if ((((((errMsg == "none") && (!(myAvatar.target == null))) && ("filter" in actionObj)) && ("sRace" in myAvatar.target.objData)) && (!(myAvatar.target.objData.sRace.toLowerCase() == actionObj.filter.toLowerCase()))))
            {
                errMsg = (("Target is not a " + actionObj.filter) + "!");
            };
            if (errMsg == "none")
            {
                for each (aura in cLeaf.auras)
                {
                    try
                    {
                        if (aura.cat != null)
                        {
							switch (aura.cat)
							{
								case "sleep":
								case "silenced":
								case "disabled":
								case "hex":
								case "paralyze":
								case "petrify":
								case "freeze":
								case "stun":
								case "stone":
									errMsg = "Cannot act while stunned!";
								break;
							};
							
                            if (errMsg != "none")
                            {
                                forceAAloop = true;
                            };
                        };
                    }
                    catch(e:Error)
                    {
                        trace(("combat.auraPreFlight > " + e));
                    };
                };
            };
            if (errMsg == "none")
            {
                if (actionObj.pet != null)
                {
                    pet = cAvt.getItemByEquipSlot("pe");
                    if (cAvt.getItemByEquipSlot("pe") == null)
                    {
                        if (cAvt.checkTempItem(actionObj.pet, 1))
                        {
                            summonPet(actionObj.pet, true);
                        }
                        else
                        {
                            summonPet(actionObj.pet, false);
                        };
                    };
                }
                else
                {
                    if (actionObj.checkPet != null)
                    {
                        if (cAvt.getItemByEquipSlot("pe").sMeta.indexOf(actionObj.checkPet) == -1)
                        {
                            errMsg = "No battle pet equipped.";
                        };
                    };
                };
            };
            if (((errMsg == "none") || (forceAAloop)))
            {
                if (myAvatar.target != null)
                {
                    tAvt = myAvatar.target;
                    if (myAvatar.target.npcType == "monster")
                    {
                        tLeaf = monTree[tAvt.objData.MonMapID];
                    }
                    else
                    {
                        if (tAvt.npcType == "player")
                        {
                            tLeaf = tAvt.dataLeaf;
                        };
                    };
                };
                switch (actionObj.tgt)
                {
                    case "h":
                        if (tAvt == null)
                        {
                            if (tgtMin > 0)
                            {
                                for each (tAvt in scan)
                                {
                                    tLeaf = tAvt.dataLeaf;
                                    if ((((!(tLeaf == null)) && ((((!(bPvP)) && (tAvt.npcType == "monster")) || (((bPvP) && (tAvt.npcType == "player")) && (!(cLeaf.pvpTeam == tLeaf.pvpTeam)))) || ((((bPvP) && (tAvt.npcType == "monster")) && (!(tLeaf.react == null))) && (tLeaf.react[cLeaf.pvpTeam] == 0)))) && (actionRangeCheck(actionObj, tAvt))))
                                    {
                                        setTarget(tAvt);
                                        testAction(actionObj);
                                        return;
                                    };
                                };
                                errMsg = "Nenhum alvo selecionado!";
                                if (actionObj.typ == "aa")
                                {
                                    cancelAutoAttack();
                                };
                            };
                        }
                        else
                        {
                            if (((((!(bPvP)) && (tAvt.npcType == "player")) || (((bPvP) && (tAvt.npcType == "player")) && (cLeaf.pvpTeam == tLeaf.pvpTeam))) || ((((bPvP) && (tAvt.npcType == "monster")) && (!(tLeaf.react == null))) && (tLeaf.react[cLeaf.pvpTeam] == 1))))
                            {
                                errMsg = "Can't attack that target!";
                                if (actionObj.typ == "aa")
                                {
                                    cancelAutoAttack();
                                };
                            };
                            if (((tgtMin > 0) && (tAvt.dataLeaf.intState == 0)))
                            {
                                errMsg = "Your target is dead!";
                            };
                        };
                        break;
                    case "f":
                        if (tAvt == null)
                        {
                            setTarget(myAvatar);
                            tAvt = myAvatar;
                            tLeaf = tAvt.dataLeaf;
                        };
                        if (((((!(bPvP)) && (tAvt.npcType == "monster")) || ((bPvP) && (!(cLeaf.pvpTeam == tLeaf.pvpTeam)))) || ((((bPvP) && (tAvt.npcType == "monster")) && (!(tLeaf.react == null))) && (tLeaf.react[cLeaf.pvpTeam] == 1))))
                        {
                            tAvt = myAvatar;
                        };
                        tLeaf = tAvt.dataLeaf;
                        break;
                    case "s":
                        if (tAvt == null)
                        {
                            setTarget(myAvatar);
                            tAvt = myAvatar;
                        };
                        if (((!(tAvt == null)) && (!(tAvt == myAvatar))))
                        {
                            tAvt = myAvatar;
                        };
                        tLeaf = tAvt.dataLeaf;
                        break;
                };
                pAvt = tAvt;
                if ((((errMsg == "none") && (!(actionRangeCheck(actionObj, pAvt)))) || (forceAAloop)))
                {
                    if (!forceAAloop)
                    {
                        errMsg = "You are out of range!  Move closer to your target!";
                    };
                    if (actionObj.typ == "aa")
                    {
                        autoActionTimer.delay = 500;
                        autoActionTimer.reset();
                        autoActionTimer.start();
                    };
                };
                tgtOK = true;
                if (errMsg == "none")
                {
                    while (scan.length > 0)
                    {
                        tAvt = scan[0];
                        tLeaf = tAvt.dataLeaf;
                        tgtOK = true;
                        if (tLeaf.intState == 0)
                        {
                            tgtOK = false;
                        };
                        if ((((!(tAvt == null)) && ("filter" in actionObj)) && ("sRace" in tAvt.objData)))
                        {
                            if (tAvt.objData.sRace.toLowerCase() != actionObj.filter.toLowerCase())
                            {
                                tgtOK = false;
                            };
                        };
                        switch (actionObj.tgt)
                        {
                            case "h":
                                if (((((!(bPvP)) && (tAvt.npcType == "player")) || (((bPvP) && (tAvt.npcType == "player")) && (cLeaf.pvpTeam == tLeaf.pvpTeam))) || ((((bPvP) && (tAvt.npcType == "monster")) && (!(tLeaf.react == null))) && (tLeaf.react[cLeaf.pvpTeam] == 1))))
                                {
                                    tgtOK = false;
                                };
                                break;
                            case "f":
                                if (((((!(bPvP)) && (tAvt.npcType == "monster")) || ((bPvP) && (!(cLeaf.pvpTeam == tLeaf.pvpTeam)))) || ((((bPvP) && (tAvt.npcType == "monster")) && (!(tLeaf.react == null))) && (tLeaf.react[cLeaf.pvpTeam] == 1))))
                                {
                                    tgtOK = false;
                                };
                                break;
                            case "s":
                                if (((!(tAvt == null)) && (!(tAvt == myAvatar))))
                                {
                                    tgtOK = false;
                                };
                                break;
                        };
                        if (tgtOK)
                        {
                            sAvt = myAvatar;
                            if (((actionObj.fx == "c") && (targets.length > 0)))
                            {
                                sAvt = targets[(targets.length - 1)].avt;
                            };
                            a = Math.abs((tAvt.pMC.x - sAvt.pMC.x));
                            b = Math.abs((tAvt.pMC.y - sAvt.pMC.y));
                            c = Math.pow(((a * a) + (b * b)), 0.5);
                            if (actionRangeCheck(actionObj, tAvt))
                            {
                                targets.push({
                                    "avt":tAvt,
                                    "d":c,
                                    "hp":tLeaf.intHP
                                });
                            };
                        };
                        scan.shift();
                    };
                };
                targets.sortOn("hp", Array.NUMERIC);
                if (pAvt != null)
                {
                    a = 0;
                    while (a < targets.length)
                    {
                        to = targets[a];
                        if (to.avt == pAvt)
                        {
                            targets.unshift(targets.splice(a, 1)[0]);
                        };
                        a = (a + 1);
                    };
                };
                if (targets.length > tgtMax)
                {
                    targets = targets.splice(0, tgtMax);
                };
                if (targets.length > 0)
                {
                    if (pAvt != null)
                    {
                        if (((!(targets[0].avt == null)) && (!(targets[0].avt.dataLeaf == null))))
                        {
                            tAvt = targets[0].avt;
                            tLeaf = tAvt.dataLeaf;
                        }
                        else
                        {
                            tAvt = null;
                            tLeaf = null;
                        };
                    }
                    else
                    {
                        tAvt = null;
                        tLeaf = null;
                    };
                };
            };
            if (errMsg == "none")
            {
                if (cLeaf.intState != 0)
                {
                    if ((((!(actionObj.lock)) && ((tLeaf == null) || (!(tLeaf.intState == 0)))) && (targets.length >= tgtMin)))
                    {
						if (actionObj.castingDur != null && actionObj.castingDur > 0 && actionObj.castAnim != null)
                        {
                            myAvatar.onCasting = true;
                            rootClass.chatF.submitMsg("/" + actionObj.castAnim, "emotea", rootClass.sfc.myUserName);
                            castObj.typ = "generic";
                            castObj.callback = castingDone;
                            castObj.args = 
							{
                                "str":actionObj,
                                "str2":targets
                            };
                            castObj.dur = actionObj.castingDur;
                            castObj.txt = "Casting...";
                            rootClass.ui.mcCastBar.fOpenWith(castObj);
                        }
                        else
                        {
                            myAvatar.onCasting = false;
							doAction(actionObj, targets);
                        };
                    };
                    if (((myAvatar.target == null) || ((tLeaf == null) || (tLeaf.intState == 0))))
                    {
                        exitCombat();
                    };
                };
            }
            else
            {
                now = new Date().getTime();
                if (((errMsg == "You are out of range!  Move closer to your target!") && ((!(actionObj.typ == "aa")) || (forceAARangeError))))
                {
                    if ((now - actionRangeSpamTS) > 3000)
                    {
                        actionRangeSpamTS = now;
                        rootClass.chatF.pushMsg("warning", errMsg, "SERVER", "", 0);
                    };
                }
                else
                {
                    if (actionObj.typ != "aa")
                    {
                        rootClass.chatF.pushMsg("warning", errMsg, "SERVER", "", 0);
                    };
                };
            };
        }
		
		public function castingDone(skill:*):void
        {
            doAction(skill.str, skill.str2);
            myAvatar.onCasting == false;
        }
		
        public function summonPet(_arg_1:int, _arg_2:Boolean):*
        {
            if (_arg_2)
            {
                rootClass.sfc.sendXtMessage("zm", "equipItem", [_arg_1], "str", curRoom);
            }
            else
            {
                rootClass.sfc.sendXtMessage("zm", "summonPet", [_arg_1], "str", curRoom);
            };
        }

        public function autoActionHandler(_arg_1:TimerEvent):*
        {
            trace("* autoActionHandler >");
            if ((((((!(myAvatar.dataLeaf == null)) && (!(myAvatar.dataLeaf.intState == 0))) && (!(myAvatar.target == null))) && (!(myAvatar.target.dataLeaf == null))) && (!(myAvatar.target.dataLeaf.intState == 0))))
            {
                testAction(getAutoAttack(), true);
            }
            else
            {
                exitCombat();
            };
        }

        public function getAutoAttack():Object
        {
            var _local_1:* = 0;
            while (_local_1 < actions.active.length)
            {
                if ((((!(actions.active[_local_1] == null)) && (!(actions.active[_local_1].auto == null))) && (actions.active[_local_1].auto == true)))
                {
                    return (actions.active[_local_1]);
                };
                _local_1++;
            };
            return (null);
        }

        public function exitCombat():*
        {
            var _local_1:int;
            actionReady = false;
            if (((!(actions == null)) && (!(actions.active == null))))
            {
                _local_1 = 0;
                while (_local_1 < actions.active.length)
                {
                    actions.active[_local_1].lock = false;
                    _local_1++;
                };
            };
            if (myAvatar != null)
            {
                if (((((!(myAvatar.pMC == null)) && (!(myAvatar.pMC.mcChar == null))) && (!(myAvatar.pMC.mcChar.onMove))) && (!(myAvatar.pMC.mcChar.currentLabel == "Rest"))))
                {
                    myAvatar.pMC.mcChar.gotoAndStop("Idle");
                };
                if (myAvatar.dataLeaf != null)
                {
                    myAvatar.dataLeaf.targets = {};
                };
                cancelAutoAttack();
            };
        }

        public function cancelAutoAttack():*
        {
            var icon:MovieClip;
            if (autoActionTimer != null)
            {
                autoActionTimer.reset();
            };
            if (AATestTimer != null)
            {
                AATestTimer.reset();
            };
            var i:* = 0;
            while (i < actionMap.length)
            {
                try
                {
                    if (actionMap[i] == "aa")
                    {
                        icon = MovieClip(rootClass.ui.mcInterface.actBar.getChildByName(("i" + (i + 1))));
                        icon.bg.gotoAndStop(1);
                    };
                }
                catch(e:Error)
                {
                    trace(e);
                };
                i++;
            };
        }

        public function doAction(_arg_1:*, _arg_2:*):*
        {
            var _local_3:Avatar;
            trace(("doAction > " + _arg_1.nam));
            afkPostpone();
            if (_arg_2.length > 0)
            {
                _local_3 = _arg_2[0].avt;
                if (_local_3 != myAvatar)
                {
                    if ((_local_3.pMC.x - myAvatar.pMC.x) >= 0)
                    {
                        myAvatar.pMC.turn("right");
                    }
                    else
                    {
                        myAvatar.pMC.turn("left");
                    };
                };
            };
            var _local_4:int;
            while (_local_4 < _arg_2.length)
            {
                _local_3 = _arg_2[_local_4].avt;
                switch (_local_3.npcType)
                {
                    case "monster":
                        if (myAvatar.dataLeaf.targets[_local_3.objData.MonMapID] == null)
                        {
                            myAvatar.dataLeaf.targets[_local_3.objData.MonMapID] = "m";
                        };
                        break;
                    case "player":
                        if (myAvatar.dataLeaf.targets[_local_3.objData.uid] == null)
                        {
                            myAvatar.dataLeaf.targets[_local_3.objData.uid] = "p";
                        };
                        break;
                };
                _local_4++;
            };
            getActionResult(_arg_1, _arg_2);
        }

        public function aggroMap(_arg_1:String, _arg_2:String, _arg_3:*):void
        {
            var _local_12:*;
            var _local_13:*;
            var _local_4:String = _arg_1.split(":")[0];
            var _local_5:String = _arg_1.split(":")[1];
            var _local_6:String = _arg_2.split(":")[0];
            var _local_7:String = _arg_2.split(":")[1];
            var _local_8:* = "";
            var _local_9:* = "";
            var _local_10:Object = {};
            var _local_11:Object = {};
            if (_local_4 == "p")
            {
                _local_10 = getUoLeafById(_local_5);
            }
            else
            {
                _local_10 = monTree[_local_5];
            };
            if (_local_6 == "p")
            {
                _local_11 = getUoLeafById(_local_7);
            }
            else
            {
                _local_11 = monTree[_local_7];
            };
            if (!("targets" in _local_10))
            {
                _local_10.targets = {};
            };
            if (!("targets" in _local_11))
            {
                _local_11.targets = {};
            };
            if (_local_6 == "m")
            {
                if (!(_local_7 in _local_10.targets))
                {
                    _local_10.targets[_local_7] = _local_6;
                };
                if (!(_local_5 in _local_11.targets))
                {
                    _local_11.targets[_local_5] = _local_4;
                };
            };
            if ((((_local_4 == "p") && (_local_6 == "p")) && (_arg_3)))
            {
                for (_local_12 in monTree)
                {
                    _local_13 = monTree[_local_12];
                    if (((!(_local_13.targets[_local_7] == null)) && (!(_local_5 in _local_13.targets))))
                    {
                        _local_13.targets[_local_5] = _local_4;
                    };
                };
            };
        }

        private function actionTimeCheck(_arg_1:*):Boolean
        {
            var _local_4:int;
            trace("actionTimeCheck >");
            var _local_2:Number = new Date().getTime();
            var _local_3:Number = (1 - Math.min(Math.max(myAvatar.dataLeaf.sta.$tha, -1), 0.5));
            if (_arg_1.auto)
            {
                if (autoActionTimer.running)
                {
                    trace("AA TIMER SELF-CLIPPING");
                    return (false);
                };
                return (true);
            };
            if ((_local_2 - GCDTS) < GCD)
            {
                return (false);
            };
            if (_arg_1.OldCD != null)
            {
                _local_4 = Math.round((_arg_1.OldCD * _local_3));
            }
            else
            {
                _local_4 = Math.round((_arg_1.cd * _local_3));
            };
            trace(((("ActionObj: " + _arg_1.nam) + " cooldown: ") + _arg_1.cd));
            if ((_local_2 - _arg_1.ts) >= _local_4)
            {
                delete _arg_1.OldCD;
                return (true);
            };
            return (false);
        }

        private function actionRangeCheck(_arg_1:*, _arg_2:Avatar=null):Boolean
        {
            var _local_3:Point;
            var _local_4:Point;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            trace("actionRangeCheck >");
            if (((_arg_2 == null) && (!(myAvatar.target == null))))
            {
                _arg_2 = myAvatar.target;
            };
            if (_arg_2 == myAvatar)
            {
                return (true);
            };
            if ((("tgtMin" in _arg_1) && (_arg_1.tgtMin == 0)))
            {
                return (true);
            };
            if (_arg_2 == null)
            {
                return (false);
            };
            _local_3 = myAvatar.pMC.mcChar.localToGlobal(new Point(0, 0));
            _local_4 = _arg_2.pMC.mcChar.localToGlobal(new Point(0, 0));
            _local_5 = Math.abs((_local_4.x - _local_3.x));
            _local_6 = Math.abs((_local_4.y - _local_3.y));
            _local_7 = Math.pow(((_local_5 * _local_5) + (_local_6 * _local_6)), 0.5);
            _local_8 = (_arg_1.range * SCALE);
            if (_arg_1.range <= 301)
            {
                if (((_local_5 <= _local_8) && (_local_6 <= (30 * SCALE))))
                {
                    return (true);
                };
                return (false);
            };
            if (_local_7 <= _local_8)
            {
                return (true);
            };
            return (false);
        }

        public function aggroAllMon():*
        {
            var _local_2:*;
            var _local_1:* = [];
            for (_local_2 in monTree)
            {
                if (monTree[_local_2].strFrame == strFrame)
                {
                    _local_1.push(_local_2);
                };
            };
            aggroMons(_local_1);
        }

        public function aggroMon(_arg_1:*):*
        {
            var _local_2:* = [];
            _local_2.push(_arg_1);
            aggroMons(_local_2);
        }

        public function aggroMons(_arg_1:*):*
        {
            if (_arg_1.length)
            {
                rootClass.sfc.sendXtMessage("zm", "aggroMon", _arg_1, "str", curRoom);
            };
        }

        public function castSpellFX(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:int=0):*
        {
            var _local_5:Avatar;
            var _local_6:Class;
            var _local_7:*;
            var _local_8:Array;
            var _local_9:int;
            if (!showAnimations)
            {
                return;
            };
            if ((((!(_arg_2.strl == null)) && (!(_arg_2.strl == ""))) && (!(_arg_2.avts == null))))
            {
                _local_8 = [];
                _local_9 = 0;
                if (_arg_2.fx == "c")
                {
                    if (_arg_2.strl == "lit1")
                    {
                        _local_8.push(_arg_1.pMC.mcChar);
                        _local_9 = 0;
                        while (_local_9 < _arg_2.avts.length)
                        {
                            _local_5 = _arg_2.avts[_local_9];
                            if ((((!(_local_5 == null)) && (!(_local_5.pMC == null))) && (!(_local_5.pMC.mcChar == null))))
                            {
                                _local_8.push(_local_5.pMC.mcChar);
                            };
                            _local_9++;
                        };
                        if (_local_8.length > 1)
                        {
                            _local_6 = (getClass("sp_C1") as Class);
                            if (_local_6 != null)
                            {
                                _local_7 = new (_local_6)();
                                _local_7.mouseEnabled = false;
                                _local_7.mouseChildren = false;
                                _local_7.visible = true;
                                _local_7.world = rootClass.world;
                                _local_7.strl = _arg_2.strl;
                                rootClass.drawChainsLinear(_local_8, 33, MovieClip(CHARS.addChild(_local_7)));
                            };
                        };
                    };
                }
                else
                {
                    if (_arg_2.fx == "f")
                    {
                        _local_8.push(_arg_1.pMC.mcChar);
                        _local_5 = _arg_2.avts[0];
                        if ((((!(_local_5 == null)) && (!(_local_5.pMC == null))) && (!(_local_5.pMC.mcChar == null))))
                        {
                            _local_8.push(_local_5.pMC.mcChar);
                        };
                        if (_local_8.length > 1)
                        {
                            _local_7 = new MovieClip();
                            _local_7.mouseEnabled = false;
                            _local_7.mouseChildren = false;
                            _local_7.visible = true;
                            _local_7.world = rootClass.world;
                            _local_7.strl = _arg_2.strl;
                            rootClass.drawFunnel(_local_8, MovieClip(CHARS.addChild(_local_7)));
                        };
                    }
                    else
                    {
                        _local_9 = 0;
                        while (_local_9 < _arg_2.avts.length)
                        {
                            _local_5 = _arg_2.avts[_local_9];
                            _local_6 = (getClass(_arg_2.strl) as Class);
                            if (_local_6 != null)
                            {
                                _local_7 = new (_local_6)();
                                _local_7.spellDur = _arg_4;
                                if (_arg_3 != null)
                                {
                                    _local_7.transform = _arg_3.transform;
                                };
                                CHARS.addChild(_local_7);
                                _local_7.mouseEnabled = false;
                                _local_7.mouseChildren = false;
                                _local_7.visible = true;
                                _local_7.world = rootClass.world;
                                _local_7.strl = _arg_2.strl;
                                _local_7.tMC = _local_5.pMC;
                                switch (_arg_2.fx)
                                {
                                    case "p":
                                        _local_7.x = _arg_1.pMC.x;
                                        _local_7.y = (_arg_1.pMC.y - (_arg_1.pMC.mcChar.height * 0.5));
                                        _local_7.dir = (((_local_5.pMC.x - _arg_1.pMC.x) >= 0) ? 1 : -1);
                                        break;
                                    case "w":
                                        _local_7.x = _local_7.tMC.x;
                                        _local_7.y = (_local_7.tMC.y + 3);
                                        if (_arg_1 != null)
                                        {
                                            if (_local_7.tMC.x < _arg_1.pMC.x)
                                            {
                                                _local_7.scaleX = (_local_7.scaleX * -1);
                                            };
                                        };
                                        break;
                                };
                            }
                            else
                            {
                                trace();
                                trace(("*>*>*> Could not load class " + _arg_2.strl));
                                trace();
                            };
                            _local_9++;
                        };
                    };
                };
            };
        }

        public function showSpellFXHit(_arg_1:*):*
        {
            var _local_2:* = {};
            switch (_arg_1.strl)
            {
                case "sp_ice1":
                    _local_2.strl = "sp_ice2";
                    break;
                case "sp_el3":
                    _local_2.strl = "sp_el2";
                    break;
                case "sp_ed3":
                    _local_2.strl = "sp_ed1";
                    break;
                case "sp_ef1":
                case "sp_ef6":
                    _local_2.strl = "sp_ef2";
                    break;
            };
            _local_2.fx = "w";
            _local_2.avts = [_arg_1.tMC.pAV];
            castSpellFX(null, _local_2, null);
        }

        public function doCastIA(_arg_1:Object):void
        {
        }

        public function getActionByActID(_arg_1:int):Object
        {
            var _local_2:Object;
            var _local_3:int;
            while (_local_3 < actions.active.length)
            {
                if (actions.active[_local_3].actID == _arg_1)
                {
                    _local_2 = actions.active[_local_3];
                };
                _local_3++;
            };
            return (_local_2);
        }

        public function getActionByRef(_arg_1:String):Object
        {
            var _local_2:*;
            for each (_local_2 in actions.active)
            {
                if (_local_2.ref == _arg_1)
                {
                    return (_local_2);
                };
            };
            for each (_local_2 in actions.passive)
            {
                if (_local_2.ref == _arg_1)
                {
                    return (_local_2);
                };
            };
			for each (_local_2 in actions.tree) 
			{
                if (_local_2.ref == _arg_1)
				{
					return (_local_2);
                };
            };
            return (null);
        }

        public function handleSAR(_arg_1:Object):void
        {
            var _local_2:Object = {};
            var _local_3:* = "";
            var _local_4:int = -1;
            var _local_5:* = "";
            var _local_6:int = -1;
            if (_arg_1.iRes == 1)
            {
                if (_arg_1.actionResult.typ == "d")
                {
                    showAuraImpact(_arg_1.actionResult);
                    _local_2 = rootClass.copyObj(_arg_1.actionResult);
                    _local_2.a = [rootClass.copyObj(_arg_1.actionResult)];
                }
                else
                {
                    aggroMap(_arg_1.actionResult.cInf, _arg_1.actionResult.tInf, (_arg_1.actionResult.hp >= 0));
                    _local_3 = _arg_1.actionResult.cInf.split(":")[0];
                    _local_4 = int(_arg_1.actionResult.cInf.split(":")[1]);
                    _local_5 = _arg_1.actionResult.tInf.split(":")[0];
                    _local_6 = int(_arg_1.actionResult.tInf.split(":")[1]);
                    _local_2 = rootClass.copyObj(_arg_1.actionResult);
                    _local_2.a = [rootClass.copyObj(_arg_1.actionResult)];
                    if (((_local_3 == "p") && (_local_4 == rootClass.sfc.myUserId)))
                    {
                        showActionResult(_local_2, _local_2.actID);
                    }
                    else
                    {
                        showIncomingAttackResult(_local_2);
                    };
                };
            };
            if (_arg_1.iRes == 0)
            {
                switch (_arg_1.actionResult.cInf.split(":")[0])
                {
                    case "p":
                        showActionResult(null, _arg_1.actID);
                        return;
                };
            };
        }

        public function handleSARS(_arg_1:Object):void
        {
            var _local_9:Array;
            var _local_10:int;
            var _local_2:Object = {};
            var _local_3:* = "";
            var _local_4:int = -1;
            var _local_5:* = "";
            var _local_6:int = -1;
            var _local_7:String = _arg_1.cInf;
            _local_7 = _arg_1.cInf;
            _local_3 = _local_7.split(":")[0];
            _local_4 = int(_local_7.split(":")[1]);
            var _local_8:Object = {};
            if (_arg_1.iRes == 1)
            {
                _local_9 = [];
                _local_10 = 0;
                while (_local_10 < _arg_1.a.length)
                {
                    _local_8 = _arg_1.a[_local_10];
                    aggroMap(_local_7, _local_8.tInf, (_local_8.hp >= 0));
                    _local_10++;
                };
                if (((_local_3 == "p") && (_local_4 == rootClass.sfc.myUserId)))
                {
                    showActionResult(rootClass.copyObj(_arg_1), _arg_1.actID);
                }
                else
                {
                    showIncomingAttackResult(rootClass.copyObj(_arg_1));
                };
            };
            if (_arg_1.iRes == 0)
            {
                switch (_local_7.split(":")[0])
                {
                    case "p":
                        showActionResult(null, _arg_1.actID);
                        return;
                };
            };
        }

        public function getActionResult(_arg_1:*, _arg_2:*):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:String;
            var _local_6:Avatar;
            var _local_7:int;
            var _local_8:Number;
            var _local_9:*;
            trace(("GAR > " + _arg_1.nam));
            _local_3 = [];
            _local_4 = "gar";
            _local_5 = "";
            _local_7 = 0;
            _local_3.push(actionID);
            if (_arg_2.length > 0)
            {
                _local_7 = 0;
                while (_local_7 < _arg_2.length)
                {
                    _local_6 = _arg_2[_local_7].avt;
                    if (_local_7 > 0)
                    {
                        _local_5 = (_local_5 + ",");
                    };
                    _local_5 = (_local_5 + (_arg_1.ref + ">"));
                    if (_local_6.npcType == "monster")
                    {
                        _local_5 = (_local_5 + ("m:" + _local_6.objData.MonMapID));
                    };
                    if (_local_6.npcType == "player")
                    {
                        _local_5 = (_local_5 + ("p:" + _local_6.uid));
                    };
                    _local_7++;
                };
            }
            else
            {
                _local_5 = (_local_5 + (_arg_1.ref + ">"));
            };
            _local_3.push(_local_5);
            if (_arg_1.ref == "i1")
            {
                _local_3.push(_arg_1.sArg1);
            };
            _local_3.push("wvz");
            rootClass.sfc.sendXtMessage("zm", _local_4, _local_3, "str", 1);
            if (((!(map.getAction == null)) && (map.getAction == true)))
            {
                try
                {
                    map.sendAction(_arg_1.ref);
                }
                catch(e)
                {
                };
            };
            _local_8 = new Date().getTime();
            _arg_1.lock = true;
            _arg_1.actID = actionID;
            actionID++;
            if (actionID > actionIDLimit)
            {
                actionID = 0;
            };
            _arg_1.lastTS = _arg_1.ts;
            _arg_1.ts = _local_8;
            if (_arg_1.typ != "aa")
            {
                coolDownAct(_arg_1);
                globalCoolDownExcept(_arg_1);
                if (((!(autoActionTimer.running)) && (_arg_1.tgt == "h")))
                {
                    testAction(getAutoAttack());
                };
            }
            else
            {
                _local_7 = 0;
                while (_local_7 < actionMap.length)
                {
                    if (actionMap[_local_7] == _arg_1.ref)
                    {
                        _local_9 = MovieClip(rootClass.ui.mcInterface.actBar.getChildByName(("i" + (_local_7 + 1))));
                        if (_local_9.bg.currentLabel != "pulse")
                        {
                            _local_9.bg.gotoAndPlay("pulse");
                        };
                    };
                    _local_7++;
                };
                actionReady = false;
            };
            actionResults[actionResultID] = {};
        }

        public function showActionResult(_arg_1:*, _arg_2:*):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            _local_3 = new Date();
            _local_4 = getActionByActID(_arg_2);
            if (_local_4 != null)
            {
                _local_4.lock = false;
                _local_4.actID = -1;
                _local_5 = _local_4.ts;
                _local_6 = _local_3.getTime();
                _local_7 = int(((_local_6 - _local_5) / 2));
                if (_local_4.typ == "aa")
                {
                    _local_8 = Math.round((_local_4.cd * (1 - Math.min(Math.max(myAvatar.dataLeaf.sta.$tha, -1), 0.5))));
                    _local_9 = (_local_8 - int((_local_6 - _local_5)));
                    if (_local_9 > _local_8)
                    {
                        _local_9 = _local_8;
                    };
                    if (_local_9 < (_local_8 - 100))
                    {
                        _local_9 = (_local_8 - 100);
                    };
                    autoActionTimer.delay = _local_9;
                    autoActionTimer.reset();
                    autoActionTimer.start();
                };
                if (_arg_1 == null)
                {
                    _local_4.ts = _local_4.lastTS;
                }
                else
                {
                    _local_4.ts = Math.max(int((_local_6 - _local_7)), (_local_5 + minLatencyOneWay));
                    unlockActionsExcept(_local_4);
                    rootClass.updateActionObjIcon(_local_4);
                };
            };
            if (_arg_1 != null)
            {
                playActionSound(_arg_1);
                if (_arg_1.type != "none")
                {
                    actionResults[actionResultID] = new ActionImpactTimer();
                    actionResults[actionResultID].world = MovieClip(this);
                    actionResults[actionResultID].actionResult = _arg_1;
                    actionResults[actionResultID].showImpact(250);
                    if (++actionResultID > actionResultIDLimit)
                    {
                        actionResultID = 0;
                    };
                };
            };
        }

        public function showIncomingAttackResult(_arg_1:Object):void
        {
            playActionSound(_arg_1);
            actionResultsMon[actionIDMon] = new ActionImpactTimer();
            actionResultsMon[actionIDMon].world = MovieClip(this);
            actionResultsMon[actionIDMon].actionResult = _arg_1;
            actionResultsMon[actionIDMon].showImpact(350);
            actionIDMon++;
            if (actionIDMon > actionIDLimitMon)
            {
                actionIDMon = 0;
            };
        }

        public function playActionSound(_arg_1:Object):void
        {
            var _local_2:Object;
            if (((_arg_1.a.length > 0) && (!(_arg_1.a[0].type == null))))
            {
                _local_2 = _arg_1.a[0];
                switch (_local_2.type)
                {
                    case "hit":
                        if (_local_2.hp >= 0)
                        {
                            if (Math.random() < 0.5)
                            {
                                rootClass.mixer.playSound("Hit1");
                            }
                            else
                            {
                                rootClass.mixer.playSound("Hit2");
                            };
                        }
                        else
                        {
                            rootClass.mixer.playSound("Heal");
                        };
					return;
                    case "crit":
                        if (_local_2.hp >= 0)
                        {
                            rootClass.mixer.playSound("Hit3");
                        }
                        else
                        {
                            rootClass.mixer.playSound("Heal");
                        };
					return;
                    case "miss":
                        rootClass.mixer.playSound("Miss");
					return;
					case "dodge":
						rootClass.mixer.playSound("Dodge");
					return;
					case "parry":
						rootClass.mixer.playSound("Parry");
					return;
					case "block":
						rootClass.mixer.playSound("Block");
					return;
                    case "none":
                        rootClass.mixer.playSound("Good");
					return;
                };
            };
        }

        public function showActionImpact(_arg_1:*):*
        {
            var _local_2:MovieClip;
            var _local_3:*;
            var _local_4:*;
            var _local_5:String;
            var _local_6:int;
            var _local_8:Array;
            var _local_10:int;
            var _local_11:TextFormat;
            var _local_12:int;
            var _local_13:Array;
            var _local_14:Object;
            _local_3 = null;
            _local_4 = null;
            _local_5 = "";
            _local_6 = 0;
            var _local_7:Array = ["GOOD", "GREAT!", "MASSIVE!!"];
            _local_8 = [0xFFFFFF, 0xFFFFFF, 0xFFFFFF];
            var _local_9:Array = [2381688, 0, 0];
            _local_10 = 0;
            _local_11 = new TextFormat();
            _local_12 = 0;
            _local_13 = _arg_1.a;
            _local_14 = {};
            _local_12 = 0;
            while (_local_12 < _local_13.length)
            {
                _local_14 = _local_13[_local_12];
                _local_5 = _local_14.tInf.split(":")[0];
                _local_6 = int(_local_14.tInf.split(":")[1]);
                switch (_local_5)
                {
                    case "p":
                        _local_2 = avatars[_local_6].pMC;
                        break;
                    case "m":
                        _local_2 = getMonster(_local_6).pMC;
                        break;
                };
                if ((((!(_local_2 == null)) && (!(_local_2.pAV == null))) && (!(_local_2.pAV.dataLeaf == null))))
                {
                    switch (_local_14.type)
                    {
                        case "hit":
                            _local_4 = new hitDisplay();
                            _local_4.t.ti.autoSize = "center";
                            if (_local_14.hp >= 0)
                            {
                                _local_10 = 0;
								if (_local_14.hp > 999999)
                                {
                                    _local_4.t.ti.text = 999999;
                                }
                                else
                                {
                                    _local_4.t.ti.text = _local_14.hp;
                                };
                                _local_4.t.ti.textColor = _local_8[_local_10];
                                _local_4.t.ti.filters = [new GlowFilter(0, 1, 5, 5, 5, 1, false, false)];
                                _local_4.t.ti.setTextFormat(_local_11);
                            }
                            else
                            {
                                _local_4.t.ti.text = (("+" + -(_local_14.hp)) + "+");
                                _local_4.t.ti.textColor = 65450;
                            };
                            wound(_local_2, "damage");
                            break;
                        case "crit":
                            _local_4 = new critDisplay();
                            _local_4.t.ti.autoSize = "center";
                            if (_local_14.hp > 0)
                            {
                                if (_local_14.hp > 999999)
                                {
                                    _local_4.t.ti.text = 999999;
                                }
                                else
                                {
                                    _local_4.t.ti.text = _local_14.hp;
                                };
                                _local_4.t.ti.textColor = 16750916;
                                _local_4.t.ti.filters = [new GlowFilter(0x330000, 1, 5, 5, 5, 1, false, false)];
								if (this.isMoveOK(_local_2.pAV.dataLeaf))
                                {
                                    _local_2.queueAnim("Hit");
                                };
							}
                            else
                            {
                                _local_4.t.ti.text = -(_local_14.hp);
                                _local_4.t.ti.textColor = 65450;
                            };
                            wound(_local_2, "damage");
						break;
                        case "miss":
                            _local_4 = new avoidDisplay();
                            _local_4.t.ti.text = "Miss!";
						break;
                        case "dodge":
                            _local_4 = new avoidDisplay();
                            _local_4.t.ti.text = "Dodge!";
                            if (isMoveOK(_local_2.pAV.dataLeaf))
                            {
                                _local_2.queueAnim("Dodge");
                            };
						break;
                        case "parry":
                            _local_4 = new avoidDisplay();
                            _local_4.t.ti.text = "Parry!";
                            if (isMoveOK(_local_2.pAV.dataLeaf))
                            {
                                _local_2.queueAnim("Dodge");
                            };
						break;
                        case "block":
                            _local_4 = new avoidDisplay();
                            _local_4.t.ti.text = "Block!";
							_local_4.t.ti.textColor = 0x66FFFF;
                            if (isMoveOK(_local_2.pAV.dataLeaf))
                            {
                                _local_2.queueAnim("Block");
                            };
						break;
                        case "none":
                    };
                    if (_local_4 != null)
                    {
                        _local_2.addChild(_local_4);
                        _local_4.x = _local_2.mcChar.x;
                        _local_4.y = (_local_2.pname.y + 10);
                    };
                    if (_local_3 != null)
                    {
                        _local_2.addChild(_local_3);
                        _local_3.x = _local_2.mcChar.x;
                        _local_3.y = (_local_2.pname.y + (_local_2.mcChar.height / 2));
                    };
                };
                _local_12++;
            };
        }

        public function showAuraImpact(_arg_1:*):*
        {
            var _local_2:MovieClip;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            _local_3 = _arg_1.tInf.split(":")[0];
            _local_4 = int(_arg_1.tInf.split(":")[1]);
            _local_5 = null;
            switch (_local_3)
            {
                case "p":
                    if ((((!(avatars[_local_4] == null)) && ("pMC" in avatars[_local_4])) && (!(avatars[_local_4].pMC == null))))
                    {
                        _local_2 = avatars[_local_4].pMC;
                    };
                    break;
                case "m":
                    if ((((!(getMonster(_local_4) == null)) && ("pMC" in getMonster(_local_4))) && (!(getMonster(_local_4).pMC == null))))
                    {
                        _local_2 = getMonster(_local_4).pMC;
                    };
                    break;
            };
            if (_local_2 != null)
            {
                _local_5 = new dotDisplay();
                _local_5.hpDisplay = _arg_1.hp;
                _local_5.init();
                _local_2.addChild(_local_5);
                _local_5.x = _local_2.mcChar.x;
                _local_5.y = (_local_2.pname.y + 10);
            };
        }

        public function showAuraChange(resObj:Object, tAvt:Avatar, tLeaf:Object):*
        {
            var tMC:MovieClip;
            var actionDamage:* = undefined;
            var cLeaf:Object;
            var i:int;
            var nc:int;
            var gap:int;
            var child:DisplayObject;
            var cTyp:String;
            var cID:int;
            var tTyp:String;
            var tID:int;
            var aura:Object;
            var existingAura:Object;
            var dateObj:Date;
            var isOK:Boolean;
            var tFilters:Array;
            var tFilter:* = undefined;
            var auras:* = undefined;
            var ai:* = undefined;
            var actObj:* = undefined;
            var icon1:* = undefined;
            var filterIndex:int;
            trace("showAuraChange > ");
            tMC = tAvt.pMC;
            actionDamage = null;
            var cAvt:Avatar;
            cLeaf = null;
            if (tMC != null)
            {
                i = 0;
                nc = tMC.numChildren;
                gap = 1;
                if (resObj.cInf != null)
                {
                    cTyp = String(resObj.cInf.split(":")[0]);
                    cID = int(resObj.cInf.split(":")[1]);
                    switch (cTyp)
                    {
                        case "p":
                            cAvt = getAvatarByUserID(cID);
                            cLeaf = getUoLeafById(cID);
                            break;
                        case "m":
                            cAvt = getMonster(cID);
                            cLeaf = monTree[cID];
                            break;
                    };
                };
                if (resObj.auras != null)
                {
                    gap = resObj.auras.length;
                };
                i = 0;
                while (i < nc)
                {
                    child = tMC.getChildAt(i);
                    if ((((!(child == null)) && (!(child.toString() == null))) && (child.toString().indexOf("auraDisplay") > -1)))
                    {
                        child.y = (child.y - (int((child.height + 3)) * gap));
                    };
                    i = (i + 1);
                };
                aura = {};
                existingAura = {};
                dateObj = new Date();
                isOK = true;
                if (tLeaf.auras == null)
                {
                    tLeaf.auras = [];
                };
                if (tLeaf.passives == null)
                {
                    tLeaf.passives = [];
                };
                switch (resObj.cmd)
                {
                    case "aura+":
                    case "aura++":
                    case "aura+p":
                        i = 0;
                        while (i < resObj.auras.length)
                        {
                            aura = resObj.auras[i];
                            aura.cLeaf = cLeaf;
                            if (resObj.cmd == "aura+p")
                            {
                                aura.passive = true;
                            }
                            else
                            {
                                aura.passive = false;
                            };
                            if (!aura.passive)
                            {
                                if (aura.t != null)
                                {
                                    aura.ts = dateObj.getTime();
                                };
                                if (((((tAvt == myAvatar) || (tAvt == myAvatar.target)) || ((!(tLeaf.targets == null)) && (!(tLeaf.targets[rootClass.sfc.myUserId] == null)))) || (resObj.cmd == "aura++")))
                                {
                                    actionDamage = new auraDisplay();
                                    actionDamage.t.ti.text = (aura.nam + "!");
                                    if (aura.nam == "Spirit Power")
                                    {
                                        actionDamage.t.ti.text = (aura.nam + " " + aura.val);
                                    };
                                    trace(("potionType: " + aura.potionType));
                                    if (aura.potionType != null)
                                    {
                                        if (aura.potionType.toLowerCase() == "tonic")
                                        {
                                            tAvt.objData.Tonic = true;
                                        };
                                        if (aura.potionType.toLowerCase() == "elixir")
                                        {
                                            tAvt.objData.Elixir = true;
                                        };
                                    };
                                    if (aura.nam == "Skill Locked")
                                    {
                                        ai = 0;
                                        while (ai < actions.active.length)
                                        {
                                            actObj = actions.active[ai];
                                            if (actObj.nam == aura.val)
                                            {
                                                icon1 = rootClass.ui.mcInterface.actBar.getChildByName(("i" + (ai + 1)));
                                                icon1.actObj.skillLock = true;
                                            };
                                            ai++;
                                        };
                                    };
                                    tMC.addChild(actionDamage);
                                    actionDamage.x = ((tMC.mcChar.scaleX < 0) ? 35 : (-(actionDamage.t.ti.textWidth) - 35));
                                    actionDamage.y = ((tMC.pname.y + 25) + ((actionDamage.height + 3) * i));
                                    if (aura.fx != null)
                                    {
                                        addAuraFX(tMC, aura.fx);
                                    };
                                };
                                if (aura.s != null)
                                {
                                    switch (aura.s)
                                    {
                                        case "s":
                                            if (tMC.mcChar.currentLabel != "Fall")
                                            {
                                                tMC.clearQueue();
                                                tMC.mcChar.gotoAndPlay("Fall");
                                            };
                                            break;
                                    };
                                };
                                if (aura.cat != null)
                                {
                                    isOK = true;
                                    for each (existingAura in tLeaf.auras)
                                    {
                                        try
                                        {
                                            if (((!(existingAura.cat == null)) && (existingAura.cat == aura.cat)))
                                            {
                                                isOK = false;
                                            };
                                        }
                                        catch(e:Error)
                                        {
                                            trace(("combat.applyAuras > " + e));
                                        };
                                    };
                                    if (isOK)
                                    {
                                        switch (aura.cat)
                                        {
											case "sleep":
												tMC.mcChar.stop();
												tMC.mcChar.gotoAndStop("Sleep");
											break;
											case "blind":
												map.transform.colorTransform = blindCT;
												CHARS.transform.colorTransform = blindCT;
											break;
											case "disabled":
												tMC.mcChar.stop();
											break;
											case "invi":
												tMC.mcChar.visible = false;
												tMC.shadow.visible = false;
												tMC.pname.visible = false;
												tMC.hpBar.visible = false;
												myAvatar.petMC.visible = false;
											break;
											case "hex":
												tMC.mcChar.stop();
												tMC.mcChar.gotoAndStop("Hex");
											break;
											case "silenced":
												tMC.mcChar.gotoAndPlay("Hit");
                                                tMC.mcChar.silenceMC.visible = true;
											break;
											case "stun":
                                                tMC.mcChar.vertigoMC.visible = true;
											break;
											case "poison":
                                                tMC.modulateColor(statusPoisonCT, "+");
												//tMC.mcChar.blindMC.visible = true;
											break;
											case "burn":
                                                tMC.modulateColor(statusBurnCT, "+");
											break;
											case "paralyze":
                                                tMC.modulateColor(statusParalyzeCT, "+");
                                                tMC.mcChar.stop();
											break;
											case "freeze":
                                                tMC.modulateColor(statusFreezeCT, "+");
                                                tMC.mcChar.stop();
											break;
                                            case "petrify":
                                            case "stone":
                                                tMC.modulateColor(statusStoneCT, "+");
                                                tMC.mcChar.stop();
											break;
                                            case "clean":
                                                tFilters = tMC.mcChar.filters;
                                                tFilters.push(new GlowFilter(0xFFFFFF, 1, 30, 30, 2, 2));
                                                tMC.mcChar.filters = tFilters;
											break;
											case "recharge":
                                                tFilters = tMC.mcChar.filters;
                                                tFilters.push(new GlowFilter(0xFF0000, 1, 30, 30, 2, 2));
                                                tMC.mcChar.filters = tFilters;
											break;
											case "restack":
                                                tFilters = tMC.mcChar.filters;
                                                tFilters.push(new GlowFilter(0x000000, 1, 30, 30, 2, 2));
                                                tMC.mcChar.filters = tFilters;
											break;
                                        };
                                    };
                                };
                                if (((!(aura.animOn == null)) && ((cLeaf == null) || (cLeaf.intState == 2))))
                                {
                                    if (aura.animOn.indexOf("fadeFX:") > -1)
                                    {
                                        removeAuraFX(tMC, aura.animOn.split(":")[1], "fade");
                                    }
                                    else
                                    {
                                        if (aura.animOn.indexOf("useFX:") > -1)
                                        {
                                            removeAuraFX(tMC, aura.animOn.split(":")[1], "use");
                                        }
                                        else
                                        {
                                            if (aura.animOn.indexOf("removeFX:") > -1)
                                            {
                                                removeAuraFX(tMC, aura.animOn.split(":")[1]);
                                            }
                                            else
                                            {
                                                tMC.mcChar.gotoAndPlay(aura.animOn);
                                            };
                                        };
                                    };
                                };
                                if (aura.msgOn != null)
                                {
                                    if (aura.msgOn.charAt(0) == "@")
                                    {
                                        if (tAvt == myAvatar)
                                        {
                                            rootClass.addUpdate(aura.msgOn.substr(1));
                                        };
                                    }
                                    else
                                    {
                                        rootClass.addUpdate(aura.msgOn);
                                    };
                                };
                                if (aura.isNew)
                                {
                                    tLeaf.auras.push(aura);
                                }
                                else
                                {
                                    updateAuraData(cLeaf, aura, tLeaf);
                                };
                            }
                            else
                            {
                                tLeaf.passives.push(aura);
                            };
                            i = (i + 1);
                        };
                        return;
                    case "aura-":
                    case "aura--":
                        auras = [];
                        if (resObj.auras != null)
                        {
                            auras = resObj.auras;
                        }
                        else
                        {
                            if (resObj.aura != null)
                            {
                                auras = [resObj.aura];
                            };
                        };
                        i = 0;
                        while (i < auras.length)
                        {
                            aura = auras[i];
                            if (removeAura(aura, tLeaf, tMC))
                            {
                                if (((((tAvt == myAvatar) || (tAvt == myAvatar.target)) || ((!(tLeaf.targets == null)) && (!(tLeaf.targets[rootClass.sfc.myUserId] == null)))) || (resObj.cmd == "aura--")))
                                {
                                    actionDamage = new auraDisplay();
                                    actionDamage.t.ti.text = (("*" + aura.nam) + " fades*");
                                    actionDamage.t.ti.textColor = 0x999999;
                                    tMC.addChild(actionDamage);
                                    actionDamage.x = ((tMC.mcChar.scaleX < 0) ? 35 : (-(actionDamage.t.ti.textWidth) - 35));
                                    actionDamage.y = (tMC.pname.y + 25);
                                };
                                if (aura.potionType != null)
                                {
                                    if (aura.potionType.toLowerCase() == "tonic")
                                    {
                                        tAvt.objData.Tonic = false;
                                    };
                                    if (aura.potionType.toLowerCase() == "elixir")
                                    {
                                        tAvt.objData.Elixir = false;
                                    };
                                };
                                if (aura.s != null)
                                {
                                    switch (aura.s)
                                    {
                                        case "s":
                                            if (tMC.mcChar.currentLabel == "Fall")
                                            {
                                                if (isStatusGone("s", tLeaf))
                                                {
                                                    tMC.mcChar.gotoAndPlay("Getup");
                                                };
                                            };
                                            break;
                                    };
                                };
                                if (aura.cat != null)
                                {
                                    isOK = true;
                                    for each (existingAura in tLeaf.auras)
                                    {
                                        try
                                        {
                                            if (((!(existingAura.cat == null)) && (existingAura.cat == aura.cat)))
                                            {
                                                isOK = false;
                                            };
                                        }
                                        catch(e:Error)
                                        {
                                            trace(("combat.applyAuras > " + e));
                                        };
                                    };
                                    if (isOK)
                                    {
                                        switch (aura.cat)
                                        {
											case "sleep":
												tMC.mcChar.play();
												tMC.mcChar.gotoAndPlay("Getup");
											break;
											case "blind":
												map.transform.colorTransform = defaultCT;
												CHARS.transform.colorTransform = defaultCT;
											break;
											case "disabled":
												tMC.mcChar.play();
											break;
											case "invi":
												tMC.mcChar.visible = true;
												tMC.shadow.visible = true;
												tMC.pname.visible = true;
												tMC.hpBar.visible = true;
												myAvatar.petMC.visible = true;
											break;
											case "hex":
												tMC.mcChar.play();
												tMC.mcChar.gotoAndPlay("Getup");
											break;
											case "silenced":
												tMC.mcChar.gotoAndPlay("Getup");
                                                tMC.mcChar.silenceMC.visible = false;
											break;
											case "stun":
                                                tMC.mcChar.gotoAndPlay("Getup");
                                                tMC.mcChar.vertigoMC.visible = false;
											break;
											case "poison":
                                                tMC.modulateColor(statusPoisonCT, "-");
												//tMC.mcChar.blindMC.visible = false;
											break;
											case "burn":
                                                tMC.modulateColor(statusBurnCT, "-");
											break;
											case "paralyze":
                                                tMC.modulateColor(statusParalyzeCT, "-");
                                                tMC.mcChar.stop();
											break;
											case "freeze":
                                                tMC.modulateColor(statusFreezeCT, "-");
                                                tMC.mcChar.stop();
											break;
                                            case "petrify":
                                            case "stone":
                                                tMC.modulateColor(statusStoneCT, "-");
                                                tMC.mcChar.play();
                                                break;
											case "recharge":
                                                tFilters = tMC.mcChar.filters;
                                                filterIndex = 0;
                                                while (filterIndex < tFilters.length) {
                                                    tFilter = tFilters[filterIndex];
                                                    if ((((tFilter is GlowFilter)) && ((GlowFilter(tFilter).color == 0xFF0000)))){
                                                        tFilters.splice(filterIndex, 1);
                                                        filterIndex = (filterIndex - 1);
                                                    };
                                                    filterIndex = (filterIndex + 1);
                                                };
                                                tMC.mcChar.filters = tFilters;
                                                break;
											case "restack":
                                                tFilters = tMC.mcChar.filters;
                                                filterIndex = 0;
                                                while (filterIndex < tFilters.length) {
                                                    tFilter = tFilters[filterIndex];
                                                    if ((((tFilter is GlowFilter)) && ((GlowFilter(tFilter).color == 0x000000)))){
                                                        tFilters.splice(filterIndex, 1);
                                                        filterIndex = (filterIndex - 1);
                                                    };
                                                    filterIndex = (filterIndex + 1);
                                                };
                                                tMC.mcChar.filters = tFilters;
											break;
                                            case "clean":
                                                tFilters = tMC.mcChar.filters;
                                                filterIndex = 0;
                                                while (filterIndex < tFilters.length)
                                                {
                                                    tFilter = tFilters[filterIndex];
                                                    if (((tFilter is GlowFilter) && (GlowFilter(tFilter).color == 0xFFFFFF)))
                                                    {
                                                        tFilters.splice(filterIndex, 1);
                                                        filterIndex = (filterIndex - 1);
                                                    };
                                                    filterIndex = (filterIndex + 1);
                                                };
                                                tMC.mcChar.filters = tFilters;
											break;
                                        };
                                    };
                                };
                                if (aura.nam == "Skill Locked")
                                {
                                    ai = 0;
                                    while (ai < actions.active.length)
                                    {
                                        actObj = actions.active[ai];
                                        if (actObj.nam == aura.val)
                                        {
                                            icon1 = rootClass.ui.mcInterface.actBar.getChildByName("i" + ai + 1);
                                            icon1.actObj.skillLock = false;
                                            icon1.cnt.alpha = 1;
                                        };
                                        ai++;
                                    };
                                };
                                if (aura.animOff != null)
                                {
                                    tMC.mcChar.gotoAndPlay(aura.animOff);
                                };
                                if (aura.msgOff != null)
                                {
                                    if (aura.msgOff.charAt(0) == "@")
                                    {
                                        if (tAvt == myAvatar)
                                        {
                                            rootClass.addUpdate(aura.msgOff.substr(1));
                                        };
                                    }
                                    else
                                    {
                                        rootClass.addUpdate(aura.msgOff);
                                    };
                                };
                            };
                            i = (i + 1);
                        };
                        return;
                    case "aura*":
                        actionDamage = new auraDisplay();
                        actionDamage.t.ti.text = "* IMMUNE *";
                        tMC.addChild(actionDamage);
                        actionDamage.x = ((tMC.mcChar.scaleX < 0) ? 35 : (-(actionDamage.t.ti.textWidth) - 35));
                        actionDamage.y = ((tMC.pname.y + 25) + ((actionDamage.height + 3) * i));
                        return;
                };
            };
        }

        public function updateAuraData(_arg_1:Object, _arg_2:Object, _arg_3:Object):void
        {
            var _local_4:Object;
            for each (_local_4 in _arg_3.auras)
            {
                if (((_local_4.nam == _arg_2.nam) && (_local_4.cLeaf == _arg_1)))
                {
                    _local_4.dur = _arg_2.dur;
                    _local_4.val = _arg_2.val;
                };
            };
        }

        public function handleAuraEvent(cmd:String, resObj:Object):void
        {
            var cLeaf:Object;
            var tLeaf:Object;
            var cAvt:Avatar;
            var tAvt:Avatar;
            var cTyp:String;
            var cID:int;
            var tTyp:String;
            var tID:int;
            var forceAura:Boolean;
            trace("handleAuraEvent >");
            if (rootClass.sfcSocial)
            {
                forceAura = false;
                if (((cmd.indexOf("++") > -1) || (cmd.indexOf("--") > -1)))
                {
                    forceAura = true;
                };
                cAvt = null;
                tAvt = null;
                if (resObj.cInf != null)
                {
                    cTyp = String(resObj.cInf.split(":")[0]);
                    cID = int(resObj.cInf.split(":")[1]);
                    switch (cTyp)
                    {
                        case "p":
                            cAvt = getAvatarByUserID(cID);
                            cLeaf = getUoLeafById(cID);
                            break;
                        case "m":
                            cAvt = getMonster(cID);
                            cLeaf = monTree[cID];
                            break;
                    };
                };
                if (resObj.tInf != null)
                {
                    tTyp = String(resObj.tInf.split(":")[0]);
                    tID = int(resObj.tInf.split(":")[1]);
                    switch (tTyp)
                    {
                        case "p":
                            try
                            {
                                tAvt = getAvatarByUserID(tID);
                                tLeaf = getUoLeafById(tID);
                                if (((forceAura) || (tLeaf.strFrame == strFrame)))
                                {
                                    if (rootClass.sfcSocial)
                                    {
                                        showAuraChange(resObj, tAvt, tLeaf);
                                    };
                                };
                            }
                            catch(e:Error)
                            {
                            };
                            return;
                        case "m":
                            try
                            {
                                tAvt = getMonster(tID);
                                tLeaf = monTree[tID];
                                if (((forceAura) || ((cLeaf == null) || ((!(cLeaf.targets[tID] == null)) && (tLeaf.strFrame == strFrame)))))
                                {
                                    if (rootClass.sfcSocial)
                                    {
                                        showAuraChange(resObj, tAvt, tLeaf);
                                    };
                                };
                            }
                            catch(e:Error)
                            {
                                trace((" HAE > " + e));
                            };
                            return;
                    };
                };
            };
        }

        public function removeAura(_arg_1:Object, _arg_2:Object, _arg_3:MovieClip):Boolean
        {
            var _local_4:Boolean;
            var _local_5:int;
            trace(("removeAura > " + _arg_1.nam));
            if (rootClass.sfcSocial)
            {
                _local_4 = false;
                _local_5 = 0;
                _local_5 = 0;
                while (_local_5 < _arg_2.auras.length)
                {
                    if (_arg_2.auras[_local_5].nam == _arg_1.nam)
                    {
                        if (((!(_arg_3 == null)) && (!(_arg_2.auras[_local_5].fx == null))))
                        {
                            removeAuraFX(_arg_3, _arg_2.auras[_local_5].fx, "fade");
                        };
                        _arg_2.auras.splice(_local_5, 1);
                        _local_5 = _arg_2.auras.length;
                        _local_4 = true;
                    };
                    _local_5++;
                };
                _local_5 = 0;
                while (_local_5 < _arg_2.passives.length)
                {
                    if (_arg_2.passives[_local_5].nam == _arg_1.nam)
                    {
                        _arg_2.passives.splice(_local_5, 1);
                        _local_5 = _arg_2.passives.length;
                        _local_4 = false;
                    };
                    _local_5++;
                };
                trace(("returning " + _local_4));
                return (_local_4);
            };
            trace("Unsocial, returning false");
            return (false);
        }

        public function addAuraFX(tMC:MovieClip, fxName:String):void
        {
            var c:Class;
            var fx:MovieClip;
            trace(("addAuraFX  > " + fxName));
            try
            {
                if (tMC.fx.getChildByName(fxName) == null)
                {
                    c = getClass(fxName);
                    fx = MovieClip(tMC.fx.addChild(new (c)()));
                    fx.name = fxName;
                    fx.y = -30;
                };
            }
            catch(e:Error)
            {
                trace(e);
            };
            trace("");
        }

        public function removeAuraFX(tMC:MovieClip, fxName:String, fxLabel:String=null):void
        {
            var i:int;
            var fx:MovieClip;
            trace((("removeAuraFX  > " + fxName) + ((fxLabel != null) ? (" " + fxLabel) : "")));
            i = 0;
            i = 0;
            while (i < tMC.fx.numChildren)
            {
                fx = MovieClip(tMC.fx.getChildAt(i));
                if (((fxName == "all") || (fx.name == fxName)))
                {
                    if (fxLabel != null)
                    {
                        try
                        {
                            MovieClip(fx.getChildByName("inner")).gotoAndPlay(fxLabel);
                        }
                        catch(fxe:Error)
                        {
                            trace(("fx play error > " + fxe));
                        };
                    }
                    else
                    {
                        MovieClip(tMC.fx.removeChildAt(i)).stop();
                        i = (i - 1);
                    };
                };
                i = (i + 1);
            };
        }

        public function isStatusGone(_arg_1:String, _arg_2:Object):Boolean
        {
            var _local_3:*;
            _local_3 = 0;
            while (_local_3 < _arg_2.auras.length)
            {
                if (((!(_arg_2.auras[_local_3].s == null)) && (_arg_2.auras[_local_3].s == _arg_1)))
                {
                    return (false);
                };
                _local_3++;
            };
            return (true);
        }

        public function isMoveOK(tLeaf:Object):Boolean
        {
            var isOK:Boolean;
            var aura:Object;
            isOK = true;
            aura = {};
            if (tLeaf.auras != null)
            {
                for each (aura in tLeaf.auras)
                {
                    try
                    {
                        if (aura.cat != null)
                        {
							switch (aura.cat)
							{
								case "sleep":
								case "hex":
								case "paralyze":
								case "petrify":
								case "freeze":
								case "stun":
								case "stone":
								case "disabled":
									isOK = false;
								break;
							};
                        };
                    }
                    catch(e:Error)
                    {
                        trace(("doAnim > " + e));
                    };
                };
                return (isOK);
            };
            return (false);
        }

        public function wound(_arg_1:*, _arg_2:*):*
        {
            var _local_3:*;
            if (_arg_2 == "damage")
            {
                _local_3 = new MovieClip();
                _local_3.name = "flickermc";
                _local_3.maxF = 3;
                _local_3.curF = 0;
                _local_3.addEventListener(Event.ENTER_FRAME, flickerFrame);
                if (_arg_1.contains(_local_3))
                {
                    _arg_1.flickermc.removeEventListener(Event.ENTER_FRAME, flickerFrame);
                    _arg_1.removeChild(_local_3);
                };
                _arg_1.addChild(_local_3);
            };
        }

        public function flickerFrame(_arg_1:Event):*
        {
            var _local_2:*;
            _local_2 = MovieClip(_arg_1.currentTarget);
            if (((!(_local_2.parent == null)) && (!(_local_2.parent.stage == null))))
            {
                if (_local_2.curF == 0)
                {
                    _local_2.parent.modulateColor(avtWCT, "+");
                };
                if (_local_2.curF == 1)
                {
                    _local_2.parent.modulateColor(avtWCT, "-");
                };
                if (_local_2.curF == 2)
                {
                    _local_2.parent.modulateColor(avtWCT, "+");
                };
                if (_local_2.curF >= _local_2.maxF)
                {
                    _local_2.parent.modulateColor(avtWCT, "-");
                    _local_2.removeEventListener(Event.ENTER_FRAME, flickerFrame);
                    _local_2.parent.removeChild(_local_2);
                };
                _local_2.curF++;
            }
            else
            {
                _local_2.removeEventListener(Event.ENTER_FRAME, flickerFrame);
            };
        }

        public function unlockActionsExcept(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            _local_2 = [];
            _local_3 = 0;
            _local_3 = 0;
            while (_local_3 < actions.active.length)
            {
                _local_5 = actions.active[_local_3];
                if ((((!(_local_5.ref == _arg_1.ref)) && (_local_5.lock == true)) && (_local_5.ts < _arg_1.ts)))
                {
                    _local_6 = 0;
                    while (_local_6 < actionMap.length)
                    {
                        if (actionMap[_local_6] == _local_5.ref)
                        {
                            _local_2.push(("i" + (_local_6 + 1)));
                        };
                        _local_6++;
                    };
                };
                _local_3++;
            };
            _local_4 = 0;
            while (_local_4 < _local_2.length)
            {
                _local_7 = rootClass.ui.mcInterface.actBar.getChildByName(_local_2[_local_4]);
                if (_local_7.actObj != null)
                {
                    _local_7.actObj.lock = false;
                };
                _local_4++;
            };
        }

        public function unlockActions():*
        {
            var _local_1:*;
            var _local_2:*;
            _local_1 = 0;
            while (_local_1 < actions.active.length)
            {
                _local_2 = actions.active[_local_1];
                _local_2.lock = false;
                _local_1++;
            };
        }

        public function updateActBar():void
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            if ((((!(myAvatar == null)) && (!(myAvatar.dataLeaf == null))) && (!(myAvatar.dataLeaf.sta == null))))
            {
                _local_1 = 0;
                while (_local_1 < rootClass.ui.mcInterface.actBar.numChildren)
                {
                    _local_2 = rootClass.ui.mcInterface.actBar.getChildAt(_local_1);
                    if ((("actObj" in _local_2) && (!(_local_2.actObj == null))))
                    {
                        _local_3 = _local_2.actObj.skillLock;
                        _local_3 = ((_local_3 == null) ? false : _local_3);
                        if (((myAvatar.dataLeaf.intMP >= Math.round((_local_2.actObj.mp * myAvatar.dataLeaf.sta["$cmc"]))) && (!(_local_3))))
                        {
                            if (_local_2.cnt.alpha < 1)
                            {
                                _local_2.cnt.alpha = 1;
                            };
                        }
                        else
                        {
                            if (_local_2.cnt.alpha == 1)
                            {
                                _local_2.cnt.alpha = 0.4;
                            };
                        };
                    };
                    _local_1++;
                };
            };
        }

        public function getActIcons(_arg_1:Object):Array
        {
            var _local_2:Array;
            var _local_3:MovieClip;
            var _local_4:*;
            _local_2 = [];
            _local_4 = 0;
            while (_local_4 < actionMap.length)
            {
                if (actionMap[_local_4] == _arg_1.ref)
                {
                    _local_3 = (rootClass.ui.mcInterface.actBar.getChildByName(("i" + (_local_4 + 1))) as MovieClip);
                    if (_local_3 != null)
                    {
                        _local_2.push(_local_3);
                    };
                };
                _local_4++;
            };
            return (_local_2);
        }

        public function globalCoolDownExcept(_arg_1:Object):void
        {
            var _local_2:Number;
            var _local_3:MovieClip;
            var _local_4:Object;
            _local_2 = new Date().getTime();
            for each (_local_4 in actions.active)
            {
                if (_local_4.isOK)
                {
                    _local_3 = getActIcons(_local_4)[0];
                    if (_local_3 != null)
                    {
                        try
                        {
                            if ((((!(_local_4 == _arg_1)) && (!(_local_4.ref == "aa"))) && (((!("icon2" in _local_3)) || (_local_3.icon2 == null)) || (((_local_4.ts + _local_4.cd) > _local_2) && (((_local_4.ts + _local_4.cd) - _local_2) < GCD)))))
                            {
                                coolDownAct(_local_4, GCD, _local_2);
                            };
                        }
                        catch(e:Error)
                        {
                        };
                    };
                };
            };
            GCDTS = _local_2;
        }

        public function checkCooldown(_arg_1:Object):*
        {
            var _local_2:Array;
            var _local_3:MovieClip;
            var _local_4:int;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            _local_2 = getActIcons(_arg_1);
            while (_local_4 < _local_2.length)
            {
                _local_3 = _local_2[_local_4];
                if (_local_3.icon2 != null)
                {
                    _local_3.bitmapData.dispose();
                    _local_5 = new BitmapData(50, 50, true, 0);
                    _local_5.draw(_local_3, null, iconCT);
                    _local_6 = new Bitmap(_local_5);
                    _local_7 = rootClass.ui.mcInterface.actBar.addChild(_local_6);
                    _local_3.icon2 = _local_7;
                };
                _local_4++;
            };
        }

        public function coolDownAct(_arg_1:Object, _arg_2:int=-1, _arg_3:Number=-1):*
        {
            var _local_4:Array;
            var _local_5:MovieClip;
            var _local_6:int;
            var _local_7:*;
            var _local_8:MovieClip;
            var _local_9:*;
            var _local_10:*;
            var _local_11:int;
            var _local_12:DisplayObject;
            _local_4 = getActIcons(_arg_1);
            _local_6 = 0;
            while (_local_6 < _local_4.length)
            {
                _local_5 = _local_4[_local_6];
                _local_7 = null;
                _local_8 = null;
                if (_local_5.icon2 == null)
                {
                    _local_9 = new BitmapData(50, 50, true, 0);
                    _local_9.draw(_local_5, null, iconCT);
                    _local_10 = new Bitmap(_local_9);
                    _local_7 = rootClass.ui.mcInterface.actBar.addChild(_local_10);
                    _local_5.icon2 = _local_7;
                    if (_arg_2 == -1)
                    {
                        _local_12 = rootClass.ui.mcInterface.actBar.addChild(new iconFlare());
                        _local_7.transform = (_local_12.transform = _local_5.transform);
                        _local_5.ts = _arg_1.ts;
                        _local_5.cd = _arg_1.cd;
                    }
                    else
                    {
                        _local_7.transform = _local_5.transform;
                        _local_5.ts = _arg_3;
                        _local_5.cd = _arg_2;
                    };
                    _local_8 = (rootClass.ui.mcInterface.actBar.addChild(new ActMask()) as MovieClip);
                    _local_8.scaleX = 0.33;
                    _local_8.scaleY = 0.33;
                    _local_8.x = int(((_local_7.x + (_local_7.width / 2)) - (_local_8.width / 2)));
                    _local_8.y = int(((_local_7.y + (_local_7.height / 2)) - (_local_8.height / 2)));
                    _local_11 = 0;
                    while (_local_11 < 4)
                    {
                        _local_8[(("e" + _local_11) + "oy")] = _local_8[("e" + _local_11)].y;
                        _local_11++;
                    };
                    _local_7.mask = _local_8;
                }
                else
                {
                    _local_7 = _local_5.icon2;
                    _local_8 = _local_7.mask;
                    if (_arg_2 == -1)
                    {
                        _local_5.ts = _arg_1.ts;
                        _local_5.cd = _arg_1.cd;
                    }
                    else
                    {
                        _local_5.ts = _arg_3;
                        _local_5.cd = _arg_2;
                    };
                };
                _local_8.e0.stop();
                _local_8.e1.stop();
                _local_8.e2.stop();
                _local_8.e3.stop();
                _local_5.removeEventListener(Event.ENTER_FRAME, countDownAct);
                _local_5.addEventListener(Event.ENTER_FRAME, countDownAct, false, 0, true);
                _local_6++;
            };
        }

        public function countDownAct(_arg_1:Event):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            _local_2 = new Date();
            _local_3 = _local_2.getTime();
            _local_4 = MovieClip(_arg_1.target);
            _local_5 = _local_4.icon2;
            _local_6 = Math.round((_local_4.cd * (1 - Math.min(Math.max(myAvatar.dataLeaf.sta.$tha, -1), 0.5))));
            _local_7 = ((_local_3 - _local_4.ts) / _local_6);
            _local_8 = Math.floor((_local_7 * 4));
            _local_9 = (int(((_local_7 * 360) % 90)) + 1);
            if (!_local_4.actObj.lock)
            {
                if (_local_7 < 0.99)
                {
                    _local_10 = 0;
                    while (_local_10 < 4)
                    {
                        if (_local_10 < _local_8)
                        {
                            _local_5.mask[("e" + _local_10)].y = -300;
                        }
                        else
                        {
                            _local_5.mask[("e" + _local_10)].y = _local_5.mask[(("e" + _local_10) + "oy")];
                            if (_local_10 > _local_8)
                            {
                                _local_5.mask[("e" + _local_10)].gotoAndStop(0);
                            };
                        };
                        _local_10++;
                    };
                    MovieClip(_local_5.mask[("e" + _local_8)]).gotoAndStop(_local_9);
                }
                else
                {
                    _local_11 = _local_5.mask;
                    _local_5.mask = null;
                    _local_5.parent.removeChild(_local_11);
                    _local_4.removeEventListener(Event.ENTER_FRAME, countDownAct);
                    _local_5.parent.removeChild(_local_5);
                    _local_5.bitmapData.dispose();
                    _local_4.icon2 = null;
                };
            };
        }

        public function healByIcon(_arg_1:Avatar):void
        {
            var _local_2:Object;
            _local_2 = getFirstHeal();
            if (_local_2 != null)
            {
                setTarget(_arg_1);
                testAction(_local_2);
            };
        }

        public function getFirstHeal():Object
        {
            var _local_1:*;
            try
            {
                _local_1 = 0;
                while (_local_1 < actions.active.length)
                {
                    if (((((!(actions.active[_local_1] == null)) && (!(actions.active[_local_1].damage == null))) && (actions.active[_local_1].damage < 0)) && (actions.active[_local_1].isOK)))
                    {
                        return (actions.active[_local_1]);
                    };
                    _local_1++;
                };
            }
            catch(e:Error)
            {
            };
            return (null);
        }

        public function AATest(_arg_1:Event):*
        {
            trace("TIMER AATest > DISABLED");
        }

        public function connTest(_arg_1:Event):*
        {
            trace("TIMER connTest > Failed!  This should not appear, test was removed.");
        }

        internal function checkSP(_arg_1:int, _arg_2:Object):Boolean
        {
            var _local_3:*;
            _local_3 = 0;
            while (_local_3 < _arg_2.auras.length)
            {
                if (_arg_2.auras[_local_3].nam == "Spirit Power")
                {
                    if (_arg_1 <= _arg_2.auras[_local_3].val)
                    {
                        return (true);
                    };
                    return (false);
                };
                _local_3++;
            };
            return (false);
        }

        public function acceptQuest(questId:int, accept:Boolean=false):void
        {
            if (questTree[questId] == null)
            {
                getQuests([questId]);
            };
            if (questTree[questId].status == null)
            {
                questTree[questId].status = "p";
                rootClass.ui.mcQTracker.updateQuest();
            };
            if (!rootClass.ui.mcQTracker.visible)
            {
                rootClass.ui.mcQTracker.toggle();
            };
            if (!accept)
            {
                this.rootClass.sfc.sendXtMessage("zm", "acceptQuest", [questId], "str", this.curRoom);
            };
        }

        public function tryQuestComplete(_arg_1:int, _arg_2:int=-1, _arg_3:Boolean=false):void
        {
            rootClass.sfc.sendXtMessage("zm", "tryQuestComplete", [_arg_1, _arg_2, _arg_3, "wvz"], "str", curRoom);
        }

        public function getMapItem(_arg_1:int):void
        {
            if (coolDown("getMapItem"))
            {
                rootClass.sfc.sendXtMessage("zm", "getMapItem", [_arg_1], "str", curRoom);
            };
        }

        public function isQuestInProgress(_arg_1:int):Boolean
        {
            return ((!(questTree[_arg_1] == null)) && (!(questTree[_arg_1].status == null)));
        }

        public function getQuests(_arg_1:Array):void
        {
            rootClass.sfc.sendXtMessage("zm", "getQuests", _arg_1, "str", curRoom);
        }

        public function getQuest(_arg_1:int):void
        {
        }

        public function showQuestList(_arg_1:String, _arg_2:String, _arg_3:String):void
        {
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:String;
            if (!rootClass.isGreedyModalInStack())
            {
                rootClass.clearPopupsQ();
                _local_4 = rootClass.attachOnModalStack("QFrameMC");
                _local_5 = _arg_2.split(",");
                _local_6 = _arg_3.split(",");
                _local_4.sIDs = _local_5;
                _local_4.tIDs = _local_6;
                _local_4.world = this;
                _local_4.rootClass = rootClass;
                _local_4.qMode = _arg_1;
                _local_7 = [];
                _local_8 = 0;
                while (_local_8 < _local_5.length)
                {
                    _local_9 = _local_5[_local_8];
                    if (questTree[_local_9] == null)
                    {
                        _local_7.push(_local_9);
                    }
                    else
                    {
                        if (questTree[_local_9].strDynamic != null)
                        {
                            questTree[_local_9] = null;
                            delete questTree[_local_9];
                            _local_7.push(_local_9);
                        };
                    };
                    _local_8++;
                };
                if (((_local_7.length > 0) && (!(_arg_2 == ""))))
                {
                    getQuests(_local_7);
                }
                else
                {
                    _local_4.open();
                };
            };
        }

        public function getApop(_arg_1:String):void
        {
            var _local_2:Object;
            var _local_3:*;
            var _local_4:Object;
            var _local_5:uint;
            var _local_6:Array;
            var _local_7:uint;
            if (int(_arg_1) < 1)
            {
                return;
            };
            if (rootClass.curID != _arg_1)
            {
                rootClass.curID = _arg_1;
                rootClass.sfc.sendXtMessage("zm", "getApop", [_arg_1], "str", curRoom);
                return;
            };
            _local_2 = rootClass.apopTree[_arg_1];
            _local_3 = new Array();
            _local_5 = 0;
            for (;_local_5 < _local_2.arrScenes.length;_local_5++)
            {
                _local_4 = _local_2.arrScenes[_local_5];
                if (_local_4.qID == null)
                {
                    trace(((("sc.sceneID: " + _local_4.sceneID) + " arrQuests: ") + _local_4.arrQuests));
                    if (_local_4.arrQuests != null)
                    {
                        _local_6 = String(_local_4.arrQuests).split(",");
                        _local_7 = 0;
                        while (_local_7 < _local_6.length)
                        {
                            if (questTree[_local_6[_local_7]] == null)
                            {
                                _local_3.push(_local_6[_local_7]);
                                rootClass.quests = true;
                            }
                            else
                            {
                                if (questTree[_local_6[_local_7]].strDynamic != null)
                                {
                                    questTree[_local_6[_local_7]] = null;
                                    delete questTree[_local_6[_local_7]];
                                    _local_3.push(_local_6[_local_7]);
                                    rootClass.quests = true;
                                };
                            };
                            _local_7++;
                        };
                        continue;
                    };
                }
                else
                {
                    if (questTree[_local_4.qID] == null)
                    {
                        _local_3.push(_local_4.qID);
                        rootClass.quests = true;
                    }
                    else
                    {
                        if (questTree[_local_4.qID].strDynamic != null)
                        {
                            questTree[_local_4.qID] = null;
                            delete questTree[_local_4.qID];
                            _local_3.push(_local_4.qID);
                            rootClass.quests = true;
                        };
                    };
                };
            };
            if (_local_3.length > 0)
            {
                rootClass.quests = true;
                rootClass.sfc.sendXtMessage("zm", "getQuests2", _local_3, "str", curRoom);
            }
            else
            {
                rootClass.quests = false;
                rootClass.createApop();
            };
        }

        public function showQuests(_arg_1:String, _arg_2:String):void
        {
            showQuestList(_arg_2, _arg_1, _arg_1);
        }

        public function showQuestLink(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:String;
            _local_2 = "$({";
            _local_3 = "})$";
            _local_4 = "";
            if (_arg_1.unm.toLowerCase() != rootClass.sfc.myUserName)
            {
                _local_4 = (_local_4 + ((_arg_1.unm + " issues a Call to Arms for ") + _local_2));
                _local_4 = (_local_4 + ["quest", _arg_1.quest.sName, _arg_1.quest.QuestID, _arg_1.quest.iLvl, _arg_1.unm].toString());
                _local_4 = (_local_4 + (_local_3 + "!"));
            }
            else
            {
                _local_4 = (_local_4 + (("You issue a Call to Arms for " + _arg_1.quest.sName) + "!"));
            };
            rootClass.chatF.pushMsg("event", _local_4, "SERVER", "", 0);
        }

        public function getActiveQuests():String
        {
            var quests:String = "";
            var _local_2:*;
            var _local_3:*;
            for (_local_2 in questTree)
            {
                _local_3 = questTree[_local_2];
                if (_local_3.status != null)
                {
                    if (quests.length)
                    {
                        quests = (quests + ("," + _local_2));
                    }
                    else
                    {
                        quests = (quests + _local_2);
                    };
                };
            };
            return (quests);
        }

        public function checkAllQuestStatus(_arg_1:*=null):*
        {
            var _local_2:Array;
            var _local_3:String;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:int;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            _local_2 = [];
            if (_arg_1 != null)
            {
                _local_2 = [String(_arg_1)];
            }
            else
            {
                for (_local_3 in questTree)
                {
                    _local_2.push(_local_3);
                };
            };
            for each (_local_3 in _local_2)
            {
                _local_4 = questTree[_local_3];
                _local_5 = {};
                if (_local_4.status != null)
                {
                    if (((!(_local_4.turnin == null)) && (_local_4.turnin.length > 0)))
                    {
                        _local_5.sItems = true;
                        _local_7 = 0;
                        while (_local_7 < _local_4.turnin.length)
                        {
                            _local_8 = _local_4.turnin[_local_7].ItemID;
                            _local_9 = _local_4.turnin[_local_7].iQty;
                            if (((invTree[_local_8] == null) || (invTree[_local_8].iQty < _local_9)))
                            {
                                _local_5.sItems = false;
                                break;
                            };
                            _local_7++;
                        };
                    };
                    if (_local_4.iTime != null)
                    {
                        _local_5.iTime = false;
                        if (_local_4.ts != null)
                        {
                            _local_10 = new Date();
                            if ((_local_10.getTime() - _local_4.ts) <= _local_4.iTime)
                            {
                                _local_5.iTime = true;
                            };
                        };
                    };
                    _local_4.status = "c";
                    for (_local_6 in _local_5)
                    {
                        if (_local_5[_local_6] == false)
                        {
                            _local_4.status = "p";
                        };
                    };
                };
            };
            rootClass.ui.mcQTracker.updateQuest();
        }

        public function updateQuestProgress(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_6:int;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            for (_local_3 in questTree)
            {
                _local_4 = questTree[_local_3];
                _local_5 = {};
                if (((!(_local_4.status == null)) && (_local_4.status == "p")))
                {
                    if ((((_arg_1 == "item") && (!(_local_4.turnin == null))) && (_local_4.turnin.length > 0)))
                    {
                        _local_5.sItems = true;
                        _local_6 = 0;
                        while (_local_6 < _local_4.turnin.length)
                        {
                            _local_7 = _local_4.turnin[_local_6].ItemID;
                            _local_8 = _local_4.turnin[_local_6].iQty;
                            if ((((_arg_2.ItemID == _local_7) && (!(invTree[_local_7] == null))) && (invTree[_local_7].iQty <= _local_8)))
                            {
                                _local_9 = invTree[_local_7];
                                rootClass.addUpdate(((((((_local_4.sName + ": ") + _local_9.sName) + " ") + invTree[_local_7].iQty) + "/") + _local_8));
                            };
                            _local_6++;
                        };
                    };
                    checkAllQuestStatus(_local_3);
                    if (_local_4.status == "c")
                    {
                        rootClass.addUpdate((_local_4.sName + " complete!"));
                        rootClass.mixer.playSound("Good");
                    };
                };
            };
        }

        public function canTurnInQuest(_arg_1:int):Boolean
        {
            var _local_2:*;
            var _local_3:int;
            var _local_4:*;
            var _local_5:*;
            _local_2 = questTree[_arg_1];
            if (((!(_local_2.turnin == null)) && (_local_2.turnin.length > 0)))
            {
                _local_3 = 0;
                while (_local_3 < _local_2.turnin.length)
                {
                    _local_4 = _local_2.turnin[_local_3].ItemID;
                    _local_5 = _local_2.turnin[_local_3].iQty;
                    if (((invTree[_local_4] == null) || (invTree[_local_4].iQty < _local_5)))
                    {
                        return (false);
                    };
                    if (myAvatar.isItemEquipped(_local_4))
                    {
                        rootClass.MsgBox.notify("Cannot turn in equipped item(s)!");
                        return (false);
                    };
                    _local_3++;
                };
            };
            return (true);
        }

        public function abandonQuest(questId:int):void
        {
            questTree[questId].status = null;
            rootClass.ui.mcQTracker.updateQuest();
        }

        public function completeQuest(_arg_1:int):void
        {
            if (questTree[_arg_1] != null)
            {
                questTree[_arg_1].status = null;
                rootClass.ui.mcQTracker.updateQuest();
            };
        }

        public function toggleQuestLog():void
        {
            var _local_1:* = rootClass.getInstanceFromModalStack("QFrameMC");
            if (_local_1 == null)
            {
                showQuests("", "l");
            }
            else
            {
                _local_1.open();
            };
        }

        public function isPartyMember(_arg_1:String):Boolean
        {
            var _local_2:int;
            _arg_1 = _arg_1.toLowerCase();
            if (_arg_1 != rootClass.sfc.myUserName)
            {
                _local_2 = 0;
                while (_local_2 < partyMembers.length)
                {
                    if (partyMembers[_local_2].toLowerCase() == _arg_1)
                    {
                        return (true);
                    };
                    _local_2++;
                };
            };
            return (false);
        }

        public function doPartyAccept(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                rootClass.sfc.sendXtMessage("zm", "gp", ["pa", _arg_1.pid], "str", 1);
            }
            else
            {
                rootClass.sfc.sendXtMessage("zm", "gp", ["pd", _arg_1.pid], "str", 1);
            };
        }

        public function doCTAAccept(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                rootClass.sfc.sendXtMessage("zm", "gp", ["ctaa", _arg_1.unm], "str", 1);
                showQuests(_arg_1.QuestID, "q");
            };
        }

        public function doCTAClick(_arg_1:MouseEvent):void
        {
            var _local_2:MovieClip;
            var _local_3:ModalMC;
            var _local_4:Object;
            _local_2 = (_arg_1.currentTarget as MovieClip);
            _local_3 = new ModalMC();
            _local_4 = {};
            _local_4.strBody = (("Would you like to join the next avabilable party for " + _local_2.sName) + "?");
            _local_4.callback = doCTAAccept;
            _local_4.params = {
                "QuestID":_local_2.QuestID,
                "unm":_local_2.unm
            };
            _local_4.btns = "dual";
            rootClass.ui.ModalStack.addChild(_local_3);
            _local_3.init(_local_4);
        }

        public function addPartyMember(_arg_1:String):*
        {
            partyMembers.push(_arg_1);
            updatePartyFrame();
        }

        public function removePartyMember(_arg_1:String):*
        {
            var _local_2:*;
            if (_arg_1 != rootClass.sfc.myUserName)
            {
                _local_2 = partyMembers.indexOf(_arg_1);
                if (_local_2 > -1)
                {
                    partyMembers.splice(_local_2, 1);
                };
            }
            else
            {
                partyID = -1;
                partyOwner = "";
                partyMembers = [];
            };
            updatePartyFrame();
        }

        public function updatePartyFrame(_arg_1:Object=null):*
        {
            var _local_2:MovieClip;
            var _local_3:int;
            var _local_4:int;
            var _local_5:MovieClip;
            var _local_6:int;
            var _local_7:Object;
            var _local_8:Array;
            var _local_9:Boolean;
            var _local_10:Boolean;
            var _local_11:String;
            var _local_12:*;
            var _local_13:*;
            _local_2 = null;
            _local_3 = 0;
            _local_4 = 0;
            _local_5 = null;
            _local_6 = 0;
            _local_7 = null;
            _local_8 = [];
            _local_9 = true;
            _local_10 = false;
            if ((((!(_arg_1 == null)) && (!(_arg_1.range == null))) && (_arg_1.range == false)))
            {
                _local_9 = false;
            };
            if (_arg_1 != null)
            {
                _local_8 = [_arg_1.unm];
            }
            else
            {
                _local_10 = true;
                _local_8 = partyMembers;
            };
            if (_local_8.length > 0)
            {
                _local_11 = "";
                if (_arg_1 == null)
                {
                    _local_12 = [];
                    _local_6 = 0;
                    _local_6 = 0;
                    while (_local_6 < rootClass.ui.mcPartyFrame.numChildren)
                    {
                        _local_12.push(MovieClip(rootClass.ui.mcPartyFrame.getChildAt(_local_6)));
                        _local_6++;
                    };
                    _local_6 = 0;
                    _local_6 = 0;
                    while (_local_6 < _local_12.length)
                    {
                        _local_2 = _local_12[_local_6];
                        _local_13 = _local_2.strName.text;
                        if (partyMembers.indexOf(_local_13) == -1)
                        {
                            _local_2.removeEventListener(MouseEvent.CLICK, onPartyPanelClick);
                            rootClass.ui.mcPartyFrame.removeChild(_local_2);
                        };
                        _local_6++;
                    };
                };
                _local_6 = 0;
                while (_local_6 < _local_8.length)
                {
                    _local_11 = _local_8[_local_6];
                    _local_2 = getPartyPanelByName(_local_11);
                    _local_7 = uoTree[_local_11.toLowerCase()];
                    if (_local_7 == null)
                    {
                        _local_2.HP.visible = false;
                        _local_2.MP.visible = false;
                        _local_2.txtRange.visible = true;
                    }
                    else
                    {
                        if (_local_9)
                        {
                            _local_3 = _local_7.intHP;
                            _local_4 = _local_7.intHPMax;
                            _local_5 = _local_2.HP;
                            if (_local_3 >= 0)
                            {
                                _local_5.strIntHP.text = (_local_5.strIntHPs.text = String(_local_7.intHP));
                            }
                            else
                            {
                                _local_5.strIntHP.text = (_local_5.strIntHPs.text = "X");
                            };
                            if (_local_3 < 0)
                            {
                                _local_3 = 0;
                            };
                            _local_5.intHPbar.x = -(_local_5.intHPbar.width * (1 - (_local_3 / _local_4)));
                            _local_3 = _local_7.intMP;
                            _local_4 = _local_7.intMPMax;
                            _local_5 = _local_2.MP;
                            if (_local_3 >= 0)
                            {
                                _local_5.strIntMP.text = (_local_5.strIntMPs.text = String(_local_7.intMP));
                            }
                            else
                            {
                                _local_5.strIntMP.text = (_local_5.strIntMPs.text = "X");
                            };
                            if (_local_3 < 0)
                            {
                                _local_3 = 0;
                            };
                            _local_5.intMPbar.x = -(_local_5.intMPbar.width * (1 - (_local_3 / _local_4)));
                            _local_2.HP.visible = true;
                            _local_2.MP.visible = true;
                            _local_2.txtRange.visible = false;
                        }
                        else
                        {
                            _local_2.HP.visible = false;
                            _local_2.MP.visible = false;
                            _local_2.txtRange.visible = true;
                        };
                    };
                    if (_local_10)
                    {
                        _local_2.y = int(((_local_2.height + 2) * _local_6));
                    };
                    _local_2.partyLead.visible = (_local_11.toLowerCase() == partyOwner.toLowerCase());
                    _local_6++;
                };
            }
            else
            {
                _local_6 = 0;
                while (((rootClass.ui.mcPartyFrame.numChildren > 0) && (_local_6 < 10)))
                {
                    _local_2 = MovieClip(rootClass.ui.mcPartyFrame.getChildAt(0));
                    _local_2.removeEventListener(MouseEvent.CLICK, onPartyPanelClick);
                    rootClass.ui.mcPartyFrame.removeChildAt(0);
                    _local_6++;
                };
            };
            rootClass.ui.mcPortrait.partyLead.visible = (partyOwner.toLowerCase() == rootClass.sfc.myUserName);
        }

        public function createPartyPanel(_arg_1:Object):MovieClip
        {
            var _local_3:*;
            var _local_2:* = (rootClass.ui.mcPartyFrame.numChildren + 1);
            _local_3 = MovieClip(rootClass.ui.mcPartyFrame.addChild(new PartyPanel()));
            _local_3.strName.text = _arg_1.unm;
            _local_3.HP.visible = false;
            _local_3.MP.visible = false;
            _local_3.txtRange.visible = false;
            _local_3.addEventListener(MouseEvent.CLICK, onPartyPanelClick, false, 0, true);
            _local_3.buttonMode = true;
            return (_local_3);
        }

        public function getPartyPanelByName(_arg_1:String):MovieClip
        {
            var _local_2:*;
            var _local_3:MovieClip;
            var _local_4:int;
            _local_2 = rootClass.ui.mcPartyFrame.numChildren;
            _local_3 = null;
            _local_4 = 0;
            while (_local_4 < _local_2)
            {
                _local_3 = MovieClip(rootClass.ui.mcPartyFrame.getChildAt(_local_4));
                if (_local_3.strName.text == _arg_1)
                {
                    return (_local_3);
                };
                _local_4++;
            };
            return (createPartyPanel({"unm":_arg_1}));
        }

        public function onPartyPanelClick(_arg_1:MouseEvent):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:Avatar;
            _local_2 = MovieClip(_arg_1.currentTarget);
            _local_3 = {};
            _local_3.strUsername = _local_2.strName.text;
            if (_arg_1.shiftKey)
            {
                _local_4 = getAvatarByUserName(_local_3.strUsername.toLowerCase());
                if (((((!(_local_4 == null)) && (!(_local_4.pMC == null))) && (!(_local_4.dataLeaf == null))) && (_local_4.dataLeaf.strFrame == myAvatar.dataLeaf.strFrame)))
                {
                    setTarget(_local_4);
                };
            }
            else
            {
                rootClass.ui.cMenu.fOpenWith("party", _local_3);
            };
        }

        public function partyInvite(_arg_1:String):void
        {
            rootClass.sfc.sendXtMessage("zm", "gp", ["pi", _arg_1], "str", 1);
        }

        public function partyKick(_arg_1:String):void
        {
            rootClass.sfc.sendXtMessage("zm", "gp", ["pk", _arg_1], "str", 1);
        }

        public function partyLeave():void
        {
            rootClass.sfc.sendXtMessage("zm", "gp", ["pl"], "str", 1);
        }

        public function partySummon(_arg_1:String):void
        {
            rootClass.sfc.sendXtMessage("zm", "gp", ["ps", _arg_1], "str", 1);
        }

        public function acceptPartySummon(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                rootClass.sfc.sendXtMessage("zm", "gp", ["psa"], "str", 1);
                if (_arg_1.strF == null)
                {
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["goto", _arg_1.unm], "str", 1);
                }
                else
                {
                    moveToCell(_arg_1.strF, _arg_1.strP);
                };
            }
            else
            {
                rootClass.sfc.sendXtMessage("zm", "gp", ["psd", _arg_1.unm], "str", 1);
            };
        }

        public function partyUpdate(_arg_1:String, _arg_2:String):void
        {
        }

        public function partyPromote(_arg_1:String):void
        {
            rootClass.sfc.sendXtMessage("zm", "gp", ["pp", _arg_1], "str", 1);
        }

        public function _SafeStr_1(_arg_1:*):*
        {
            var _local_2:*;
            var _local_3:*;
            _arg_1 = _arg_1.toLowerCase();
            _local_2 = uoTree[rootClass.sfc.myUserName];
            _local_3 = uoTree[String(_arg_1).toLowerCase()];
            if (((_local_2.intState == 1) && ((_local_2.pvpTeam == null) || (_local_2.pvpTeam == -1))))
            {
                if (((!(_local_3 == null)) && (!(_local_2.uoName == _local_3.uoName))))
                {
                    if ((("nogoto" in map) && (map.nogoto)))
                    {
                        rootClass.chatF.pushMsg("warning", "/goto can't target players within this map.", "SERVER", "", 0);
                        return;
                    };
                    if (_local_2.strFrame != _local_3.strFrame)
                    {
                        moveToCell(_local_3.strFrame, _local_3.strPad);
                    };
                }
                else
                {
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["goto", _arg_1], "str", 1);
                };
            };
        }

        public function pull(_arg_1:*):*
        {
            _arg_1 = _arg_1.toLowerCase();
            rootClass.sfc.sendXtMessage("zm", "cmd", ["pull", _arg_1], "str", 1);
        }

        public function requestFriend(_arg_1:String):void
        {
            rootClass.sfc.sendXtMessage("zm", "requestFriend", [_arg_1], "str", 1);
        }

        public function addFriend(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                rootClass.sfc.sendXtMessage("zm", "addFriend", [_arg_1.unm], "str", 1);
            }
            else
            {
                rootClass.sfc.sendXtMessage("zm", "declineFriend", [_arg_1.unm], "str", 1);
            };
        }

        public function deleteFriend(_arg_1:int, _arg_2:*):void
        {
            rootClass.sfc.sendXtMessage("zm", "deleteFriend", [_arg_1, _arg_2], "str", 1);
        }

        public function guildInvite(_arg_1:String):void
        {
            rootClass.sfc.sendXtMessage("zm", "guild", ["gi", _arg_1], "str", 1);
        }

        public function guildRemove(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                rootClass.sfc.sendXtMessage("zm", "guild", ["gr", _arg_1.userName], "str", 1);
            };
        }

        public function guildPromote(_arg_1:String):void
        {
            rootClass.sfc.sendXtMessage("zm", "guild", ["gp", _arg_1], "str", 1);
        }

        public function guildDemote(_arg_1:String):void
        {
            rootClass.sfc.sendXtMessage("zm", "guild", ["gd", _arg_1], "str", 1);
        }

        public function doGuildAccept(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                rootClass.sfc.sendXtMessage("zm", "guild", ["ga", _arg_1.guildID, _arg_1.owner], "str", 1);
            }
            else
            {
                rootClass.sfc.sendXtMessage("zm", "guild", ["gdi", _arg_1.guildID, _arg_1.owner], "str", 1);
            };
        }

        public function setGuildMOTD(_arg_1:String):void
        {
            rootClass.sfc.sendXtMessage("zm", "guild", ["motd", _arg_1], "str", 1);
        }

        public function createGuild(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                rootClass.sfc.sendXtMessage("zm", "guild", ["gc", _arg_1.guildName], "str", 1);
            };
        }

        public function addMemSlots(_arg_1:int):void
        {
            rootClass.sfc.sendXtMessage("zm", "guild", ["slots", _arg_1], "str", 1);
        }

        public function renameGuild(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                rootClass.sfc.sendXtMessage("zm", "guild", ["rename", _arg_1.guildName], "str", 1);
            };
        }

        public function requestPVPQueue(_arg_1:String, _arg_2:int=-1):void
        {
            rootClass.sfc.sendXtMessage("zm", "PVPQr", [_arg_1, _arg_2], "str", rootClass.world.curRoom);
        }

        public function handlePVPQueue(_arg_1:Object):void
        {
            var _local_2:MovieClip;
            if (_arg_1.bitSuccess == 1)
            {
                PVPQueue.warzone = _arg_1.warzone;
                PVPQueue.ts = new Date().getTime();
                PVPQueue.avgWait = _arg_1.avgWait;
                rootClass.showMCPVPQueue();
            }
            else
            {
                PVPQueue.warzone = "";
                PVPQueue.ts = -1;
                PVPQueue.avgWait = -1;
                rootClass.hideMCPVPQueue();
            };
            _local_2 = rootClass.ui.mcPopup;
            if (((_local_2.currentLabel == "PVPPanel") && (!(_local_2.mcPVPPanel == null))))
            {
                _local_2.mcPVPPanel.updateBody();
            };
            rootClass.closeModalByStrBody("A new Warzone battle has started!");
        }

        public function updatePVPAvgWait(_arg_1:int):void
        {
            PVPQueue.avgWait = _arg_1;
        }

        public function duelExpire():*
        {
            rootClass.closeModalByStrBody("has challenged you to a duel.");
        }

        public function receivePVPInvite(_arg_1:Object):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            _local_2 = new ModalMC();
            _local_3 = {};
            _local_4 = getWarzoneByWarzoneName(_arg_1.warzone);
            _local_3.strBody = (("A new Warzone battle has started!  Will you join " + _local_4.nam) + "?");
            _local_3.greedy = true;
            _local_3.params = {};
            _local_3.callback = replyToPVPInvite;
            rootClass.ui.ModalStack.addChild(_local_2);
            rootClass.ui.mcPopup.onClose();
            rootClass.hideMCPVPQueue();
            _local_2.init(_local_3);
        }

        public function replyToPVPInvite(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                sendPVPInviteAccept();
            }
            else
            {
                sendPVPInviteDecline();
            };
        }

        public function sendPVPInviteAccept():void
        {
            rootClass.sfc.sendXtMessage("zm", "PVPIr", ["1"], "str", rootClass.world.curRoom);
        }

        public function sendPVPInviteDecline():void
        {
            rootClass.sfc.sendXtMessage("zm", "PVPIr", ["0"], "str", rootClass.world.curRoom);
        }

        public function sendDuelInvite(_arg_1:String):void
        {
            rootClass.sfc.sendXtMessage("zm", "duel", ["di", _arg_1], "str", 1);
        }

        public function doDuelAccept(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                rootClass.sfc.sendXtMessage("zm", "duel", ["da", _arg_1.unm], "str", 1);
            }
            else
            {
                rootClass.sfc.sendXtMessage("zm", "duel", ["dd", _arg_1.unm], "str", 1);
            };
        }

        public function getWarzoneByName(_arg_1:String):*
        {
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < PVPMaps.length)
            {
                if (PVPMaps[_local_2].nam == _arg_1)
                {
                    return (PVPMaps[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function getWarzoneByWarzoneName(_arg_1:String):*
        {
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < PVPMaps.length)
            {
                if (PVPMaps[_local_2].warzone == _arg_1)
                {
                    return (PVPMaps[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function setPVPFactionData(_arg_1:Array):void
        {
            if (_arg_1 != null)
            {
                PVPFactions = _arg_1;
            }
            else
            {
                PVPFactions = [];
            };
        }

        public function attachMovieFront(_arg_1:*):MovieClip
        {
            var _local_2:MovieClip;
            var _local_3:Class;
            var _local_4:*;
            var _local_5:*;
            _local_3 = (ldr_map.contentLoaderInfo.applicationDomain.getDefinition(_arg_1) as Class);
            _local_4 = true;
            if (FG.numChildren)
            {
                _local_2 = MovieClip(FG.getChildAt(0));
                _local_5 = (_local_2.constructor as Class);
                if (_local_5 == _local_3)
                {
                    _local_4 = false;
                };
            };
            if (_local_4)
            {
                removeMovieFront();
                _local_2 = MovieClip(FG.addChild(new (_local_3)()));
                FG.mouseChildren = true;
            };
            return (_local_2);
        }

        public function attachMovieFrontMenu(_arg_1:*):MovieClip
        {
            var _local_2:MovieClip;
            var _local_3:Class;
            var _local_4:*;
            var _local_5:*;
            _local_3 = (getClass(_arg_1) as Class);
            _local_4 = true;
            if (FG.numChildren)
            {
                _local_2 = MovieClip(FG.getChildAt(0));
                _local_5 = (_local_2.constructor as Class);
                if (_local_5 == _local_3)
                {
                    _local_4 = false;
                };
            };
            if (_local_4)
            {
                removeMovieFront();
                _local_2 = MovieClip(FG.addChild(new (_local_3)()));
                FG.mouseChildren = true;
            };
            return (_local_2);
        }

        public function removeMovieFront():*
        {
            var _local_1:int;
            _local_1 = 0;
            while (((FG.numChildren > 0) && (_local_1 < 100)))
            {
                _local_1++;
                FG.removeChildAt(0);
            };
            rootClass.ldrMC.closeHistory();
            rootClass.stage.focus = null;
        }

        public function getMovieFront():*
        {
            if (((FG.numChildren > 0) && (!(FG.getChildAt(0) == null))))
            {
                return (FG.getChildAt(0));
            };
            return (null);
        }

        public function isMovieFront(_arg_1:String):Boolean
        {
            var _local_2:MovieClip;
            var _local_3:Class;
            var _local_4:*;
            var _local_5:*;
            _local_3 = (ldr_map.contentLoaderInfo.applicationDomain.getDefinition(_arg_1) as Class);
            _local_4 = false;
            if (FG.numChildren)
            {
                _local_2 = MovieClip(FG.getChildAt(0));
                _local_5 = (_local_2.constructor as Class);
                if (_local_5 == _local_3)
                {
                    _local_4 = true;
                };
            };
            return (_local_4);
        }

        public function loadMovieFront(_arg_1:String, _arg_2:String="Game Files"):void
        {
            removeMovieFront();
            rootClass.ldrMC.loadFile(FG, _arg_1, _arg_2);
        }

        public function showPreL():*
        {
            if (((preLMC == null) || (!(MovieClip(this).contains(preLMC)))))
            {
                preLMC = new PreL();
                addChild(preLMC);
                preLMC.x = ((960 / 2) - (preLMC.width / 2));
                preLMC.y = ((550 / 2) - (preLMC.height / 2));
            };
        }

        public function toggleFPS():void
        {
            rootClass.ui.mcFPS.visible = (!(rootClass.ui.mcFPS.visible));
        }

        private function calculateFPS():void
        {
            var _local_1:Number;
            var _local_2:int;
            var _local_3:int;
            var _local_4:*;
            var _local_5:Number;
            var _local_6:int;
            var _local_7:Number;
            var _local_8:int;
            try
            {
                if (fpsTS != 0)
                {
                    _local_1 = new Date().getTime();
                    _local_2 = (_local_1 - fpsTS);
                    _local_3 = 0;
                    if (ticklist.length == TICK_MAX)
                    {
                        _local_3 = ticklist.shift();
                    };
                    ticklist.push(_local_2);
                    ticksum = ((ticksum + _local_2) - _local_3);
                    _local_4 = (1000 / (ticksum / ticklist.length));
                    if (rootClass.ui.mcFPS.visible)
                    {
                        rootClass.ui.mcFPS.txtFPS.text = _local_4.toPrecision(4);
                    };
                    if ((((rootClass.userPreference.data.quality == "AUTO") && (ticklist.length == TICK_MAX)) && ((++fpsQualityCounter % 24) == 0)))
                    {
                        fpsArrayQuality.push(_local_4);
                        if (fpsArrayQuality.length == 5)
                        {
                            _local_5 = 0;
                            _local_6 = 0;
                            while (_local_6 < fpsArrayQuality.length)
                            {
                                _local_5 = (_local_5 + fpsArrayQuality[_local_6]);
                                _local_6++;
                            };
                            _local_7 = (_local_5 / fpsArrayQuality.length);
                            _local_8 = arrQuality.indexOf(rootClass.stage.quality);
                            if (((_local_7 < 12) && (_local_8 > 0)))
                            {
                                rootClass.stage.quality = arrQuality[(_local_8 - 1)];
                            };
                            if (((_local_7 >= 12) && (_local_8 < 2)))
                            {
                                rootClass.stage.quality = arrQuality[(_local_8 + 1)];
                            };
                            fpsArrayQuality = new Array();
                        };
                    };
                };
                fpsTS = new Date().getTime();
            }
            catch(e)
            {
            };
        }

        public function onZmanagerEnterFrame(_arg_1:Event):*
        {
            var _local_2:MovieClip;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Number;
            calculateFPS();
            zSortArr = [];
            _local_3 = 0;
            while (_local_3 < CHARS.numChildren)
            {
                _local_2 = MovieClip(CHARS.getChildAt(_local_3));
                zSortArr.push({
                    "mc":_local_2,
                    "oy":_local_2.y
                });
                _local_3++;
            };
            zSortArr.sortOn("oy", Array.NUMERIC);
            _local_4 = 0;
            while (_local_4 < zSortArr.length)
            {
                _local_2 = zSortArr[_local_4].mc;
                _local_5 = CHARS.getChildIndex(_local_2);
                if (_local_5 != _local_4)
                {
                    CHARS.swapChildrenAt(_local_5, _local_4);
                };
                _local_4++;
            };
            if (EFAO.xpc++ > EFAO.xpn)
            {
                EFAO.xpc = 0;
                try
                {
                    if (rootClass.stage == null)
                    {
                        killTimers();
                        killListeners();
                        return;
                    };
                    _local_6 = new Date().getTime();
                    if (((!(rootClass.stage == null)) && (!(myAvatar.objData.iBoostXP == null))))
                    {
                        if ((rootClass.ui.mcPortrait.iconBoostXP.boostTS + (rootClass.ui.mcPortrait.iconBoostXP.iBoostXP * 1000)) < (_local_6 + 1000))
                        {
                            rootClass.sfc.sendXtMessage("zm", "serverUseItem", ["-", "xpboost"], "str", -1);
                        };
                    };
                    if (((!(rootClass.stage == null)) && (!(myAvatar.objData.iBoostG == null))))
                    {
                        if ((rootClass.ui.mcPortrait.iconBoostG.boostTS + (rootClass.ui.mcPortrait.iconBoostG.iBoostG * 1000)) < (_local_6 + 1000))
                        {
                            rootClass.sfc.sendXtMessage("zm", "serverUseItem", ["-", "gboost"], "str", -1);
                        };
                    };
                    if (((!(rootClass.stage == null)) && (!(myAvatar.objData.iBoostRep == null))))
                    {
                        if ((rootClass.ui.mcPortrait.iconBoostRep.boostTS + (rootClass.ui.mcPortrait.iconBoostRep.iBoostRep * 1000)) < (_local_6 + 1000))
                        {
                            rootClass.sfc.sendXtMessage("zm", "serverUseItem", ["-", "repboost"], "str", -1);
                        };
                    };
                    if (((!(rootClass.stage == null)) && (!(myAvatar.objData.iBoostCP == null))))
                    {
                        if ((rootClass.ui.mcPortrait.iconBoostCP.boostTS + (rootClass.ui.mcPortrait.iconBoostCP.iBoostCP * 1000)) < (_local_6 + 1000))
                        {
                            rootClass.sfc.sendXtMessage("zm", "serverUseItem", ["-", "cpboost"], "str", -1);
                        };
                    };
                }
                catch(e:Error)
                {
                };
            };
        }

        public function iaTrigger(_arg_1:MovieClip):*
        {
            var _local_2:*;
            var _local_3:int;
            if (coolDown("doIA"))
            {
                _local_2 = [];
                _local_2.push(_arg_1.iaType);
                _local_2.push(_arg_1.name);
                if (("iaPathMC" in _arg_1))
                {
                    _local_2.push(myAvatar.dataLeaf.strFrame);
                }
                else
                {
                    _local_2.push(_arg_1.iaFrame);
                };
                if (("iaStr" in _arg_1))
                {
                    _local_2.push(_arg_1.iaStr);
                };
                if (("iaPathMC" in _arg_1))
                {
                    _local_2.push(_arg_1.iaPathMC);
                };
                trace(((("xtArr: " + _local_2) + " str: ") + _arg_1.isStr));
                _local_3 = 0;
                while (_local_3 < _local_2.length)
                {
                    trace(((_local_3 + " isNull: ") + (_local_2[_local_3] == null)));
                    _local_3++;
                };
                rootClass.sfc.sendXtMessage("zm", "ia", _local_2, "str", 1);
            };
        }

        public function actCastRequest(_arg_1:Object):void
        {
            var _local_2:Array;
            var _local_3:Array;
            var _local_4:Object;
            _local_2 = ["castr"];
            _local_3 = [];
            switch (_arg_1.typ)
            {
                case "sia":
                    if (coolDown("doIA"))
                    {
                        _local_4 = {};
                        _local_4.typ = "sia";
                        _local_4.callback = actCastTrigger;
                        _local_4.args = _arg_1;
                        _local_4.dur = Number(_arg_1.sAccessCD);
                        _local_4.txt = _arg_1.sMsg;
                        rootClass.ui.mcCastBar.fOpenWith(_local_4);
                        _local_3.push(1);
                        _local_3.push(_arg_1.ID);
                    };
                    break;
            };
            if (_local_3.length > 0)
            {
                rootClass.sfc.sendXtMessage("zm", _local_2, _local_3, "str", 1);
            };
        }

        public function actCastTrigger(_arg_1:Object):void
        {
            switch (_arg_1.typ)
            {
                case "sia":
                    siaTrigger(_arg_1);
                    return;
            };
        }

        public function siaTrigger(_arg_1:Object):void
        {
            rootClass.sfc.sendXtMessage("zm", ["castt"], [], "str", 1);
        }

        public function uoTreeLeaf(_arg_1:*):Object
        {
            if (uoTree[_arg_1.toLowerCase()] == null)
            {
                uoTree[_arg_1.toLowerCase()] = {};
            };
            return (uoTree[_arg_1.toLowerCase()]);
        }

        public function myLeaf():Object
        {
            return (uoTreeLeaf(rootClass.sfc.myUserName));
        }

        public function uoTreeLeafSet(_arg_1:*, _arg_2:Object):*
        {
            var _local_3:*;
            var _local_5:*;
            var _local_6:*;
            if (uoTree[_arg_1.toLowerCase()] == null)
            {
                uoTree[_arg_1.toLowerCase()] = {};
            };
            _local_3 = uoTree[_arg_1.toLowerCase()];
            var _local_4:* = [];
            for (_local_5 in _arg_2)
            {
                _local_3[_local_5] = _arg_2[_local_5];
                _local_6 = getAvatarByUserName(_arg_1);
                if (((!(_local_6 == null)) && (!(_local_6.objData == null))))
                {
                    _local_6.objData[_local_5] = _arg_2[_local_5];
                };
            };
        }

        public function manageAreaUser(_arg_1:String, _arg_2:String):void
        {
            var _local_3:int;
            _arg_1 = _arg_1.toLowerCase();
            if (_arg_2 == "+")
            {
                if (areaUsers.indexOf(_arg_1) == -1)
                {
                    areaUsers.push(_arg_1);
                };
            }
            else
            {
                _local_3 = areaUsers.indexOf(_arg_1);
                if (_local_3 > -1)
                {
                    areaUsers.splice(_local_3, 1);
                };
            };
            rootClass.updateAreaName();
        }

        public function updateAreaUserCount():void
        {
        }

        public function setAllCloakVisibility():void
        {
            var _local_1:Array;
            var _local_2:Avatar;
            _local_1 = getUsersByCell(myAvatar.dataLeaf.strFrame);
            for each (_local_2 in _local_1)
            {
                _local_2.pMC.setCloakVisibility(_local_2.dataLeaf.showCloak);
            };
        }

        public function coolDown(_arg_1:String):Boolean
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            _local_2 = lock[_arg_1];
            _local_3 = new Date();
            _local_4 = _local_3.getTime();
            _local_5 = (_local_4 - _local_2.ts);
            if (_local_5 < _local_2.cd)
            {
                //rootClass.chatF.pushMsg("warning", "Action taken too quickly, try again in a moment.", "SERVER", "", 0);
                return (false);
            };
            _local_2.ts = _local_4;
            return (true);
        }

        public function copyAvatarMC(_arg_1:MovieClip):void
        {
            var _local_2:AvatarMCCopier;
            _local_2 = new AvatarMCCopier(this);
            _local_2.copyTo(_arg_1);
        }

        public function doLoadPet(_arg_1:Avatar):Boolean
        {
            if (!rootClass.uoPref.bPet)
            {
                return (false);
            };
            if (((!(_arg_1 == myAvatar)) && (hideOtherPets)))
            {
                return (false);
            };
            return (true);
        }

        public function get Scale():Number
        {
            return (SCALE);
        }

        public function get bankinfo():BankController
        {
            return (bankController);
        }

		public function sendLoadOfferRequest(_arg_1:Array=null):void
        {
            var _local_2:String;
            if (_arg_1[0] == "*")
            {
                (_arg_1 = ["All"]);
            };
            for each (var _local_5:* in _arg_1)
            {
                _local_2 = _local_5;
                _local_5;
                (this.tradeinfo.hasRequested[_local_2] = true);
            };
            this.rootClass.sfc.sendXtMessage("zm", "loadOffer", _arg_1, "str", this.curRoom);
        }

        public function addItemsToTradeA(_arg_1:Array):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Boolean;
            _local_4 = true;
            for each (var _local_7:* in _arg_1)
            {
                _local_2 = _local_7;
                _local_7;
                (_local_4 = true);
                for each (var _local_9:* in this.tradeinfo.itemsA)
                {
                    _local_3 = _local_9;
                    _local_9;
                    if (_local_3.ItemID == _local_2.ItemID)
                    {
                        (_local_3.iQty = _local_2.iQty);
                        (_local_4 = false);
                        break;
                    };
                };
                if (_local_4)
                {
                    this.tradeinfo.itemsA.push(_local_2);
                };
            };
        }

        public function addItemsToTradeB(_arg_1:Array):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Boolean;
            _local_4 = true;
            for each (var _local_7:* in _arg_1)
            {
                _local_2 = _local_7;
                _local_7;
                (_local_4 = true);
                for each (var _local_9:* in this.tradeinfo.itemsB)
                {
                    _local_3 = _local_9;
                    _local_9;
                    if (_local_3.ItemID == _local_2.ItemID)
                    {
                        (_local_4 = false);
                        break;
                    };
                };
                if (_local_4)
                {
                    this.tradeinfo.itemsB.push(_local_2);
                };
            };
        }

        public function replyToTradeInvite(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                this.sendTradeInviteAccept();
            }
            else
            {
                this.sendTradeInviteDecline();
            };
        }

        public function sendTradeInviteAccept():void
        {
            this.rootClass.sfc.sendXtMessage("zm", "ti", ["1"], "str", this.rootClass.world.curRoom);
        }

        public function sendTradeInviteDecline():void
        {
            this.rootClass.sfc.sendXtMessage("zm", "ti", ["0"], "str", this.rootClass.world.curRoom);
        }

        public function sendTradeInvite(_arg_1:String):void
        {
            this.rootClass.sfc.sendXtMessage("zm", "ti", [_arg_1], "str", 1);
        }

        public function doTradeAccept(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                this.rootClass.sfc.sendXtMessage("zm", "tia", [_arg_1.unm], "str", 1);
            }
            else
            {
                this.rootClass.sfc.sendXtMessage("zm", "tid", [_arg_1.unm], "str", 1);
            };
        }

        public function sendTradeFromInvRequest(_arg_1:Object):*
        {
            var _local_2:ModalMC;
            var _local_3:Object;
            if (_arg_1.bEquip == 1)
            {
                (_local_2 = new ModalMC());
                (_local_3 = {});
                (_local_3.strBody = "You must unequip the item before offering it!");
                (_local_3.params = {});
                (_local_3.glow = "red,medium");
                (_local_3.btns = "mono");
                this.rootClass.ui.ModalStack.addChild(_local_2);
                _local_2.init(_local_3);
            }
            else
            {
                this.rootClass.sfc.sendXtMessage("zm", "tradeFromInv", [_arg_1.ItemID, _arg_1.CharItemID, _arg_1.TradeID, _arg_1.Quantity], "str", this.curRoom);
            };
        }

        public function sendTradeToInvRequest(_arg_1:Object):*
        {
            var _local_2:*;
            var _local_3:*;
            this.rootClass.sfc.sendXtMessage("zm", "tradeToInv", [_arg_1.ItemID, _arg_1.CharItemID, _arg_1.TradeID], "str", this.curRoom);
        }

        public function sendTradeSwapInvRequest(_arg_1:Object, _arg_2:Object):*
        {
            var _local_3:ModalMC;
            var _local_4:Object;
            if (_arg_2.bEquip == 1)
            {
                (_local_3 = new ModalMC());
                (_local_4 = {});
                (_local_4.strBody = "You must unequip the item before offering it!");
                (_local_4.params = {});
                (_local_4.glow = "red,medium");
                (_local_4.btns = "mono");
                this.rootClass.ui.ModalStack.addChild(_local_3);
                _local_3.init(_local_4);
            }
            else
            {
                this.rootClass.sfc.sendXtMessage("zm", "tradeSwapInv", [_arg_2.ItemID, _arg_2.CharItemID, _arg_1.ItemID, _arg_1.CharItemID, _arg_1.TradeID], "str", this.curRoom);
            };
        }

        public function tradeHasRequested(_arg_1:Array):Boolean
        {
            var _local_2:String;
            for each (var _local_5:* in _arg_1)
            {
                _local_2 = _local_5;
                _local_5;
                if (!(_local_2 in this.tradeinfo.hasRequested))
                {
                    return (false);
                };
            };
            return (true);
        }
		
		public function sendGuildWarInvite(_arg_1:String):void
        {
            this.rootClass.sfc.sendXtMessage("zm", "guild", ["gwi", _arg_1], "str", 1);
        }
		
		public function doGuildWarAccept(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["gwa", _arg_1.unm], "str", 1);
            }
            else
            {
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["gwd", _arg_1.unm], "str", 1);
            };
        }
		
		public function GuildWarExpire():*
        {
            this.rootClass.closeModalByStrBody("has challenged you to a guild war.");
        }
		
		public function sendGuildLeaderSummonInvite():void
		{
            this.rootClass.sfc.sendXtMessage("zm", "guild", ["gs"], "str", 1);
        }
		
        public function doGuildLeaderSummonAccept(modalObj:Object):void
		{
            if (modalObj.accept)
			{
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["gsa", modalObj.unm], "str", 1);
				if (modalObj.strF == null)
				{
                    this.rootClass.sfc.sendXtMessage("zm", "cmd", ["goto", modalObj.unm], "str", 1);
                }
                else 
				{
                    this.moveToCell(modalObj.strF, modalObj.strP);
                };
            }
            else 
			{
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["gsd", modalObj.unm], "str", 1);
            };
        }
		
		public function GuildLeaderSummonExpire()
		{
            this.rootClass.closeModalByStrBody("has summoned you.");
        }
		
		public function doGuildMasterChangeAccept(_arg1:Object):void
		{
            if (_arg1.accept)
			{
                this.rootClass.sfc.sendXtMessage("zm", "guild", ["gcl", _arg1.userName], "str", 1);
				this.rootClass.world.myAvatar.objData.guildRank = 1;
            }
        }
		
		public function showMiniPreview(itemObj:*):*
        {
            var itmPreview:* = rootClass.attachOnModalStack("ItemPreview");
            itmPreview.loadItem(itemObj);
        }
		
		public function getActionbyTreeSlot(slot:String):Object
		{
            var tree:*;
            for each (tree in actions.tree) 
			{
                if (tree.ref == slot)
				{
					return (tree);
                };
            };
            for each (tree in actions.passive) 
			{
                if (tree.ref == slot)
				{
					return (tree);
                };
            };
            return (null);
        }
		
		public function redeemToken(token):void
		{
			if(coolDown("buttonClick"))
			{
				rootClass.sfc.sendXtMessage("zm", "redeemToken", [token], "str", this.curRoom);
			};
        }
		
    }
}