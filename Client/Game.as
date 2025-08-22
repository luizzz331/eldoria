// AQW - PRIME
// Client By AE
// Edited by g14k
// Long Live the Biladerios

// Game

package 
{
	import flash.media.Sound;
    import flash.display.MovieClip;
    import flash.display.DisplayObject;
    import flash.system.ApplicationDomain;
    import it.gotoandplay.smartfoxserver.SmartFoxClient;
	import flash.media.SoundChannel;
    import flash.media.SoundTransform;
    import flash.net.SharedObject;
    import flash.system.LoaderContext;
    import flash.net.URLLoader;
    import it.gotoandplay.smartfoxserver.SFSEvent;
    import fl.motion.Color;
    import flash.utils.getTimer;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import flash.system.Security;
    import flash.net.URLVariables;
    import flash.net.URLRequestMethod;
    import flash.media.SoundMixer;
    import flash.media.SoundTransform;
    import flash.display.Sprite;
    import flash.filters.ColorMatrixFilter;
    import flash.display.Loader;
    import flash.geom.Point;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import flash.utils.ByteArray;
    import flash.filters.GlowFilter;
    import flash.events.IOErrorEvent;
    import com.adobe.serialization.json.JSON;
    import flash.display.DisplayObjectContainer;
    import flash.geom.Rectangle;
    import flash.display.StageDisplayState;
    import flash.events.FocusEvent;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.utils.getQualifiedClassName;
    import flash.text.*;
    import it.gotoandplay.smartfoxserver.*;
    import flash.external.*;

    public class Game extends MovieClip 
    {

        public static var ISWEB:Boolean = true;
        public static var root:DisplayObject;
        public static var serverName:String;
        public static var serverPort:int = 5588;
        public static var serverIP:String = "";
        public static var serverFilePath:String = "";
        public static var serverURL:String = "";
        public static var cLoginZone:String = "zone_master";
        public static var clientToken:String = "N7B5W1W1Y5B1R5VWVZ";
        public static var bPTR:Boolean = false;
        public static var loginInfo:Object = new Object();
        public static var objLogin:Object;
        public static var mcUpgradeWindow:MovieClip;
        public static var mcACWindow:MovieClip;
        public static var strToken:String;
        public static const ASSETS_LOADED:String = "main_assets_loaded";
        public static var ASSETS_READY:Boolean = false;
        public static const FB_APP_NAME:String = "AQW";
        public static const FB_APP_URL:String = "www.aq.com";
        public static const FB_APP_ID:String = "51356733862";
        public static const FB_APP_SEC:String = "This should never be stored in the client";
		
		public var skillAnimFX:Boolean = true;
		public var ctrlTrade:MovieClip;
        public var tradeItem1:MovieClip;
        public var tradeItem2:MovieClip;
        public var tradeItem3:MovieClip;
        public var mcLowHPGlow:MovieClip;
        public var MsgBox:MovieClip;
        public var mcAccount:MovieClip;
        public var mcExtSWF:MovieClip;
        public var ui:MovieClip;
        public var mcLogin:MovieClip;
        public var sToken:String;
        public var user_id:int = 0;
        public var world:World;
        public var bagSpace:String = "interface/bagspace_20201023.swf";
        private var swfObj:String = "AQWGame";
        public var showFB:Boolean = false;
        public var fbL:fbLinkWindow;
        public var titleDomain:ApplicationDomain;
        public var mcO:MovieClip;
        public var elmType:String;
        public var handleSessionEvent:Function;
        public var sfc:SmartFoxClient;
        public var chatF:Chat;
        public var sFilePath:String = "";
        public var userPreference:SharedObject;
        public var objServerInfo:Object;
        public var sfcSocial:Boolean = false;
        public var ldrMC:LoaderMC;
        public var mcConnDetail:ConnDetailMC;
        public var querystring:Object;
        public var ts_login_server:Number;
        public var ts_login_client:Number;
        public var aaaloop:int = 0;
        public var totalPingTime:Number = 0;
        public var pingCount:int = 0;
        public var arrRanks:Array;
        public var iRankMax:int = 10;
        public var arrHP:Array;
        private var aswc:Apop;
        public var intLevelCap:int;
        public var PCstBase:int;
        public var PCstRatio:Number;
        public var PCstGoal:int;
        public var GstBase:int;
        public var GstRatio:Number;
        public var GstGoal:int;
        public var PChpBase1:int;
        public var PChpBase100:int;
        public var PChpGoal1:int;
        public var PChpGoal100:int;
        public var PChpDelta:int;
        public var intHPperEND:int;
        public var intAPtoDPS:int;
        public var intSPtoDPS:int;
        public var bigNumberBase:int;
        public var resistRating:Number;
        public var modRating:Number;
        public var baseDodge:Number;
        public var baseBlock:Number;
        public var baseParry:Number;
        public var baseCrit:Number;
        public var baseHit:Number;
        public var baseHaste:Number;
        public var baseMiss:Number;
        public var baseResist:Number;
        public var baseCritValue:Number;
        public var baseBlockValue:Number;
        public var baseResistValue:Number;
        public var baseEventValue:Number;
        public var PCDPSMod:Number = 0.85;
        public var curveExponent:Number = 0.66;
        public var statsExponent:Number = 1.33;
        public var stats:Array;
        public var orderedStats:Array;
        public var ratiosBySlot:Object;
        public var I0pct:Number = 0.8;
        public var I2pct:Number = 1.25;
        public var classCatMap:Object;
        private var travelMapData:Object;
        private var WorldMapData:worldMap;
        private var skipR2:Boolean = false;
        private var apop_:apopCore;
        public var apopTree:Object;
        public var curID:String;
        public var serialCmdMode:Boolean = false;
        public var serialCmd:Object;
        private var conn:*;
        public var confirmTime:int = 0;
        public var quests:Boolean = false;
        public var sfcA:Array;
        public var bits:Array;
        private var fbc:MovieClip;
        public var mcGameMenu:MovieClip;
        public var firstMenu:Boolean = true;
        public var bPassword:Boolean = true;
        private var weakPass:Array;
        public var extCall:ExternalCalls;
        public var FBConnectCallback:Function;
        public var sBG:String = "generic2.swf";
        public var IsEU:Boolean = false;
        public var TempLoginName:* = "";
        public var TempLoginPass:* = "";
		public var LoginBGM:Sound = null;
        public var BGMChannel:SoundChannel;
        public var BGMTransform:SoundTransform;
		public var selectedCharacter:int = -1;
		
        public var failedServers:* = {};
        private var rn:RandomNumber = new RandomNumber();
        public var assetsDomain:ApplicationDomain = new ApplicationDomain();
        public var assetsContext:LoaderContext = new LoaderContext(false, assetsDomain);
        public const EMAIL_REGEX:RegExp = /^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
        public var mixer:SoundFX = new SoundFX(assetsDomain);
        public var params:Object = {};
        public var uoPref:Object = {};
        public var loginLoader:URLLoader = new URLLoader();

        {
            MovieClip.prototype.removeAllChildren = function ():void
            {
                var _local_1:* = (this.numChildren - 1);
                while (_local_1 >= 0)
                {
                    this.removeChildAt(_local_1);
                    _local_1--;
                };
            };
        }

        public function Game()
        {
            var onMultiConnectionLostHandler:Function;
            var onMultiLogoutHandler:Function;
            var onExtensionResponseHandler:Function;
            var multiO:Object;
            var sfcMulti:SmartFoxClient;
            var sfcO:Object;
            var sfci:int;
            ldrMC = new LoaderMC(MovieClip(this));
            querystring = {};
            arrRanks = [0];
            arrHP = [];
            stats = ["STR", "END", "DEX", "INT", "WIS", "LCK"];
            orderedStats = ["STR", "INT", "DEX", "WIS", "END", "LCK"];
            ratiosBySlot = {
                "he":0.25,
                "ar":0.25,
                "ba":0.2,
                "Weapon":0.33
            };
            classCatMap = {
                "M1":{},
                "M2":{},
                "M3":{},
                "M4":{},
                "C1":{},
                "C2":{},
                "C3":{},
                "S1":{}
            };
            apopTree = new Object();
            serialCmd = {
                "cmd":"",
                "si":0,
                "servers":[],
                "callBack":serialCmdDone,
                "active":false
            };
            sfcA = [{
                "sIP":"74.53.22.41",
                "sLogin":"aqwserial01",
                "sPass":"",
                "sfc":null
            }, {
                "sIP":"74.53.22.42",
                "sLogin":"aqwserial02",
                "sPass":"",
                "sfc":null
            }, {
                "sIP":"74.53.22.43",
                "sLogin":"aqwserial03",
                "sPass":"",
                "sfc":null
            }, {
                "sIP":"74.53.22.44",
                "sLogin":"aqwserial04",
                "sPass":"",
                "sfc":null
            }, {
                "sIP":"74.53.22.45",
                "sLogin":"aqwserial05",
                "sPass":"",
                "sfc":null
            }, {
                "sIP":"74.53.7.196",
                "sLogin":"aqwserial06",
                "sPass":"",
                "sfc":null
            }, {
                "sIP":"74.53.7.197",
                "sLogin":"aqwserial07",
                "sPass":"",
                "sfc":null
            }, {
                "sIP":"74.53.7.198",
                "sLogin":"aqwserial08",
                "sPass":"",
                "sfc":null
            }, {
                "sIP":"74.53.7.199",
                "sLogin":"aqwserial09",
                "sPass":"",
                "sfc":null
            }, {
                "sIP":"74.53.7.200",
                "sLogin":"aqwserial10",
                "sPass":"",
                "sfc":null
            }, {
                "sIP":"74.53.7.201",
                "sLogin":"aqwserial11",
                "sPass":"",
                "sfc":null
            }, {
                "sIP":"74.53.7.202",
                "sLogin":"aqwserial12",
                "sPass":"",
                "sfc":null
            }, {
                "sIP":"74.53.7.203",
                "sLogin":"aqwserial13",
                "sPass":"",
                "sfc":null
            }];
            bits = [1, 2, 4, 8, 16, 32, 64, 128, 0x0100, 0x0200, 0x0400, 0x0800, 0x1000, 0x2000, 0x4000, 0x8000, 0x10000, 0x20000, 0x40000, 0x80000, 0x100000, 0x200000, 0x400000, 0x800000, 0x1000000, 0x2000000, 0x4000000, 0x8000000, 0x10000000, 0x20000000, 0x40000000, 0x80000000];
            weakPass = new Array("0", "1111", "11111", "111111", "11111111", "112233", "1212", "121212", "123123", "1234", "12345", "123456", "1234567", "12345678", "1313", "131313", "2000", "2112", "2222", "232323", "3333", "4128", "4321", "4444", "5150", "5555", "654321", "6666", "666666", "6969", "696969", "7777", "777777", "7777777", "8675309", "987654", "aaaa", "aaaaaa", "abc123", "abgrtyu", "access", "access14", "action", "albert", "alex", "alexis", "amanda", "amateur", "andrea", "andrew", "angel", "angela", "angels", "animal", "anthony", "apollo", "apple", "apples", "arsenal", "arthur", "asdf", "asdfgh", "ashley", "asshole", "august", "austin", "baby", "badboy", "bailey", "banana", "barney", "baseball", "batman", "beach", "bear", "beaver", "beavis", "beer", "bigcock", "bigdaddy", "bigdick", "bigdog", "bigtits", "bill", "billy", "birdie", "bitch", "bitches", "biteme", "black", "blazer", "blonde", "blondes", "blowjob", "blowme", "blue", "bond007", "bonnie", "booboo", "boobs", "booger", "boomer", "booty", "boston", "brandon", "brandy", "braves", "brazil", "brian", "bronco", "broncos", "bubba", "buddy", "bulldog", "buster", "butter", "butthead", "calvin", "camaro", "cameron", "canada", "captain", "carlos", "carter", "casper", "charles", "charlie", "cheese", "chelsea", "chester", "chevy", "chicago", "chicken", "chris", "cocacola", "cock", "coffee", "college", "compaq", "computer", "cookie", "cool", "cooper", "corvette", "cowboy", "cowboys", "cream", "crystal", "cumming", "cumshot", "cunt", "dakota", "dallas", "daniel", "danielle", "dave", "david", "debbie", "dennis", "diablo", "diamond", "dick", "dirty", "doctor", "doggie", "dolphin", "dolphins", "donald", "dragon", "dreams", "driver", "eagle", "eagle1", "eagles", "edward", "einstein", "enjoy", "enter", "eric", "erotic", "extreme", "falcon", "fender", "ferrari", "fire", "firebird", "fish", "fishing", "florida", "flower", "flyers", "football", "ford", "forever", "frank", "fred", "freddy", "freedom", "fuck", "fucked", "fucker", "fucking", "fuckme", "fuckyou", "gandalf", "gateway", "gators", "gemini", "george", "giants", "ginger", "girl", "girls", "golden", "golf", "golfer", "gordon", "great", "green", "gregory", "guitar", "gunner", "hammer", "hannah", "happy", "hardcore", "harley", "heather", "hello", "helpme", "hentai", "hockey", "hooters", "horney", "horny", "hotdog", "house", "hunter", "hunting", "iceman", "iloveyou", "internet", "iwantu", "jack", "jackie", "jackson", "jaguar", "jake", "james", "japan", "jasmine", "jason", "jasper", "jennifer", "jeremy", "jessica", "john", "johnny", "johnson", "jordan", "joseph", "joshua", "juice", "junior", "justin", "kelly", "kevin", "killer", "king", "kitty", "knight", "ladies", "lakers", "lauren", "leather", "legend", "letmein", "little", "london", "love", "lover", "lovers", "lucky", "maddog", "madison", "maggie", "magic", "magnum", "marine", "mark", "marlboro", "martin", "marvin", "master", "matrix", "matt", "matthew", "maverick", "maxwell", "melissa", "member", "mercedes", "merlin", "michael", "michelle", "mickey", "midnight", "mike", "miller", "mine", "mistress", "money", "monica", "monkey", "monster", "morgan", "mother", "mountain", "movie", "muffin", "murphy", "music", "mustang", "naked", "nascar", "nathan", "naughty", "ncc1701", "newyork", "nicholas", "nicole", "nipple", "nipples", "oliver", "orange", "ou812", "packers", "panther", "panties", "paris", "parker", "pass", "password", "patrick", "paul", "peaches", "peanut", "penis", "pepper", "peter", "phantom", "phoenix", "player", "please", "pookie", "porn", "porno", "porsche", "power", "prince", "princess", "private", "purple", "pussies", "pussy", "qazwsx", "qwert", "qwerty", "qwertyui", "rabbit", "rachel", "pokemon", "racing", "raiders", "rainbow", "ranger", "rangers", "rebecca", "redskins", "redsox", "redwings", "richard", "robert", "rock", "rocket", "rosebud", "runner", "rush2112", "russia", "samantha", "sammy", "samson", "sandra", "saturn", "scooby", "scooter", "scorpio", "scorpion", "scott", "secret", "sexsex", "sexy", "shadow", "shannon", "shaved", "shit", "sierra", "silver", "skippy", "slayer", "slut", "smith", "smokey", "snoopy", "soccer", "sophie", "spanky", "sparky", "spider", "squirt", "srinivas", "star", "stars", "startrek", "starwars", "steelers", "steve", "steven", "sticky", "stupid", "success", "suckit", "summer", "sunshine", "super", "superman", "surfer", "swimming", "sydney", "taylor", "teens", "tennis", "teresa", "test", "tester", "testing", "theman", "thomas", "thunder", "thx1138", "tiffany", "tiger", "tigers", "tigger", "time", "tits", "tomcat", "topgun", "toyota", "travis", "trouble", "trustno1", "tucker", "turtle", "united", "vagina", "victor", "victoria", "video", "viking", "viper", "voodoo", "voyager", "walter", "warrior", "welcome", "whatever", "white", "william", "willie", "wilson", "winner", "winston", "winter", "wizard", "wolf", "women", "xavier", "xxxx", "xxxxx", "xxxxxx", "xxxxxxxx", "yamaha", "yankee", "yankees", "yellow", "young", "zxcvbn", "zxcvbnm", "zzzzzz", "artix", "aqworlds", "adventure", "mechquest", "dragonfable", "123456789", "1234567890", "987654321", "0123456789", "12345678910", "qwertyuiop", "123123123", "asdfghjkl", "123321", "0987654321", "147258369", "789456123", "159753", "741852963", "minecraft", "147852369", "0123456", "qwerty123", "123654789", "naruto", "9876543210", "12341234", "123qwe", "159357", "123654", "gabriel", "123456789a");
            super();
			// envia request para logar no emulador
            var onConnectionHandler:Function = function (_arg_1:SFSEvent)
            {
                if (_arg_1.params.success)
                {
                    sfc.login(cLoginZone, (clientToken + "~" + loginInfo.iCharacter  +"~" + loginInfo.strNickname), loginInfo.strToken);
                    if (world != null)
                    {
                        world.uiLock = true;
                    };
                }
                else
                {
                    trace("failed");
                    if (serialCmdMode)
                    {
                        serialCmdNext();
                    };
                };
            };
            var onConnectionLostHandler:Function = function (_arg_1:SFSEvent)
            {
                if (!serialCmdMode)
                {
                    if (world != null)
                    {
                        world.exitCombat();
                        world.setTarget(null);
                        world.killTimers();
                        try
                        {
                            world.removeChild(world.map);
                        }
                        catch(e)
                        {
                        };
                    };
                    if (sfc.isConnected)
                    {
                        sfc.disconnect();
                    };
                    gotoAndPlay("Login");
                    if (_arg_1.params != null)
                    {
                        if (_arg_1.params.disconnect == true)
                        {
                            mcConnDetail.showDisconnect("Communication with server has been lost. Please check your internet connection and try again.");
                        };
                    };
                };
            };
            var onLoginHandler:Function = function (_arg_1:SFSEvent)
            {
            };
            var onLogoutHandler:Function = function (_arg_1:SFSEvent)
            {
                if (!serialCmdMode)
                {
                    if (world != null)
                    {
                        world.exitCombat();
                        world.setTarget(null);
                        world.killTimers();
                        world.clearLoaders(true);
                    };
                    if (sfc.isConnected)
                    {
                        sfc.disconnect();
                    };
                    gotoAndPlay("Login");
                }
                else
                {
                    if (sfc.isConnected)
                    {
                        sfc.disconnect();
                    };
                    serialCmdNext();
                };
            };
            var onMultiConnectionHandler:Function = function (_arg_1:SFSEvent)
            {
                if (_arg_1.params.success)
                {
                    this.sfc.login(cLoginZone, ((clientToken + "~") + this.sLogin), loginInfo.strToken);
                }
                else
                {
                    trace("failed");
                };
            };
            onMultiConnectionLostHandler = function (_arg_1:SFSEvent)
            {
                trace("");
                trace("** A MULTI CONNECTION WAS LOST");
                trace("");
            };
            onMultiLogoutHandler = function (_arg_1:SFSEvent)
            {
                trace("");
                trace("** A MULTI CONNECTION WAS LOGGED OUT");
                trace("");
            };
            var onMultiLoginHandler:Function = function (_arg_1:SFSEvent)
            {
            };
            var onJoinRoomHandler:Function = function (_arg_1:SFSEvent)
            {
            };
            var onUserEnterRoomHandler:Function = function (_arg_1:SFSEvent)
            {
            };
            var onUserLeaveRoomHandler:Function = function (_arg_1:SFSEvent)
            {
            };
            var onUserVariablesUpdateHandler:Function = function (_arg_1:SFSEvent)
            {
            };
            var onRoomListUpdateHandler:Function = function (_arg_1:SFSEvent)
            {
            };
            var onRoomVariablesUpdateHandler:Function = function (_arg_1:SFSEvent)
            {
            };
            var onRoomAddedHandler:Function = function (_arg_1:SFSEvent)
            {
            };
            var onPublicMessageHandler:Function = function (_arg_1:SFSEvent)
            {
            };
            var onPrivateMessageHandler:Function = function (_arg_1:SFSEvent)
            {
            };
            var onModeratorMessage:Function = function (_arg_1:SFSEvent)
            {
                var _local_2:* = _arg_1.params.message;
                var _local_3:* = _arg_1.params.sender;
            };
            var onObjectReceivedHandler:Function = function (_arg_1:SFSEvent)
            {
                var _local_2:*;
                var _local_3:*;
                var _local_4:MovieClip;
                var _local_5:*;
                var _local_6:*;
                trace("OBJ HANDLER");
                if (sfcSocial)
                {
                    _local_2 = _arg_1.params.sender;
                    _local_3 = _arg_1.params.obj;
                    switch (_local_3.typ)
                    {
                        case "flourish":
                            if (world.CHARS.getChildByName(_local_3.oName) != null)
                            {
                                MovieClip(world.CHARS.getChildByName(_local_3.oName)).userName = _local_2.getName();
                                MovieClip(world.CHARS.getChildByName(_local_3.oName)).gotoAndPlay(_local_3.oFrame);
                            };
                            return;
                        case "danceRequest":
                            if (_local_3.cell == world.strFrame)
                            {
                                _local_5 = new ModalMC();
                                _local_6 = {};
                                _local_6.strBody = "Would you care to dance?";
                                _local_6.params = {};
                                _local_6.params.emote1 = "/dance";
                                _local_6.params.sender = _local_2;
                                _local_6.callback = world.danceRequest;
                                ui.ModalStack.addChild(_local_5);
                                _local_5.init(_local_6);
                            };
                            return;
                        case "danceDenied":
                            if (_local_3.cell == world.strFrame)
                            {
                                chatF.submitMsg("/cry", "emotea", sfc.myUserName);
                            };
                            return;
                    };
                };
            };
            var onRoundTripResponseHandler:Function = function (_arg_1:SFSEvent):void
            {
                var _local_2:int = _arg_1.params.elapsed;
                totalPingTime = (totalPingTime + (_local_2 / 2));
                pingCount++;
                var _local_3:int = int(Math.round((totalPingTime / pingCount)));
                trace((("Average lag: " + _local_3) + " milliseconds"));
            };
            onExtensionResponseHandler = function (e:SFSEvent)
            {
                var resObj:* = undefined;
                var protocol:* = undefined;
                var i:int;
                var s:String;
                var j:int;
                var o:Object;
                var a:Array;
                var b:Array;
                var mc:MovieClip;
                var tuo:* = undefined;
                var typ:String;
                var nam:String;
                var val:* = undefined;
                var msg:String;
                var msgT:String;
                var snd:String;
                var rcp:String;
                var org:* = undefined;
                var cmd:String;
                var anims:Array;
                var animIndex:uint;
                var monAvt:Avatar;
                var avtAvt:Avatar;
                var Mon:Avatar;
                var avt:Avatar;
                var pMC:MovieClip;
                var unm:String;
                var uid:int;
                var rmId:int;
                var MonMapID:int;
                var MonID:int;
                var prop:String;
                var uoName:* = undefined;
                var uoLeaf:Object;
                var monLeaf:Object;
                var cLeaf:Object;
                var tLeaf:Object;
                var actObj:Object;
                var cell:String;
                var st:int;
                var sta:String;
                var evt:String;
                var modal:MovieClip;
                var modalO:Object;
                var modalRR:* = undefined;
                var modalORR:Object;
                var silentMute:int;
                var filter:int;
                var updateID:String;
                var updateA:Array;
                var updateN:String;
                var updateO:Object;
                var iSel:Object;
                var eSel:Object;
                var now:Number;
                var newmon:Object;
                var cluster:* = undefined;
                var strMsg:* = undefined;
                var strLabel:* = undefined;
                var str:* = undefined;
                var slots:int;
                var dt:* = undefined;
                var motd:* = undefined;
                var MonMapIDs:* = undefined;
                var id:* = undefined;
                var strMonName:String;
                var rand:int;
                var clMon:* = undefined;
                var tAvt:Avatar;
                var cAvt:Avatar;
                var strF:String;
                var ulo:* = undefined;
                var myLeaf:* = undefined;
                var adShown:Boolean;
                var testDate:Date;
                var dropItem:* = undefined;
                var anim:Object;
                var ai:int;
                var slot:int;
                var supressMupltiples:* = undefined;
                var isYou:* = undefined;
                var sMsg:* = undefined;
                var bi:int;
                var branchA:Object;
                var mID:String;
                var deltaXP:int;
                var xp:* = undefined;
                var xpB:* = undefined;
                var deltaGold:int;
                var gold:* = undefined;
                var deltaCP:int;
                var iRank:* = undefined;
                var txtBonusCP:String;
                var flo:* = undefined;
                var fct:Function;
                var item:* = undefined;
                var dID:* = undefined;
                var dItem:* = undefined;
                var dropitem:* = undefined;
                var ItemID:* = undefined;
                var itemObj:* = undefined;
                var fi:* = undefined;
                var iobj:* = undefined;
                var itemArr:* = undefined;
                var dropindex:* = undefined;
                var dropID:* = undefined;
                var dropQty:int;
                var qi:String;
                var qr:String;
                var qj:String;
                var qk:String;
                var qat:Array;
                var ri:* = undefined;
                var fgWin:* = undefined;
                var m:* = undefined;
                var k:* = undefined;
                var blanki:* = undefined;
                var actBar:* = undefined;
                var delIcon:* = undefined;
                var actIconClass:Class;
                var actIcon:* = undefined;
                var actIconMC:* = undefined;
                var blankMC:* = undefined;
                var c:Color;
                var stuS:String;
                var hasteCoeff:Number;
                var cd:* = undefined;
                var mcPath:* = undefined;
                resObj = e.params.dataObj;
                protocol = e.params.type;
                i = 0;
                s = "";
                j = 0;
                prop = "";
                var updated:Object = {};
                silentMute = 0;
                filter = 0;
                var cInf:String = "";
                var tInf:String = "";
                var cTyp:String = "";
                var cID:int = -1;
                var tTyp:String = "";
                var tID:int = -1;
                var ul:Array = [];
                var dat:Date = new Date();
                now = dat.getTime();
                if (protocol == "str")
                {
                    cmd = resObj[0];
                    trace(("responseObject STR: " + cmd));
                    switch (cmd)
                    {
                        default:
                            break;
                        case "loginResponse":
                            showTracking("5");
                            if ((((resObj[2] == 1) || (resObj[2] == "true")) || (resObj[2] == "True")))
                            {
                                mcConnDetail.showConn("Carregando informações do personagem...");
                                sfc.myUserId = Number(resObj[3]);
                                sfc.myUserName = String(resObj[4]);
                                ts_login_client = now;
                                dt = stringToDate(resObj[6]);
                                ts_login_server = dt.getTime();
                                trace(date_server);
                                motd = ("Mensagem do Dia: " + String(resObj[5]));
                                chatF.pushMsg("Administração", motd, "SERVER", "", 0);
                                world.initObjInfo(resObj[7]);
                                confirmTime = getTimer();
                                if (ASSETS_READY)
                                {
                                    loadGameMenu();
                                    resumeOnLoginResponse();
                                }
                                else
                                {
                                    loadExternalAssets();
                                };
                            }
                            else
                            {
                                if (resObj[5].indexOf("out of date") >= 0)
                                {
                                    navigateToURL(new URLRequest("default.asp?id=0624"), "_self");
                                }
                                else
                                {
                                    mcConnDetail.showError(resObj[5]);
                                };
                            };
                            break;
                        case "loginIterator":
                            if (((resObj[2] == 1) || (resObj[2] == "true")))
                            {
                                sfc.myUserId = Number(resObj[3]);
                                sfc.myUserName = String(resObj[4]);
                                chatF.submitMsg(serialCmd.cmd, "serialCmd", sfc.myUserName);
                            }
                            else
                            {
                                mcConnDetail.showError("Login Failed!");
                            };
                            break;
                        case "iterator":
                            sfc.logout();
                            break;
                        case "loginMulti":
                            if (!((resObj[2] == 1) || (resObj[2] == "true")))
                            {
                                mcConnDetail.showError("Login Failed!");
                            };
                            break;
                        case "notify":
                            typ = "server";
                            msg = resObj[2];
                            msg = chatF.cleanChars(msg);
                            msg = chatF.cleanStr(msg);
                            chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            MsgBox.notify(msg);
                            break;
                        case "logoutWarning":
                            userPreference.data.logoutWarning = String(resObj[2]);
                            userPreference.data.logoutWarningDur = Number(resObj[3]);
                            userPreference.data.logoutWarningTS = now;
                            try
                            {
                                userPreference.flush();
                            }
                            catch(e:Error)
                            {
                                trace(e.message);
                            };
                            break;
                        case "multiLoginWarning":
                            mcConnDetail.showError("Your AQWorlds account has been logged on from another computer. Please log back in to play. If you cannot login, please contact Artix Entertainment via our help page:<br/> <u><a href='http://www.aq.com/help/aw-account-recovery.asp' target='_blank'>http://www.aq.com/help/aw-account-recovery.asp</a></u>");
                            break;
                        case "server":
                            typ = "server";
                            msg = resObj[2];
                            msg = chatF.cleanChars(msg);
                            msg = chatF.cleanStr(msg);
                            chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            break;
                        case "serverf":
                            msg = String(resObj[2]);
                            typ = "server";
                            str = chatF.cleanStr(msg);
                            unm = String(resObj[3]);
                            uid = int(resObj[4]);
                            rmId = int(resObj[5]);
                            msg = chatF.cleanChars(msg);
                            msgT = stripWhite(msg.toLowerCase());
                            if (chatF.strContains(msgT, chatF.illegalStrings))
                            {
                                silentMute = 1;
                            };
                            msgT = stripWhiteStrict(msg.toLowerCase());
                            if (chatF.strContains(msgT, ["email", "password"]))
                            {
                                silentMute = 1;
                            };
                            if (!silentMute)
                            {
                                chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            };
                            break;
                        case "moderator":
                            if (sfcSocial)
                            {
                                typ = "moderator";
                                msg = resObj[2];
                                msg = chatF.cleanChars(msg);
                                msg = chatF.cleanStr(msg);
                                chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            };
                            break;
                        case "wheel":
                            if (sfcSocial)
                            {
                                typ = "wheel";
                                msg = resObj[2];
                                msg = chatF.cleanChars(msg);
                                msg = chatF.cleanStr(msg);
                                chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            };
                            break;
                        case "gsupdate":
                            try
                            {
                                world.map.killCount(resObj[2]);
                            }
                            catch(e)
                            {
                                trace(e);
                            };
                            break;
                        case "frostupdate":
                            try
                            {
                                world.map.frostWar(resObj[2], resObj[3]);
                            }
                            catch(e)
                            {
                                trace(e);
                            };
                            break;
                        case "warning":
                            typ = "warning";
                            msg = resObj[2];
                            msg = chatF.cleanChars(msg);
                            msg = chatF.cleanStr(msg);
                            chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            break;
                        case "respawnMon":
                            if (sfcSocial)
                            {
                                MonMapIDs = resObj[2].split(",");
                                for (id in MonMapIDs)
                                {
                                    Mon = world.getMonster(MonMapIDs[id]);
                                    monLeaf = world.monTree[MonMapIDs[id]];
                                    if ((((!(monLeaf == null)) && (!(Mon.objData == null))) && (Mon.objData.strFrame == world.strFrame)))
                                    {
                                        monLeaf.targets = {};
                                        strMonName = "";
                                        if (Number(world.objExtra["bMonName"]) == 1)
                                        {
                                            rand = int(Math.round((Math.random() * (world.chaosNames.length - 1))));
                                            if (world.chaosNames[rand] == world.myAvatar.objData.strUsername)
                                            {
                                                rand = ((rand == 0) ? ((rand = (rand + 1)), rand) : ((rand = (rand - 1)), rand));
                                            };
                                            strMonName = world.chaosNames[rand];
                                        };
                                        Mon.pMC.respawn(strMonName);
                                        Mon.pMC.x = Mon.pMC.ox;
                                        Mon.pMC.y = Mon.pMC.oy;
                                        if (((Mon.objData.bRed == 1) && (world.myAvatar.dataLeaf.intState > 0)))
                                        {
                                            world.aggroMon(MonMapIDs[id]);
                                        };
                                    };
                                };
                            };
                            break;
                        case "resTimed":
                            if ((((resObj.length > 2) && (!(String(resObj[2]) == null))) && (!(String(resObj[3]) == null))))
                            {
                                world.moveToCell(String(resObj[2]), String(resObj[3]));
                            }
                            else
                            {
                                world.moveToCell(world.spawnPoint.strFrame, world.spawnPoint.strPad);
                            };
                            world.map.transform.colorTransform = world.defaultCT;
                            world.CHARS.transform.colorTransform = world.defaultCT;
                            break;
                        case "exitArea":
                            uid = int(resObj[2]);
                            unm = String(resObj[3]);
                            world.manageAreaUser(String(resObj[3]), "-");
                            avt = world.avatars[uid];
                            if (avt != null)
                            {
                                if (avt == world.myAvatar.target)
                                {
                                    world.setTarget(null);
                                };
                                if (((!(avt.objData == null)) && (world.isPartyMember(avt.objData.strUsername))))
                                {
                                    world.updatePartyFrame({
                                        "unm":avt.objData.strUsername,
                                        "range":false
                                    });
                                };
                                world.destroyAvatar(uid);
                                delete world.uoTree[unm];
                            };
                            break;
                        case "uotls":
                            trace("uotls");
                            o = {};
                            a = resObj[3].split(",");
                            i = 0;
                            while (i < a.length)
                            {
                                o[a[i].split(":")[0]] = a[i].split(":")[1];
                                i = (i + 1);
                            };
                            userTreeWrite(String(resObj[2]), o);
                            break;
                        case "mtls":
                            o = {};
                            a = resObj[3].split(",");
                            i = 0;
                            while (i < a.length)
                            {
                                o[a[i].split(":")[0]] = a[i].split(":")[1];
                                i = (i + 1);
                            };
                            monsterTreeWrite(int(resObj[2]), o);
                            break;
                        case "spcs":
                            MonMapID = int(resObj[2]);
                            MonID = int(resObj[3]);
                            monLeaf = world.monTree[MonMapID];
                            newmon = {};
                            i = 0;
                            while (i < world.mondef.length)
                            {
                                if (world.mondef[i].MonID == MonID)
                                {
                                    newmon = world.mondef[i];
                                    i = world.mondef.length;
                                };
                                i = (i + 1);
                            };
                            monLeaf.intHP = 0;
                            monLeaf.intMP = 0;
                            monLeaf.intHPMax = newmon.intHPMax;
                            monLeaf.intMPMax = newmon.intMPMax;
                            monLeaf.intState = 0;
                            monLeaf.iLvl = newmon.iLvl;
                            monLeaf.MonID = MonID;
                            cluster = world.getMonsterCluster(MonMapID);
                            i = 0;
                            while (i < cluster.length)
                            {
                                clMon = cluster[i];
                                if (monLeaf.MonID == clMon.objData.MonID)
                                {
                                    if (monLeaf.strFrame == world.strFrame)
                                    {
                                        world.CHARS.addChild(clMon.pMC);
                                    };
                                    clMon.dataLeaf = monLeaf;
                                }
                                else
                                {
                                    if (monLeaf.strFrame == world.strFrame)
                                    {
                                        world.TRASH.addChild(clMon.pMC);
                                    };
                                    clMon.dataLeaf = null;
                                };
                                i = (i + 1);
                            };
                            break;
                        case "cc":
                            strMsg = chatF.getCCText(resObj[2]);
                            unm = String(resObj[3]);
                            if (chatF.ignoreList.data.users != undefined)
                            {
                                if (chatF.ignoreList.data.users.indexOf(unm) > -1)
                                {
                                    filter = 1;
                                };
                            };
                            if (filter == 0)
                            {
                                chatF.pushMsg("zone", strMsg, unm, "", 0);
                            };
                            break;
                        case "emotea":
                            strLabel = String(resObj[2]);
                            uid = int(resObj[3]);
                            pMC = world.getMCByUserID(uid);
                            if (pMC != null)
                            {
                                pMC.mcChar.gotoAndPlay(strToProperCase(strLabel));
                            };
                            break;
                        case "em":
                            unm = String(resObj[2]);
                            msg = chatF.cleanStr(String(resObj[3]));
                            while (msg.indexOf("  ") > -1)
                            {
                                msg = msg.split("  ").join(" ");
                            };
                            msg = chatF.cleanChars(msg);
                            msgT = stripWhiteStrict(msg.toLowerCase());
                            if (chatF.strContains(msgT, chatF.illegalStrings))
                            {
                                silentMute = 1;
                            };
                            if (!silentMute)
                            {
                                chatF.pushMsg("event", msg, unm, "", 0);
                            };
                            break;
                        case "chatm":
                            str = String(resObj[2]);
                            str = chatF.cleanStr(str, true, false, Boolean(int(resObj[6])));
                            unm = String(resObj[3]);
                            uid = int(resObj[4]);
                            rmId = int(resObj[5]);
                            typ = str.substr(0, str.indexOf("~"));
                            msg = str.substr((str.indexOf("~") + 1));
                            msg = chatF.cleanChars(msg);
                            if (chatF.ignoreList.data.users != undefined)
                            {
                                if (chatF.ignoreList.data.users.indexOf(unm.toLowerCase()) > -1)
                                {
                                    filter = 1;
                                };
                            };
                            if (!filter)
                            {
                                chatF.pushMsg(typ, msg, unm, uid, 0, int(resObj[6]));
                            };
                            break;
                        case "whisper":
                            typ = "whisper";
                            msg = resObj[2];
                            snd = String(resObj[3]);
                            rcp = String(resObj[4]);
                            org = resObj[5];
                            msg = chatF.cleanStr(msg);
                            msg = chatF.cleanChars(msg);
                            silentMute = 0;
                            if (msg.indexOf(":=sm") > -1)
                            {
                                msg = msg.substr(0, msg.indexOf(":=sm"));
                                if (unm != sfc.myUserName)
                                {
                                    silentMute = 1;
                                };
                            };
                            if (chatF.ignoreList.data.users != undefined)
                            {
                                if (chatF.ignoreList.data.users.indexOf(snd.toLowerCase()) > -1)
                                {
                                    filter = 1;
                                };
                            };
                            if (((!(filter)) && ((!(silentMute)) || ((silentMute) && (snd == rcp)))))
                            {
                                if (snd.toLowerCase() != sfc.myUserName.toLowerCase())
                                {
                                    chatF.pmSourceA = [snd];
                                    if (chatF.pmSourceA.length > 20)
                                    {
                                        chatF.pmSourceA.splice(0, (chatF.pmSourceA.length - 20));
                                    };
                                };
                                if (org == 1)
                                {
                                    chatF.pushMsg(typ, msg, snd, rcp, 0);
                                    chatF.pushMsg(typ, msg, snd, rcp, 1);
                                }
                                else
                                {
                                    chatF.pushMsg(typ, msg, snd, rcp, org, int(resObj[6]));
                                };
                            };
                            break;
                        case "mute":
                            chatF.muteMe(int(resObj[2]));
                            break;
                        case "unmute":
                            chatF.unmuteMe();
                            break;
                        case "mvna":
                            if (((world.uoTree[sfc.myUserName].freeze == null) || (!(world.uoTree[sfc.myUserName].freeze))))
                            {
                                world.uoTree[sfc.myUserName].freeze = true;
                            };
                            break;
                        case "mvnb":
                            if (world.uoTree[sfc.myUserName].freeze != null)
                            {
                                delete world.uoTree[sfc.myUserName].freeze;
                            };
                            break;
                        case "gtc":
                            if (((!(String(resObj[2]) == null)) && (!(String(resObj[3]) == null))))
                            {
                                world.moveToCell(String(resObj[2]), String(resObj[3]));
                            };
                            break;
                        case "mtcid":
                            if (resObj.length > 2)
                            {
                                world.moveToCellByIDb(Number(resObj[2]));
                            };
                            break;
                        case "hi":
                            trace("");
                            trace("****> SFS Ping response, unlocking all actions, canceling logout timer");
                            trace("");
                            world.connMsgOut = false;
                            world.connTestTimer.reset();
                            world.unlockActions();
                            break;
                        case "Dragon Buff":
                            world.map.doDragonBuff();
                            break;
                        case "trap door":
                            world.map.doTrapDoor(resObj[2]);
                            break;
                        case "gMOTD":
                            world.myAvatar.objData.guild.MOTD = resObj[2];
                            break;
                        case "buyGSlots":
                            slots = int(resObj[2]);
                            if (!isNaN(slots))
                            {
                                world.myAvatar.objData.guild.Fame = (world.myAvatar.objData.guild.Fame - (slots * 200));
                            };
                            if (ui.mcPopup.currentLabel == "GuildPanel")
                            {
                                ui.mcPopup.GuildBG.updateGuildWindow();
                            };
                            break;
                        case "gRename":
                            world.myAvatar.objData.guild.Fame = (world.myAvatar.objData.guild.Fame - 1000);
                            break;
                        case "fbRes":
                            if (resObj[4] != null)
                            {
                                typ = "warning";
                                msg = resObj[4];
                                msg = chatF.cleanChars(msg);
                                msg = chatF.cleanStr(msg);
                                chatF.pushMsg(typ, msg, "SERVER", "", 0);
                            };
                            break;
                        case "elmSwitch":
                            try
                            {
                                world.map.setupElement(String(resObj[2]));
                            }
                            catch(e)
                            {
                                trace(("error sending element: " + e));
                            };
                    };
                };
                if (protocol == "json")
                {
                    cmd = resObj.cmd;
                    trace(("responseObject JSON: " + cmd));
                    strF = "";
                    switch (cmd)
                    {
                        default:
                            trace("*>> Unhandled CMD <<*");
                            break;
                        case "who":
                            ulo = {};
                            ulo.typ = "userListA";
                            ulo.ul = resObj.users;
                            ui.mcOFrame.fOpenWith(ulo);
                            break;
                        case "al":
                            areaListShow(resObj);
                            break;
                        case "getinfo":
                            for (prop in resObj)
                            {
                                if (prop != "cmd")
                                {
                                    trace(((("USER INFO >  " + prop) + " : ") + resObj[prop]));
                                };
                            };
                            break;
                        case "reloadmap":
                            if (world.strMapName == resObj.sName)
                            {
                                world.setMapEvents(null);
                                world.strMapFileName = resObj.sFileName;
                                world.reloadCurrentMap();
                            };
                            break;
                        case "moveToArea":
                            if (((resObj.areaName.indexOf("battleon") > -1) && (resObj.areaName.indexOf("battleontown") < 0)))
                            {
                                world.rootClass.openMenu();
                                world.rootClass.firstMenu = false;
                            }
                            else
                            {
                                if (!world.rootClass.firstMenu)
                                {
                                    world.rootClass.menuClose();
                                };
                            };
                            world.mapLoadInProgress = true;
                            world.strAreaName = resObj.areaName;
                            world.initObjExtra(resObj.sExtra);
                            world.areaUsers = [];
                            myLeaf = null;
                            world.modID = -1;
                            if (world.uoTreeLeaf(sfc.myUserName) != null)
                            {
                                myLeaf = copyObj(world.uoTreeLeaf(sfc.myUserName));
                            };
                            world.uoTree = {};
                            if (myLeaf != null)
                            {
                                world.uoTree[sfc.myUserName] = myLeaf;
                            };
                            if (resObj.monName != null)
                            {
                                world.chaosNames = resObj.monName.split(",");
                            };
                            if (resObj.pvpTeam != null)
                            {
                                myLeaf.pvpTeam = resObj.pvpTeam;
                                world.bPvP = true;
                                ui.mcPortrait.pvpIcon.visible = true;
                                ui.mcPortrait.partyLead.y = 18;
                                world.setPVPFactionData(resObj.PVPFactions);
                                if (world.objExtra["bChaos"] == null)
                                {
                                    updatePVPScore(resObj.pvpScore);
                                    showPVPScore();
                                };
                            }
                            else
                            {
                                ui.mcPortrait.pvpIcon.visible = false;
                                ui.mcPortrait.partyLead.y = 0;
                                delete myLeaf.pvpTeam;
                                world.bPvP = false;
                                hidePVPScore();
                                world.setPVPFactionData(null);
                            };
                            if (resObj.pvpScore != null)
                            {
                                updatePVPScore(resObj.pvpScore);
                            };
                            bi = 0;
                            while (bi < resObj.uoBranch.length)
                            {
                                branchA = resObj.uoBranch[bi];
                                unm = branchA.uoName;
                                uoLeaf = {};
                                for (s in branchA)
                                {
                                    nam = s;
                                    val = branchA[s];
                                    if ((((((nam.toLowerCase().indexOf("int") > -1) || (nam.toLowerCase() == "tx")) || (nam.toLowerCase() == "ty")) || (nam.toLowerCase() == "sp")) || (nam.toLowerCase() == "pvpTeam")))
                                    {
                                        val = int(val);
                                    };
                                    uoLeaf[nam] = val;
                                };
                                if (unm != sfc.myUserName)
                                {
                                    uoLeaf.auras = [];
                                };
                                uoLeaf.targets = {};
                                world.uoTreeLeafSet(unm, uoLeaf);
                                world.manageAreaUser(unm, "+");
                                bi = (bi + 1);
                            };
                            world.monTree = {};
                            world.monsters = [];
                            bi = 0;
                            while (bi < resObj.monBranch.length)
                            {
                                branchA = resObj.monBranch[bi];
                                monLeaf = {};
                                mID = "1";
                                for (s in branchA)
                                {
                                    nam = s;
                                    val = branchA[s];
                                    if (nam.toLowerCase().indexOf("monmapid") > -1)
                                    {
                                        mID = val;
                                    };
                                    if ((((nam.toLowerCase().indexOf("int") > -1) || (nam.toLowerCase().indexOf("monid") > -1)) || (nam.toLowerCase().indexOf("monmapid") > -1)))
                                    {
                                        val = int(val);
                                    };
                                    monLeaf[nam] = val;
                                };
                                monLeaf.auras = [];
                                monLeaf.targets = {};
                                monLeaf.strBehave = "walk";
                                world.monTree[mID] = monLeaf;
                                bi = (bi + 1);
                            };
                            if (("event" in resObj))
                            {
                                world.setMapEvents(resObj.event);
                            }
                            else
                            {
                                world.setMapEvents(null);
                            };
                            if (("cellMap" in resObj))
                            {
                                world.setCellMap(resObj.cellMap);
                            }
                            else
                            {
                                world.setCellMap(null);
                            };
                            if (world.strFrame != "")
                            {
                                world.exitCell();
                            };
                            world.killLoaders();
                            world.clearMonstersAndProps();
                            world.clearAllAvatars();
                            world.avatars[sfc.myUserId] = world.myAvatar;
                            world.strMapName = resObj.strMapName;
                            world.strMapFileName = resObj.strMapFileName;
                            world.intType = resObj.intType;
                            world.intKillCount = resObj.intKillCount;
                            world.objLock = ((resObj.objLock != null) ? resObj.objLock : null);
                            world.mondef = resObj.mondef;
                            world.monmap = resObj.monmap;
                            world.curRoom = Number(resObj.areaId);
                            world.actionResultsMon = {};
                            world.actionResults = {};
                            world.mapBoundsMC = null;
                            chatF.chn.zone.rid = world.curRoom;
                            if (("houseData" in resObj))
                            {
                                world.initHouseData(resObj.houseData);
                            }
                            else
                            {
                                world.initHouseData(null);
                            };
                            world.updatePartyFrame();
                            world.clearLoaders();
                            s = resObj.strMapFileName.toLowerCase();
                            world.loadMap(s);
                            elmType = resObj.elmType;
                            break;
                        case "initUserData":
                            try
                            {
                                avt = world.getAvatarByUserID(resObj.uid);
                                uoLeaf = avt.dataLeaf;
                                if (((!(avt == null)) && (!(uoLeaf == null))))
                                {
                                    avt.initAvatar({"data":resObj.data});
                                    if (avt.isMyAvatar)
                                    {
                                        avt.objData.strHomeTown = avt.objData.strMapName;
                                        if (avt.objData.guild != null)
                                        {
                                            chatF.chn.guild.act = 1;
                                            if (String(avt.objData.guild.MOTD) != "undefined")
                                            {
                                                chatF.pushMsg("guild", ("Mensagem do dia: " + String(avt.objData.guild.MOTD)), "SERVER", "", 0);
                                            };
                                        };
                                        if (Game.serverFilePath.indexOf("content.aqworlds.com") == -1)
                                        {
                                            world.rootClass.extCall.showIt("login");
                                        };
                                        if (avt.objData.iUpg > 0)
                                        {
                                            if (avt.objData.iUpgDays < 0)
                                            {
                                                chatF.pushMsg("moderator", "Sua assinatura expirou. Por favor, visite nosso site para renovar sua assinatura", "SERVER", "", 0);
                                            }
                                            else
                                            {
                                                if (avt.objData.iUpgDays < 7)
                                                {
                                                    chatF.pushMsg("moderator", (("Sua assinatura vai expirar em " + (Number(avt.objData.iUpgDays) + 1)) + " dias. Por favor, visite nosso site para renovar sua assinatura."), "SERVER", "", 0);
                                                };
                                            };
                                        };
                                        updateXPBar();
                                        ui.mcInterface.mcGold.strGold.text = avt.objData.intGold;
                                        if (ui.mcPopup.currentLabel == "Inventory")
                                        {
                                            MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshCoins"});
                                        };
                                        trace(("resObj.uid: " + resObj.uid));
                                        world.getInventory(resObj.uid);
                                        world.initAchievements();
                                        readIA1Preferences();
                                    };
                                };
                            }
                            catch(e:Error)
                            {
                                trace("initUserData > ");
                                trace(e);
                            };
                            break;
                        case "initUserDatas":
                            a = resObj.a;
                            i = 0;
                            while (i < a.length)
                            {
                                o = a[i];
                                try
                                {
                                    avt = world.getAvatarByUserID(o.uid);
                                    uoLeaf = avt.dataLeaf;
                                    if (((!(avt == null)) && (!(uoLeaf == null))))
                                    {
                                        avt.initAvatar({"data":o.data});
                                        if (((avt.isMyAvatar) && ((avt.items == null) || (avt.items.length < 1))))
                                        {
                                            avt.objData.strHomeTown = avt.objData.strMapName;
                                            if (avt.objData.guild != null)
                                            {
                                                chatF.chn.guild.act = 1;
                                                if (String(avt.objData.guild.MOTD) != "undefined")
                                                {
                                                    chatF.pushMsg("guild", ("Mensagem do dia: " + String(avt.objData.guild.MOTD)), "SERVER", "", 0);
                                                };
                                            };
                                            if (Game.serverFilePath.indexOf("content.aqworlds.com") == -1)
                                            {
                                                world.rootClass.extCall.showIt("login");
                                            };
                                            if (avt.objData.iUpg > 0)
                                            {
                                                if (avt.objData.iUpgDays < 0)
                                                {
                                                    chatF.pushMsg("moderator", "Sua assinatura expirou. Por favor, visite nosso site para renovar sua assinatura..", "SERVER", "", 0);
                                                }
                                                else
                                                {
                                                    if (avt.objData.iUpgDays < 7)
                                                    {
                                                        chatF.pushMsg("moderator", (("Sua assinatura vai expirar em " + (Number(avt.objData.iUpgDays) + 1)) + " dias. Por favor, visite nosso site para renovar sua assinatura."), "SERVER", "", 0);
                                                    };
                                                };
                                            };
                                            if (((!(avt.objData.dRefReset == null)) && ((avt.objData.iRefGold > 0) || (avt.objData.iRefExp > 0))))
                                            {
                                                modalRR = new ModalMC();
                                                modalORR = {};
                                                modalORR.strBody = (((("You earned <font color='#FFCC00'><b>" + Math.ceil(avt.objData.iRefGold)) + " Gold</b></font> and <font color='#990099'><b>") + Math.ceil(avt.objData.iRefExp)) + " XP</b></font><br/> from Referred Friends.");
                                                modalORR.callback = world.sendRewardReferralRequest;
                                                modalORR.btns = "mono";
                                                ui.ModalStack.addChild(modalRR);
                                                modalRR.init(modalORR);
                                            };
                                            updateXPBar();
                                            ui.mcInterface.mcGold.strGold.text = avt.objData.intGold;
                                            if (ui.mcPopup.currentLabel == "Inventory")
                                            {
                                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshCoins"});
                                            };
                                            world.getInventory(o.uid);
                                            world.initAchievements();
                                            readIA1Preferences();
                                        };
                                    };
                                }
                                catch(e:Error)
                                {
                                    trace("initUserDatas > ");
                                    trace(e);
                                };
                                i = (i + 1);
                            };
                            break;
                        case "changeColor":
                            avt = world.getAvatarByUserID(resObj.uid);
                            if (((!(avt == null)) && (avt.bitData)))
                            {
                                if (avt.isMyAvatar)
                                {
                                    showPortrait(avt);
                                }
                                else
                                {
                                    if (resObj.HairID != null)
                                    {
                                        avt.objData.HairID = resObj.HairID;
                                        avt.objData.strHairName = resObj.strHairName;
                                        avt.objData.strHairFilename = resObj.strHairFilename;
                                        if (((!(avt.pMC == null)) && (!(avt.pMC.stage == null))))
                                        {
                                            avt.pMC.loadHair();
                                        };
                                    };
                                    avt.objData.intColorSkin = resObj.intColorSkin;
                                    avt.objData.intColorHair = resObj.intColorHair;
                                    avt.objData.intColorEye = resObj.intColorEye;
                                    if (((!(avt.pMC == null)) && (!(avt.pMC.stage == null))))
                                    {
                                        avt.pMC.updateColor();
                                    };
                                };
                            }
                            else
                            {
                                trace("can't set data!");
                            };
                            break;
                        case "changeArmorColor":
                            avt = world.getAvatarByUserID(resObj.uid);
                            if (((!(avt == null)) && (avt.bitData)))
                            {
                                if (!avt.isMyAvatar)
                                {
                                    avt.objData.intColorBase = resObj.intColorBase;
                                    avt.objData.intColorTrim = resObj.intColorTrim;
                                    avt.objData.intColorAccessory = resObj.intColorAccessory;
                                    if (((!(avt.pMC == null)) && (!(avt.pMC.stage == null))))
                                    {
                                        avt.pMC.updateColor();
                                    };
                                };
                            }
                            else
                            {
                                trace("can't set data!");
                            };
                            break;
                        case "addGoldExp":
                            if (((!(resObj.intExp == null)) && (resObj.intExp > 0)))
                            {
                                deltaXP = resObj.intExp;
                                world.myAvatar.objData.intExp = (world.myAvatar.objData.intExp + deltaXP);
                                updateXPBar();
                                xp = new xpDisplay();
                                xp.t.ti.text = (deltaXP + " xp");
                                xpB = null;
                                if (("bonusExp" in resObj))
                                {
                                    xpB = new xpDisplayBonus();
                                    xpB.t.ti.text = String((("+ " + resObj.bonusExp) + " xp!"));
                                    xp.t.ti.text = ((deltaXP - resObj.bonusExp) + " xp");
                                };
                                if (((!(resObj.typ == null)) && (resObj.typ == "m")))
                                {
                                    Mon = world.getMonster(resObj.id);
                                    xp.x = Mon.pMC.mcChar.x;
                                    xp.y = (Mon.pMC.mcChar.y - 40);
                                    Mon.pMC.addChild(xp);
                                    if (xpB != null)
                                    {
                                        xpB.x = xp.x;
                                        xpB.y = xp.y;
                                        Mon.pMC.addChild(xpB);
                                    };
                                }
                                else
                                {
                                    xp.x = world.myAvatar.pMC.mcChar.x;
                                    xp.y = (world.myAvatar.pMC.pname.y + 10);
                                    world.myAvatar.pMC.addChild(xp);
                                    if (xpB != null)
                                    {
                                        xpB.x = xp.x;
                                        xpB.y = xp.y;
                                        world.myAvatar.pMC.addChild(xpB);
                                    };
                                };
                            };
                            if (((!(resObj.intGold == null)) && (resObj.intGold > 0)))
                            {
                                mixer.playSound("Coins");
                                deltaGold = resObj.intGold;
                                world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold + resObj.intGold);
                                ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
                                if (ui.mcPopup.currentLabel == "Inventory")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshCoins"});
                                };
                                gold = new goldDisplay();
                                gold.t.ti.text = (deltaGold + " g");
                                gold.tMask.ti.text = (deltaGold + " g");
                                if (((!(resObj.typ == null)) && (resObj.typ == "m")))
                                {
                                    Mon = world.getMonster(resObj.id);
                                    gold.x = Mon.pMC.mcChar.x;
                                    gold.y = (Mon.pMC.mcChar.y - 20);
                                    Mon.pMC.addChild(gold);
                                }
                                else
                                {
                                    gold.x = world.myAvatar.pMC.mcChar.x;
                                    gold.y = (world.myAvatar.pMC.pname.y - 30);
                                    world.myAvatar.pMC.addChild(gold);
                                };
                            };
							if (resObj.intCoins !=null && resObj.intCoins > 0)
							{
								world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins + resObj.intCoins);
								if (ui.mcPopup.currentLabel == "Inventory")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshCoins"});
                                };
							}
                            if (resObj.iCP != null)
                            {
                                deltaCP = resObj.iCP;
                                world.myAvatar.objData.iCP = (world.myAvatar.objData.iCP + deltaCP);
                                world.myAvatar.updateArmorRep();
                                iRank = world.myAvatar.objData.iRank;
                                world.myAvatar.updateRep();
                                if (iRank != world.myAvatar.objData.iRank)
                                {
                                    world.myAvatar.rankUp(world.myAvatar.objData.strClassName, world.myAvatar.objData.iRank);
                                    //FB_showFeedDialog("Rank Up!", (((("reached Rank " + world.myAvatar.objData.iRank) + " ") + world.myAvatar.objData.strClassName) + " in AQWorlds!"), "aqw-rankup.jpg");
                                };
                                txtBonusCP = "";
                                if (resObj.bonusCP == null)
                                {
                                    resObj.bonusCP = 0;
                                }
                                else
                                {
                                    txtBonusCP = ((" + " + resObj.bonusCP) + "(Bonus)");
                                };
                                chatF.pushMsg("server", ((((("Class Points for " + world.myAvatar.objData.strClassName) + " increased by ") + (deltaCP - resObj.bonusCP)) + txtBonusCP) + "."), "SERVER", "", 0);
                            };
                            if (resObj.FactionID != null)
                            {
                                if (resObj.bonusRep == null)
                                {
                                    resObj.bonusRep = 0;
                                };
                                world.myAvatar.addRep(resObj.FactionID, resObj.iRep, resObj.bonusRep);
                            };
                            break;
                        case "levelUp":
                            world.myAvatar.objData.intLevel = resObj.intLevel;
                            world.myAvatar.objData.intExpToLevel = resObj.intExpToLevel;
                            world.myAvatar.objData.intExp = 0;
                            updateXPBar();
                            showPortraitBox(world.myAvatar, ui.mcPortrait);
                            world.myAvatar.levelUp();
                            /*if (resObj.intLevel == 10)
                            {
                                world.rootClass.extCall.showIt("level10");
                            };*/
							ui.mcSkillUp.gotoAndPlay("in");
                            if (("updatePStats" in world.map))
                            {
                                world.map.updatePStats();
                            };
                            break;
                        case "loadInventoryBig":
                            trace("loadInventoryBig");
                            world.myAvatar.iBankCount = int(resObj.bankCount);
                            world.myAvatar.initInventory(resObj.items);
                            world.initHouseInventory({
                                "sHouseInfo":world.myAvatar.objData.sHouseInfo,
                                "items":resObj.hitems
                            });
                            world.myAvatar.initFactions(resObj.factions);
                            world.myAvatar.initGuild(resObj.guild);
                            world.uiLock = false;
                            world.myAvatar.invLoaded = true;
                            if (("eventTrigger" in MovieClip(world.map)))
                            {
                                world.map.eventTrigger({"cmd":"userLoaded"});
                            };
                            world.myAvatar.checkItemAnimation();
                            adShown = false;
                            testDate = new Date();
                            if (!FacebookConnect.isLoggedIn)
                            {
                            };
                            if (((world.myAvatar.objData.iUpg < 1) && (!(world.map.noPopup == true))))
                            {
                                testDate.setDate((testDate.getDate() - 3));
                                if ((((world.myAvatar.objData.dCreated > testDate) && (world.myAvatar.objData.intHits > 1)) && (Math.random() < 0.2)))
                                {
                                    adShown = true;
                                    world.loadMovieFront("interface/DragonHeroOffer-28Feb13.swf", "Inline Asset");
                                };
                            };
                            if ((((world.myAvatar.objData.intActivationFlag == 1) && (world.myAvatar.objData.intHits < 16)) && (!(world.map.noPopup == true))))
                            {
                                if (((world.myAvatar.objData.intHits == 5) || (world.myAvatar.objData.intHits == 15)))
                                {
                                    world.loadMovieFront("interface/ConfirmedEmailPopup.swf", "Inline Asset");
                                };
                            };
                            break;
                        case "friends":
                            world.myAvatar.initFriendsList(resObj.friends);
                            if (resObj.showList)
                            {
                                flo = {};
                                flo.typ = "userListFriends";
                                flo.ul = world.myAvatar.friends;
                                ui.mcOFrame.fOpenWith(flo);
                            };
                            break;
                        case "initInventory":
                            world.myAvatar.initInventory(resObj.items);
                            if (("eventTrigger" in MovieClip(world.map)))
                            {
                                world.map.eventTrigger({"cmd":"userLoaded"});
                            };
                            break;
                        case "loadHouseInventory":
                            world.initHouseInventory(resObj);
                            break;
                        case "house":
                            MsgBox.notify(resObj.msg);
                            break;
                        case "buyBagSlots":
                            world.dispatchEvent(new Event("buyBagSlots"));
                            if (resObj.bitSuccess == 1)
                            {
                                mixer.playSound("Heal");
                                world.myAvatar.objData.iBagSlots = (world.myAvatar.objData.iBagSlots + Number(resObj.iSlots));
                                //world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins - (Number(resObj.iSlots) * 200));
                                MsgBox.notify((("You now have " + world.myAvatar.objData.iBagSlots) + " inventory spaces!"));
                                if (ui.mcPopup.currentLabel == "Inventory")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshSlots"});
                                };
                                if (ui.mcPopup.currentLabel == "Shop")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcShop")).update({"eventType":"refreshSlots"});
                                };
                            };
                            break;
                        case "buyBankSlots":
                            world.dispatchEvent(new Event("buyBankSlots"));
                            if (resObj.bitSuccess == 1)
                            {
                                mixer.playSound("Heal");
                                world.myAvatar.objData.iBankSlots = (world.myAvatar.objData.iBankSlots + Number(resObj.iSlots));
                                //world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins - (Number(resObj.iSlots) * 200));
                                MsgBox.notify((("You now have " + world.myAvatar.objData.iBankSlots) + " bank spaces!"));
                                if (ui.mcPopup.currentLabel == "Inventory")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshSlots"});
                                };
                                if (ui.mcPopup.currentLabel == "Shop")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcShop")).update({"eventType":"refreshSlots"});
                                };
                            };
                            break;
                        case "buyHouseSlots":
                            world.dispatchEvent(new Event("buyHouseSlots"));
                            if (resObj.bitSuccess == 1)
                            {
                                mixer.playSound("Heal");
                                world.myAvatar.objData.iHouseSlots = (world.myAvatar.objData.iHouseSlots + Number(resObj.iSlots));
                                //world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins - (Number(resObj.iSlots) * 200));
                                MsgBox.notify((("You now have " + world.myAvatar.objData.iHouseSlots) + " house inventory spaces!"));
                                if (ui.mcPopup.currentLabel == "Inventory")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshSlots"});
                                };
                                if (ui.mcPopup.currentLabel == "Shop")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcShop")).update({"eventType":"refreshSlots"});
                                };
                            };
                            break;
                        case "callfct":
                            try
                            {
                                fct = world.map[resObj.fctNam];
                                (fct(resObj.fctParams));
                            }
                            catch(e)
                            {
                                trace(e);
                            };
                            break;
                        case "genderSwap":
                            avt = world.getAvatarByUserID(resObj.uid);
                            if (((!(avt == null)) && (avt.bitData)))
                            {
                                if (resObj.bitSuccess == 1)
                                {
                                    if (avt.isMyAvatar)
                                    {
                                        MsgBox.notify("Your gender has been successfully changed.");
                                        avt.objData.intCoins = (avt.objData.intCoins - resObj.intCoins);
                                    };
                                    avt.objData.strGender = resObj.gender;
                                    avt.objData.HairID = resObj.HairID;
                                    avt.objData.strHairName = resObj.strHairName;
                                    avt.objData.strHairFilename = resObj.strHairFilename;
                                    avt.initAvatar({"data":avt.objData});
                                };
                            };
                            break;
                        case "loadBank":
                            if (resObj.bitSuccess)
                            {
                                if (((!(resObj.items == null)) && (!(resObj.items == "undefined"))))
                                {
                                    world.addItemsToBank(resObj.items);
                                };
                                if (ui.mcPopup.currentLabel == "Bank")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcBank")).update({"eventType":"refreshBank"});
                                }
                                else
                                {
                                    ui.mcPopup.fOpen("Bank");
                                };
                            }
                            else
                            {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error loading bank items!  Try logging out and back in to fix this problem.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
                        case "bankFromInv":
                            if ((("bSuccess" in resObj) && (resObj.bSuccess == 1)))
                            {
                                world.myAvatar.bankFromInv(resObj.ItemID);
                                world.checkAllQuestStatus();
                                if (ui.mcPopup.currentLabel == "Bank")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcBank")).update({"eventType":"refreshItems"});
                                };
                            }
                            else
                            {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.msg;
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
                        case "bankToInv":
                            world.myAvatar.bankToInv(resObj.ItemID);
                            world.checkAllQuestStatus();
                            if (ui.mcPopup.currentLabel == "Bank")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcBank")).update({"eventType":"refreshItems"});
                            };
                            break;
                        case "bankSwapInv":
                            world.myAvatar.bankSwapInv(resObj.invItemID, resObj.bankItemID);
                            world.checkAllQuestStatus();
                            if (ui.mcPopup.currentLabel == "Bank")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcBank")).update({"eventType":"refreshItems"});
                            };
                            break;
                        case "loadShop":
                            if ((((((!(world.shopinfo == null)) && ("ShopID" in world.shopinfo)) && (world.shopinfo.ShopID == resObj.shopinfo.ShopID)) && ("bLimited" in world.shopinfo)) && (world.shopinfo.bLimited)))
                            {
                                trace(" >>>> Shop reload detected");
                                i = 0;
                                while (i < resObj.shopinfo.items.length)
                                {
                                    world.shopinfo.items.push(resObj.shopinfo.items[i]);
                                    world.shopinfo.items.shift();
                                    i = (i + 1);
                                };
                                if (ui.mcPopup.currentLabel == "Shop")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcShop")).update({"eventType":"refreshItems"});
                                }
                                else
                                {
                                    ui.mcPopup.fOpen("Shop");
                                };
                            }
                            else
                            {
                                world.shopinfo = resObj.shopinfo;
                                if (resObj.shopinfo.bHouse == 1)
                                {
                                    trace("House Shop");
                                    ui.mcPopup.fOpen("HouseShop");
                                }
                                else
                                {
                                    if (isMergeShop(resObj.shopinfo))
                                    {
                                        ui.mcPopup.fOpen("MergeShop");
                                    }
                                    else
                                    {
                                        ui.mcPopup.fOpen("Shop");
                                    };
                                };
                            };
                            break;
                        case "loadEnhShop":
                            world.enhShopID = resObj.shopinfo.ShopID;
                            world.enhShopItems = resObj.shopinfo.items;
                            ui.mcPopup.fOpen("EnhShop");
                            break;
                        case "enhanceItemShop":
                            if (resObj.iCost != null)
                            {
                                world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold - Number(resObj.iCost));
                                ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
                                if (ui.mcPopup.currentLabel == "Inventory")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshCoins"});
                                };
                                if (ui.mcPopup.currentLabel == "Shop")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcShop")).update({"eventType":"refreshCoins"});
                                };
                            };
                            iSel = null;
                            eSel = null;
                            for each (o in world.myAvatar.items)
                            {
                                if (o.ItemID == resObj.ItemID)
                                {
                                    iSel = o;
                                };
                            };
                            iSel.iEnh = resObj.EnhID;
                            iSel.EnhID = resObj.EnhID;
                            iSel.EnhPatternID = resObj.EnhPID;
                            iSel.EnhLvl = resObj.EnhLvl;
                            iSel.EnhDPS = resObj.EnhDPS;
                            iSel.EnhRng = resObj.EnhRng;
                            iSel.EnhRty = resObj.EnhRty;
                            mixer.playSound("Good");
                            if (ui.mcPopup.currentLabel == "Inventory")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({
                                    "eventType":"refreshItems",
                                    "sInstruction":"previewEquipOnly"
                                });
                            };
                            if (ui.mcPopup.currentLabel == "Shop")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcShop")).update({
                                    "eventType":"refreshItems",
                                    "sInstruction":"closeWindows"
                                });
                            };
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (((((("You have upgraded <b>" + iSel.sName) + "</b> with <b>") + resObj.EnhName) + "</b>, level <b>") + resObj.EnhLvl) + "</b>!");
                            modalO.params = {};
                            modalO.glow = "white,medium";
                            modalO.btns = "mono";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            break;
                        case "enhanceItemLocal":
                            iSel = null;
                            eSel = null;
                            for each (o in world.myAvatar.items)
                            {
                                if (o.ItemID == resObj.ItemID)
                                {
                                    iSel = o;
                                };
                            };
                            iSel.iEnh = resObj.EnhID;
                            iSel.EnhID = resObj.EnhID;
                            iSel.EnhPatternID = resObj.EnhPID;
                            iSel.EnhLvl = resObj.EnhLvl;
                            iSel.EnhDPS = resObj.EnhDPS;
                            iSel.EnhRng = resObj.EnhRng;
                            iSel.EnhRty = resObj.EnhRty;
                            mixer.playSound("Good");
                            if (ui.mcPopup.currentLabel == "Inventory")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({
                                    "eventType":"refreshItems",
                                    "sInstruction":"previewEquipOnly"
                                });
                            };
                            if (ui.mcPopup.currentLabel == "Shop")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcShop")).update({
                                    "eventType":"refreshItems",
                                    "sInstruction":"closeWindows"
                                });
                            };
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (((((("You have upgraded " + iSel.sName) + " with ") + resObj.EnhName) + ", level ") + resObj.EnhLvl) + "!");
                            modalO.params = {};
                            modalO.glow = "white,medium";
                            modalO.btns = "mono";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            break;
                        case "loadHairShop":
                            world.hairshopinfo = resObj;
                            openCharacterCustomize();
                            break;
                        case "buyItem":
                            if (resObj.CharItemID == -1)
                            {
                                if ((("bSoldOut" in resObj) && (resObj.bSoldOut)))
                                {
                                    if (world.shopinfo.bLimited)
                                    {
                                        MovieClip(ui.mcPopup.getChildByName("mcShop")).update({
                                            "eventType":"refreshShop",
                                            "sInstruction":"closeWindows"
                                        });
                                    };
                                    modal = new ModalMC();
                                    modalO = {};
                                    modalO.strBody = (resObj.strMessage + " is no longer in stock.");
                                    modalO.params = {};
                                    modalO.glow = "red,medium";
                                    modalO.btns = "mono";
                                    ui.ModalStack.addChild(modal);
                                    modal.init(modalO);
                                }
                                else
                                {
                                    if (resObj.strMessage != null)
                                    {
                                        MsgBox.notify(resObj.strMessage);
                                    };
                                };
                            }
                            else
                            {
                                item = copyObj(world.shopBuyItem);
                                item.CharItemID = resObj.CharItemID;
								item.iQty = resObj.iQty;
                                if (item.bCoins == 0)
                                {
                                    world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold - Number(item.iCost));
                                    ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
                                    if (ui.mcPopup.currentLabel == "Inventory")
                                    {
                                        MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshCoins"});
                                    };
                                }
                                else
                                {
                                    item.iHrs = 0;
                                    world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins - Number(item.iCost));
                                };
                                showItemDrop(item, false);
                                if (world.invTree[item.ItemID] == null)
                                {
                                    world.invTree[item.ItemID] = copyObj(resObj);
                                    world.invTree[item.ItemID].iQty = 0;
                                };
                                world.myAvatar.addItem(item);
                                if (item.bHouse == 1)
                                {
                                    if (((item.sType == "House") && (!(world.isHouseEquipped()))))
                                    {
                                        world.sendEquipItemRequest(item);
                                        world.myAvatar.getItemByID(item.ItemID).bEquip = 1;
                                    };
                                    ui.mcPopup.mcHouseShop.reset();
                                }
                                else
                                {
                                    if (ui.mcPopup.currentLabel == "Shop")
                                    {
                                        MovieClip(ui.mcPopup.getChildByName("mcShop")).update({"eventType":"refreshCoins"});
                                        MovieClip(ui.mcPopup.getChildByName("mcShop")).update({
                                            "eventType":"refreshItems",
                                            "sInstruction":"closeWindows"
                                        });
                                        if (world.shopinfo.bLimited)
                                        {
                                            MovieClip(ui.mcPopup.getChildByName("mcShop")).update({"eventType":"refreshShop"});
                                        };
                                    }
                                    else
                                    {
                                        if (ui.mcPopup.currentLabel == "MergeShop")
                                        {
                                            MovieClip(ui.mcPopup.getChildByName("mcShop")).update({"eventType":"refreshCoins"});
                                            MovieClip(ui.mcPopup.getChildByName("mcShop")).update({"eventType":"refreshItems"});
                                        }
                                        else
                                        {
                                            if (ui.mcPopup.currentLabel == "Inventory")
                                            {
                                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshCoins"});
                                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({
                                                    "eventType":"refreshItems",
                                                    "sInstruction":"closeWindows"
                                                });
                                            };
                                        };
                                    };
                                };
                                world.updateQuestProgress("item", item);
                            };
                            break;
                        case "sellItem":
                            if (resObj.iQty != null)
                            {
                                world.myAvatar.removeItem(resObj.CharItemID, resObj.iQty);
                            }
                            else
                            {
                                world.myAvatar.removeItem(resObj.CharItemID);
                            };
                            if (resObj.bCoins == 1)
                            {
                                world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins + resObj.intAmount);
                            }
                            else
                            {
                                if (world.myAvatar.objData.intGold < 3000000)
                                {
                                    world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold + resObj.intAmount);
                                    ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
                                };
                            };
                            if (ui.mcPopup.currentLabel == "Shop")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcShop")).update({"eventType":"refreshCoins"});
                                MovieClip(ui.mcPopup.getChildByName("mcShop")).update({
                                    "eventType":"refreshItems",
                                    "sInstruction":"closeWindows"
                                });
                            }
                            else
                            {
                                if (ui.mcPopup.currentLabel == "Inventory")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshCoins"});
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({
                                        "eventType":"refreshItems",
                                        "sInstruction":"closeWindows"
                                    });
                                }
                                else
                                {
                                    if (ui.mcPopup.currentLabel == "HouseShop")
                                    {
                                        MovieClip(ui.mcPopup.getChildByName("mcHouseShop")).reset();
                                    };
                                };
                            };
                            world.checkAllQuestStatus();
                            break;
                        case "removeItem":
                            if (resObj.iQty != null)
                            {
                                world.myAvatar.removeItem(resObj.CharItemID, resObj.iQty);
                            }
                            else
                            {
                                world.myAvatar.removeItem(resObj.CharItemID);
                            };
                            if (ui.mcPopup.currentLabel == "Inventory")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshItems"});
                            };
                            world.checkAllQuestStatus();
                            break;
                        case "updateClass":
                            avt = world.getAvatarByUserID(resObj.uid);
                            if (((!(avt == null)) && (!(avt.objData == null))))
                            {
                                avt.objData.strClassName = resObj.sClassName;
                                avt.objData.iCP = resObj.iCP;
                                avt.objData.sClassCat = resObj.sClassCat;
                                avt.updateRep();
                                if (resObj.uid == sfc.myUserId)
                                {
                                    if (("sDesc" in resObj))
                                    {
                                        avt.objData.sClassDesc = resObj.sDesc;
                                    };
                                    if (("sStats" in resObj))
                                    {
                                        avt.objData.sClassStats = resObj.sStats;
                                    };
                                    if (("aMRM" in resObj))
                                    {
                                        avt.objData.aClassMRM = resObj.aMRM;
                                    };
                                };
                            };
                            break;
                        case "equipItem":
                            avt = world.getAvatarByUserID(resObj.uid);
                            tLeaf = world.getUoLeafById(resObj.uid);
							if (("ItemID" in resObj))
							{
								if (world.invTree[resObj.ItemID] != null)
								{
									world.invTree[resObj.ItemID].bBound = 1;
								};
							};
                            if (avt != null)
                            {
                                if (((!(avt.pMC == null)) && (!(avt.objData == null))))
                                {
                                    avt.objData.eqp[resObj.strES] = {};
                                    avt.objData.eqp[resObj.strES].sFile = ((resObj.sFile == "undefined") ? "" : resObj.sFile);
                                    avt.objData.eqp[resObj.strES].sLink = resObj.sLink;
									avt.objData.eqp[resObj.strES].bBound = 1;
                                    if (("sType" in resObj))
                                    {
                                        avt.objData.eqp[resObj.strES].sType = resObj.sType;
                                    };
                                    if (("ItemID" in resObj))
                                    {
                                        avt.objData.eqp[resObj.strES].ItemID = resObj.ItemID;
                                    };
                                    if (("sMeta" in resObj))
                                    {
                                        avt.objData.eqp[resObj.strES].sMeta = resObj.sMeta;
                                    };
                                    avt.loadMovieAtES(resObj.strES, resObj.sFile, resObj.sLink);
                                };
                                if (avt.isMyAvatar)
                                {
                                    avt.equipItem(resObj.CharItemID, resObj.ItemID);
                                    if (MovieClip(ui.mcPopup.getChildByName("mcInventory")) != null)
                                    {
                                        MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshItems"});
                                    };
                                    if (ui.mcPopup.mcTempInventory != null)
                                    {
                                        ui.mcPopup.mcTempInventory.mcItemList.refreshList();
                                        ui.mcPopup.mcTempInventory.refreshDetail();
                                    };
                                };
                            };
                            break;
                        case "unequipItem":
                            avt = world.getAvatarByUserID(resObj.uid);
                            if (avt != null)
                            {
                                if (avt.pMC != null)
                                {
                                    delete avt.objData.eqp[resObj.strES];
                                    avt.unloadMovieAtES(resObj.strES);
                                };
                                if (avt.isMyAvatar)
                                {
                                    avt.unequipItem(resObj.CharItemID, resObj.ItemID);
                                    if (ui.mcPopup.currentLabel == "Inventory")
                                    {
                                        MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshItems"});
                                    };
                                    if (ui.mcPopup.mcTempInventory != null)
                                    {
                                        ui.mcPopup.mcTempInventory.mcItemList.refreshList();
                                        ui.mcPopup.mcTempInventory.refreshDetail();
                                    };
                                };
                            };
                            break;
                        case "dropItem":
                            for (dID in resObj.items)
                            {
                                dItem = null;
                                if (world.invTree[dID] == null)
                                {
                                    world.invTree[dID] = copyObj(resObj.items[dID]);
                                    world.invTree[dID].iQty = 0;
                                    dItem = resObj.items[dID];
                                }
                                else
                                {
                                    dItem = copyObj(world.invTree[dID]);
                                    dItem.iQty = int(resObj.items[dID].iQty);
                                };
                                if (resObj.Wheel != null)
                                {
                                    try
                                    {
                                        world.map.doWheelDrop(dItem);
                                    }
                                    catch(e)
                                    {
                                    };
                                }
                                else
                                {
                                    showItemDrop(dItem, true);
                                };
                            };
                            break;
                        case "referralReward":
                            for (dID in resObj.items)
                            {
                                dItem = null;
                                if (world.invTree[dID] == null)
                                {
                                    world.invTree[dID] = copyObj(resObj.items[dID]);
                                    world.invTree[dID].iQty = 0;
                                    dItem = resObj.items[dID];
                                }
                                else
                                {
                                    dItem = copyObj(world.invTree[dID]);
                                    dItem.iQty = int(resObj.items[dID].iQty);
                                };
                            };
                            dropItem = new DFrameMC(dItem);
                            ui.dropStack.addChild(dropItem);
                            dropItem.init();
                            dropItem.fY = (dropItem.y = -(dropItem.fHeight + 8));
                            dropItem.fX = (dropItem.x = -(dropItem.fWidth / 2));
                            cleanDropStack();
                            break;
                        case "getDrop":
                            i = 0;
                            while (i < ui.dropStack.numChildren)
                            {
                                mc = (ui.dropStack.getChildAt(i) as MovieClip);
                                if (((!(mc.fData == null)) && (mc.fData.ItemID == resObj.ItemID)))
                                {
                                    if (resObj.bSuccess == 1)
                                    {
                                        mc.gotoAndPlay("out");
                                    }
                                    else
                                    {
                                        modal = new ModalMC();
                                        modalO = {};
                                        modalO.strBody = "Item could not be added to your inventory! Please make sure your inventory is not full or the item is already present in your inventory/bank.";
                                        modalO.params = {};
                                        modalO.glow = "red,medium";
                                        modalO.btns = "mono";
                                        ui.ModalStack.addChild(modal);
                                        modal.init(modalO);
                                        mc.cnt.ybtn.mouseEnabled = true;
                                        mc.cnt.ybtn.mouseChildren = true;
                                    };
                                };
                                i = (i + 1);
                            };
                            if (resObj.bSuccess == 1)
                            {
                                dropitem = copyObj(world.invTree[resObj.ItemID]);
                                dropitem.CharItemID = resObj.CharItemID;
                                dropitem.bBank = resObj.bBank;
                                dropitem.iQty = int(resObj.iQty);
                                if (resObj.EnhID != null)
                                {
                                    dropitem.EnhID = int(resObj.EnhID);
                                    dropitem.EnhLvl = int(resObj.EnhLvl);
                                    dropitem.EnhPatternID = int(resObj.EnhPatternID);
                                    dropitem.EnhRty = int(resObj.EnhRty);
                                };
                                world.myAvatar.addItem(dropitem);
                                world.updateQuestProgress("item", dropitem);
                                if (resObj.showDrop == 1)
                                {
                                    showItemDrop(dropitem, false);
                                };
                                if (ui.mcPopup.currentLabel == "Inventory")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshItems"});
                                };
                                if (((ui.mcPopup.currentLabel == "Shop") || (ui.mcPopup.currentLabel == "MergeShop")))
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcShop")).update({"eventType":"refreshItems"});
                                };
                                if (resObj.pendingID != null)
                                {
                                    world.myAvatar.updatePending(int(resObj.pendingID));
                                };
                            };
                            break;
                        case "addItems":
                            for (ItemID in resObj.items)
                            {
                                if (world.invTree[ItemID] == null)
                                {
                                    itemObj = copyObj(resObj.items[ItemID]);
                                }
                                else
                                {
                                    itemObj = copyObj(world.invTree[ItemID]);
                                    itemObj.iQty = int(resObj.items[ItemID].iQty);
                                };
                                showItemDrop(itemObj, true);
                                world.myAvatar.addTempItem(itemObj);
                                world.updateQuestProgress("item", itemObj);
                                if (itemObj.sMeta == "doUpdate")
                                {
                                    try
                                    {
                                        world.map.doUpdate();
                                    }
                                    catch(e)
                                    {
                                    };
                                };
                            };
                            break;
                        case "Wheel":
                            dropItem = copyObj(resObj.dropItems["18927"]);
                            dropItem.CharItemID = resObj.charItem1;
                            if (world.invTree["18927"] == null)
                            {
                                dropItem.bBank = 0;
                            };
                            trace(("dropQty: " + resObj.dropQty));
                            dropItem.iQty = ((resObj.dropQty != null) ? Number(resObj.dropQty) : 1);
                            world.myAvatar.addItem(dropItem);
                            dropItem = copyObj(resObj.dropItems["19189"]);
                            dropItem.CharItemID = resObj.charItem2;
                            if (world.invTree["19189"] == null)
                            {
                                dropItem.bBank = 0;
                            };
                            dropItem.iQty = 1;
                            world.myAvatar.addItem(dropItem);
                            if (resObj.Item != null)
                            {
                                dropItem = copyObj(resObj.Item);
                                dropItem.CharItemID = resObj.CharItemID;
                                dropItem.bBank = 0;
                                dropItem.iQty = 1;
                                world.myAvatar.addItem(dropItem);
                            };
                            if (ui.mcPopup.currentLabel == "Inventory")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshItems"});
                            };
                            try
                            {
                                world.map.doWheelDrop(resObj.Item, resObj.dropQty);
                            }
                            catch(e)
                            {
                                trace(("error in wheel function: " + e));
                            };
                        case "powerGem":
                            for (ItemID in resObj.items)
                            {
                                if (world.invTree[ItemID] == null)
                                {
                                    itemObj = copyObj(resObj.items[ItemID]);
                                }
                                else
                                {
                                    itemObj = copyObj(world.invTree[ItemID]);
                                    itemObj.iQty = int(resObj.items[ItemID].iQty);
                                };
                                showItemDrop(itemObj, false);
                                world.myAvatar.addItem(itemObj);
                            };
                            break;
                        case "forceAddItem":
                            for (fi in resObj.items)
                            {
                                iobj = copyObj(resObj.items[fi]);
                                world.myAvatar.addItem(iobj);
                            };
                            break;
                        case "warvalues":
                            world.map.updateWarValues(resObj.wars);
                            break;
                        case "enhp":
                            for each (o in resObj.o)
                            {
                                world.enhPatternTree[o.ID] = o;
                            };
                            break;
                        case "turnIn":
                            if (((!(resObj.sItems == null)) && (resObj.sItems.length >= 3)))
                            {
                                itemArr = resObj.sItems.split(",");
                                dropindex = 0;
                                while (dropindex < itemArr.length)
                                {
                                    dropID = itemArr[dropindex].split(":")[0];
                                    dropQty = int(itemArr[dropindex].split(":")[1]);
                                    if (world.invTree[dropID].bTemp == 0)
                                    {
                                        world.myAvatar.removeItemByID(dropID, dropQty);
                                    }
                                    else
                                    {
                                        world.myAvatar.removeTempItem(dropID, dropQty);
                                    };
                                    dropindex++;
                                };
                            };
                            if (ui.mcPopup.currentLabel == "Inventory")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshItems"});
                            };
                            break;
                        case "getQuest":
                            break;
                        case "getQuests":
                            for (qi in resObj.quests)
                            {
                                if (world.questTree[qi] == null)
                                {
                                    o = resObj.quests[qi];
                                    world.questTree[qi] = o;
                                    for (qr in o.oReqd)
                                    {
                                        if (world.invTree[qr] == null)
                                        {
                                            world.invTree[qr] = o.oReqd[qr];
                                            world.invTree[qr].iQty = 0;
                                        };
                                    };
                                    for (qj in o.oItems)
                                    {
                                        if (world.invTree[qj] == null)
                                        {
                                            world.invTree[qj] = o.oItems[qj];
                                            world.invTree[qj].iQty = 0;
                                        };
                                    };
                                    qk = "";
                                    qat = ["itemsS", "itemsC", "itemsR", "itemsrand"];
                                    i = 0;
                                    while (i < qat.length)
                                    {
                                        s = qat[i];
                                        if (o.oRewards[s] != null)
                                        {
                                            for (ri in o.oRewards[s])
                                            {
                                                if (isNaN(ri))
                                                {
                                                    qk = ri.ItemID;
                                                }
                                                else
                                                {
                                                    qk = o.oRewards[s][ri].ItemID;
                                                };
                                                if (world.invTree[qk] == null)
                                                {
                                                    world.invTree[qk] = copyObj(o.oRewards[s][ri]);
                                                    world.invTree[qk].iQty = 0;
                                                };
                                            };
                                        };
                                        i = (i + 1);
                                    };
                                };
                            };
                            if (ui.ModalStack.numChildren > 0)
                            {
                                MovieClip(ui.ModalStack.getChildAt(0)).open();
                            };
                            break;
                        case "getQuests2":
                            for (qi in resObj.quests)
                            {
                                if (world.questTree[qi] == null)
                                {
                                    o = resObj.quests[qi];
                                    world.questTree[qi] = o;
                                    for (qr in o.oReqd)
                                    {
                                        if (world.invTree[qr] == null)
                                        {
                                            world.invTree[qr] = o.oReqd[qr];
                                            world.invTree[qr].iQty = 0;
                                        };
                                    };
                                    for (qj in o.oItems)
                                    {
                                        if (world.invTree[qj] == null)
                                        {
                                            world.invTree[qj] = o.oItems[qj];
                                            world.invTree[qj].iQty = 0;
                                        };
                                    };
                                    qk = "";
                                    qat = ["itemsS", "itemsC", "itemsR", "itemsrand"];
                                    i = 0;
                                    while (i < qat.length)
                                    {
                                        s = qat[i];
                                        if (o.oRewards[s] != null)
                                        {
                                            for (ri in o.oRewards[s])
                                            {
                                                if (isNaN(ri))
                                                {
                                                    qk = ri.ItemID;
                                                }
                                                else
                                                {
                                                    qk = o.oRewards[s][ri].ItemID;
                                                };
                                                if (world.invTree[qk] == null)
                                                {
                                                    world.invTree[qk] = copyObj(o.oRewards[s][ri]);
                                                    world.invTree[qk].iQty = 0;
                                                };
                                            };
                                        };
                                        i = (i + 1);
                                    };
                                };
                            };
                            createApop();
                            break;
                        case "ccqr":
                            if (resObj.bSuccess == 0)
                            {
                                MsgBox.notify("Quest Complete Failed!");
                            }
                            else
                            {
                                if (("eventTrigger" in MovieClip(world.map)))
                                {
                                    world.map.eventTrigger({
                                        "cmd":"questComplete",
                                        "args":resObj.QuestID
                                    });
                                };
                                world.completeQuest(resObj.QuestID);
                                if (ui.ModalStack.numChildren)
                                {
                                    fgWin = ui.ModalStack.getChildAt(0);
                                    if (((!(fgWin == null)) && (fgWin.toString().indexOf("QFrameMC") > -1)))
                                    {
                                        fgWin.turninResult(resObj.QuestID);
                                    };
                                };
                                showQuestpopup(resObj);
                                if (apop_ != null)
                                {
                                    apop_.questComplete(int(resObj.QuestID));
                                };
                            };
						break;
                        case "updateQuest":
                            world.setQuestValue(resObj.iIndex, resObj.iValue);
                            break;
                        case "showQuestLink":
                            world.showQuestLink(resObj);
                            break;
                        case "dailylogin":
                            break;
                        case "initMonData":
                            for (m in resObj.mon)
                            {
                                world.updateMonster(resObj.mon[m]);
                            };
                            break;
                        case "aura+":
                        case "aura*":
                        case "aura-":
                        case "aura--":
                        case "aura++":
                        case "aura+p":
                            world.handleAuraEvent(cmd, resObj);
                            break;
                        case "clearAuras":
                            tAvt = world.myAvatar;
                            tLeaf = tAvt.dataLeaf;
                            world.showAuraChange({
                                "cmd":"aura-",
                                "auras":tLeaf.auras
                            }, tAvt, tLeaf);
                            tLeaf.auras = [];
                            break;
                        case "uotls":
                            userTreeWrite(resObj.unm, resObj.o);
                            break;
                        case "mtls":
                            monsterTreeWrite(resObj.id, resObj.o, resObj.targets);
                            break;
                        case "cb":
                            if (resObj.m != null)
                            {
                                for (updateID in resObj.m)
                                {
                                    monsterTreeWrite(int(updateID), resObj.m[updateID]);
                                };
                            };
                            if (resObj.p != null)
                            {
                                for (updateID in resObj.p)
                                {
                                    userTreeWrite(updateID, resObj.p[updateID]);
                                };
                            };
                            if (resObj.anims != null)
                            {
                                if (sfcSocial)
                                {
                                    for each (o in resObj.anims)
                                    {
                                        if (resObj.isProc)
                                        {
                                            doAnim(o, resObj.isProc);
                                        }
                                        else
                                        {
                                            doAnim(o);
                                        };
                                    };
                                };
                            };
                            if (resObj.a != null)
                            {
                                i = 0;
                                while (i < resObj.a.length)
                                {
                                    world.handleAuraEvent(resObj.a[i].cmd, resObj.a[i]);
                                    i = (i + 1);
                                };
                            };
                            break;
                        case "ct":
                            anim = new Object();
                            if (resObj.m != null)
                            {
                                for (updateID in resObj.m)
                                {
                                    monsterTreeWrite(int(updateID), resObj.m[updateID]);
                                };
                            };
                            if (resObj.p != null)
                            {
                                for (updateID in resObj.p)
                                {
                                    userTreeWrite(updateID, resObj.p[updateID]);
                                };
                            };
                            if (resObj.a != null)
                            {
                                j = 0;
                                while (j < resObj.a.length)
                                {
                                    try
                                    {
                                        k = 0;
                                        while (k < resObj.a[j].auras.length)
                                        {
                                            if (resObj.a[j].auras[k].spellOn != null)
                                            {
                                                anim[resObj.a[j].auras[k].spellOn] = resObj.a[j].auras[k].dur;
                                            };
                                            k++;
                                        };
                                    }
                                    catch(e)
                                    {
                                    };
                                    world.handleAuraEvent(resObj.a[j].cmd, resObj.a[j]);
                                    j = (j + 1);
                                };
                            };
                            if (resObj.sara != null)
                            {
                                for each (o in resObj.sara)
                                {
                                    world.handleSAR(o);
                                };
                            };
                            if (resObj.sarsa != null)
                            {
                                for each (o in resObj.sarsa)
                                {
                                    world.handleSARS(o);
                                };
                            };
                            if (resObj.anims != null)
                            {
                                if (sfcSocial)
                                {
                                    for each (o in resObj.anims)
                                    {
                                        trace(anim[o.strl]);
                                        if (resObj.isProc)
                                        {
                                            doAnim(o, resObj.isProc, anim[o.strl]);
                                        }
                                        else
                                        {
                                            doAnim(o, false, anim[o.strl]);
                                        };
                                    };
                                };
                            };
                            if (resObj.pvp != null)
                            {
                                switch (resObj.pvp.cmd)
                                {
                                    case "PVPS":
                                        updatePVPScore(resObj.pvp.pvpScore);
                                        break;
                                    case "PVPC":
                                        world.PVPResults.pvpScore = resObj.pvp.pvpScore;
                                        world.PVPResults.team = resObj.pvp.team;
                                        updatePVPScore(resObj.pvp.pvpScore);
                                        togglePVPPanel("results");
                                        break;
                                };
                            };
                            break;
                        case "sar":
                            world.handleSAR(resObj);
                            break;
                        case "sars":
                            world.handleSARS(resObj);
                            break;
                        case "showAuraResult":
                            world.showAuraImpact(resObj);
                            break;
                        case "anim":
                            if (sfcSocial)
                            {
                                doAnim(resObj);
                            };
                            break;
                        case "sAct":
                            world.actions = {};
                            world.actions.active = [];
                            world.actions.passive = [];
                            world.actionMap = [null, null, null, null, null, null, null];
                            blanki = 0;
                            while (blanki < 7)
                            {
                                ui.mcInterface.actBar.getChildByName(("blank" + blanki)).visible = true;
                                actBar = ui.mcInterface.actBar;
                                delIcon = actBar.getChildByName(("i" + (blanki + 1)));
                                if (delIcon != null)
                                {
                                    delIcon.removeEventListener(MouseEvent.CLICK, actIconClick);
                                    delIcon.removeEventListener(MouseEvent.MOUSE_OVER, actIconOver);
                                    delIcon.removeEventListener(MouseEvent.MOUSE_OUT, actIconOut);
                                    if (delIcon.icon2 != null)
                                    {
                                        delIcon.removeEventListener(Event.ENTER_FRAME, world.countDownAct);
                                        if (delIcon.icon2.mask != null)
                                        {
                                            actBar.removeChild(delIcon.icon2.mask);
                                            delIcon.icon2.mask = null;
                                        };
                                        actBar.removeChild(delIcon.icon2);
                                    };
                                    actBar.removeChild(delIcon);
                                };
                                blanki++;
                            };
                            slot = 0;
                            ai = 0;
                            while (ai < resObj.actions.active.length)
                            {
                                actObj = resObj.actions.active[ai];
                                actObj.sArg1 = "";
                                actObj.sArg2 = "";
                                world.actions.active.push(actObj);
                                actObj.ts = 0;
                                actObj.actID = -1;
                                actObj.lock = false;
                                world.actionMap[ai] = actObj.ref;
                                actIconClass = (getDefinitionByName("ib2") as Class);
                                actIcon = new (actIconClass)();
                                actIconMC = ui.mcInterface.actBar.addChild(actIcon);
                                slot = (ai < resObj.actions.active.length - 1) ? ai : 6;
                                blankMC = ui.mcInterface.actBar.getChildByName("blank" + slot);
                                actIconMC.x = blankMC.x;
                                actIconMC.width = 42;
                                actIconMC.height = 39;
                                actIconMC.name = String(("i" + (ai + 1)));
                                actIconMC.actionIndex = ai;
                                actIconMC.actObj = actObj;
                                actIconMC.icon2 = null;
                                actIconMC.tQty.visible = false;
                                actIconMC.y = (actIconMC.y - 6);
                                updateIcons([actIconMC], actObj.icon.split(","), null);
                                blankMC.visible = false;
                                actIconMC.addEventListener(MouseEvent.MOUSE_OVER, actIconOver, false, 0, true);
                                actIconMC.addEventListener(MouseEvent.MOUSE_OUT, actIconOut, false, 0, true);
                                actIconMC.mouseChildren = false;
                                if (((!(actObj.auto == null)) && (actObj.auto == true)))
                                {
                                    world.actions.auto = world.actions.active[ai];
                                }
                                else
                                {
                                    world.actions.active[ai].auto = false;
                                };
                                if (actObj.isOK)
                                {
                                    actIconMC.addEventListener(MouseEvent.CLICK, actIconClick, false, 0, true);
                                    actIconMC.buttonMode = true;
                                }
                                else
                                {
                                    c = new Color();
                                    c.setTint(0x333333, 0.9);
                                    actIconMC.cnt.transform.colorTransform = c;
                                };
                                ai = (ai + 1);
                            };
                            world.myAvatar.dataLeaf.passives = [];
                            if (resObj.actions.passive != null)
                            {
                                ai = 0;
                                while (ai < resObj.actions.passive.length)
                                {
                                    actObj = copyObj(resObj.actions.passive[ai]);
                                    actObj.sArg1 = "";
                                    actObj.sArg2 = "";
                                    world.actions.passive.push(actObj);
                                    if (actObj.auras != null)
                                    {
                                        i = 0;
                                        while (i < actObj.auras.length)
                                        {
                                            world.myAvatar.dataLeaf.passives.push(actObj.auras[i]);
                                            i = (i + 1);
                                        };
                                    };
                                    ai = (ai + 1);
                                };
                            };
						break;
                        case "seia":
                            if (resObj.iRes == 1)
                            {
                                ai = 0;
                                while (ai < world.actions.active.length)
                                {
                                    o = world.actions.active[ai];
                                    if (o.ref == "i1")
                                    {
                                        if (("tgtMax" in o))
                                        {
                                            delete o.tgtMax;
                                        };
                                        if (("tgtMin" in o))
                                        {
                                            delete o.tgtMin;
                                        };
                                        if (("auras" in o))
                                        {
                                            delete o.auras;
                                        };
                                        if (o.OldCD == null)
                                        {
                                            o.OldCD = o.cd;
                                        };
                                        for (s in resObj.o)
                                        {
                                            if (((((!(s == "nam")) && (!(s == "ref"))) && (!(s == "desc"))) && (!(s == "typ"))))
                                            {
                                                o[s] = resObj.o[s];
                                            };
                                        };
                                    };
                                    ai = (ai + 1);
                                };
                            };
                            break;
                        case "stu":
                            avt = world.myAvatar;
                            unm = sfc.myUserName;
                            uoLeaf = world.uoTreeLeaf(unm);
                            if (resObj.wDPS != null)
                            {
                                uoLeaf.wDPS = resObj.wDPS;
                            };
                            if (resObj.mDPS != null)
                            {
                                uoLeaf.mDPS = resObj.mDPS;
                            };
                            if (uoLeaf.sta == null)
                            {
                                uoLeaf.sta = {};
                            };
                            for (stuS in resObj.sta)
                            {
                                uoLeaf.sta[stuS] = resObj.sta[stuS];
                                if (stats.indexOf(stuS.substr(1)) > -1)
                                {
                                    uoLeaf.sta[stuS] = int(uoLeaf.sta[stuS]);
                                }
                                else
                                {
                                    uoLeaf.sta[stuS] = Number(uoLeaf.sta[stuS]);
                                };
                                if (stuS.toLowerCase().indexOf("$tha") > -1)
                                {
                                    actObj = world.getAutoAttack();
                                    if ((((!(actObj == null)) && (!(uoLeaf == null))) && (!(uoLeaf.sta == null))))
                                    {
                                        cd = Math.round((actObj.cd * (1 - Math.min(Math.max(uoLeaf.sta.$tha, -1), 0.5))));
                                        if (world.autoActionTimer.running)
                                        {
                                            world.autoActionTimer.delay = (world.autoActionTimer.delay - (world.autoActionTimer.delay - cd));
                                            world.autoActionTimer.delay = (world.autoActionTimer.delay + 100);
                                            world.autoActionTimer.reset();
                                            world.autoActionTimer.start();
                                        }
                                        else
                                        {
                                            world.autoActionTimer.delay = cd;
                                        };
                                    }
                                    else
                                    {
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("Login event order error");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                        trace("**");
                                    };
                                    hasteCoeff = (1 - Math.min(Math.max(uoLeaf.sta.$tha, -1), 0.5));
                                    world.GCD = Math.round((hasteCoeff * world.GCDO));
                                    for each (actObj in world.actions.active)
                                    {
                                        if (((((actObj.isOK) && (!(world.getActIcons(actObj)[0] == null))) && (world.getActIcons(actObj)[0].icon2 == null)) && ((now - actObj.ts) < (actObj.cd * hasteCoeff))))
                                        {
                                            world.coolDownAct(actObj, ((actObj.cd * hasteCoeff) - (now - actObj.ts)), now);
                                        };
                                    };
                                };
                                if (stuS.toLowerCase().indexOf("$cmc") > -1)
                                {
                                    world.updateActBar();
                                };
                            };
                            if (resObj.tempSta != null)
                            {
                                uoLeaf.tempSta = resObj.tempSta;
                                if (("updatePStats" in world.map))
                                {
                                    world.map.updatePStats();
                                };
                            };
                            if (avt != null)
                            {
                                world.updatePortrait(avt);
                            };
                            break;
                        case "cvu":
                            updateCoreValues(resObj.o);
                            break;
                        case "event":
                            world.map.eventTrigger(resObj);
                            break;
                        case "modinfo":
                            world.map.showModInfo(resObj);
                            break;
                        case "modinc":
                            if (resObj.bSuccess)
                            {
                                world.map.hideLoading();
                                world.map.show(resObj.events);
                                world.modID = int(resObj.mID);
                            }
                            else
                            {
                                chatF.pushMsg("warning", resObj.msg, "SERVER", "", 0);
                            };
                            break;
                        case "ia":
                            if (("iaPathMC" in resObj))
                            {
                                try
                                {
                                    mc = world;
                                    mcPath = resObj.iaPathMC.split(".");
                                    while (mcPath.length > 0)
                                    {
                                        s = String(mcPath.shift());
                                        if (mc.getChildByName(s) != null)
                                        {
                                            mc = (mc.getChildByName(s) as MovieClip);
                                        }
                                        else
                                        {
                                            mc = mc[s];
                                        };
                                    };
                                }
                                catch(e:Error)
                                {
                                };
                            }
                            else
                            {
                                if (resObj.str != null)
                                {
                                    avt = world.getAvatarByUserID(int(resObj.str));
                                    if (avt != null)
                                    {
                                        mc = avt.pMC;
                                    };
                                }
                                else
                                {
                                    mc = MovieClip(world.CHARS.getChildByName(resObj.oName));
                                };
                            };
                            if (((!(mc == null)) && (!(mc == world))))
                            {
                                try
                                {
                                    switch (resObj.typ)
                                    {
                                        case "rval":
                                            mc.userName = resObj.unm;
                                            mc.iaF(resObj);
                                            break;
                                        case "str":
                                            if (resObj.str == null)
                                            {
                                                mc.userName = resObj.unm;
                                            };
                                            mc.iaF(resObj);
                                            break;
                                        case "flourish":
                                            mc.userName = resObj.unm;
                                            mc.gotoAndPlay(resObj.oFrame);
                                            break;
                                    };
                                }
                                catch(e:Error)
                                {
                                    trace(("error: " + e));
                                };
                            };
                            break;
                        case "siau":
                            world.updateCellMap(resObj);
                            break;
                        case "umsg":
                            addUpdate(resObj.s);
                            break;
                        case "gi":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (((resObj.owner + " has invited you to join the guild ") + resObj.gName) + ". Do you accept?");
                            modalO.callback = world.doGuildAccept;
                            modalO.params = {
                                "guildID":resObj.guildID,
                                "owner":resObj.owner
                            };
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", ((resObj.owner + " has invited you to join the guild ") + resObj.gName), "SERVER", "", 0);
                            break;
                        case "gd":
                            chatF.pushMsg("server", (resObj.unm + " has declined your invitation."), "SERVER", "", 0);
                            break;
                        case "ga":
                            avt = world.getAvatarByUserName(resObj.unm);
                            if (avt != null)
                            {
                                avt.updateGuild(resObj.guild);
                                if (avt.isMyAvatar)
                                {
                                    chatF.chn.guild.act = 1;
                                    chatF.pushMsg("server", "You have joined the guild.", "SERVER", "", 0);
                                }
                                else
                                {
                                    if (world.myAvatar.objData.guild.Name == avt.objData.guild.Name)
                                    {
                                        chatF.pushMsg("server", (avt.pnm + " has joined the guild."), "SERVER", "", 0);
                                        world.myAvatar.updateGuild(resObj.guild);
                                    };
                                };
                            }
                            else
                            {
                                if (resObj.guild.Name == world.myAvatar.objData.guild.Name)
                                {
                                    chatF.pushMsg("server", (resObj.unm + " has joined the guild."), "SERVER", "", 0);
                                    world.myAvatar.updateGuild(resObj.guild);
                                };
                            };
                            break;
                        case "gr":
                            avt = world.getAvatarByUserName(resObj.unm);
                            if (avt != null)
                            {
                                avt.updateGuild(null);
                                if (avt.isMyAvatar)
                                {
                                    chatF.chn.guild.act = 0;
                                    chatF.pushMsg("server", "You have been removed from the guild.", "SERVER", "", 0);
                                }
                                else
                                {
                                    if (world.myAvatar.objData.guild.Name == avt.objData.guild.Name)
                                    {
                                        chatF.pushMsg("server", (avt.pnm + " has been removed from the guild."), "SERVER", "", 0);
                                        world.myAvatar.updateGuild(resObj.guild);
                                    };
                                };
                            };
                            if (world.myAvatar.objData.guild != null)
                            {
                                if (world.myAvatar.objData.guild.Name == resObj.guild.Name)
                                {
                                    chatF.pushMsg("server", (resObj.unm + " has been removed from the guild."), "SERVER", "", 0);
                                    world.myAvatar.updateGuild(resObj.guild);
                                };
                            };
                            break;
                        case "guildDelete":
                            avt = world.getAvatarByUserName(resObj.unm);
                            if (avt != null)
                            {
                                avt.updateGuild(null);
                                if (avt.isMyAvatar)
                                {
                                    chatF.pushMsg("server", resObj.msg, "SERVER", "", 0);
                                };
                            };
                            break;
                        case "gMOTD":
                            world.myAvatar.objData.guild.MOTD = resObj.MOTD[0];
                            break;
                        case "updateGuild":
                            try
                            {
                                if (world.myAvatar.objData != null)
                                {
                                    world.myAvatar.updateGuild(resObj.guild);
                                };
                            }
                            catch(e)
                            {
                            };
                            if (resObj.msg != null)
                            {
                                chatF.pushMsg("server", resObj.msg, "SERVER", "", 0);
                            };
                            break;
                        case "gc":
                            avt = world.getAvatarByUserID(resObj.uid);
                            avt.initGuild(resObj.guild);
                            break;
                        case "interior":
                            break;
                        case "guildhall":
                            break;
                        case "guildinv":
                            break;
                        case "pi":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.owner + " has invited you to join their group.  Do you accept?");
                            modalO.callback = world.doPartyAccept;
                            modalO.params = {"pid":resObj.pid};
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.owner + " has invited you to a group."), "SERVER", "", 0);
                            break;
                        case "pa":
                            if (world.partyOwner == "")
                            {
                                world.partyOwner = resObj.owner;
                            };
                            supressMupltiples = false;
                            if (world.partyID == -1)
                            {
                                world.partyID = resObj.pid;
                                chatF.chn.party.act = 1;
                                if (resObj.owner.toLowerCase() != sfc.myUserName)
                                {
                                    chatF.pushMsg("server", "You have joined the party.", "SERVER", "", 0);
                                    supressMupltiples = true;
                                };
                            };
                            i = 0;
                            while (i < resObj.ul.length)
                            {
                                unm = resObj.ul[i];
                                if (unm.toLowerCase() != sfc.myUserName)
                                {
                                    world.addPartyMember(unm);
                                    if (!supressMupltiples)
                                    {
                                        chatF.pushMsg("server", (unm + " has joined the party."), "SERVER", "", 0);
                                    };
                                };
                                i = (i + 1);
                            };
                            break;
                        case "pr":
                            isYou = false;
                            nam = world.partyOwner;
                            world.partyOwner = resObj.owner;
                            if (nam != world.partyOwner)
                            {
                                chatF.pushMsg("server", (world.partyOwner + " is now the party leader."), "SERVER", "", 0);
                            };
                            if (resObj.unm.toLowerCase() == sfc.myUserName.toLowerCase())
                            {
                                isYou = true;
                                chatF.chn.party.act = 0;
                            };
                            if (resObj.typ == "k")
                            {
                                if (isYou)
                                {
                                    chatF.pushMsg("server", "You have been removed from the party", "SERVER", "", 0);
                                }
                                else
                                {
                                    chatF.pushMsg("server", (resObj.unm + " has been removed from the party"), "SERVER", "", 0);
                                };
                            }
                            else
                            {
                                if (resObj.typ == "l")
                                {
                                    if (isYou)
                                    {
                                        chatF.pushMsg("server", "You have left the party", "SERVER", "", 0);
                                    }
                                    else
                                    {
                                        chatF.pushMsg("server", (resObj.unm + " has left the party"), "SERVER", "", 0);
                                    };
                                };
                            };
                            world.removePartyMember(String(resObj.unm).toLowerCase());
                            break;
                        case "pp":
                            nam = world.partyOwner;
                            world.partyOwner = resObj.owner;
                            if (nam != world.partyOwner)
                            {
                                chatF.pushMsg("server", (world.partyOwner + " is now the party leader."), "SERVER", "", 0);
                            };
                            world.updatePartyFrame();
                            break;
                        case "ps":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.unm + " wants to summon you to them.  Do you accept?");
                            modalO.callback = world.acceptPartySummon;
                            modalO.params = resObj;
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.unm + " is trying to summon you to them."), "SERVER", "", 0);
                            break;
                        case "pd":
                            chatF.pushMsg("server", (resObj.unm + " has declined your invitation."), "SERVER", "", 0);
                            break;
                        case "pc":
                            if (world.partyID > -1)
                            {
                                chatF.pushMsg("server", "Your party has been disbanded", "SERVER", "", 0);
                            };
                            world.partyID = -1;
                            world.partyOwner = "";
                            world.partyMembers = [];
                            world.updatePartyFrame();
                            chatF.chn.party.act = 0;
                            if (chatF.chn.cur == chatF.chn.party)
                            {
                                chatF.chn.cur = chatF.chn.zone;
                            };
                            if (chatF.chn.lastPublic == chatF.chn.party)
                            {
                                chatF.chn.lastPublic = chatF.chn.zone;
                            };
                            break;
                        case "PVPQ":
                            world.handlePVPQueue(resObj);
                            break;
                        case "PVPI":
                            world.receivePVPInvite(resObj);
                            break;
                        case "PVPE":
                            relayPVPEvent(resObj);
                            break;
                        case "PVPS":
                            updatePVPScore(resObj.pvpScore);
                            break;
                        case "PVPC":
                            world.PVPResults.pvpScore = resObj.pvpScore;
                            world.PVPResults.team = resObj.team;
                            updatePVPScore(resObj.pvpScore);
                            togglePVPPanel("results");
                            break;
                        case "pvpbreakdown":
                            break;
                        case "di":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.owner + " has challenged you to a duel.  Do you accept?");
                            modalO.callback = world.doDuelAccept;
                            modalO.params = {"unm":resObj.owner};
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.owner + " has challenged you to a duel."), "SERVER", "", 0);
                            break;
                        case "DuelEX":
                            world.duelExpire();
                            break;
                        case "loadFactions":
                            world.myAvatar.initFactions(resObj.factions);
                            break;
                        case "addFaction":
                            world.myAvatar.addFaction(resObj.faction);
                            break;
                        case "loadFriendsList":
                            world.myAvatar.initFriendsList(resObj.friends);
                            break;
                        case "requestFriend":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.unm + " has invited you to be friends. Do you accept?");
                            modalO.callback = world.addFriend;
                            modalO.params = {
                                "ID":resObj.ID,
                                "unm":resObj.unm
                            };
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.unm + " has invited you to be friends."), "SERVER", "", 0);
                            break;
                        case "addFriend":
                            world.myAvatar.addFriend(resObj.friend);
                            break;
                        case "updateFriend":
                            world.myAvatar.updateFriend(resObj.friend);
                            break;
                        case "deleteFriend":
                            world.myAvatar.deleteFriend(resObj.ID);
                            break;
                        case "isModerator":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.btns = "mono";
                            if (resObj.val)
                            {
                                modalO.strBody = (resObj.unm + " is staff!");
                                modalO.glow = "gold,medium";
                                chatF.pushMsg("server", (resObj.unm + " is staff!"), "SERVER", "", 0);
                            }
                            else
                            {
                                modalO.strBody = (resObj.unm + " is NOT staff!");
                                modalO.glow = "red,medium";
                                chatF.pushMsg("warning", (resObj.unm + " is NOT staff!"), "SERVER", "", 0);
                            };
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            break;
                        case "loadWarVars":
                            world.objResponse["loadWarVars"] = resObj;
                            world.dispatchEvent(new Event("loadWarVars"));
                            break;
                        case "setAchievement":
                            world.updateAchievement(resObj.field, resObj.index, resObj.value);
                            break;
                        case "loadQuestStringData":
                            world.objQuestString = resObj.obj;
                            world.dispatchEvent(new Event("QuestStringData_Complete"));
                            break;
                        case "getAdData":
                            if (resObj.bSuccess == 1)
                            {
                                world.adData = resObj.bh;
                                world.dispatchEvent(new Event("getAdData"));
                            };
                            break;
                        case "getAdReward":
                            world.myAvatar.objData.iDailyAds = (world.myAvatar.objData.iDailyAds + 1);
                            world.adData = null;
                            if (world.myAvatar.objData.iDailyAds < world.myAvatar.objData.iDailyAdCap)
                            {
                                world.sendGetAdDataRequest();
                            };
                            world.myAvatar.objData.intGold = (world.myAvatar.objData.intGold + int(resObj.iGold));
                            ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold;
                            if (ui.mcPopup.currentLabel == "Inventory")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshCoins"});
                            };
                            world.myAvatar.objData.intCoins = (world.myAvatar.objData.intCoins + int(resObj.iCoins));
                            sMsg = (("Congratulations! You just received <font color='#FFCC00'><b>" + resObj.iGold) + " Gold</b></font>");
                            if (resObj.iCoins > 0)
                            {
                                sMsg = (sMsg + ((" and <font color='#990099'><b>" + resObj.iCoins) + " Adventure Coins</b></font>"));
                            };
                            sMsg = (sMsg + " from Ballyhoo.");
                            showMessageBox(sMsg);
                            break;
                        case "xpboost":
                            manageXPBoost(resObj);
                            break;
                        case "gboost":
                            manageGBoost(resObj);
                            break;
                        case "repboost":
                            manageRepBoost(resObj);
                            break;
                        case "cpboost":
                            manageCPBoost(resObj);
                            break;
                        case "gettimes":
                            a = [];
                            for (s in resObj.o)
                            {
                                o = resObj.o[s];
                                o.s = s;
                                a.push(o);
                            };
                            a.sortOn("t", (Array.NUMERIC | Array.DESCENDING));
                            trace(" ** GETTIMES START **");
                            i = 0;
                            while (i < a.length)
                            {
                                o = a[i];
                                trace(((((((((o.s + ",") + o.t) + ",") + o.n) + ",") + numToStr((o.t / o.n))) + ",") + Math.round(o.d)));
                                i = (i + 1);
                            };
                            trace(" ** GETTIMES END **");
                            break;
                        case "clockTick":
                            if (("eventTrigger" in MovieClip(world.map)))
                            {
                                world.map.eventTrigger(resObj);
                            };
                            break;
                        case "castWait":
                            try
                            {
                                world.map.fishGame.castingWait(resObj.wait, resObj.derp);
                            }
                            catch(e)
                            {
                            };
                            break;
                        case "CatchResult":
                            world.myAvatar.addRep(20, resObj.catchResult.myRep);
                            try
                            {
                                world.map.fishGame.showCatch(resObj);
                            }
                            catch(e)
                            {
                            };
                            break;
                        case "alchOnStart":
                            world.map.alchemyGame.onStart(resObj);
                            break;
                        case "alchComplete":
                            world.map.alchemyGame.checkComplete(resObj);
                            break;
                        case "bookInfo":
                            world.bookData = resObj.bookData;
                            break;
                        case "spellOnStart":
                            world.map.mcGame.spellOnStart(resObj);
                            break;
                        case "spellComplete":
                            world.map.mcGame.spellComplete(resObj);
                            break;
                        case "spellWaitTimer":
                            world.map.mcGame.spellWaitTimer(resObj);
                            break;
                        case "playerDeath":
                            if (("eventTrigger" in MovieClip(world.map)))
                            {
                                world.map.eventTrigger(resObj);
                            };
                            break;
                        case "getScrolls":
                            trace("getScrolls recieved");
                            try
                            {
                                world.scrollData = resObj.scrolls;
                                world.map.initScrollData();
                            }
                            catch(e)
                            {
                                trace("error finding function");
                            };
                            break;
                        case "turninscroll":
                            if (resObj.IDs != null)
                            {
                                i = 0;
                                while (i < resObj.IDs.length)
                                {
                                    world.myAvatar.updateScrolls(int(resObj.IDs[i]));
                                    i = (i + 1);
                                };
                                s = "";
                                i = 0;
                                while (i < 500)
                                {
                                    s = (s + String.fromCharCode(0));
                                    i = (i + 1);
                                };
                                world.myAvatar.objData.pending = s;
                                try
                                {
                                    world.map.displayTurnins(resObj.IDs);
                                }
                                catch(e)
                                {
                                    trace("error displaying turnins");
                                };
                            };
                            break;
                        case "getapop":
                            if (resObj.apopData != null)
                            {
                                trace(("apopID: " + resObj.apopData.apopID));
                                apopTree[String(resObj.apopData.apopID)] = resObj.apopData;
                                if (!resObj.bQuests)
                                {
                                    createApop();
                                };
                            };
						break;
						case "startTrade":
                            toggleTradePanel(resObj.userid, resObj.username);
                            (world.tradeinfo = {
                                "itemsA":[],
                                "itemsB":[],
                                "hasRequested":{}
                            });
                            break;
                        case "ti":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = (resObj.owner + " has requested you to trade. Do you accept?");
                            modalO.callback = world.doTradeAccept;
                            modalO.params = {unm:resObj.owner};
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.owner + " has requested you to trade."), "SERVER", "", 0);
                            break;
                        case "loadOffer":
                            if (resObj.bitSuccess)
                            {
                                if (((!(resObj.itemsA == null)) && (!(resObj.itemsA == "undefined"))))
                                {
                                    world.addItemsToTradeA(resObj.itemsA);
                                };
                                if (((!(resObj.itemsB == null)) && (!(resObj.itemsB == "undefined"))))
                                {
                                    world.addItemsToTradeB(resObj.itemsB);
                                };
                                if (ui.mcPopup.currentLabel == "TradePanel")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"refreshItems"});
                                    MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"refreshBank"});
                                    MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"refreshInventory"});
                                }
                                else
                                {
                                    ui.mcPopup.fOpen("TradePanel");
                                };
                            }
                            else
                            {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = "Error loading trade items!  Try logging out and back in to fix this problem.";
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
                        case "tradeDeal":
                            if (resObj.bitSuccess)
                            {
                                if ((("onHold" in resObj) && (resObj.onHold == 1)))
                                {
                                    (ctrlTrade.btnDeal.alpha = 0.5);
                                    (ctrlTrade.btnDeal.mouseEnabled = false);
                                }
                                else
                                {
                                    if (ui.mcPopup.currentLabel == "TradePanel")
                                    {
                                        (MovieClip(ui.mcPopup.getChildByName("mcTrade")).notify = false);
                                        MovieClip(ui.mcPopup.getChildByName("mcTrade")).fClose();
                                    };
                                };
                                if (("msg" in resObj))
                                {
                                    modal = new ModalMC();
									modalO = {};
									modalO.strBody = resObj.msg;
									modalO.params = {};
									modalO.glow = "green,medium";
									modalO.btns = "mono";
									ui.ModalStack.addChild(modal);
									modal.init(modalO);
                                };
                            }
                            else
                            {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.msg;
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
                        case "tradeCancel":
                            if (resObj.bitSuccess)
                            {
                                world.myAvatar.tradeToInvReset();
                                if (ui.mcPopup.currentLabel == "TradePanel")
                                {
                                    (MovieClip(ui.mcPopup.getChildByName("mcTrade")).notify = false);
                                    MovieClip(ui.mcPopup.getChildByName("mcTrade")).fClose();
                                };
                            };
                            break;
                        case "tradeLock":
                            if (resObj.bitSuccess)
                            {
                                (ctrlTrade.txtTargetGold.text = resObj.gold);
                                (ctrlTrade.txtTargetCoins.text = resObj.coins);
                                if ((("Deal" in resObj) && (resObj.Deal == 1)))
                                {
                                    (ctrlTrade.btnDeal.alpha = 1);
                                    (ctrlTrade.btnDeal.mouseEnabled = true);
                                };
                                if ((("Self" in resObj) && (resObj.Self == 1)))
                                {
                                    (ctrlTrade.txtMyGold.mouseEnabled = false);
                                    (ctrlTrade.txtMyCoins.mouseEnabled = false);
                                    (ctrlTrade.txtLock.text = "Unlock");
                                    (tradeItem1.alpha = 0.5);
                                }
                                else
                                {
                                    (tradeItem2.alpha = 0.5);
                                };
                            }
                            else
                            {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.msg;
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
                        case "refreshItems":
                            if (ui.mcPopup.currentLabel == "Inventory")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshCoins"});
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({
                                    "eventType":"refreshItems",
                                    "sInstruction":"closeWindows"
                                });
                            };
                            break;
                        case "tradeUnlock":
                            if (resObj.bitSuccess)
                            {
                                (ctrlTrade.txtLock.text = "Lock");
                                (ctrlTrade.btnDeal.alpha = 0.5);
                                (ctrlTrade.btnDeal.mouseEnabled = false);
                                (ctrlTrade.txtMyGold.mouseEnabled = true);
                                (ctrlTrade.txtMyCoins.mouseEnabled = true);
                                (tradeItem1.alpha = 1);
                                (tradeItem2.alpha = 1);
                            };
                            break;
                        case "tradeFromInv":
                            if ((("bSuccess" in resObj) && (resObj.bSuccess == 1)))
                            {
                                world.myAvatar.tradeFromInv(resObj.ItemID, resObj.Type, resObj.Quantity);
                                world.checkAllQuestStatus();
                                if (ui.mcPopup.currentLabel == "TradePanel")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"refreshItems"});
                                    MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"refreshBank"});
                                    MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"refreshInventory"});
                                };
                            }
                            else
                            {
                                modal = new ModalMC();
                                modalO = {};
                                modalO.strBody = resObj.msg;
                                modalO.params = {};
                                modalO.glow = "red,medium";
                                modalO.btns = "mono";
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
                            break;
                        case "tradeToInv":
                            if (resObj.Type == 1)
                            {
                                world.myAvatar.tradeToInvA(resObj.ItemID);
                            }
                            else
                            {
                                world.myAvatar.tradeToInvB(resObj.ItemID);
                            };
                            world.checkAllQuestStatus();
                            if (ui.mcPopup.currentLabel == "TradePanel")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"refreshItems"});
                                MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"refreshBank"});
                                MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"refreshInventory"});
                            };
                            break;
                        case "tradeSwapInv":
                            world.myAvatar.tradeSwapInv(resObj.invItemID, resObj.tradeItemID);
                            world.checkAllQuestStatus();
                            if (ui.mcPopup.currentLabel == "TradePanel")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"refreshItems"});
                                MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"refreshBank"});
                                MovieClip(ui.mcPopup.getChildByName("mcTrade")).update({"eventType":"refreshInventory"});
                            };
						break;
						case "gwi":
                            (modal = null);
                            (modalO = null);
                            (modal = new ModalMC());
                            (modalO = {});
                            (modalO.strBody = (resObj.owner + " has challenged you to a guild war. Do you accept?"));
                            (modalO.callback = world.doGuildWarAccept);
                            (modalO.params = {"unm":resObj.owner});
                            (modalO.btns = "dual");
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
                            chatF.pushMsg("server", (resObj.owner + " has challenged you to a guild war."), "SERVER", "", 0);
						break;
                        case "GuildWarEX":
                            world.GuildWarExpire();
						break;
						case "gs":
                            modal = null;
                            modalO = null;
                            modal = new ModalMC();
                            modalO = {};
                            modalO.strBody = ("Your guild master " + resObj.owner + " has summoned you. Do you accept?");
                            modalO.callback = world.doGuildLeaderSummonAccept;
                            modalO.params = {unm:resObj.owner};
                            modalO.btns = "dual";
                            ui.ModalStack.addChild(modal);
                            modal.init(modalO);
						break;
						case "GuildSummonEX":
                            world.GuildLeaderSummonExpire();
						break;
						case "popupmsg":
							modal = new ModalMC();
							modalO = {};
							modalO.strBody = resObj.strMsg;
							modalO.params = {};
							modalO.glow = resObj.strGlow;
							modalO.btns = "mono";
							ui.ModalStack.addChild(modal);
							modal.init(modalO);
						break;
						case "popupach":
							showAchievement(resObj.strName, resObj.AchievementID);	
							mixer.playSound("Achievement");
						break;
						case "emoticon":
							strLabel = resObj.emoji;
                            uid = resObj.uid;
                            pMC = world.getMCByUserID(uid);
                            if (pMC != null)
                            {
								pMC.mcEmoticon.visible = true;
								pMC.mcEmoticon.gotoAndStop(strToProperCase(strLabel));
                            };
						break;
						case "currentQuests":
							if (resObj.bitSuccess)
							{
								i = 0;
								while (i < resObj.Quests.length)
								{
									world.acceptQuest(resObj.Quests[i], true);
									i++;
								};
							};
						break;
						case "denyDrop":
							i = 0;
							while (i < ui.dropStack.numChildren)
							{
								(mc = (ui.dropStack.getChildAt(i) as MovieClip));
								if (((!(mc.fData == null)) && (mc.fData.ItemID == resObj.ItemID)))
								{
									if (resObj.bSuccess == 1)
									{
										mc.gotoAndPlay("out");
									}
									else
									{
										(modal = new ModalMC());
										(modalO = {});
										(modalO.strBody = "Item could not be removed from your dropped list.");
										(modalO.params = {});
										(modalO.glow = "red,medium");
										(modalO.btns = "mono");
										ui.ModalStack.addChild(modal);
										modal.init(modalO);
										(mc.cnt.ybtn.mouseEnabled = true);
										(mc.cnt.ybtn.mouseChildren = true);
									};
								};
								(i = (i + 1));
							};
							cleanDropStack();
						break;
						case "guildList":
							if (resObj.bitSuccess)
							{
								ui.mcPopup.mcGuildBoard.distributeList(resObj.lists, resObj.totalGuilds);
							};
						break;
						case "updateGoldCoins":
                            if (("gold" in resObj))
                            {
                                (world.myAvatar.objData.intGold = Number(resObj.gold));
                                (ui.mcInterface.mcGold.strGold.text = world.myAvatar.objData.intGold);
                            };
                            if (("coins" in resObj))
                            {
                                (world.myAvatar.objData.intCoins = Number(resObj.coins));
                                (ui.mcInterface.mcGold.strCoins.text = world.myAvatar.objData.intCoins);
                            };
                            if (ui.mcPopup.currentLabel == "Inventory")
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshCoins"});
                            };
                            if (((ui.mcPopup.currentLabel == "MergeShop") || (ui.mcPopup.currentLabel == "Shop")))
                            {
                                MovieClip(ui.mcPopup.getChildByName("mcShop")).update({"eventType":"refreshCoins"});
                            };
                            mixer.playSound("Coins");
						break;
						case "loadForge":
                            if (world.forgeinfo != null)
                            {
                                trace(" >>>> Shop reload detected");
                                i = 0;
                                while (i < resObj.forgeinfo.items.length)
                                {
                                    world.forgeinfo.items.push(resObj.forgeinfo.items[i]);
                                    world.forgeinfo.items.shift();
                                    i = (i + 1);
                                };
                                if (ui.mcPopup.currentLabel == "Forge")
                                {
                                    MovieClip(ui.mcPopup.getChildByName("mcForge")).update({"eventType":"refreshItems"});
                                }
                                else
                                {
                                    ui.mcPopup.fOpen("Forge");
                                };
                            }
                            else
                            {
                                world.forgeinfo = resObj.forgeinfo;
                                ui.mcPopup.fOpen("Forge");
                            };
						break;
						case "resurrectPlayer":
                            (world.map.transform.colorTransform = world.defaultCT);
                            (world.CHARS.transform.colorTransform = world.defaultCT);
                            chatF.submitMsg("/getup", "emotea", sfc.myUserName);
                            (world.actionReady = true);
                            (world.bitWalk = true);
                            (ui.mcRes.visible = false);
                            ui.mcRes.gotoAndStop(1);
						break;
                        case "respawnClient":
                            (world.map.transform.colorTransform = world.defaultCT);
                            (world.CHARS.transform.colorTransform = world.defaultCT);
                            chatF.submitMsg("/getup", "emotea", sfc.myUserName);
                            (world.actionReady = true);
                            (world.bitWalk = true);
                            (ui.mcRes.visible = false);
                            ui.mcRes.gotoAndStop(1);
						break;
						case "unbindItem":
                            if (resObj.bitSuccess)
                            {
                                if (("ItemID" in resObj))
                                {
                                    if (world.invTree[resObj.ItemID] != null)
                                    {
                                        (world.invTree[resObj.ItemID].bBound = 0);
                                        if (MovieClip(ui.mcPopup.getChildByName("mcInventory")) != null)
                                        {
                                            MovieClip(ui.mcPopup.getChildByName("mcInventory")).update({"eventType":"refreshItems"});
                                        };
                                        (modal = new ModalMC());
                                        (modalO = {});
                                        (modalO.strBody = (world.invTree[resObj.ItemID].sName + " has been successfuly unbound."));
                                        (modalO.params = {});
                                        (modalO.glow = "green,medium");
                                        (modalO.btns = "mono");
                                        ui.ModalStack.addChild(modal);
                                        modal.init(modalO);
                                    };
                                };
                            }
                            else
                            {
                                (modal = new ModalMC());
                                (modalO = {});
                                (modalO.strBody = resObj.msg);
                                (modalO.params = {});
                                (modalO.glow = "red,medium");
                                (modalO.btns = "mono");
                                ui.ModalStack.addChild(modal);
                                modal.init(modalO);
                            };
						break;
                    };
                };
                try
                {
                    if (world.map.Events != null)
                    {
                        trace("events not null");
                        if (world.map.Events[cmd] != null)
                        {
                            trace(("sending: " + cmd));
                            world.map.responseEvent(cmd, resObj);
                        };
                    };
                }
                catch(e)
                {
                    trace(("error in responseEvent: " + e));
                };
            };
            addFrameScript(0, frame1, 11, frame12, 12, frame13, 21, frame22, 31, frame32);
            Security.allowDomain("*.aq.com");
            Security.allowDomain("*.aqworlds.com");
            this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            sfc = new SmartFoxClient();
            sfc.debug = true;
            sfc.smartConnect = false;
            sfc.addEventListener(SFSEvent.onConnection, onConnectionHandler);
            sfc.addEventListener(SFSEvent.onConnectionLost, onConnectionLostHandler);
            sfc.addEventListener(SFSEvent.onLogin, onLoginHandler);
            sfc.addEventListener(SFSEvent.onLogout, onLogoutHandler);
            sfc.addEventListener(SFSEvent.onObjectReceived, onObjectReceivedHandler);
            sfc.addEventListener(SFSEvent.onRoundTripResponse, onRoundTripResponseHandler);
            sfc.addEventListener(SFSEvent.onExtensionResponse, onExtensionResponseHandler);
            for each (multiO in sfcA)
            {
            };
            (classCatMap.M1.ratios = [0.27, 0.3, 0.22, 0.05, 0.1, 0.06]);
            (classCatMap.M2.ratios = [0.2, 0.22, 0.33, 0.05, 0.1, 0.1]);
            (classCatMap.M3.ratios = [0.24, 0.2, 0.2, 0.24, 0.07, 0.05]);
            (classCatMap.M4.ratios = [0.3, 0.18, 0.3, 0.02, 0.06, 0.14]);
            (classCatMap.C1.ratios = [0.06, 0.2, 0.11, 0.33, 0.15, 0.15]);
            (classCatMap.C2.ratios = [0.08, 0.27, 0.1, 0.3, 0.1, 0.15]);
            (classCatMap.C3.ratios = [0.06, 0.23, 0.05, 0.28, 0.28, 0.1]);
            (classCatMap.S1.ratios = [0.22, 0.18, 0.21, 0.08, 0.08, 0.23]);
            sfci = 0;
            while (sfci < sfcA.length)
            {
                (sfcO = sfcA[sfci]);
                (sfcO.sfc = new SmartFoxClient());
                (sfcO.sfc.debug = true);
                (sfcO.rootClass = this);
                (sfcO.cLoginZone = cLoginZone);
                (sfcO.clientToken = clientToken);
                (sfcO.serverPort = serverPort);
                (sfcO.loginInfo = {});
                (sfcO.onMultiConnectionHandler = function (_arg_1:SFSEvent):void
                {
                    var _local_2:Object;
                    if (_arg_1.params.success)
                    {
                        _local_2 = getSfcBySFC(_arg_1.currentTarget);
                        trace(((("MULTI.onMultiConnectionHandler > " + _local_2.sLogin) + " on ") + _local_2.sIP));
                        _local_2.sfc.login(_local_2.cLoginZone, ((_local_2.clientToken + "~") + _local_2.sLogin), _local_2.strToken);
                    }
                    else
                    {
                        trace("failed");
                    };
                });
                (sfcO.onMultiConnectionLostHandler = onMultiConnectionLostHandler);
                (sfcO.onMultiLogoutHandler = onMultiLogoutHandler);
                (sfcO.loginLoader = new URLLoader());
                (sfcO.login = function ():void
                {
                    var rand:Number;
                    var url:String;
                    var request:URLRequest;
                    var variables:URLVariables;
                    rand = rn.rand();
                    url = ((params.loginURL + "?ran=") + rand);
                    request = new URLRequest(url);
                    variables = new URLVariables();
                    (variables.strUsername = this.sLogin);
                    (variables.strPassword = this.sPass);
                    (request.data = variables);
                    (request.method = URLRequestMethod.POST);
                    this.loginLoader.addEventListener(Event.COMPLETE, sfcO.onLoginComplete);
                    try
                    {
                        this.loginLoader.load(request);
                    }
                    catch(e:Error)
                    {
                        trace("Unable to load URL");
                    };
                });
                (sfcO.onLoginComplete = function (_arg_1:Event):void
                {
                    var _local_2:Object;
                    var _local_3:Object;
                    _local_2 = getSfcByLoader(_arg_1.currentTarget);
                    if (_local_2 != null)
                    {
                        trace(((("MULTI.onLoginComplete > " + _local_2.sLogin) + " on ") + _local_2.sIP));
                        _local_3 = XMLtoObject(new XML(_arg_1.target.data));
                        _local_2.loginLoader.removeEventListener(Event.COMPLETE, _local_2.onLoginComplete);
                        (_local_2.strToken = _local_3.sToken);
                        _local_2.sfc.connect(_local_2.sIP, _local_2.serverPort);
                    }
                    else
                    {
                        trace("MULTI.onLoginComplete > Unable to resolve host object");
                    };
                });
                sfcO.sfc.addEventListener(SFSEvent.onConnection, sfcO.onMultiConnectionHandler);
                sfcO.sfc.addEventListener(SFSEvent.onConnectionLost, sfcO.onMultiConnectionLostHandler);
                sfcO.sfc.addEventListener(SFSEvent.onLogout, sfcO.onMultiLogoutHandler);
                sfci = (sfci + 1);
            };
            (userPreference = SharedObject.getLocal("AQWUserPref", "/"));
            inituoPref();
            if (((!(userPreference.data.bSoundOn == null)) && (userPreference.data.bSoundOn == false)))
            {
                (mixer.bSoundOn = false);
            };
            if (!mixer.bSoundOn)
            {
                (SoundMixer.soundTransform = new SoundTransform(0));
            };
            (uoPref.bSoundOn = mixer.bSoundOn);
            if (userPreference.data.quality == null)
            {
                (userPreference.data.quality = "AUTO");
            };
            initArrRep();
            (chatF = new Chat());
            (chatF.rootClass = this);
            addChildAt(new Sprite(), 0);
        }

        public static function trim(_arg_1:String):String
        {
            if (_arg_1 == null)
            {
                return ("");
            };
            return (_arg_1.replace(/^\s+|\s+$/g, ""));
        }

        public static function XMLtoObject(_arg_1:XML):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:*;
            var _local_2:* = {};
            for (_local_3 in _arg_1.attributes())
            {
                _local_2[String(_arg_1.attributes()[_local_3].name())] = String(_arg_1.attributes()[_local_3]);
            };
            for (_local_4 in _arg_1.children())
            {
                _local_5 = _arg_1.children()[_local_4].name();
                if (_local_2[_local_5] == undefined)
                {
                    _local_2[_local_5] = [];
                };
                _local_2[_local_5].push(XMLtoObject(_arg_1.children()[_local_4]));
            };
            return (_local_2);
        }

        public static function convertXMLtoObject(_arg_1:XML):*
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:XML;
            var _local_6:*;
            var _local_2:* = {};
            for (_local_3 in _arg_1.attributes())
            {
                _local_2[String(_arg_1.attributes()[_local_3].name())] = String(_arg_1.attributes()[_local_3]);
            };
            for (_local_4 in _arg_1.children())
            {
                _local_5 = _arg_1.children()[_local_4];
                if (_local_5.nodeKind() == "text")
                {
                    if (_local_5 == parseFloat(_local_5).toString())
                    {
                        return (parseFloat(_local_5));
                    };
                    return (_local_5);
                };
                if (_local_5.nodeKind() == "element")
                {
                    _local_6 = _arg_1.children()[_local_4].name();
                    if (_local_2[_local_6] == null)
                    {
                        _local_2[_local_6] = convertXMLtoObject(_arg_1.children()[_local_4]);
                    }
                    else
                    {
                        if (!(_local_2[_local_6] is Array))
                        {
                            _local_2[_local_6] = [_local_2[_local_6]];
                        };
                        _local_2[_local_6].push(convertXMLtoObject(_arg_1.children()[_local_4]));
                    };
                };
            };
            return (_local_2);
        }

        private static function makeGrayscale(_arg_1:DisplayObject, _arg_2:int=0, _arg_3:Number=0.33):void
        {
            var _local_6:Color;
            if (_arg_1 == null)
            {
                return;
            };
            var _local_4:Array = [_arg_3, _arg_3, _arg_3, 0, 0, _arg_3, _arg_3, _arg_3, 0, 0, _arg_3, _arg_3, _arg_3, 0, 0, _arg_3, _arg_3, _arg_3, 1, 0];
            var _local_5:ColorMatrixFilter = new ColorMatrixFilter(_local_4);
            _arg_1.filters = [_local_5];
            if (_arg_2 != 0)
            {
                _local_6 = new Color();
                _local_6.brightness = -(_arg_2 / 100);
                _arg_1.transform.colorTransform = _local_6;
            };
        }


        public function loadAccountCreation(_arg_1:String):*
        {
            mcAccount.removeChildAt(0);
            var _local_2:Loader = new Loader();
            trace((("newchar " + Game.serverFilePath) + _arg_1));
            _local_2.load(new URLRequest((Game.serverFilePath + _arg_1)), new LoaderContext(false, new ApplicationDomain(null)));
            mcAccount.addChild(_local_2);
        }

        public function monsterTreeWrite(_arg_1:int, _arg_2:Object, _arg_3:*=null):void
        {
            var _local_5:String;
            var _local_6:String;
            var _local_7:*;
            var _local_8:Avatar;
            var _local_9:Avatar;
            var _local_10:Avatar;
            var _local_11:Avatar;
            var _local_12:MovieClip;
            var _local_16:int;
            var _local_17:String;
            var _local_18:int;
            var _local_19:*;
            var _local_20:*;
            var _local_4:int;
            var _local_13:* = "";
            var _local_14:Object = {};
            var _local_15:Object = world.monTree[_arg_1];
            if (_local_15 != null)
            {
                _local_16 = -1;
                if (((!(_local_15 == null)) && (!(_local_15.intState == null))))
                {
                    _local_16 = _local_15.intState;
                };
                for (_local_17 in _arg_2)
                {
                    _local_6 = _local_17;
                    _local_7 = _arg_2[_local_17];
                    _local_14[_local_6] = _local_7;
                    if (_local_6.toLowerCase().indexOf("int") > -1)
                    {
                        _local_7 = int(_local_7);
                    };
                    if (_local_6 == "react")
                    {
                        _local_7 = _local_7.split(",");
                        _local_18 = 0;
                        while (_local_18 < _local_7.length)
                        {
                            _local_7[_local_18] = int(_local_7[_local_18]);
                            _local_18++;
                        };
                    };
                    _local_15[_local_6] = _local_7;
                };
                _local_13 = "";
                for (_local_13 in _local_14)
                {
                    _local_6 = _local_13;
                    _local_7 = _local_14[_local_13];
                    if (_local_6.toLowerCase().indexOf("evt:") < 0)
                    {
                        _local_10 = world.getMonster(_arg_1);
                        if (_local_10 != null)
                        {
                            if (_local_6.toLowerCase().indexOf("hp") > -1)
                            {
                                if (((!(_local_10 == null)) && (!(_local_10.objData == null))))
                                {
                                    _local_7 = int(_local_7);
                                    _local_10.objData[_local_13] = _local_7;
                                    if (world.myAvatar.target == _local_10)
                                    {
                                        world.updatePortrait(_local_10);
                                    };
                                    if (((!(world.objLock == null)) && ((_local_6 == "intHP") && (_local_7 <= 0))))
                                    {
                                        world.intKillCount++;
                                        world.updatePadNames();
                                    };
                                    if (((!(_local_10.objData == null)) && ("boolean")))
                                    {
                                        if (_local_10.objData.strFrame == world.strFrame)
                                        {
                                            if (_local_7 <= 0)
                                            {
                                                _local_10.pMC.stopWalking();
                                                world.removeAuraFX(_local_10.pMC, "all");
                                                _local_10.pMC.die();
                                                _local_15.auras = [];
                                                _local_15.targets = {};
                                                _local_10.target = null;
                                                if (("eventTrigger" in MovieClip(world.map)))
                                                {
                                                    world.map.eventTrigger({
                                                        "cmd":"monDeath",
                                                        "args":_arg_1,
                                                        "targets":_arg_2.targets
                                                    });
                                                };
                                                if (world.myAvatar.dataLeaf.targets[_local_10.objData.MonMapID] != null)
                                                {
                                                    delete world.myAvatar.dataLeaf.targets[_local_10.objData.MonMapID];
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                            if (_local_6.toLowerCase().indexOf("state") > -1)
                            {
                                if (((!(_local_10 == null)) && (!(_local_10.objData == null))))
                                {
                                    _local_7 = int(_local_7);
                                    _local_10.objData[_local_13] = _local_7;
                                    if (_local_7 != 2)
                                    {
                                        _local_10.dataLeaf.auras = [];
                                    };
                                    if (((!(_local_10.objData.strFrame == null)) && (_local_10.objData.strFrame == world.strFrame)))
                                    {
                                        if ((((_local_7 == 1) && (!(_local_10.pMC == null))) && ((!(_local_10.pMC.x == _local_10.pMC.ox)) || (!(_local_10.pMC.y == _local_10.pMC.oy)))))
                                        {
                                            _local_10.pMC.walkTo(_local_10.pMC.ox, _local_10.pMC.oy, world.WALKSPEED);
                                        };
                                    };
                                    if (_local_7 != 2)
                                    {
                                        _local_15.targets = {};
                                    };
                                };
                            };
                            if (_local_6.toLowerCase().indexOf("dx") > -1)
                            {
                                _local_7 = int(_local_7);
                                if ((((!(_local_10.objData == null)) && (!(_local_10.objData.strFrame == null))) && (_local_10.objData.strFrame == world.strFrame)))
                                {
                                    _local_19 = int(world.monTree[_arg_1].dx);
                                    _local_20 = int(world.monTree[_arg_1].dy);
                                    _local_10.pMC.walkTo(_local_19, _local_20, world.WALKSPEED);
                                };
                            };
                        };
                    };
                };
            };
        }

        public function userTreeWrite(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:String;
            var _local_5:String;
            var _local_6:*;
            var _local_7:Avatar;
            var _local_8:Avatar;
            var _local_9:Avatar;
            var _local_10:Avatar;
            var _local_11:MovieClip;
            var _local_16:String;
            var _local_17:int;
            var _local_3:int;
            var _local_12:* = "";
            var _local_13:Object = {};
            var _local_14:Object = {};
            var _local_15:Object = world.uoTree[_arg_1.toLowerCase()];
            _local_10 = world.getAvatarByUserName(_arg_1);
            for (_local_16 in _arg_2)
            {
                _local_5 = _local_16;
                _local_6 = _arg_2[_local_16];
                if ((((((_local_5.toLowerCase().indexOf("int") > -1) || (_local_5.toLowerCase() == "tx")) || (_local_5.toLowerCase() == "ty")) || (_local_5.toLowerCase() == "sp")) || (_local_5.toLowerCase() == "pvpTeam")))
                {
                    _local_6 = int(_local_6);
                };
                if ((((((((((sfcSocial) && (!(_local_15 == null))) && (!(world.myAvatar.dataLeaf == null))) && (_local_5.toLowerCase() == "inthp")) && (!(_arg_1.toLowerCase() == sfc.myUserName))) && (_local_15.strFrame == world.myAvatar.dataLeaf.strFrame)) && ((!(world.bPvP)) || (_local_15.pvpTeam == world.myAvatar.dataLeaf.pvpTeam))) && (_local_6 > 0)) && (!(world.getFirstHeal() == null))))
                {
                    if (((_local_6 <= _local_15.intHP) && (((_local_15.intHP - _local_6) >= (_local_15.intHPMax * 0.15)) || (_local_6 <= (_local_15.intHPMax * 0.5)))))
                    {
                        try
                        {
                            _local_10.pMC.showHealIcon();
                        }
                        catch(e:Error)
                        {
                        };
                    };
                    if (_local_6 > Math.round((_local_15.intHPMax * 0.5)))
                    {
                        try
                        {
                            if (_local_10.pMC.getChildByName("HealIconMC") != null)
                            {
                                MovieClip(_local_10.pMC.getChildByName("HealIconMC")).fClose();
                            };
                        }
                        catch(e:Error)
                        {
                        };
                    };
                };
                if (_local_5.toLowerCase() == "afk")
                {
                    _local_6 = (_local_6 == "true");
                };
                _local_13[_local_5] = _local_6;
                _local_14[_local_5] = _local_6;
            };
            _local_17 = -1;
            if (world.uoTree[_arg_1.toLowerCase()] != null)
            {
                _local_17 = world.uoTree[_arg_1.toLowerCase()].intState;
            };
            world.uoTreeLeafSet(_arg_1, _local_14);
            _local_15 = world.uoTree[_arg_1.toLowerCase()];
            if (world.isPartyMember(_arg_1))
            {
                world.updatePartyFrame({"unm":_local_15.strUsername});
            };
            _local_12 = "";
            for (_local_12 in _local_13)
            {
                _local_6 = _local_13[_local_12];
                if (_local_12.toLowerCase() == "strframe")
                {
                    world.manageAreaUser(_arg_1, "+");
                    if (_local_13[_local_12] != world.strFrame)
                    {
                        _local_11 = world.getMCByUserID(world.getUserByName(_arg_1).getId());
                        if (((!(_local_11 == null)) && (!(_local_11.stage == null))))
                        {
                            _local_11.pAV.hideMC();
                            if (_local_11.pAV == world.myAvatar.target)
                            {
                                world.setTarget(null);
                            };
                        };
                    }
                    else
                    {
                        if (_local_13.sp != null)
                        {
                            _local_11 = world.getMCByUserID(world.getUserByName(_arg_1).getId());
                            if (_local_11 != null)
                            {
                                _local_11.walkTo(_local_13.tx, _local_13.ty, world.WALKSPEED);
                            };
                        }
                        else
                        {
                            world.objectByID(_local_15.entID);
                        };
                    };
                };
                if (_local_12.toLowerCase() == "sp")
                {
                    if (_local_13.strFrame == world.strFrame)
                    {
                    };
                };
                if (_local_10 != null)
                {
                    if (((_local_12.toLowerCase().indexOf("inthp") > -1) || (_local_12.toLowerCase().indexOf("intmp") > -1)))
                    {
                        _local_6 = int(_local_6);
                        if (_local_10.objData != null)
                        {
                            _local_10.objData[_local_12] = _local_6;
                        };
                        if (((_local_10.isMyAvatar) || (world.myAvatar.target == _local_10)))
                        {
                            world.updatePortrait(_local_10);
                        };
                        if (_local_10.isMyAvatar)
                        {
                            world.updateActBar();
                        };
                        if (((!(_local_10.pMC == null)) && (world.showHPBar)))
                        {
                            _local_10.pMC.updateHPBar();
                        };
                    };
                    if (_local_12.toLowerCase().indexOf("intlevel") > -1)
                    {
                        _local_6 = int(_local_6);
                        if (_local_10.objData != null)
                        {
                            _local_10.objData[_local_12] = _local_6;
                            if (((!(_local_10.isMyAvatar)) && (world.myAvatar.target == _local_10)))
                            {
                                showPortraitBox(_local_10, ui.mcPortraitTarget);
                            };
                        };
                    };
                    if (_local_12.toLowerCase().indexOf("intstate") > -1)
                    {
                        _local_6 = int(_local_6);
                        if (((!(_local_10.objData == null)) && (world.uoTree[_arg_1.toLowerCase()].strFrame == world.strFrame)))
                        {
                            if (((_local_6 == 1) && (_local_17 == 0)))
                            {
                                _local_10.pMC.gotoAndStop("Idle");
                                _local_10.pMC.scale(world.SCALE);
                            };
                            if (((_local_6 == 1) && (_local_17 == 2)))
                            {
                                if (("eventTrigger" in MovieClip(world.map)))
                                {
                                };
                            };
                        };
                        if (_local_10.objData != null)
                        {
                            _local_10.objData[_local_12] = _local_6;
                        };
                        if ((((_local_6 == 0) && (world.uoTree[_arg_1.toLowerCase()].strFrame == world.strFrame)) && (!(_local_10.pMC == null))))
                        {
                            _local_10.pMC.stopWalking();
                            _local_10.pMC.mcChar.gotoAndPlay("Feign");
                            world.removeAuraFX(_local_10.pMC, "all");
                            if (_local_10.pMC.getChildByName("HealIconMC") != null)
                            {
                                MovieClip(_local_10.pMC.getChildByName("HealIconMC")).fClose();
                            };
                            if (_local_10.isMyAvatar)
                            {
                                world.cancelAutoAttack();
                                world.actionReady = false;
                                world.bitWalk = false;
                                world.map.transform.colorTransform = world.deathCT;
                                world.CHARS.transform.colorTransform = world.deathCT;
                                _local_10.pMC.transform.colorTransform = world.defaultCT;
                                world.showResCounter();
                            };
                        };
                        if (_local_6 != 2)
                        {
                            _local_15.targets = {};
                        };
                    };
                    if (_local_12.toLowerCase().indexOf("afk") > -1)
                    {
                        if (_local_10.pMC != null)
                        {
                            _local_10.pMC.updateName();
                        };
                    };
                    if (_local_12 == "showCloak")
                    {
                        if (_local_10.pMC != null)
                        {
                            _local_10.pMC.setCloakVisibility(_local_6);
                        };
                    };
                    if (_local_12 == "showHelm")
                    {
                        if (_local_10.pMC != null)
                        {
                            _local_10.pMC.setHelmVisibility(_local_6);
                        };
                    };
                    if (_local_12.toLowerCase().indexOf("cast") > -1)
                    {
                        if (_local_10.pMC != null)
                        {
                            if (_local_6.t > -1)
                            {
                                _local_10.pMC.stopWalking();
                                _local_10.pMC.queueAnim("Use");
                            }
                            else
                            {
                                _local_10.pMC.endAction();
                                if (_local_10 == world.myAvatar)
                                {
                                    ui.mcCastBar.fClose();
                                };
                            };
                        };
                    };
                };
            };
        }

        public function doAnim(anim:Object, isProc:Boolean=false, dur:*=null):void
        {
            var anims:Array;
            var animIndex:uint;
            var animStr:String;
            var pMC:MovieClip;
            var cLeaf:Object;
            var tLeaf:Object;
            var tAvt:Avatar;
            var cAvt:Avatar;
            var aura:Object;
            var buffer:* = undefined;
            var xBuffer:* = undefined;
            var yBuffer:* = undefined;
            var animString:String;
            var i:int;
            var cTyp:String = "";
            var cID:int = -1;
            var tTyp:String = "";
            var tID:int = -1;
            var tAvts:Array = [];
            var tInfA:Array = [];
            var strF:String = "";
            cAvt = null;
            tAvt = null;
            var cReg:Point = new Point(0, 0);
            var tReg:Point = new Point(0, 0);
            if (((!(anim.cInf == null)) && (!(anim.tInf == null))))
            {
                cTyp = String(anim.cInf.split(":")[0]);
                cID = int(anim.cInf.split(":")[1]);
                switch (cTyp)
                {
                    case "p":
                        cAvt = world.getAvatarByUserID(cID);
                        cLeaf = world.getUoLeafById(cID);
                        break;
                    case "m":
                        cAvt = world.getMonster(cID);
                        cLeaf = world.monTree[cID];
                        if (anim.msg != null)
                        {
                            if (anim.msg.indexOf("<mon>") > -1)
                            {
                                anim.msg = anim.msg.split("<mon>").join(cAvt.objData.strMonName);
                            };
                            addUpdate(anim.msg);
                        };
                        break;
                };
                tInfA = anim.tInf.split(",");
                i = 0;
                while (i < tInfA.length)
                {
                    tTyp = String(tInfA[i].split(":")[0]);
                    tID = int(tInfA[i].split(":")[1]);
                    switch (tTyp)
                    {
                        case "p":
                            tAvt = world.getAvatarByUserID(tID);
                            tLeaf = world.getUoLeafById(tID);
                            break;
                        case "m":
                            tAvt = world.getMonster(tID);
                            tLeaf = world.monTree[tID];
                            break;
                    };
                    tAvts.push(tAvt);
                    i = (i + 1);
                };
                if (tAvts[0] != null)
                {
                    tAvt = tAvts[0];
                };
                if (tAvt != null)
                {
                    tLeaf = tAvt.dataLeaf;
                };
                if (((((((!(cAvt == null)) && (!(cAvt.pMC == null))) && (!(tAvt == null))) && (!(tAvt.pMC == null))) && (!(cLeaf == null))) && (!(tLeaf == null))))
                {
                    aura = {};
                    for each (aura in cLeaf.auras)
                    {
                        try
                        {
                            if (aura.cat != null)
                            {
                                if (aura.cat == "stun")
                                {
                                    return;
                                };
                                if (aura.cat == "stone")
                                {
                                    return;
                                };
                                if (aura.cat == "disabled")
                                {
                                    return;
                                };
                            };
                        }
                        catch(e:Error)
                        {
                            trace(("doAnim > " + e));
                        };
                    };
                    animStr = anim.animStr;
                    switch (cTyp)
                    {
                        case "p":
                            if (cAvt.objData != null)
                            {
                                if (cAvt != world.myAvatar)
                                {
                                    cAvt.target = tAvt;
                                };
                                strF = String(cLeaf.strFrame);
                                cAvt.pMC.spFX.strl = "";
                                if ((((!(strF == null)) && (strF == world.strFrame)) && (cLeaf.intState > 0)))
                                {
                                    if (cAvt != tAvt)
                                    {
                                        if ((tAvt.pMC.x - cAvt.pMC.x) >= 0)
                                        {
                                            cAvt.pMC.turn("right");
                                        }
                                        else
                                        {
                                            cAvt.pMC.turn("left");
                                        };
                                    };
                                    if (anim.strl != null)
                                    {
										if (skillAnimFX)
                                        {
											cAvt.pMC.spFX.strl = anim.strl;
										}
                                    };
                                    if (anim.fx != null)
                                    {
                                        cAvt.pMC.spFX.fx = anim.fx;
                                    };
                                    if (tAvts != null)
                                    {
                                        cAvt.pMC.spFX.avts = tAvts;
                                    };
                                    if (!isNaN(dur))
                                    {
                                        cAvt.pMC.spellDur = dur;
                                    };
                                    if (animStr.indexOf(",") > -1)
                                    {
                                        animStr = animStr.split(",")[Math.round((Math.random() * (animStr.split(",").length - 1)))];
                                    };
                                    if (((!(animStr == "Thrash")) || (!(cAvt.pMC.mcChar.currentLabel == "Thrash"))))
                                    {
                                        cAvt.pMC.queueAnim(animStr);
                                    };
                                    if (((isProc) && (cAvt.pMC.mcChar.weapon.mcWeapon.isProc)))
                                    {
                                        cAvt.pMC.mcChar.weapon.mcWeapon.gotoAndPlay("Proc");
                                    };
                                };
                            };
                            return;
                        case "m":
                            if (cAvt.objData != null)
                            {
                                if (cAvt != world.myAvatar)
                                {
                                    cAvt.target = tAvt;
                                };
                                strF = String(cLeaf.strFrame);
                                cReg = cAvt.pMC.mcChar.localToGlobal(new Point(0, 0));
                                tReg = tAvt.pMC.mcChar.localToGlobal(new Point(0, 0));
                                cReg = world.CHARS.globalToLocal(cReg);
                                tReg = world.CHARS.globalToLocal(tReg);
                                if ((((!(strF == null)) && (strF == world.strFrame)) && (cLeaf.intState > 0)))
                                {
                                    if (cAvt != tAvt)
                                    {
                                        if ((tReg.x - cReg.x) >= 0)
                                        {
                                            cAvt.pMC.turn("right");
                                        }
                                        else
                                        {
                                            cAvt.pMC.turn("left");
                                        };
                                    };
                                    if (((((!(anim.fx == "p")) && (!(anim.fx == "w"))) && (!(anim.fx == ""))) && (((Math.abs((cReg.x - tReg.x)) * world.SCALE) > 160) || ((Math.abs((cReg.y - tReg.y)) * world.SCALE) > 15))))
                                    {
                                        buffer = int((110 + (Math.random() * 50)));
                                        xBuffer = (((tReg.x - cReg.x) >= 0) ? -(buffer) : buffer);
                                        xBuffer = int((xBuffer * world.SCALE));
                                        if ((((tReg.x + xBuffer) < 0) || ((tReg.x + xBuffer) > 960)))
                                        {
                                            xBuffer = (xBuffer * -1);
                                        };
                                        buffer = int(((Math.random() * 30) - 15));
                                        yBuffer = (((tReg.y - cReg.y) >= 0) ? -(buffer) : buffer);
                                        yBuffer = int((yBuffer * world.SCALE));
                                        cAvt.pMC.walkTo((tReg.x + xBuffer), (tReg.y + yBuffer), 32);
                                    };
                                    if (cAvt.pMC.spFX != null)
                                    {
                                        cAvt.pMC.spFX.avt = cAvt.target;
                                    };
                                    cReg = cAvt.pMC.mcChar.localToGlobal(new Point(0, 0));
                                    tReg = tAvt.pMC.mcChar.localToGlobal(new Point(0, 0));
                                    if (cAvt != tAvt)
                                    {
                                        if ((tReg.x - cReg.x) >= 0)
                                        {
                                            cAvt.pMC.turn("right");
                                        }
                                        else
                                        {
                                            cAvt.pMC.turn("left");
                                        };
                                    };
                                    if (animStr.length > 1)
                                    {
                                        if (animStr.indexOf(",") > -1)
                                        {
                                            if (world.objExtra["bChar"] == 1)
                                            {
                                                animString = cAvt.pMC.Animation;
                                                MovieClip(cAvt.pMC.getChildAt(1)).gotoAndPlay(animString);
                                            }
                                            else
                                            {
                                                anims = animStr.split(",");
                                                animIndex = uint(Math.round((Math.random() * (anims.length - 1))));
                                                MovieClip(cAvt.pMC.getChildAt(1)).gotoAndPlay(anims[animIndex]);
                                            };
                                        }
                                        else
                                        {
                                            if (world.objExtra["bChar"] == 1)
                                            {
                                                animString = cAvt.pMC.Animation;
                                                MovieClip(cAvt.pMC.getChildAt(1)).gotoAndPlay(animString);
                                            }
                                            else
                                            {
                                                MovieClip(cAvt.pMC.getChildAt(1)).gotoAndPlay(animStr);
                                            };
                                        };
                                    };
                                };
                            };
                            return;
                    };
                };
            };
        }
		
		public function key_StageLogin(_arg_1:KeyboardEvent):*
        {
            if (_arg_1.target == stage)
            {
                if ((_arg_1.charCode == Keyboard.ENTER))
                {
                    (stage.focus = mcLogin.ni);
                };
            };
        }
		
        public function key_StageGame(_arg_1:KeyboardEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if (!("text" in _arg_1.target))
            {
                switch (String.fromCharCode(_arg_1.charCode))
                {
                    case "/":
                        mixer.playSound("Click");
                        chatF.openMsgEntry();
                        break;
                    case "]":
                        if (((stage.focus == null) || ((!(stage.focus == null)) && (!("text" in stage.focus)))))
                        {
                            if ((((!(world.myAvatar.target == null)) && (!(world.myAvatar.target.target == null))) && (!(world.myAvatar.target == world.myAvatar.target.target))))
                            {
                                world.setTarget(world.myAvatar.target.target);
                            };
                        };
                        break;
                    case ">":
                        if (((stage.focus == null) || ((!(stage.focus == null)) && (!("text" in stage.focus)))))
                        {
                            if (((!(chatF.pmSourceA[0] == null)) && (chatF.pmSourceA[0].length >= 1)))
                            {
                                chatF.openPMsg(chatF.pmSourceA[0]);
                                (ui.mcInterface.te.text = "> ");
                            };
                        };
					break;
                    case "i":
                        if (((stage.focus == null) || ((!(stage.focus == null)) && (!("text" in stage.focus)))))
                        {
                            ui.mcInterface.mcMenu.toggleInventory();
                            mixer.playSound("Click");
                        };
					break;
                    case "p":
                        if (stage.focus != ui.mcInterface.te)
                        {
                            mixer.playSound("Click");
                            togglePVPPanel("maps");
                        };
					break;
					case "c":
						if (stage.focus != ui.mcInterface.te)
                        {
							if (world.coolDown("rest"))
							{
								mixer.playSound("Click");
								world.rest();
							};
                        };
					break;
					case "z":
                        if (stage.focus != ui.mcInterface.te)
                        {
                            mixer.playSound("Click");
                            toggleTradePanel();
                        };
					break;
					case "x":
                        if (stage.focus != ui.mcInterface.te)
                        {
                            mixer.playSound("Click");
                            world.senLoadForgeRequest();
                        };
					break;
                    case "f":
                        if (((stage.focus == null) || ((!(stage.focus == null)) && (!("text" in stage.focus)))))
                        {
                            if (ui.mcOFrame.isOpen)
                            {
                                ui.mcOFrame.fClose();
                                mixer.playSound("Click");
                            }
                            else
                            {
                                world.showFriendsList();
                                mixer.playSound("Click");
                            };
                        };
					break;
                    case "v":
                        if (((stage.focus == null) || ((!(stage.focus == null)) && (!("text" in stage.focus)))))
                        {
                            world.toggleHPBar();
                            //mixer.playSound("ClickMagic");
                        };
					break;
                    case "o":
                        if (((stage.focus == null) || ((!(stage.focus == null)) && (!("text" in stage.focus)))))
                        {
                            if (ui.mcPopup.currentLabel == "Option")
                            {
                                ui.mcPopup.onClose();
                            }
                            else
                            {
                                ui.mcPopup.fOpen("Option");
                                mixer.playSound("Click");
                            };
                        };
					break;
                    case "u":
                        if (((stage.focus == null) || ((!(stage.focus == null)) && (!("text" in stage.focus)))))
                        {
                            if (!ui.mcOFrame.isOpen)
                            {
                                world.sendWhoRequest();
                                mixer.playSound("Click");
                            }
                            else
                            {
                                ui.mcOFrame.fClose();
                                mixer.playSound("Click");
                            };
                        };
					break;
                };
                switch (_arg_1.charCode)
                {
                    case Keyboard.ENTER:
                        mixer.playSound("Click");
                        chatF.openMsgEntry();
                        return;
                    case Keyboard.SPACE:
                        if (stage.focus != ui.mcInterface.te)
                        {
                            if (world.coolDown("showEmoticon"))
							{
								sfc.sendXtMessage("zm", "emotea", ["jump"], "str", 1);
								world.myAvatar.pMC.mcChar.gotoAndPlay("Jump");
							};
                        };
                        return;
                    case Keyboard.ESCAPE:
                        mixer.playSound("Click");
                        /*if (world.coolDown("closeTarget"))
                        {*/
                            world.cancelTarget();
                        //};
                        if (_arg_1.target != ui.mcInterface.te)
                        {
                        };
                        return;
                    case 81:
                        return;
                    default:
                        if (world.myAvatar.isStaff())
                        {
                        };
					return;
                };
            };
        }

        public function key_TextLogin(_arg_1:KeyboardEvent):*
        {
            if (_arg_1.target != stage)
            {
                if ((_arg_1.charCode == Keyboard.ENTER))
                {
                    onLoginClick(null);
                };
            };
        }

        public function key_ChatEntry(_arg_1:KeyboardEvent):*
        {
            if (_arg_1.charCode == Keyboard.ENTER)
            {
                chatF.submitMsg(ui.mcInterface.te.text, chatF.chn.cur.typ, chatF.pmNm);
            };
            if (_arg_1.charCode == Keyboard.ESCAPE)
            {
                chatF.closeMsgEntry();
            };
        }

        public function talk(_arg_1:*):*
        {
            if (_arg_1.accept)
            {
                chatF.submitMsg(_arg_1.emote1, "emote", sfc.myUserName);
            }
            else
            {
                chatF.submitMsg(_arg_1.emote2, "emote", sfc.myUserName);
            };
        }

        public function key_actBar(_arg_1:KeyboardEvent):*
        {
            var skillId:int;
            var _local_3:String;
            var _local_4:*;
            if (((stage.focus == null) || ((!(stage.focus == null)) && (!("text" in stage.focus)))))
            {
                switch (_arg_1.keyCode)
                {
					case 81:
                        (skillId = 0);// Q
						if (world.actionMap[skillId] != null)
						{
							(_local_4 = world.getActionByRef(world.actionMap[skillId]));
							if (_local_4.isOK)
							{
								world.testAction(_local_4);
							};
						};
                        world.approachTarget();
					return;
					case 87:// W
						(skillId = 1);
						if (world.actionMap[skillId] != null)
						{
							(_local_4 = world.getActionByRef(world.actionMap[skillId]));
							if (_local_4.isOK)
							{
								world.testAction(_local_4);
							};
						};
                        world.approachTarget();
					return;
					case 69:// E
						(skillId = 2);
						if (world.actionMap[skillId] != null)
						{
							(_local_4 = world.getActionByRef(world.actionMap[skillId]));
							if (_local_4.isOK)
							{
								world.testAction(_local_4);
							};
						};
                        world.approachTarget();
					return;
					case 82:// R
						(skillId = 3);
						if (world.actionMap[skillId] != null)
						{
							(_local_4 = world.getActionByRef(world.actionMap[skillId]));
							if (_local_4.isOK)
							{
								world.testAction(_local_4);
							};
						};
                        world.approachTarget();
					return;
					case 84:// T
						(skillId = 4);
						if (world.actionMap[skillId] != null)
						{
							(_local_4 = world.getActionByRef(world.actionMap[skillId]));
							if (_local_4.isOK)
							{
								world.testAction(_local_4);
							};
						};
                        world.approachTarget();
					return;
					case 89:// Y
						(skillId = 5);
						if (world.actionMap[skillId] != null)
						{
							(_local_4 = world.getActionByRef(world.actionMap[skillId]));
							if (_local_4.isOK)
							{
								world.testAction(_local_4);
							};
						};
                        world.approachTarget();
					return;
					case 49:// 1
						(skillId = 6);
						if (world.actionMap[skillId] != null)
						{
							(_local_4 = world.getActionByRef(world.actionMap[skillId]));
							if (_local_4.isOK)
							{
								world.testAction(_local_4);
							};
						};
                        world.approachTarget();
					return;
                    case 112:// f1
                        if (world.coolDown("showEmoticon"))
                        {
                            sfc.sendXtMessage("zm", "emoticon", ["smile"], "str", 1);
                            (world.myAvatar.pMC.mcEmoticon.visible = true);
                            world.myAvatar.pMC.mcEmoticon.gotoAndStop("Smile");
                        };
                        return;
                    case 113:// f2
                        if (world.coolDown("showEmoticon"))
                        {
                            sfc.sendXtMessage("zm", "emoticon", ["angry"], "str", 1);
                            (world.myAvatar.pMC.mcEmoticon.visible = true);
                            world.myAvatar.pMC.mcEmoticon.gotoAndStop("Angry");
                        };
                        return;
                    case 114:// f3
                        if (world.coolDown("showEmoticon"))
                        {
                            sfc.sendXtMessage("zm", "emoticon", ["love"], "str", 1);
                            (world.myAvatar.pMC.mcEmoticon.visible = true);
                            world.myAvatar.pMC.mcEmoticon.gotoAndStop("Love");
                        };
                        return;
                    case 115:// f4
                        if (world.coolDown("showEmoticon"))
                        {
                            sfc.sendXtMessage("zm", "emoticon", ["kiss"], "str", 1);
                            (world.myAvatar.pMC.mcEmoticon.visible = true);
                            world.myAvatar.pMC.mcEmoticon.gotoAndStop("Kiss");
                        };
                        return;
                    case 116:// f5
                        if (world.coolDown("showEmoticon"))
                        {
                            sfc.sendXtMessage("zm", "emoticon", ["wink"], "str", 1);
                            (world.myAvatar.pMC.mcEmoticon.visible = true);
                            world.myAvatar.pMC.mcEmoticon.gotoAndStop("Wink");
                        };
                        return;
                    case 117:// f6
                        if (world.coolDown("showEmoticon"))
                        {
                            sfc.sendXtMessage("zm", "emoticon", ["laugh"], "str", 1);
                            (world.myAvatar.pMC.mcEmoticon.visible = true);
                            world.myAvatar.pMC.mcEmoticon.gotoAndStop("Laugh");
                        };
                        return;
                    case 118:// f7
                        if (world.coolDown("showEmoticon"))
                        {
                            sfc.sendXtMessage("zm", "emoticon", ["cry"], "str", 1);
                            (world.myAvatar.pMC.mcEmoticon.visible = true);
                            world.myAvatar.pMC.mcEmoticon.gotoAndStop("Cry");
                        };
                        return;
                    case 119:// f8
                        if (world.coolDown("showEmoticon"))
                        {
                            sfc.sendXtMessage("zm", "emoticon", ["tongue"], "str", 1);
                            (world.myAvatar.pMC.mcEmoticon.visible = true);
                            world.myAvatar.pMC.mcEmoticon.gotoAndStop("Tongue");
                        };
                        return;
                    case 120:// f9
                        if (world.coolDown("showEmoticon"))
                        {
                            sfc.sendXtMessage("zm", "emoticon", ["blush"], "str", 1);
                            (world.myAvatar.pMC.mcEmoticon.visible = true);
                            world.myAvatar.pMC.mcEmoticon.gotoAndStop("Blush");
                        };
                        return;
                    case 121:// f10
                        if (world.coolDown("showEmoticon"))
                        {
                            sfc.sendXtMessage("zm", "emoticon", ["sad"], "str", 1);
                            (world.myAvatar.pMC.mcEmoticon.visible = true);
                            world.myAvatar.pMC.mcEmoticon.gotoAndStop("Sad");
                        };
                        return;
                    case 122:// f11
                        if (world.coolDown("showEmoticon"))
                        {
                            sfc.sendXtMessage("zm", "emoticon", ["confuse"], "str", 1);
                            (world.myAvatar.pMC.mcEmoticon.visible = true);
                            world.myAvatar.pMC.mcEmoticon.gotoAndStop("Confuse");
                        };
                        return;
                    case 123:// f12
                        if (world.coolDown("showEmoticon"))
                        {
                            sfc.sendXtMessage("zm", "emoticon", ["lmao"], "str", 1);
                            (world.myAvatar.pMC.mcEmoticon.visible = true);
                            world.myAvatar.pMC.mcEmoticon.gotoAndStop("Lmao");
                        };
                        return;
                };
            };
        }

        public function decHex(_arg_1:*):*
        {
            return (_arg_1.toString(16));
        }

        public function hexDec(_arg_1:*):*
        {
            return (parseInt(_arg_1, 16));
        }

        public function modColor(_arg_1:*, _arg_2:*, _arg_3:*):*
        {
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            var _local_4:* = "";
            var _local_8:* = 0;
            while (_local_8 < 3)
            {
                _local_5 = hexDec(_arg_1.substr((_local_8 * 2), 2));
                _local_6 = hexDec(_arg_2.substr((_local_8 * 2), 2));
                switch (_arg_3)
                {
                    case "-":
                    default:
                        _local_7 = (_local_5 - _local_6);
                        if (_local_7 < 0)
                        {
                            _local_7 = 0;
                        };
                        _local_7 = decHex(_local_7);
                        break;
                    case "+":
                        _local_7 = (_local_5 + _local_6);
                        if (_local_7 > 0xFF)
                        {
                            _local_7 = 0xFF;
                        };
                        _local_7 = decHex(_local_7);
                };
                _local_4 = (_local_4 + String(((_local_7.length < 2) ? ("0" + _local_7) : _local_7)));
                _local_8++;
            };
            return (_local_4);
        }

        internal function replaceString(_arg_1:String, _arg_2:String, _arg_3:String):String
        {
            var _local_4:Number = 0;
            var _local_5:Number = 0;
            var _local_6:* = "";
            while ((_local_4 = _arg_1.indexOf(_arg_2, _local_4)) != -1)
            {
                _local_6 = (_local_6 + (_arg_1.substring(_local_5, _local_4) + _arg_3));
                _local_5 = (_local_4 = (_local_4 + _arg_2.length));
            };
            return ((_local_6 == "") ? _arg_1 : _local_6);
        }

        public function stripWhite(_arg_1:String):String
        {
            _arg_1 = _arg_1.split("\r").join("");
            _arg_1 = _arg_1.split("\t").join("");
            return (_arg_1.split(" ").join(""));
        }

        public function stripWhiteStrict(_arg_1:String):String
        {
            _arg_1 = stripWhite(_arg_1);
            var _local_2:int;
            while (_local_2 < chatF.strictComparisonChars.length)
            {
                _arg_1 = _arg_1.split(chatF.strictComparisonChars.substr(_local_2, 1)).join("");
                _local_2++;
            };
            return (_arg_1);
        }

        public function stripWhiteStrictB(_arg_1:String):String
        {
            _arg_1 = stripWhite(_arg_1);
            var _local_2:int;
            while (_local_2 < chatF.strictComparisonCharsB.length)
            {
                _arg_1 = _arg_1.split(chatF.strictComparisonCharsB.substr(_local_2, 1)).join("");
                _local_2++;
            };
            return (_arg_1);
        }

        public function stripMarks(_arg_1:String):String
        {
            var _local_2:int;
            while (_local_2 < chatF.markChars.length)
            {
                _arg_1 = _arg_1.split(chatF.markChars.substr(_local_2, 1)).join("");
                _local_2++;
            };
            return (_arg_1);
        }

        public function stripDuplicateVowels(_arg_1:String):String
        {
            _arg_1 = _arg_1.replace(chatF.regExpA, "a");
            _arg_1 = _arg_1.replace(chatF.regExpE, "e");
            _arg_1 = _arg_1.replace(chatF.regExpI, "i");
            _arg_1 = _arg_1.replace(chatF.regExpO, "o");
            _arg_1 = _arg_1.replace(chatF.regExpU, "u");
            return (_arg_1.replace(chatF.regExpSPACE, " "));
        }

        public function maskStringBetween(_arg_1:String, _arg_2:Array):String
        {
            var _local_4:int;
            var _local_5:int;
            var _local_3:* = "";
            if (((_arg_2.length > 0) && ((_arg_2.length % 2) == 0)))
            {
                _local_4 = 0;
                _local_5 = 0;
                while (_local_5 < _arg_1.length)
                {
                    if (((_local_5 >= _arg_2[_local_4]) && (_local_5 <= _arg_2[(_local_4 + 1)])))
                    {
                        if (_arg_1.charAt(_local_5) == " ")
                        {
                            _local_3 = (_local_3 + " ");
                        }
                        else
                        {
                            _local_3 = (_local_3 + "*");
                        };
                        if (_local_5 == _arg_2[(_local_4 + 1)])
                        {
                            _local_4 = (_local_4 + 2);
                        };
                    }
                    else
                    {
                        _local_3 = (_local_3 + _arg_1.charAt(_local_5));
                    };
                    _local_5++;
                };
            }
            else
            {
                trace("");
                trace("Utility.maskStringBetween() > Malformed indeces array.  Must be in format [start,end, start,end, etc]");
                trace("");
            };
            return (_local_3);
        }

        public function arraySort(_arg_1:String, _arg_2:String):int
        {
            if (_arg_1 > _arg_2)
            {
                return (1);
            };
            if (_arg_1 < _arg_2)
            {
                return (-1);
            };
            return (0);
        }

        public function convertBubbleText(_arg_1:String):String
        {
            var _local_2:String;
            _local_2 = world.myAvatar.objData.strUsername;
            if (_arg_1.indexOf("@name"))
            {
                _arg_1 = _arg_1.split("@name").join(_local_2);
            };
            _local_2 = String(world.myAvatar.objData.intLevel);
            if (_arg_1.indexOf("@level"))
            {
                _arg_1 = _arg_1.split("@level").join(_local_2);
            };
            _local_2 = world.myAvatar.objData.strClassName;
            if (_arg_1.indexOf("@class"))
            {
                _arg_1 = _arg_1.split("@class").join(_local_2);
            };
            _local_2 = ((world.myAvatar.objData.strGender.toLowerCase() == "m") ? "Mr." : "Mrs.");
            if (_arg_1.indexOf("@prefix"))
            {
                _arg_1 = _arg_1.split("@prefix").join(_local_2);
            };
            _local_2 = ((world.myAvatar.objData.strGender.toLowerCase() == "m") ? "He" : "She");
            if (_arg_1.indexOf("@He"))
            {
                _arg_1 = _arg_1.split("@prefix").join(_local_2);
            };
            _local_2 = ((world.myAvatar.objData.strGender.toLowerCase() == "m") ? "Him" : "Her");
            if (_arg_1.indexOf("@Him"))
            {
                _arg_1 = _arg_1.split("@prefix").join(_local_2);
            };
            _local_2 = ((world.myAvatar.objData.strGender.toLowerCase() == "m") ? "His" : "Her");
            if (_arg_1.indexOf("@His"))
            {
                _arg_1 = _arg_1.split("@prefix").join(_local_2);
            };
            _local_2 = ((world.myAvatar.objData.strGender.toLowerCase() == "m") ? "he" : "she");
            if (_arg_1.indexOf("@he"))
            {
                _arg_1 = _arg_1.split("@prefix").join(_local_2);
            };
            _local_2 = ((world.myAvatar.objData.strGender.toLowerCase() == "m") ? "him" : "her");
            if (_arg_1.indexOf("@him"))
            {
                _arg_1 = _arg_1.split("@prefix").join(_local_2);
            };
            _local_2 = ((world.myAvatar.objData.strGender.toLowerCase() == "m") ? "his" : "her");
            if (_arg_1.indexOf("@his"))
            {
                _arg_1 = _arg_1.split("@prefix").join(_local_2);
            };
            return (_arg_1);
        }

        public function strToProperCase(_arg_1:String):String
        {
            return (_arg_1.slice(0, 1).toUpperCase() + _arg_1.slice(1, _arg_1.length).toLowerCase());
        }

        public function strSetCharAt(_arg_1:String, _arg_2:int, _arg_3:String):String
        {
            return ((_arg_1.substring(0, _arg_2) + _arg_3) + _arg_1.substring((_arg_2 + 1), _arg_1.length));
        }

        public function strNumWithCommas(_arg_1:Number):String
        {
            var _local_2:* = "";
            var _local_3:String = _arg_1.toString();
            var _local_4:int;
            var _local_5:int;
            _local_4 = (_local_3.length - 1);
            while (_local_4 > -1)
            {
                if (_local_5 == 3)
                {
                    _local_5 = 0;
                    _local_2 = ((_local_3.charAt(_local_4) + ",") + _local_2);
                }
                else
                {
                    _local_2 = (_local_3.charAt(_local_4) + _local_2);
                };
                _local_5++;
                _local_4--;
            };
            return (_local_2);
        }

        public function numToStr(_arg_1:Number, _arg_2:int=2):String
        {
            var _local_3:String = _arg_1.toString();
            if (_local_3.indexOf(".") == -1)
            {
                _local_3 = (_local_3 + ".");
            };
            var _local_4:Array = _local_3.split(".");
            while (_local_4[1].length < _arg_2)
            {
                _local_4[1] = (_local_4[1] + "0");
            };
            if (_local_4[1].length > _arg_2)
            {
                _local_4[1] = _local_4[1].substr(0, _arg_2);
            };
            if (_arg_2 > 0)
            {
                _local_3 = ((_local_4[0] + ".") + _local_4[1]);
            }
            else
            {
                _local_3 = _local_4[0];
            };
            return (_local_3);
        }

        public function copyObj(_arg_1:Object):Object
        {
            var _local_2:ByteArray = new ByteArray();
            _local_2.writeObject(_arg_1);
            _local_2.position = 0;
            return (_local_2.readObject());
        }

        public function copyConstructor(_arg_1:*):*
        {
            var _local_2:ByteArray = new ByteArray();
            _local_2.writeObject(_arg_1);
            _local_2.position = 0;
            return (_local_2.readObject() as Class);
        }

        public function distanceO(_arg_1:*, _arg_2:*):Number
        {
            return (Math.sqrt((Math.pow(int((_arg_2.x - _arg_1.x)), 2) + Math.pow(int((_arg_2.y - _arg_1.y)), 2))));
        }

        public function distanceP(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*):Number
        {
            return (Math.sqrt((Math.pow((_arg_3 - _arg_1), 2) + Math.pow((_arg_4 - _arg_2), 2))));
        }

        public function distanceXY(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*):Object
        {
            return ({
                "dx":(_arg_3 - _arg_1),
                "dy":(_arg_4 - _arg_2)
            });
        }

        public function isHouseItem(_arg_1:Object):Boolean
        {
            return (((_arg_1.sType == "House") || (_arg_1.sType == "Floor Item")) || (_arg_1.sType == "Wall Item"));
        }

        internal function validateArmor(_arg_1:*):*
        {
            var _local_10:uint;
            var _local_11:uint;
            var _local_2:Array = [];
            var _local_3:Object = {};
            var _local_4:int;
            var _local_5:int = 10;
            var _local_6:Boolean = true;
            var _local_7:Boolean;
            var _local_8:Boolean;
            var _local_9:int = _arg_1.ItemID;
            switch (_local_9)
            {
                default:
                    break;
                case 319:
                case 2083:
                    _local_7 = true;
                    _local_2 = [16, 15654, 407, 20, 15651, 409];
                    break;
                case 409:
                    _local_8 = true;
                    _local_2 = [20, 15651];
                    break;
                case 408:
                    _local_8 = true;
                    _local_2 = [17, 15653];
                    break;
                case 410:
                    _local_8 = true;
                    _local_2 = [18, 15652];
                    break;
                case 407:
                    _local_8 = true;
                    _local_2 = [16, 15654];
            };
            if (_local_7)
            {
                _local_10 = 0;
                while (_local_10 < _local_2.length)
                {
                    if (world.myAvatar.getCPByID(_local_2[_local_10]) < 302500)
                    {
                        _local_6 = false;
                    }
                    else
                    {
                        _local_6 = true;
                        if (_local_10 < 2)
                        {
                            _local_10 = 2;
                        };
                        if (((_local_10 < 5) && (_local_10 > 2))) break;
                    };
                    _local_10++;
                };
                return (_local_6);
            };
            if (_local_8)
            {
                _local_11 = 0;
                while (_local_11 < _local_2.length)
                {
                    if (world.myAvatar.getCPByID(_local_2[_local_11]) >= _arg_1.iReqCP)
                    {
                        return (true);
                    };
                    _local_11++;
                };
                return (false);
            };
            return (!((Number(_arg_1.iClass) > 0) && (world.myAvatar.getCPByID(_arg_1.iClass) < _arg_1.iReqCP)));
        }

        public function getItemInfoString(_arg_1:Object):String
        {
            var _local_3:int;
            var _local_4:*;
            var _local_5:int;
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            var _local_12:*;
            var _local_13:*;
            var _local_14:*;
            var _local_15:*;
            var _local_2:* = (("<font size='14'><b>" + _arg_1.sName) + "</b></font><br>");
            if (((!(validateArmor(_arg_1))) && (_arg_1.iClass > 0)))
            {
                _local_2 = (_local_2 + "<font size='11' color='#CC0000'>");
                _local_3 = getRankFromPoints(_arg_1.iReqCP);
                _local_4 = (_arg_1.iReqCP - arrRanks[(_local_3 - 1)]);
                if (_local_4 > 0)
                {
                    _local_2 = (_local_2 + (((((("Requires " + _local_4) + " Class Points on ") + _arg_1.sClass) + ", Rank ") + _local_3) + "."));
                }
                else
                {
                    _local_2 = (_local_2 + (((("Requires " + _arg_1.sClass) + ", Rank ") + _local_3) + "."));
                };
                _local_2 = (_local_2 + "</font><br>");
            };
            if (((_arg_1.FactionID > 1) && (world.myAvatar.getRep(_arg_1.FactionID) < _arg_1.iReqRep)))
            {
                _local_2 = (_local_2 + "<font size='11' color='#CC0000'>");
                _local_5 = getRankFromPoints(_arg_1.iReqRep);
                _local_6 = (_arg_1.iReqRep - arrRanks[(_local_3 - 1)]);
                if (_local_6 > 0)
                {
                    _local_2 = (_local_2 + (((((("Requires " + _local_6) + " Reputation on ") + _arg_1.sFaction) + ", Rank ") + _local_5) + "."));
                }
                else
                {
                    _local_2 = (_local_2 + (((("Requires " + _arg_1.sFaction) + ", Rank ") + _local_5) + "."));
                };
                _local_2 = (_local_2 + "</font><br>");
            };
            if (((_arg_1.iQSindex >= 0) && (world.getQuestValue(_arg_1.iQSindex) < int(_arg_1.iQSvalue))))
            {
                _local_2 = (_local_2 + (("<font size='11' color='#CC0000'>Requires completion of quest \"" + _arg_1.sQuest) + '".</font><br>'));
            };
            _local_2 = (_local_2 + ("<font color='#009900'><b>" + getDisplaysType(_arg_1)));
            if (((!(_arg_1.sES == "None")) && (!(_arg_1.sES == "co"))))
            {
                if (_arg_1.EnhID > 0)
                {
                    _local_2 = (_local_2 + (", Lvl " + _arg_1.EnhLvl));
                    if (_arg_1.sES == "Weapon")
                    {
                        _local_7 = getBaseHPByLevel(_arg_1.EnhLvl);
                        _local_8 = 20;
                        _local_9 = 1;
                        _local_10 = (_arg_1.iRng / 100);
                        _local_11 = 2;
                        _local_12 = Math.round(((_local_7 / _local_8) * _local_9));
                        _local_13 = Math.round((_local_12 * _local_11));
                        _local_14 = Math.floor((_local_13 - (_local_13 * _local_10)));
                        _local_15 = Math.ceil((_local_13 + (_local_13 * _local_10)));
                        _local_2 = (_local_2 + ((((("<br>" + _local_14) + " - ") + _local_15) + " ") + _arg_1.sElmt));
                    };
                }
                else
                {
                    _local_2 = (_local_2 + " Design");
                };
            };
            return (_local_2 + (("</b></font><br>" + _arg_1.sDesc) + "<br>"));
        }

        public function getItemInfoStringB(_arg_1:Object):String
        {
            var _local_3:int;
            var _local_4:*;
            var _local_5:int;
            var _local_6:*;
            var _local_2:* = (("<font size='12'><b>" + _arg_1.sName) + "</b></font><br>");
            if (((!(validateArmor(_arg_1))) && (_arg_1.iClass > 0)))
            {
                _local_2 = (_local_2 + "<font size='10' color='#CC0000'>");
                _local_3 = getRankFromPoints(_arg_1.iReqCP);
                _local_4 = (_arg_1.iReqCP - arrRanks[(_local_3 - 1)]);
                if (_local_4 > 0)
                {
                    _local_2 = (_local_2 + (((((("Requires " + _local_4) + " Class Points on ") + _arg_1.sClass) + ", Rank ") + _local_3) + "."));
                }
                else
                {
                    _local_2 = (_local_2 + (((("Requires " + _arg_1.sClass) + ", Rank ") + _local_3) + "."));
                };
                _local_2 = (_local_2 + "</font><br>");
            };
            if (((_arg_1.FactionID > 1) && (world.myAvatar.getRep(_arg_1.FactionID) < _arg_1.iReqRep)))
            {
                _local_2 = (_local_2 + "<font size='10' color='#CC0000'>");
                _local_5 = getRankFromPoints(_arg_1.iReqRep);
                _local_6 = (_arg_1.iReqRep - arrRanks[(_local_3 - 1)]);
                if (_local_6 > 0)
                {
                    _local_2 = (_local_2 + (((((("Requires " + _local_6) + " Reputation on ") + _arg_1.sFaction) + ", Rank ") + _local_5) + "."));
                }
                else
                {
                    _local_2 = (_local_2 + (((("Requires " + _arg_1.sFaction) + ", Rank ") + _local_5) + "."));
                };
                _local_2 = (_local_2 + "</font><br>");
            };
            if (((_arg_1.iQSindex >= 0) && (world.getQuestValue(_arg_1.iQSindex) < int(_arg_1.iQSvalue))))
            {
                _local_2 = (_local_2 + (("<font size='11' color='#CC0000'>Requires completion of quest \"" + _arg_1.sQuest) + '".</font><br>'));
            };
            if ((((!(_arg_1.sMeta == null)) && (getDisplaysType(_arg_1) == "Pet")) && (_arg_1.sMeta.indexOf("Necromancer") > -1)))
            {
                _local_2 = (_local_2 + ("<font color='#00CCFF'><b>Battle " + getDisplaysType(_arg_1)));
            }
            else
            {
                _local_2 = (_local_2 + ("<font color='#00CCFF'><b>" + getDisplaysType(_arg_1)));
            };
            if (_arg_1.sType.toLowerCase() == "enhancement")
            {
                _local_2 = (_local_2 + (", Level " + _arg_1.iLvl));
            };
            if ((((!(_arg_1.sES == "None")) && (!(_arg_1.sES == "co"))) && (!(_arg_1.sES == "pe"))))
            {
                if (_arg_1.EnhID > 0)
                {
                    _local_2 = (_local_2 + (", Level " + _arg_1.EnhLvl));
                    if (_arg_1.sES == "ar")
                    {
                        _local_2 = (_local_2 + ("<br>Rank " + getRankFromPoints(_arg_1.iQty)));
                    };
                }
                else
                {
                    if (_arg_1.sType.toLowerCase() != "enhancement")
                    {
                        _local_2 = (_local_2 + " Design");
                    };
                };
            };
            if (((((((_arg_1.sES == "Weapon") || (_arg_1.sES == "co")) || (_arg_1.sES == "he")) || (_arg_1.sES == "ba")) || (_arg_1.sES == "pe")) || (_arg_1.sES == "am")))
            {
                if (_arg_1.sType.toLowerCase() != "enhancement")
                {
                    _local_2 = (_local_2 + (("<br>" + getRarityString(_arg_1.iRty)) + " Raro"));
                };
            };
            if (_arg_1.sType.toLowerCase() != "enhancement")
            {
                _local_2 = (_local_2 + (("</b></font><br><font size='10' color='#FFFFFF'>" + _arg_1.sDesc) + "<br></font>"));
            }
            else
            {
                _local_2 = (_local_2 + "</b></font><br><font size='10' color='#FFFFFF'>");
                _local_2 = (_local_2 + "Enhancements are special items which can apply stats to your weapons and armor. Select a weapon or armor item from the list on the right, and click the <font color='#00CCFF'>\"Enhancements\"</font> button that appears below its preview.");
            };
            return (_local_2);
        }

        public function getIconByType(_arg_1:String):String
        {
            var _local_2:* = "";
            switch (_arg_1.toLowerCase())
            {
                case "axe":
                case "bow":
                case "dagger":
                case "gun":
                case "mace":
                case "polearm":
                case "staff":
                case "sword":
                case "wand":
                case "armor":
                    _local_2 = ("iw" + _arg_1.toLowerCase());
                    break;
                case "cape":
                case "helm":
                case "pet":
                case "class":
                    _local_2 = ("ii" + _arg_1.toLowerCase());
                    break;
                default:
                    _local_2 = "iibag";
            };
            return (_local_2);
        }

        public function getIconBySlot(_arg_1:String):String
        {
            var _local_2:* = "";
            switch (_arg_1.toLowerCase())
            {
                case "weapon":
                    _local_2 = "iwsword";
                    break;
                case "back":
                case "ba":
                    _local_2 = "iicape";
                    break;
                case "head":
                case "he":
                    _local_2 = "iihelm";
                    break;
                case "armor":
                case "ar":
                    _local_2 = "iiclass";
                    break;
                case "class":
                    _local_2 = "iiclass";
                    break;
                case "pet":
                case "pe":
                    _local_2 = "iipet";
                    break;
                default:
                    _local_2 = "iibag";
            };
            return (_local_2);
        }

        public function getDisplaysType(_arg_1:Object):*
        {
            var _local_2:String = ((_arg_1.sType != null) ? _arg_1.sType : "Unknown");
            var _local_3:String = _local_2.toLowerCase();
            if (((_local_3 == "clientuse") || (_local_3 == "serveruse")))
            {
                _local_2 = "Item";
            };
            return (_local_2);
        }

        public function stringToDate(_arg_1:String):Date
        {
            var _local_2:* = Number(_arg_1.substr(0, 4));
            var _local_3:* = (Number(_arg_1.substr(5, 2)) - 1);
            var _local_4:* = Number(_arg_1.substr(8, 2));
            var _local_5:* = Number(_arg_1.substr(11, 2));
            var _local_6:* = Number(_arg_1.substr(14, 2));
            var _local_7:* = Number(_arg_1.substr(17));
            return (new Date(_local_2, _local_3, _local_4, _local_5, _local_6, _local_7));
        }

        internal function traceObject(_arg_1:*, _arg_2:*=1):*
        {
            var _local_4:*;
            var _local_5:*;
            var _local_3:* = "";
            while (_local_3.length < _arg_2)
            {
                _local_3 = (_local_3 + " ");
            };
            _arg_2++;
            if (((typeof(_arg_1) == "object") && (!(_arg_1.length == null))))
            {
                _local_4 = 0;
                while (_local_4 < _arg_1.length)
                {
                    trace((((_local_3 + _local_4) + ": ") + _arg_1[_local_4]));
                    _local_4++;
                };
            }
            else
            {
                for (_local_5 in _arg_1)
                {
                    trace((((_local_3 + _local_5) + ": ") + _arg_1[_local_5]));
                    if (typeof(_arg_1[_local_5]) == "object")
                    {
                        traceObject(_arg_1[_local_5], _arg_2);
                    };
                };
            };
        }

        public function max(_arg_1:int, _arg_2:int):int
        {
            if (_arg_1 > _arg_2)
            {
                return (_arg_1);
            };
            return (_arg_2);
        }

        public function clamp(_arg_1:Number, _arg_2:Number, _arg_3:Number):Number
        {
            if (_arg_1 < _arg_2)
            {
                return (_arg_2);
            };
            if (_arg_1 > _arg_3)
            {
                return (_arg_3);
            };
            return (_arg_1);
        }

        public function isValidEmail(_arg_1:String):Boolean
        {
            return (Boolean(_arg_1.match(EMAIL_REGEX)));
        }

        public function closeToolTip():void
        {
            var _local_1:*;
            try
            {
                _local_1 = MovieClip(stage.getChildAt(0)).ui.ToolTip;
                _local_1.close();
            }
            catch(e:Error)
            {
            };
        }

        public function updateIcons(_arg_1:Array, _arg_2:Array, _arg_3:Object=null):*
        {
            var _local_6:MovieClip;
            var _local_7:Class;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            var _local_12:*;
            var _local_13:*;
            var _local_4:int;
            var _local_5:int;
            _local_4 = 0;
            while (_local_4 < _arg_1.length)
            {
                _local_6 = _arg_1[_local_4];
                _local_6.cnt.removeChildAt(0);
                _local_6.item = _arg_3;
                if (_local_6.item == null)
                {
                    _local_6.tQty.visible = false;
                };
                while (_local_5 < _arg_2.length)
                {
                    _local_7 = (world.getClass(_arg_2[_local_5]) as Class);
                    _local_8 = new (_local_7)();
                    _local_9 = _local_6.cnt.addChild(_local_8);
                    _local_10 = int(((42 - 8) + (4 * _local_5)));
                    _local_11 = int(((39 - 8) + (4 * _local_5)));
                    _local_12 = _local_9.width;
                    _local_13 = _local_9.height;
                    if (_local_12 > _local_13)
                    {
                        _local_9.scaleX = (_local_9.scaleY = (_local_10 / _local_12));
                    }
                    else
                    {
                        _local_9.scaleX = (_local_9.scaleY = (_local_11 / _local_13));
                    };
                    _local_9.x = ((_local_6.bg.width / 2) - (_local_9.width / 2));
                    _local_9.y = ((_local_6.bg.height / 2) - (_local_9.height / 2));
                    _local_5++;
                };
                _local_4++;
            };
        }

        public function updateActionObjIcon(_arg_1:Object):void
        {
            var _local_3:MovieClip;
            var _local_4:Object;
            var _local_6:int;
            var _local_7:int;
            var _local_2:Array = world.getActIcons(_arg_1);
            var _local_5:* = 0;
            while (_local_5 < _local_2.length)
            {
                _local_3 = _local_2[_local_5];
                _local_4 = _local_3.item;
                if (_local_4 != null)
                {
                    _local_6 = 0;
                    while (_local_7 < world.myAvatar.items.length)
                    {
                        if (world.myAvatar.items[_local_7].ItemID == _local_4.ItemID)
                        {
                            _local_6 = int(world.myAvatar.items[_local_7].iQty);
                        };
                        _local_7++;
                    };
                    if (_local_6 > 0)
                    {
                        _local_3.tQty.visible = true;
                        _local_3.tQty.text = _local_6;
                    }
                    else
                    {
                        world.unequipUseableItem(_local_4);
                    };
                };
                _local_5++;
            };
        }

        public function drawChainsSmooth(_arg_1:Array, _arg_2:int, _arg_3:MovieClip):void
        {
            var _local_4:Point;
            var _local_5:Point;
            var _local_6:int;
            var _local_7:Array;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:Point;
            var _local_12:Array;
            var _local_13:MovieClip;
            var _local_14:int;
            var _local_15:int;
            _local_6 = 1;
            while (_local_6 < _arg_1.length)
            {
                _local_4 = new Point(0, 0);
                _local_5 = new Point(0, 0);
                _local_4 = _arg_1[(_local_6 - 1)].localToGlobal(_local_4);
                _local_5 = _arg_1[_local_6].localToGlobal(_local_5);
                _local_7 = [];
                _local_8 = 0;
                _local_9 = 0;
                _local_10 = int(Math.ceil((Point.distance(_local_4, _local_5) / _arg_2)));
                if ((_local_10 % 2) == 1)
                {
                    _local_10 = (_local_10 + 1);
                };
                _local_11 = new Point();
                _local_12 = [_arg_3.fx0, _arg_3.fx1, _arg_3.fx2];
                _local_14 = -1;
                _local_8 = 0;
                while (_local_8 < _local_12.length)
                {
                    _local_7 = [];
                    _local_14 = int(((Math.random() > 0.5) ? 1 : -1));
                    _local_15 = 0;
                    _local_9 = 1;
                    while (_local_9 < _local_10)
                    {
                        _local_11 = Point.interpolate(_local_4, _local_5, (1 - (_local_9 / _local_10)));
                        if ((++_local_15 % 2) == 1)
                        {
                            _local_11.x = (_local_11.x + (_local_14 * Math.round((Math.random() * 30))));
                            _local_11.y = (_local_11.y + (_local_14 * Math.round((Math.random() * 30))));
                            _local_14 = -(_local_14);
                        };
                        _local_7.push(_local_11);
                        _local_9++;
                    };
                    _local_7.push(_local_5);
                    _local_13 = _local_12[_local_8];
                    _local_13.graphics.lineStyle(2, 0xFFFFFF, 1);
                    _local_13.graphics.moveTo(_local_4.x, _local_4.y);
                    _local_9 = 0;
                    while (_local_9 < _local_7.length)
                    {
                        _local_13.graphics.curveTo(_local_7[_local_9].x, _local_7[_local_9].y, _local_7[(_local_9 + 1)].x, _local_7[(_local_9 + 1)].y);
                        _local_9 = (_local_9 + 2);
                    };
                    _local_8++;
                };
                _local_6++;
            };
        }

        public function drawChainsLinear(_arg_1:Array, _arg_2:int, _arg_3:MovieClip):void
        {
            var _local_4:Point;
            var _local_5:Point;
            var _local_6:MovieClip;
            var _local_7:MovieClip;
            var _local_8:int;
            var _local_9:Array;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:Point;
            var _local_14:Array;
            var _local_15:MovieClip;
            _local_8 = 1;
            while (_local_8 < _arg_1.length)
            {
                _local_6 = _arg_1[(_local_8 - 1)];
                _local_7 = _arg_1[_local_8];
                _local_4 = new Point(0, (-(_local_6.height) * 0.5));
                _local_5 = new Point(0, (-(_local_7.height) * 0.5));
                _local_4 = _local_6.localToGlobal(_local_4);
                _local_5 = _local_7.localToGlobal(_local_5);
                _local_9 = [];
                _local_10 = 0;
                _local_11 = 0;
                _local_12 = int(Math.ceil((Point.distance(_local_4, _local_5) / _arg_2)));
                _local_13 = new Point();
                _local_14 = [_arg_3.fx0, _arg_3.fx1, _arg_3.fx2];
                _local_10 = 0;
                while (_local_10 < _local_14.length)
                {
                    _local_9 = [];
                    _local_11 = 1;
                    while (_local_11 < _local_12)
                    {
                        _local_13 = Point.interpolate(_local_4, _local_5, (1 - (_local_11 / (_local_12 + 1))));
                        _local_13.x = (_local_13.x + Math.round(((Math.random() * 25) - 13)));
                        _local_13.y = (_local_13.y + Math.round(((Math.random() * 25) - 13)));
                        _local_9.push(_local_13);
                        _local_11++;
                    };
                    _local_15 = _local_14[_local_10];
                    _local_15.graphics.lineStyle(5, 0xFFFFFF, 1);
                    _local_15.graphics.moveTo(_local_4.x, _local_4.y);
                    _local_11 = 0;
                    while (_local_11 < _local_9.length)
                    {
                        _local_15.graphics.lineTo(_local_9[_local_11].x, _local_9[_local_11].y);
                        _local_11++;
                    };
                    _local_15.graphics.lineTo(_local_5.x, _local_5.y);
                    _local_10++;
                };
                _local_8++;
            };
        }

        public function drawFunnel(_arg_1:Array, _arg_2:MovieClip):void
        {
            var _local_3:MovieClip;
            _arg_2.numLines = 3;
            _arg_2.lineThickness = 3;
            _arg_2.lineColors = [0x9900AA, 0, 0x220066];
            _arg_2.glowColors = [0];
            _arg_2.glowStrength = 4;
            _arg_2.glowSize = 4;
            _arg_2.dur = 500;
            _arg_2.del = 100;
            _arg_2.p1StartingValue = 0.12;
            _arg_2.p2StartingValue = 0.24;
            _arg_2.p3StartingValue = 0.36;
            _arg_2.p1EndingValue = 0.66;
            _arg_2.p2EndingValue = 0.825;
            _arg_2.p3EndingValue = 0.99;
            _arg_2.p1ScaleFactor = 0.5;
            _arg_2.p3ScaleFactor = 0.5;
            _arg_2.easingExponent = 1.5;
            _arg_2.targetMCs = _arg_1;
            _arg_2.filterArr = [];
            _arg_2.fxArr = [];
            _arg_2.ts = new Date().getTime();
            var _local_4:int;
            var _local_5:int;
            _local_4 = 0;
            while (_local_4 < _arg_2.glowColors.length)
            {
                _arg_2.filterArr.push([new GlowFilter(_arg_2.glowColors[_local_4], 1, _arg_2.glowSize, _arg_2.glowSize, _arg_2.glowStrength, 1, false, false)]);
                _local_4++;
            };
            _local_4 = 0;
            _local_5 = 0;
            var _local_6:int;
            while (_local_6 < _arg_2.numLines)
            {
                _local_3 = (_arg_2.addChild(new MovieClip()) as MovieClip);
                _local_3.filters = _arg_2.filterArr[_local_4];
                if (++_local_4 >= _arg_2.glowColors.length)
                {
                    _local_4 = 0;
                };
                _local_3.lineColor = _arg_2.lineColors[_local_5];
                if (++_local_5 >= _arg_2.lineColors.length)
                {
                    _local_5 = 0;
                };
                _arg_2.fxArr.push(_local_3);
                _local_6++;
            };
            _arg_2.addEventListener(Event.ENTER_FRAME, funnelEF, false, 0, true);
        }

        internal function funnelEF(_arg_1:Event):void
        {
            var _local_3:MovieClip;
            var _local_8:Number;
            var _local_9:Number;
            var _local_17:Point;
            var _local_18:Point;
            var _local_19:Point;
            var _local_20:Point;
            var _local_21:Point;
            var _local_22:Point;
            var _local_26:Number;
            var _local_29:Number;
            var _local_30:Number;
            var _local_2:MovieClip = MovieClip(_arg_1.currentTarget);
            var _local_4:Number = new Date().getTime();
            var _local_5:Point = new Point();
            var _local_6:Point = new Point();
            var _local_7:Point = new Point();
            var _local_10:int = 1;
            var _local_11:MovieClip = _local_2.targetMCs[0];
            var _local_12:MovieClip = _local_2.targetMCs[1];
            var _local_13:Point = _local_11.localToGlobal(new Point(0, (-(_local_11.height) / 2)));
            var _local_14:Point = _local_12.localToGlobal(new Point(0, (-(_local_12.height) / 2)));
            var _local_15:* = _local_12.width;
            var _local_16:* = _local_12.height;
            var _local_23:int = -1;
            var _local_24:int;
            var _local_25:int;
            var _local_27:Number = Math.atan2((_local_13.y - _local_14.y), (_local_13.x - _local_14.x));
            _local_27 = (_local_27 - (Math.PI / 2));
            var _local_28:int;
            while (_local_28 < _local_2.fxArr.length)
            {
                _local_3 = _local_2.fxArr[_local_28];
                _local_9 = _local_2.ts;
                _local_8 = (_local_4 - (_local_28 * _local_2.del));
                if (_local_8 > (_local_9 + _local_2.dur))
                {
                    if (_local_3.visible)
                    {
                        _local_3.visible = false;
                        _local_3.graphics.clear();
                    };
                    if (_local_28 == (_local_2.fxArr.length - 1))
                    {
                        _local_2.removeEventListener(Event.ENTER_FRAME, funnelEF);
                        if (_local_2.parent != null)
                        {
                            _local_2.parent.removeChild(_local_2);
                        };
                    };
                }
                else
                {
                    if (_local_8 >= _local_2.ts)
                    {
                        _local_29 = ((_local_8 - _local_9) / _local_2.dur);
                        _local_29 = Math.pow((1 - _local_29), _local_2.easingExponent);
                        _local_10 = (((_local_28 % 2) == 0) ? 1 : -1);
                        _local_17 = new Point((Point.interpolate(_local_13, _local_14, _local_2.p1StartingValue).x + Point.polar((_local_10 * (_local_12.height / _local_2.p1ScaleFactor)), _local_27).x), (Point.interpolate(_local_13, _local_14, _local_2.p1StartingValue).y + Point.polar((_local_10 * (_local_12.height / _local_2.p1ScaleFactor)), _local_27).y));
                        _local_18 = new Point(Point.interpolate(_local_13, _local_14, _local_2.p1EndingValue).x, Point.interpolate(_local_13, _local_14, _local_2.p1EndingValue).y);
                        _local_19 = new Point(Point.interpolate(_local_13, _local_14, _local_2.p2StartingValue).x, _local_14.y);
                        _local_20 = new Point(Point.interpolate(_local_13, _local_14, _local_2.p2EndingValue).x, Point.interpolate(_local_13, _local_14, _local_2.p2EndingValue).y);
                        _local_21 = new Point((Point.interpolate(_local_13, _local_14, _local_2.p3StartingValue).x + Point.polar((-(_local_10) * (_local_12.height / _local_2.p3ScaleFactor)), _local_27).x), (Point.interpolate(_local_13, _local_14, _local_2.p3StartingValue).y + Point.polar((-(_local_10) * (_local_12.height / _local_2.p3ScaleFactor)), _local_27).y));
                        _local_22 = new Point(Point.interpolate(_local_13, _local_14, _local_2.p3EndingValue).x, Point.interpolate(_local_13, _local_14, _local_2.p3EndingValue).y);
                        _local_5 = Point.interpolate(_local_17, _local_18, _local_29);
                        _local_6 = Point.interpolate(_local_19, _local_20, _local_29);
                        _local_7 = Point.interpolate(_local_21, _local_22, _local_29);
                        _local_26 = _local_3.lineColor;
                        _local_3.graphics.clear();
                        _local_3.graphics.lineStyle(_local_2.lineThickness, _local_26, 1);
                        _local_3.graphics.moveTo(_local_14.x, _local_14.y);
                        _local_3.graphics.curveTo(_local_5.x, _local_5.y, _local_6.x, _local_6.y);
                        _local_3.graphics.curveTo(_local_7.x, _local_7.y, _local_13.x, _local_13.y);
                        _local_30 = Math.cos(((((_local_8 - _local_9) / _local_2.dur) * Math.PI) * 2));
                        _local_30 = ((_local_30 / 2) + 0.5);
                        _local_30 = (1 - _local_30);
                        _local_3.alpha = _local_30;
                    };
                };
                _local_28++;
            };
        }

        public function updateCoreValues(_arg_1:Object):void
        {
            if (_arg_1.intLevelCap != null)
            {
                intLevelCap = _arg_1.intLevelCap;
            };
            if (_arg_1.PCstBase != null)
            {
                PCstBase = _arg_1.PCstBase;
            };
            if (_arg_1.PCstRatio != null)
            {
                PCstRatio = _arg_1.PCstRatio;
            };
            if (_arg_1.PCstGoal != null)
            {
                PCstGoal = _arg_1.PCstGoal;
            };
            if (_arg_1.GstBase != null)
            {
                GstBase = _arg_1.GstBase;
            };
            if (_arg_1.GstRatio != null)
            {
                GstRatio = _arg_1.GstRatio;
            };
            if (_arg_1.GstGoal != null)
            {
                GstGoal = _arg_1.GstGoal;
            };
            if (_arg_1.PChpBase1 != null)
            {
                PChpBase1 = _arg_1.PChpBase1;
            };
            if (_arg_1.PChpBase100 != null)
            {
                PChpBase100 = _arg_1.PChpBase100;
            };
            if (_arg_1.PChpGoal1 != null)
            {
                PChpGoal1 = _arg_1.PChpGoal1;
            };
            if (_arg_1.PChpGoal100 != null)
            {
                PChpGoal100 = _arg_1.PChpGoal100;
            };
            if (_arg_1.PChpDelta != null)
            {
                PChpDelta = _arg_1.PChpDelta;
            };
            if (_arg_1.intHPperEND != null)
            {
                intHPperEND = _arg_1.intHPperEND;
            };
            if (_arg_1.intAPtoDPS != null)
            {
                intAPtoDPS = _arg_1.intAPtoDPS;
            };
            if (_arg_1.intSPtoDPS != null)
            {
                intSPtoDPS = _arg_1.intSPtoDPS;
            };
            if (_arg_1.bigNumberBase != null)
            {
                bigNumberBase = _arg_1.bigNumberBase;
            };
            if (_arg_1.resistRating != null)
            {
                resistRating = _arg_1.resistRating;
            };
            if (_arg_1.modRating != null)
            {
                modRating = _arg_1.modRating;
            };
            if (_arg_1.baseDodge != null)
            {
                baseDodge = _arg_1.baseDodge;
            };
            if (_arg_1.baseBlock != null)
            {
                baseBlock = _arg_1.baseBlock;
            };
            if (_arg_1.baseParry != null)
            {
                baseParry = _arg_1.baseParry;
            };
            if (_arg_1.baseCrit != null)
            {
                baseCrit = _arg_1.baseCrit;
            };
            if (_arg_1.baseHit != null)
            {
                baseHit = _arg_1.baseHit;
            };
            if (_arg_1.baseHaste != null)
            {
                baseHaste = _arg_1.baseHaste;
            };
            if (_arg_1.baseMiss != null)
            {
                baseMiss = _arg_1.baseMiss;
            };
            if (_arg_1.baseResist != null)
            {
                baseResist = _arg_1.baseResist;
            };
            if (_arg_1.baseCritValue != null)
            {
                baseCritValue = _arg_1.baseCritValue;
            };
            if (_arg_1.baseBlockValue != null)
            {
                baseBlockValue = _arg_1.baseBlockValue;
            };
            if (_arg_1.baseResistValue != null)
            {
                baseResistValue = _arg_1.baseResistValue;
            };
            if (_arg_1.baseEventValue != null)
            {
                baseEventValue = _arg_1.baseEventValue;
            };
            if (_arg_1.PCDPSMod != null)
            {
                PCDPSMod = _arg_1.PCDPSMod;
            };
            if (_arg_1.curveExponent != null)
            {
                curveExponent = _arg_1.curveExponent;
            };
            if (_arg_1.statsExponent != null)
            {
                statsExponent = _arg_1.statsExponent;
            };
        }

        internal function spaceBy(_arg_1:int, _arg_2:int):String
        {
            var _local_3:String = String(_arg_1);
            while (_local_3.length < _arg_2)
            {
                _local_3 = (_local_3 + " ");
            };
            return (_local_3);
        }

        internal function spaceNumBy(_arg_1:Number, _arg_2:int):String
        {
            var _local_3:String = _arg_1.toString();
            _local_3 = _local_3.substr(0, _arg_2);
            while (_local_3.length < _arg_2)
            {
                _local_3 = (_local_3 + " ");
            };
            return (_local_3);
        }

        internal function showRatings():void
        {
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            var _local_12:*;
            var _local_13:*;
            var _local_14:*;
            var _local_15:*;
            var _local_16:*;
            trace("showRatings >");
            var _local_1:* = world.myAvatar.dataLeaf;
            var _local_2:* = "";
            var _local_3:* = 1;
            var _local_4:* = 0;
            var _local_5:* = 0;
            _local_3 = 1;
            while (_local_3 <= 35)
            {
                if (_local_3 == 0)
                {
                    _local_3 = 1;
                };
                _local_6 = getInnateStats(_local_3);
                _local_7 = getIBudget(_local_3, 1);
                _local_8 = -1;
                _local_9 = -1;
                _local_10 = -1;
                _local_11 = -1;
                _local_12 = _local_1.sCat;
                _local_13 = copyObj(_local_1.sta);
                resetTableValues(_local_13);
                _local_14 = getBaseHPByLevel(_local_3);
                _local_15 = ((_local_14 / 20) * 0.7);
                _local_16 = (((2.25 * _local_15) / (100 / intAPtoDPS)) / 2);
                trace(("Level " + _local_3));
                _local_4 = 0;
                while (_local_4 < stats.length)
                {
                    _local_2 = stats[_local_4];
                    _local_11 = _local_13[("$" + _local_2)];
                    switch (_local_2)
                    {
                        case "STR":
                            _local_8 = _local_16;
                            _local_13.$ap = (_local_13.$ap + (_local_11 * 2));
                            _local_13.$tcr = (_local_13.$tcr + (((_local_11 / _local_8) / 100) * 0.4));
                            trace(((((((((((("  " + spaceBy(_local_14, 5)) + "  |  ") + spaceBy(_local_11, 4)) + "  |  ") + spaceNumBy(_local_8, 4)) + "  |  ") + spaceNumBy(_local_6, 6)) + "  |  ") + spaceNumBy(_local_7, 6)) + "  |  ") + spaceNumBy(_local_13.$tcr, 6)));
                            break;
                    };
                    _local_4++;
                };
                trace("");
                _local_3 = (_local_3 + 1);
            };
        }

        public function applyCoreStatRatings(_arg_1:Object, _arg_2:Object):void
        {
            var _local_3:int = 1;
            var _local_4:* = 100;
            var _local_5:Object = world.myAvatar.getEquippedItemBySlot("Weapon");
            if (_local_5 != null)
            {
                if (_local_5.EnhLvl != null)
                {
                    _local_3 = _local_5.EnhLvl;
                };
                if (_local_5.EnhDPS != null)
                {
                    _local_4 = Number(_local_5.EnhDPS);
                };
                if (_local_4 == 0)
                {
                    _local_4 = 100;
                };
            };
            _local_4 = (_local_4 / 100);
            var _local_6:int = _arg_2.intLevel;
            var _local_7:* = "";
            var _local_8:int = getInnateStats(_local_6);
            var _local_9:Number = -1;
            var _local_10:Number = -1;
            var _local_11:Number = -1;
            var _local_12:int = -1;
            var _local_13:String = world.myAvatar.objData.sClassCat;
            var _local_14:int = getBaseHPByLevel(_local_6);
            var _local_15:int = 20;
            var _local_16:* = ((_local_14 / 20) * 0.7);
            var _local_17:Number = (((2.25 * _local_16) / (100 / intAPtoDPS)) / 2);
            resetTableValues(_arg_1);
            var _local_18:int;
            while (_local_18 < stats.length)
            {
                _local_7 = stats[_local_18];
                _local_12 = (_arg_1[("_" + _local_7)] + _arg_1[("^" + _local_7)]);
                switch (_local_7)
                {
                    case "STR":
                        _local_9 = _local_17;
                        if (_local_13 == "M1")
                        {
                            _arg_1.$sbm = (_arg_1.$sbm - (((_local_12 / _local_9) / 100) * 0.3));
                        };
                        if (_local_13 == "S1")
                        {
                            _arg_1.$ap = (_arg_1.$ap + Math.round((_local_12 * 1.4)));
                        }
                        else
                        {
                            _arg_1.$ap = (_arg_1.$ap + (_local_12 * 2));
                        };
                        if ((((((_local_13 == "M1") || (_local_13 == "M2")) || (_local_13 == "M3")) || (_local_13 == "M4")) || (_local_13 == "S1")))
                        {
                            if (_local_13 == "M4")
                            {
                                _arg_1.$tcr = (_arg_1.$tcr + (((_local_12 / _local_9) / 100) * 0.7));
                            }
                            else
                            {
                                _arg_1.$tcr = (_arg_1.$tcr + (((_local_12 / _local_9) / 100) * 0.4));
                            };
                        };
                        break;
                    case "INT":
                        _local_9 = _local_17;
                        _arg_1.$cmi = (_arg_1.$cmi - ((_local_12 / _local_9) / 100));
                        if (((_local_13.substr(0, 1) == "C") || (_local_13 == "M3")))
                        {
                            _arg_1.$cmo = (_arg_1.$cmo + ((_local_12 / _local_9) / 100));
                        };
                        if (_local_13 == "S1")
                        {
                            _arg_1.$sp = (_arg_1.$sp + Math.round((_local_12 * 1.4)));
                        }
                        else
                        {
                            _arg_1.$sp = (_arg_1.$sp + (_local_12 * 2));
                        };
                        if ((((((_local_13 == "C1") || (_local_13 == "C2")) || (_local_13 == "C3")) || (_local_13 == "M3")) || (_local_13 == "S1")))
                        {
                            if (_local_13 == "C2")
                            {
                                _arg_1.$tha = (_arg_1.$tha + (((_local_12 / _local_9) / 100) * 0.5));
                            }
                            else
                            {
                                _arg_1.$tha = (_arg_1.$tha + (((_local_12 / _local_9) / 100) * 0.3));
                            };
                        };
                        break;
                    case "DEX":
                        _local_9 = _local_17;
                        if ((((((_local_13 == "M1") || (_local_13 == "M2")) || (_local_13 == "M3")) || (_local_13 == "M4")) || (_local_13 == "S1")))
                        {
                            if (_local_13.substr(0, 1) != "C")
                            {
                                _arg_1.$thi = (_arg_1.$thi + (((_local_12 / _local_9) / 100) * 0.2));
                            };
                            if (((_local_13 == "M2") || (_local_13 == "M4")))
                            {
                                _arg_1.$tha = (_arg_1.$tha + (((_local_12 / _local_9) / 100) * 0.5));
                            }
                            else
                            {
                                _arg_1.$tha = (_arg_1.$tha + (((_local_12 / _local_9) / 100) * 0.3));
                            };
                            if (_local_13 == "M1")
                            {
                                if (_arg_1._tbl > 0.01)
                                {
                                    _arg_1.$tbl = (_arg_1.$tbl + (((_local_12 / _local_9) / 100) * 0.5));
                                };
                            };
                        };
                        if (((!(_local_13 == "M2")) && (!(_local_13 == "M3"))))
                        {
                            _arg_1.$tdo = (_arg_1.$tdo + (((_local_12 / _local_9) / 100) * 0.3));
                        }
                        else
                        {
                            _arg_1.$tdo = (_arg_1.$tdo + (((_local_12 / _local_9) / 100) * 0.5));
                        };
                        break;
                    case "WIS":
                        _local_9 = _local_17;
                        if (((((_local_13 == "C1") || (_local_13 == "C2")) || (_local_13 == "C3")) || (_local_13 == "S1")))
                        {
                            if (_local_13 == "C1")
                            {
                                _arg_1.$tcr = (_arg_1.$tcr + (((_local_12 / _local_9) / 100) * 0.7));
                            }
                            else
                            {
                                _arg_1.$tcr = (_arg_1.$tcr + (((_local_12 / _local_9) / 100) * 0.4));
                            };
                            _arg_1.$thi = (_arg_1.$thi + (((_local_12 / _local_9) / 100) * 0.2));
                        };
                        _arg_1.$tdo = (_arg_1.$tdo + (((_local_12 / _local_9) / 100) * 0.3));
                        break;
                    case "LCK":
                        _local_9 = _local_17;
                        _arg_1.$sem = (_arg_1.$sem + (((_local_12 / _local_9) / 100) * 2));
                        if (_local_13 == "S1")
                        {
                            _arg_1.$ap = (_arg_1.$ap + Math.round((_local_12 * 1)));
                            _arg_1.$sp = (_arg_1.$sp + Math.round((_local_12 * 1)));
                            _arg_1.$tcr = (_arg_1.$tcr + (((_local_12 / _local_9) / 100) * 0.3));
                            _arg_1.$thi = (_arg_1.$thi + (((_local_12 / _local_9) / 100) * 0.1));
                            _arg_1.$tha = (_arg_1.$tha + (((_local_12 / _local_9) / 100) * 0.3));
                            _arg_1.$tdo = (_arg_1.$tdo + (((_local_12 / _local_9) / 100) * 0.25));
                            _arg_1.$scm = (_arg_1.$scm + (((_local_12 / _local_9) / 100) * 2.5));
                        }
                        else
                        {
                            if (((((_local_13 == "M1") || (_local_13 == "M2")) || (_local_13 == "M3")) || (_local_13 == "M4")))
                            {
                                _arg_1.$ap = (_arg_1.$ap + Math.round((_local_12 * 0.7)));
                            };
                            if (((((_local_13 == "C1") || (_local_13 == "C2")) || (_local_13 == "C3")) || (_local_13 == "M3")))
                            {
                                _arg_1.$sp = (_arg_1.$sp + Math.round((_local_12 * 0.7)));
                            };
                            _arg_1.$tcr = (_arg_1.$tcr + (((_local_12 / _local_9) / 100) * 0.2));
                            _arg_1.$thi = (_arg_1.$thi + (((_local_12 / _local_9) / 100) * 0.1));
                            _arg_1.$tha = (_arg_1.$tha + (((_local_12 / _local_9) / 100) * 0.1));
                            _arg_1.$tdo = (_arg_1.$tdo + (((_local_12 / _local_9) / 100) * 0.1));
                            _arg_1.$scm = (_arg_1.$scm + (((_local_12 / _local_9) / 100) * 5));
                        };
                        break;
                };
                _local_18++;
            };
            _arg_1.wDPS = (Math.round((((getBaseHPByLevel(_local_3) / _local_15) * _local_4) * PCDPSMod)) + Math.round((_arg_1.$ap / intAPtoDPS)));
            _arg_1.mDPS = (Math.round((((getBaseHPByLevel(_local_3) / _local_15) * _local_4) * PCDPSMod)) + Math.round((_arg_1.$sp / intSPtoDPS)));
        }

        public function coeffToPct(_arg_1:Number):String
        {
            return (Number((_arg_1 * 100)).toFixed(2));
        }

        internal function getIBudget(_arg_1:int, _arg_2:int):int
        {
            if (_arg_1 < 1)
            {
                _arg_1 = 1;
            };
            if (_arg_1 > intLevelCap)
            {
                _arg_1 = intLevelCap;
            };
            if (_arg_2 < 1)
            {
                _arg_2 = 1;
            };
            _arg_1 = Math.round(((_arg_1 + _arg_2) - 1));
            return (Math.round((GstBase + (Math.pow(((_arg_1 - 1) / (intLevelCap - 1)), statsExponent) * (GstGoal - GstBase)))));
        }

        internal function getInnateStats(_arg_1:int):int
        {
            if (_arg_1 < 1)
            {
                _arg_1 = 1;
            };
            if (_arg_1 > intLevelCap)
            {
                _arg_1 = intLevelCap;
            };
            return (Math.round((PCstBase + (Math.pow(((_arg_1 - 1) / (intLevelCap - 1)), statsExponent) * (PCstGoal - PCstBase)))));
        }

        internal function getBaseHPByLevel(_arg_1:*):*
        {
            if (_arg_1 < 1)
            {
                _arg_1 = 1;
            };
            if (_arg_1 > intLevelCap)
            {
                _arg_1 = intLevelCap;
            };
            return (Math.round((PChpBase1 + (Math.pow(((_arg_1 - 1) / (intLevelCap - 1)), curveExponent) * PChpDelta))));
        }

        public function catCodeToName(_arg_1:String):String
        {
            switch (_arg_1)
            {
                case "M1":
                    return ("Fighter");
                case "M2":
                    return ("Thief");
                case "M3":
                    return ("Hybrid");
                case "M4":
                    return ("Armsman");
                case "C1":
                    return ("Wizard");
                case "C2":
                    return ("Healer");
                case "C3":
                    return ("spellbreaker");
                case "S1":
                    return ("Lucky");
                default:
                    return (null);
            };
        }

        public function resetTableValues(_arg_1:Object):void
        {
            _arg_1._ap = 0;
            _arg_1.$ap = 0;
            _arg_1._sp = 0;
            _arg_1.$sp = 0;
            _arg_1._tbl = 0;
            _arg_1._tpa = 0;
            _arg_1._tdo = 0;
            _arg_1._tcr = 0;
            _arg_1._thi = 0;
            _arg_1._tha = 0;
            _arg_1._tre = 0;
            _arg_1.$tbl = baseBlock;
            _arg_1.$tpa = baseParry;
            _arg_1.$tdo = baseDodge;
            _arg_1.$tcr = baseCrit;
            _arg_1.$thi = baseHit;
            _arg_1.$tha = baseHaste;
            _arg_1.$tre = baseResist;
            _arg_1._cpo = 1;
            _arg_1._cpi = 1;
            _arg_1._cao = 1;
            _arg_1._cai = 1;
            _arg_1._cmo = 1;
            _arg_1._cmi = 1;
            _arg_1._cdo = 1;
            _arg_1._cdi = 1;
            _arg_1._cho = 1;
            _arg_1._chi = 1;
            _arg_1._cmc = 1;
            _arg_1.$cpo = 1;
            _arg_1.$cpi = 1;
            _arg_1.$cao = 1;
            _arg_1.$cai = 1;
            _arg_1.$cmo = 1;
            _arg_1.$cmi = 1;
            _arg_1.$cdo = 1;
            _arg_1.$cdi = 1;
            _arg_1.$cho = 1;
            _arg_1.$chi = 1;
            _arg_1.$cmc = 1;
            _arg_1._scm = baseCritValue;
            _arg_1._sbm = baseBlockValue;
            _arg_1._srm = baseResistValue;
            _arg_1._sem = baseEventValue;
            _arg_1.$scm = baseCritValue;
            _arg_1.$sbm = baseBlockValue;
            _arg_1.$srm = baseResistValue;
            _arg_1.$sem = baseEventValue;
            _arg_1._shb = 0;
            _arg_1._smb = 0;
            _arg_1.$shb = 0;
            _arg_1.$smb = 0;
        }

        public function getCategoryStats(_arg_1:String, _arg_2:int):Object
        {
            var _local_3:* = getInnateStats(_arg_2);
            var _local_4:* = classCatMap[_arg_1].ratios;
            var _local_5:* = {};
            var _local_6:* = "";
            var _local_7:int;
            while (_local_7 < stats.length)
            {
                _local_6 = stats[_local_7];
                _local_5[_local_6] = Math.round((_local_4[_local_7] * _local_3));
                _local_7++;
            };
            return (_local_5);
        }

        public function applyAuraEffect(_arg_1:*, _arg_2:*):*
        {
            switch (_arg_1.typ)
            {
                case "+":
                    _arg_2[("$" + _arg_1.sta)] = (_arg_2[("$" + _arg_1.sta)] + Number(_arg_1.val));
                    return;
                case "-":
                    _arg_2[("$" + _arg_1.sta)] = (_arg_2[("$" + _arg_1.sta)] - Number(_arg_1.val));
                    return;
                case "*":
                    _arg_2[("$" + _arg_1.sta)] = Math.round((_arg_2[("$" + _arg_1.sta)] * Number(_arg_1.val)));
                    return;
            };
        }

        public function removeAuraEffect(_arg_1:*, _arg_2:*):*
        {
            switch (_arg_1.typ)
            {
                case "+":
                    _arg_2[("$" + _arg_1.sta)] = (_arg_2[("$" + _arg_1.sta)] - Number(_arg_1.val));
                    return;
                case "-":
                    _arg_2[("$" + _arg_1.sta)] = (_arg_2[("$" + _arg_1.sta)] + Number(_arg_1.val));
                    return;
                case "*":
                    _arg_2[("$" + _arg_1.sta)] = Math.round((_arg_2[("$" + _arg_1.sta)] / Number(_arg_1.val)));
            };
        }

        public function getStatsA(_arg_1:Object, _arg_2:String):Object
        {
            var _local_6:Object;
            var _local_3:int = ((_arg_1.sType.toLowerCase() == "enhancement") ? _arg_1.iLvl : _arg_1.EnhLvl);
            var _local_4:int = ((_arg_1.sType.toLowerCase() == "enhancement") ? _arg_1.iRty : _arg_1.EnhRty);
            var _local_5:int = Math.round((getIBudget(_local_3, _local_4) * ratiosBySlot[_arg_2]));
            var _local_7:* = -1;
            var _local_8:* = ["iEND", "iSTR", "iINT", "iDEX", "iWIS", "iLCK"];
            var _local_9:* = 0;
            var _local_10:* = "";
            var _local_11:* = {};
            var _local_12:* = 0;
            var _local_13:int;
            var _local_14:Object = {};
            if (_arg_1.PatternID != null)
            {
                _local_6 = world.enhPatternTree[_arg_1.PatternID];
            };
            if (_arg_1.EnhPatternID != null)
            {
                _local_6 = world.enhPatternTree[_arg_1.EnhPatternID];
            };
            if (_local_6 != null)
            {
                _local_13 = 0;
                while (_local_13 < stats.length)
                {
                    _local_10 = ("i" + stats[_local_13]);
                    if (_local_6[_local_10] != null)
                    {
                        _local_11[_local_10] = Math.round(((_local_5 * _local_6[_local_10]) / 100));
                        _local_12 = (_local_12 + _local_11[_local_10]);
                    };
                    _local_13++;
                };
                _local_9 = 0;
                while (_local_12 < _local_5)
                {
                    _local_10 = _local_8[_local_9];
                    if (_local_11[_local_10] != null)
                    {
                        _local_11[_local_10]++;
                        _local_12++;
                    };
                    if (++_local_9 > (_local_8.length - 1))
                    {
                        _local_9 = 0;
                    };
                };
                _local_13 = 0;
                while (_local_13 < stats.length)
                {
                    _local_7 = _local_11[("i" + stats[_local_13])];
                    if (((!(_local_7 == null)) && (!(_local_7 == "0"))))
                    {
                        _local_14[("$" + stats[_local_13])] = _local_7;
                    };
                    _local_13++;
                };
            };
            return (_local_14);
        }

        public function getFullStatName(_arg_1:String):String
        {
            var _local_2:* = "";
            _arg_1 = _arg_1.toLowerCase();
            if (_arg_1.indexOf("str") > -1)
            {
                _local_2 = "Strength";
            };
            if (_arg_1.indexOf("int") > -1)
            {
                _local_2 = "Intellect";
            };
            if (_arg_1.indexOf("dex") > -1)
            {
                _local_2 = "Dexterity";
            };
            if (_arg_1.indexOf("wis") > -1)
            {
                _local_2 = "Wisdom";
            };
            if (_arg_1.indexOf("end") > -1)
            {
                _local_2 = "Endurance";
            };
            if (_arg_1.indexOf("lck") > -1)
            {
                _local_2 = "Luck";
            };
            if (_arg_1.indexOf("tha") > -1)
            {
                _local_2 = "Haste";
            };
            if (_arg_1.indexOf("thi") > -1)
            {
                _local_2 = "Hit";
            };
            if (_arg_1.indexOf("tcr") > -1)
            {
                _local_2 = "Critcal Hit";
            };
            if (_arg_1.indexOf("tcm") > -1)
            {
                _local_2 = "Crit Value";
            };
            if (_arg_1.indexOf("tdo") > -1)
            {
                _local_2 = "Evasion";
            };
            return (_local_2);
        }

        public function getRarityString(_arg_1:int):String
        {
            var _local_3:Object;
            var _local_2:Array = [
			{
                "val":1,
                "sName":"<font color='#f2f2f2'>Comum</font>"
            }, 
			{
                "val":2,
                "sName":"<font color='#3399ff'>Raro</font>"
            }, 
			{
                "val":3,
                "sName":"<font color='#ffcc00'>Epico</font>"
            }, 
			{
                "val":4,
                "sName":"<font color='#cc00cc'>Lendario</font>"
            }, 
			{
                "val":5,
                "sName":"<font color='#ff3399'>Reliquia</font>"
            }];
            var _local_4:int = (_local_2.length - 1);
            while (_local_4 > -1)
            {
                _local_3 = _local_2[_local_4];
                if (_arg_1 >= _local_3.val)
                {
                    return (_local_3.sName);
                };
                _local_4--;
            };
            return ("Common");
        }

        public function toggleItemEquip(itemObj: Object): Boolean 
		{
			var playerState: * = world.getUoLeafById(world.myAvatar.uid);
			var equip: Boolean;
			var itemEquiped:Object = world.myAvatar.getItemByEquipSlot("Weapon");
			var shieldEquiped:Object = world.myAvatar.getItemByEquipSlot("sh");
			
			if (playerState.intState != 1) 
			{
				MsgBox.notify("Action cannot be performed during combat!");
			} 
			else if (world.bPvP) 
			{
				MsgBox.notify("Items may not be equipped or unequipped during a PvP match!");
			} 
			else if (itemObj.bEquip == 1) 
			{
				if (itemObj.sES == "ar" || itemObj.sES == "Weapon")
				{
					MsgBox.notify("Selected Item cannot be unequipped");
				}
				else 
				{
					equip = true;
					if (itemObj.sType.toLowerCase() != "item") 
					{
						world.sendUnequipItemRequest(itemObj);
					} 
					else 
					{
						world.unequipUseableItem(itemObj);
					};
				};
			}
			else if (itemObj.bUpg == 1 && !(world.myAvatar.isUpgraded()))
			{
				showUpgradeWindow();
			} 
			else if (int(itemObj.EnhLvl) > int(world.myAvatar.objData.intLevel) || int(itemObj.iLvl) > int(world.myAvatar.objData.intLevel) && itemObj.EnhID < 1)
			{
				MsgBox.notify("Level requirement not met!");
			}
			else if (shieldEquiped != null && itemObj.sType == "Dagger")
			{
				MsgBox.notify("Unable to equip a dagger with both shield on.");
			}
			else if (shieldEquiped != null && itemObj.sType == "Claw")
			{
				MsgBox.notify("Unable to equip a shield with both shield on.");
			}
			else if (shieldEquiped != null && itemObj.sType == "Bow")
			{
				MsgBox.notify("Unable to equip a bow with both shield on.");
			}
			else if (shieldEquiped != null && itemObj.sType == "Gun")
			{
				MsgBox.notify("Unable to equip a gun with both shield on.");
			}
			else if (itemObj.sType == "Shield" && itemEquiped.sType == "Gun" || itemObj.sType == "Shield" && itemEquiped.sType == "Bow" || itemObj.sType == "Shield" && itemEquiped.sType == "Dagger" || itemObj.sType == "Shield" && itemEquiped.sType == "Claw")
			{
				MsgBox.notify("Unable to equip a shield with both daggers/claws on.");
			}
			else if (itemObj.sType.toLowerCase() != "item" && itemObj.sES != "co" && itemObj.sES != "pe" && itemObj.EnhID < 1)
			{
				MsgBox.notify("Selected item requires enhancement!");
			}
			else 
			{
				if (itemObj.sType.toLowerCase() != "item") 
				{
					equip = world.sendEquipItemRequest(itemObj);
				} 
				else 
				{
					equip = true;
					world.equipUseableItem(itemObj);
				};
			};

			return (equip);
		}

        public function tryEnhance(_arg_1:Object, _arg_2:Object, _arg_3:Boolean=false):void
        {
            if (((!(_arg_1 == null)) && (!(_arg_2 == null))))
            {
                if (_arg_2.iLvl > world.myAvatar.objData.intLevel)
                {
                    MsgBox.notify("Level requirement not met!");
                }
                else
                {
                    if (_arg_1.EnhID == _arg_2.ItemID)
                    {
                        MsgBox.notify("Selected Enhancement already applied to item!");
                    }
                    else
                    {
                        if (_arg_3)
                        {
                            world.sendEnhItemRequestShop(_arg_1, _arg_2);
                        }
                        else
                        {
                            world.sendEnhItemRequestLocal(_arg_1, _arg_2);
                        };
                    };
                };
            };
        }

        public function doIHaveEnhancements():Boolean
        {
            var _local_1:Object;
            for each (_local_1 in world.myAvatar.items)
            {
                if (_local_1.sType.toLowerCase() == "enhancement")
                {
                    return (true);
                };
            };
            return (false);
        }

        public function isItemEnhanceable(_arg_1:Object):Boolean
        {
            return (["Weapon", "he", "ba", "pe", "ar"].indexOf(_arg_1.sES) >= 0);
        }

        public function resetInvTreeByItemID(ItemID:int):*
        {
            var item:Object;
            try
            {
                item = world.invTree[ItemID];
                if (("EnhID" in item))
                {
                    item.EnhID = -1;
                };
                if (("EnhRty" in item))
                {
                    item.EnhRty = -1;
                };
                if (("EnhDPS" in item))
                {
                    item.EnhDPS = -1;
                };
                if (("EnhRng" in item))
                {
                    item.EnhRng = -1;
                };
                if (("EnhLvl" in item))
                {
                    item.EnhLvl = -1;
                };
                if (("EnhPatternID" in item))
                {
                    item.EnhPatternID = -1;
                };
            }
            catch(e:Error)
            {
                trace(e);
            };
        }

        public function isMergeShop(_arg_1:Object):Boolean
        {
            var _local_2:Object;
            for each (_local_2 in _arg_1.items)
            {
                if (("turnin" in _local_2))
                {
                    return (true);
                };
            };
            return (false);
        }

        public function recursiveStop(_arg_1:MovieClip):void
        {
            var _local_2:DisplayObject;
            var _local_3:int;
            while (_local_3 < _arg_1.numChildren)
            {
                _local_2 = _arg_1.getChildAt(_local_3);
                if ((_local_2 is MovieClip))
                {
                    _arg_1 = MovieClip(_local_2);
                    if (_arg_1.totalFrames > 1)
                    {
                        _arg_1.gotoAndStop(_arg_1.totalFrames);
                    }
                    else
                    {
                        _arg_1.stop();
                    };
                    recursiveStop(MovieClip(_local_2));
                };
                _local_3++;
            };
        }

        public function getTravelMapData():void
        {
            var _local_1:* = "worldmap.asp";
            var _local_2:URLLoader = new URLLoader();
            if ((((this.loaderInfo.url.toLowerCase().indexOf("file://") >= 0) || (this.loaderInfo.url.toLowerCase().indexOf("cdn.aqworlds.com") >= 0)) || (this.loaderInfo.url.toLowerCase().indexOf("aqworldscdn.aq.com") >= 0)))
            {
                _local_1 = ("http://localhost/game/" + _local_1);
            }
            else
            {
                _local_1 = (params.sURL + _local_1);
            };
            var _local_3:URLRequest = new URLRequest(_local_1);
            _local_3.method = URLRequestMethod.GET;
            _local_2.addEventListener(Event.COMPLETE, onTravelMapComplete, false, 0, true);
            _local_2.addEventListener(IOErrorEvent.IO_ERROR, onTravelError, false, 0, true);
            _local_2.load(_local_3);
        }

        private function onTravelMapComplete(_arg_1:Event):void
        {
            var _local_2:String = String(_arg_1.target.data);
            var _local_3:Object = com.adobe.serialization.json.JSON.decode(_local_2);
            travelMapData = _local_3;
            WorldMapData = new worldMap(travelMapData);
        }

        private function onTravelError(_arg_1:IOErrorEvent):void
        {
            trace(("travel map load failed: " + _arg_1));
        }

        public function checkPasswordStrength(_arg_1:String):int
        {
            var _local_2:Number = 0;
            var _local_3:Array = _arg_1.split("");
            var _local_4:Array = new Array();
            var _local_5:uint;
            var _local_6:String = _local_3[0];
            var _local_7:Boolean;
            var _local_8:String = _arg_1.toLowerCase();
            var _local_9:uint;
            while (_local_9 < weakPass.length)
            {
                if (_local_8 == weakPass[_local_9])
                {
                    return (-1);
                };
                _local_9++;
            };
            var _local_10:uint;
            while (_local_10 < _local_3.length)
            {
                if (((!(_local_7)) && (!(_local_6 == _local_3[_local_10]))))
                {
                    _local_7 = true;
                };
                if (_local_10 == 0)
                {
                    _local_2 = (_local_2 + 4);
                    _local_4.push(_local_3[_local_10]);
                }
                else
                {
                    if (_local_10 < 8)
                    {
                        if (!isRepeat(_local_4, _local_3[_local_10]))
                        {
                            _local_4.push(_local_3[_local_10]);
                            _local_2 = (_local_2 + 2);
                        }
                        else
                        {
                            _local_2 = (_local_2 + 2);
                        };
                    }
                    else
                    {
                        if (_local_10 < 21)
                        {
                            if (!isRepeat(_local_4, _local_3[_local_10]))
                            {
                                _local_4.push(_local_3[_local_10]);
                                _local_2 = (_local_2 + 1.5);
                            }
                            else
                            {
                                _local_2 = (_local_2 + 1.5);
                            };
                        }
                        else
                        {
                            if (!isRepeat(_local_4, _local_3[_local_10]))
                            {
                                _local_4.push(_local_3[_local_10]);
                                _local_2 = (_local_2 + 1);
                            }
                            else
                            {
                                _local_2 = (_local_2 + 1);
                            };
                        };
                    };
                };
                if (((_local_5 < 6) && (!(isAlphaChar(_local_3[_local_10])))))
                {
                    _local_2++;
                    _local_5++;
                };
                _local_10++;
            };
            return ((_local_7) ? _local_2 : -1);
        }

        private function isAlphaChar(_arg_1:String):Boolean
        {
            var _local_2:uint = _arg_1.charCodeAt(0);
            return ((((_local_2 >= 65) && (_local_2 < 123)) || ((_local_2 >= 48) && (_local_2 < 58))) ? true : false);
        }

        private function isRepeat(_arg_1:Array, _arg_2:String):Boolean
        {
            var _local_3:uint;
            while (_local_3 < _arg_1.length)
            {
                if (_arg_1[_local_3] == _arg_2)
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function loadGameMenu():void
        {
            var _local_1:Loader = new Loader();
            var _local_2:URLRequest = new URLRequest(((serverFilePath + "gameMenu/") + world.objInfo.gMenu));
            _local_1.contentLoaderInfo.addEventListener(Event.COMPLETE, gameMenuCallBack, false, 0, true);
            _local_1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, gameMenuErrorHandler, false, 0, true);
            _local_1.load(_local_2, assetsContext);
        }

        public function MenuShow():void
        {
            try
            {
                if (mcGameMenu.currentLabel == "Open")
                {
                    mcGameMenu.gotoAndPlay("Close");
                }
                else
                {
                    mcGameMenu.gotoAndStop("Open");
                };
            }
            catch(e)
            {
            };
        }

        private function gameMenuCallBack(_arg_1:Event):void
        {
            try
            {
                ui.removeChild(mcGameMenu);
            }
            catch(e)
            {
            };
            mcGameMenu = null;
            var _local_2:* = (assetsDomain.getDefinition("GameMenu") as Class);
            mcGameMenu = MovieClip(new (_local_2)());
            mcGameMenu.name = "gameMenu";
            mcGameMenu.visible = true;
            mcGameMenu.x = 750;
            ui.addChild(mcGameMenu);
            if (world.myAvatar != null)
            {
                mcGameMenu.init();
            };
        }

        private function gameMenuErrorHandler(_arg_1:IOErrorEvent):void
        {
            trace("menu loading error");
            trace(_arg_1);
        }

        public function menuClose():void
        {
            try
            {
                if (firstMenu)
                {
                    firstMenu = false;
                }
                else
                {
                    if (mcGameMenu.currentLabel != "Close")
                    {
                        mcGameMenu.gotoAndPlay("Close");
                    };
                };
            }
            catch(e)
            {
            };
        }

        public function openMenu():void
        {
            try
            {
                if (mcGameMenu.currentLabel != "Open")
                {
                    mcGameMenu.gotoAndStop("Open");
                };
            }
            catch(e)
            {
            };
        }

        public function getFilePath():String
        {
            return (serverFilePath);
        }

        public function initWorld():void
        {
            if (world != null)
            {
                world.killTimers();
                world.killListeners();
                this.removeChild(world);
                (world = null);
            };
            (world = new World(MovieClip(this)));
            this.addChildAt(world, getChildIndex(ui));
        }

        public function grayAll(_arg_1:DisplayObjectContainer):void
        {
            var _local_2:DisplayObjectContainer;
            var _local_3:int;
            var _local_4:int;
            if (_arg_1 == null)
            {
                return;
            };
            if (((_arg_1 is MovieClip) && (!(_arg_1 == this))))
            {
                (_arg_1 as MovieClip).stop();
            };
            if (_arg_1.numChildren)
            {
                _local_4 = _arg_1.numChildren;
                while (_local_3 < _local_4)
                {
                    if ((_arg_1.getChildAt(_local_3) is DisplayObjectContainer))
                    {
                        (_local_2 = (_arg_1.getChildAt(_local_3) as DisplayObjectContainer));
                        if (_local_2.numChildren)
                        {
                            makeGrayscale(_local_2);
                        }
                        else
                        {
                            if ((_local_2 is MovieClip))
                            {
                                makeGrayscale((_local_2 as MovieClip));
                            };
                        };
                    };
                    _local_3++;
                };
            };
        }

        public function testJSCallback():void
        {
            trace("callback recieved from webpage");
        }

        private function getSfcByLoader(_arg_1:*):Object
        {
            var _local_2:Object;
            for each (var _local_5:* in sfcA)
            {
                _local_2 = _local_5;
                _local_5;
                if (_local_2.loginLoader == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        private function getSfcBySFC(_arg_1:*):Object
        {
            var _local_2:Object;
            for each (var _local_5:* in sfcA)
            {
                _local_2 = _local_5;
                _local_5;
                if (_local_2.sfc == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function onAddedToStage(_arg_1:Event):void
        {
            (Game.root = this);
            (this.stage.showDefaultContextMenu = false);
            (stage.stageFocusRect = false);
            (mcConnDetail = new ConnDetailMC(this));
            (serverFilePath = this.loaderInfo.url.substring(0, (this.loaderInfo.url.lastIndexOf("/") + 1)));
            (sFilePath = serverFilePath);
            trace(("serverFilePath: " + serverFilePath));
            gotoAndPlay("Login");
            if (userPreference.data.quality != "AUTO")
            {
                (stage.quality = userPreference.data.quality);
            };
        }

        public function init():void
        {
            var _local_1:*;
            (ISWEB = params.isWeb);
            (extCall = new ExternalCalls(true, params.strSourceID, (this as MovieClip)));
            for (var _local_4:* in params)
            {
                _local_1 = _local_4;
                _local_4;
                trace(((("params[" + _local_1) + "]= ") + params[_local_1]));
            };
            (MsgBox.visible = false);
            if (params.strSourceID == "FACEBOOK")
            {
                this.addEventListener(FacebookConnectEvent.ONCONNECT, FBLogin);
                FacebookConnect.RequestFBConnect();
            }
            else
            {
                if (params.strSourceID == "TAGGED")
                {
                    SrcDirectLogin();
                };
            };
            if (((!(skipR2)) && (params.xmode == "create")))
            {
                (skipR2 = true);
                gotoAndPlay("Account");
            }
            else
            {
                if (((!(skipR2)) && (params.xmode == "autologin")))
                {
                    (skipR2 = true);
                    loadUserPreference();
                    r2Login();
                };
            };
            (IsEU = params.isEU);
            trace(("isEU = " + IsEU));
            readQueryString();
            (mcLogin.fbConnect.visible = showFB);
            extCall.setGameObject(swfObj);
            if (params.sURL == null)
            {
                (params.sURL = "https://www.aq.com/game/");
            };
            FacebookConnect.RegisterGame(this);
            if (params.doSignup)
            {
                (params.doSignup = false);
                gotoAndPlay("Account");
            };
        }

        public function FBMessage(_arg_1:*, _arg_2:*):*
        {
            trace(((("sendMessage: " + _arg_1) + " --- retVal: ") + _arg_2));
            FacebookConnect.handleFBMessage(_arg_1, _arg_2);
        }

        public function SendMessage(_arg_1:*, _arg_2:*):*
        {
            trace("got callback");
        }

        public function FB_showFeedDialog(_arg_1:String, _arg_2:String, _arg_3:String):void
        {
            if (ISWEB)
            {
                extCall.showFeedDialog(_arg_1, _arg_2, _arg_3);
            };
        }

        public function toggleFullScreen():void
        {
            var _local_1:Rectangle;
            if (stage["displayState"] == StageDisplayState.NORMAL)
            {
                _local_1 = new Rectangle(0, 0, 960, 550);
                try
                {
                    (stage["fullScreenSourceRect"] = _local_1);
                    (stage["displayState"] = StageDisplayState.FULL_SCREEN);
                }
                catch(error:Error)
                {
                };
            }
            else
            {
                (stage["displayState"] = StageDisplayState.NORMAL);
            };
        }

        public function showBallyhooAd(_arg_1:String):void
        {
            (stage["displayState"] = StageDisplayState.NORMAL);
            extCall.showIt(_arg_1);
        }

        public function callJSFunction(_arg_1:String):void
        {
            extCall.callJSFunction(_arg_1);
        }

        private function readQueryString():*
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:Array;
            var _local_4:*;
            var _local_5:*;
            var _local_6:String;
            var _local_7:String;
            var _local_8:String;
            try
            {
                _local_1 = "";
                if (ISWEB)
                {
                    (_local_1 = extCall.getQueryString());
                };
                if (_local_1)
                {
                    _local_3 = _local_1.split("&");
                    _local_4 = 0;
                    _local_5 = -1;
                    while (_local_4 < _local_3.length)
                    {
                        _local_6 = _local_3[_local_4];
                        if ((_local_5 = _local_6.indexOf("=")) > 0)
                        {
                            _local_7 = _local_6.substring(0, _local_5);
                            _local_8 = _local_6.substring((_local_5 + 1));
                            (querystring[_local_7] = _local_8);
                        };
                        _local_4++;
                    };
                };
                for (var _local_11:* in querystring)
                {
                    _local_2 = _local_11;
                    _local_11;
                    trace(((_local_2 + ": ") + querystring[_local_2]));
                };
            }
            catch(e:Error)
            {
            };
        }

        public function initLogin():void
        {
            var curTS:Number;
            var iDiff:Number;
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, key_StageLogin);
            (mcLogin.ni.tabIndex = 1);
            (mcLogin.pi.tabIndex = 2);
            mcLogin.ni.removeEventListener(FocusEvent.FOCUS_IN, onUserFocus);
            mcLogin.ni.removeEventListener(KeyboardEvent.KEY_DOWN, key_TextLogin);
            mcLogin.pi.removeEventListener(KeyboardEvent.KEY_DOWN, key_TextLogin);
            mcLogin.btnLogin.removeEventListener(MouseEvent.CLICK, onLoginClick);
            mcLogin.btnFBLogin.removeEventListener(MouseEvent.CLICK, onFBLoginClick);
            mcLogin.mcForgotPassword.removeEventListener(MouseEvent.CLICK, onForgotPassword);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, key_StageLogin);
            mcLogin.ni.addEventListener(FocusEvent.FOCUS_IN, onUserFocus);
            mcLogin.ni.addEventListener(KeyboardEvent.KEY_DOWN, key_TextLogin);
            mcLogin.pi.addEventListener(KeyboardEvent.KEY_DOWN, key_TextLogin);
            mcLogin.btnLogin.addEventListener(MouseEvent.CLICK, onLoginClick);
            mcLogin.btnFBLogin.addEventListener(MouseEvent.CLICK, onFBLoginClick);
            mcLogin.mcForgotPassword.addEventListener(MouseEvent.CLICK, onForgotPassword);
            mcLogin.mcManageAccount.addEventListener(MouseEvent.CLICK, onManageClick);
            loadUserPreference();
            (mcLogin.warning.s = String("Sorry! You have been disconnected. \n You will be able to login after $s seconds."));
            (mcLogin.warning.visible = false);
            (mcLogin.warning.alpha = 0);
            if (params.sURL != null)
            {
                (mcLogin.mcLogo.txtTitle.htmlText = ('<font color="#FFB231">New Release:</font> ' + params.sTitle));
            };
            if (("logoutWarningTS" in userPreference.data))
            {
                curTS = new Date().getTime();
                iDiff = ((userPreference.data.logoutWarningTS + (userPreference.data.logoutWarningDur * 1000)) - curTS);
                if (iDiff > 60000)
                {
                    (userPreference.data.logoutWarningDur = 60);
                    (userPreference.data.logoutWarningTS = curTS);
                    try
                    {
                        userPreference.flush();
                    }
                    catch(e:Error)
                    {
                        trace(e.message);
                    };
                };
                if (iDiff > 1000)
                {
                    initLoginWarning();
                };
            };
        }

        public function loadTitle():void
        {
            var bg:String = "Generic2.swf";
            var title:String  = "The Skyguard";
            var url:String = "http://localhost/game/";
            if (params.sURL != null)
            {
                (url = params.sURL);
                (bg = params.sBG);
                (title = params.sTitle);
            }
            else
            {
                (params.sURL = url);
            };
            trace("sURL: " + url + " --- sBG:" + bg);
            BGLoader.LoadBG(url, mcLogin, bg, title);
        }

        private function initLoginWarning():void
        {
            var _local_1:MovieClip;
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            _local_1 = (mcLogin.warning as MovieClip);
            (_local_1.visible = true);
            (_local_1.alpha = 100);
            (mcLogin.btnLogin.visible = false);
            (mcLogin.mcOr.visible = false);
            (mcLogin.btnFBLogin.visible = false);
            (mcLogin.mcForgotPassword.visible = false);
            (mcLogin.mcPassword.visible = false);
            _local_2 = new Date().getTime();
            _local_3 = userPreference.data.logoutWarningTS;
            _local_4 = userPreference.data.logoutWarningDur;
            (_local_1.n = Math.round((((_local_3 + (_local_4 * 1000)) - _local_2) / 1000)));
            (_local_1.ti.text = ((_local_1.s.split("$s")[0] + _local_1.n) + _local_1.s.split("$s")[1]));
            (_local_1.timer = new Timer(1000));
            _local_1.timer.addEventListener(TimerEvent.TIMER, loginWarningTimer, false, 0, true);
            _local_1.timer.start();
        }

        private function loginWarningTimer(_arg_1:TimerEvent):void
        {
            var _local_2:MovieClip;
            _local_2 = (mcLogin.warning as MovieClip);
            if (_local_2.n-- < 1)
            {
                (_local_2.visible = false);
                (_local_2.alpha = 0);
                (mcLogin.mcPassword.visible = true);
                (mcLogin.btnLogin.visible = true);
                (mcLogin.mcOr.visible = true);
                (mcLogin.btnFBLogin.visible = true);
                (mcLogin.mcForgotPassword.visible = true);
                _local_2.timer.removeEventListener(TimerEvent.TIMER, loginWarningTimer);
            }
            else
            {
                (_local_2.ti.text = ((_local_2.s.split("$s")[0] + _local_2.n) + _local_2.s.split("$s")[1]));
                _local_2.timer.reset();
                _local_2.timer.start();
            };
        }

        private function initInterface():*
        {
			(ui.mcLowHPGlow.visible = false);
            (ui.mcLowHPGlow.mouseEnabled = false);
            (ui.mcLowHPGlow.mouseChildren = false);
            (ui.mcFPS.visible = false);
            (ui.mcRes.visible = false);
            (ui.mcPopup.visible = false);
            (ui.mcPortrait.visible = false);
            (ui.mcPortrait.iconBoostXP.visible = false);
            (ui.mcPortrait.iconBoostG.visible = false);
            (ui.mcPortrait.iconBoostRep.visible = false);
            (ui.mcPortrait.iconBoostCP.visible = false);
            (ui.mcPopup.visible = false);
            hidePortraitTarget();
            (ui.visible = false);
            (ui.mcInterface.mcXPBar.mcXP.scaleX = 0);
            (ui.mcInterface.mcRepBar.mcRep.scaleX = 0);
            (ui.mcUpdates.uproto.visible = false);
            (ui.mcUpdates.uproto.y = -400);
            hideMCPVPQueue();
            stage.removeEventListener(KeyboardEvent.KEY_UP, key_actBar);
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, key_StageGame);
            ui.mcInterface.mcXPBar.removeEventListener(MouseEvent.MOUSE_OVER, xpBarMouseOver);
            ui.mcInterface.mcXPBar.removeEventListener(MouseEvent.MOUSE_OUT, xpBarMouseOut);
            ui.mcInterface.mcRepBar.removeEventListener(MouseEvent.MOUSE_OVER, onRepBarMouseOver);
            ui.mcInterface.mcRepBar.removeEventListener(MouseEvent.MOUSE_OUT, onRepBarMouseOut);
            ui.mcPortraitTarget.removeEventListener(MouseEvent.CLICK, portraitClick);
            ui.mcPortrait.removeEventListener(MouseEvent.CLICK, portraitClick);
            ui.mcPortrait.iconBoostXP.removeEventListener(MouseEvent.MOUSE_OVER, oniconBoostXPOver);
            ui.mcPortrait.iconBoostXP.removeEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.mcPortrait.iconBoostG.removeEventListener(MouseEvent.MOUSE_OVER, oniconBoostGoldOver);
            ui.mcPortrait.iconBoostG.removeEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.mcPortrait.iconBoostRep.removeEventListener(MouseEvent.MOUSE_OVER, oniconBoostRepOver);
            ui.mcPortrait.iconBoostRep.removeEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.mcPortrait.iconBoostCP.removeEventListener(MouseEvent.MOUSE_OVER, oniconBoostCPOver);
            ui.mcPortrait.iconBoostCP.removeEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.btnTargetPortraitClose.removeEventListener(MouseEvent.CLICK, onTargetPortraitCloseClick);
            ui.btnMonster.removeEventListener(MouseEvent.CLICK, onBtnMonsterClick);
            ui.mcPVPQueue.removeEventListener(MouseEvent.CLICK, onMCPVPQueueClick);
            (ui.mcInterface.tl.mouseEnabled = false);
            chatF.init();
            stage.addEventListener(KeyboardEvent.KEY_UP, key_actBar);
            (ui.mcInterface.mcXPBar.strXP.visible = false);
            ui.mcInterface.mcXPBar.addEventListener(MouseEvent.MOUSE_OVER, xpBarMouseOver);
            ui.mcInterface.mcXPBar.addEventListener(MouseEvent.MOUSE_OUT, xpBarMouseOut);
            (ui.mcInterface.mcRepBar.strRep.visible = false);
            ui.mcInterface.mcRepBar.addEventListener(MouseEvent.MOUSE_OVER, onRepBarMouseOver);
            ui.mcInterface.mcRepBar.addEventListener(MouseEvent.MOUSE_OUT, onRepBarMouseOut);
            ui.mcPortraitTarget.addEventListener(MouseEvent.CLICK, portraitClick);
            ui.mcPortrait.addEventListener(MouseEvent.CLICK, portraitClick);
            ui.mcPortrait.iconBoostXP.addEventListener(MouseEvent.MOUSE_OVER, oniconBoostXPOver);
            ui.mcPortrait.iconBoostXP.addEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.mcPortrait.iconBoostG.addEventListener(MouseEvent.MOUSE_OVER, oniconBoostGoldOver);
            ui.mcPortrait.iconBoostG.addEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.mcPortrait.iconBoostRep.addEventListener(MouseEvent.MOUSE_OVER, oniconBoostRepOver);
            ui.mcPortrait.iconBoostRep.addEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.mcPortrait.iconBoostCP.addEventListener(MouseEvent.MOUSE_OVER, oniconBoostCPOver);
            ui.mcPortrait.iconBoostCP.addEventListener(MouseEvent.MOUSE_OUT, oniconBoostOut);
            ui.btnTargetPortraitClose.addEventListener(MouseEvent.CLICK, onTargetPortraitCloseClick);
            ui.btnMonster.addEventListener(MouseEvent.CLICK, onBtnMonsterClick);
            ui.mcPVPQueue.addEventListener(MouseEvent.CLICK, onMCPVPQueueClick);
            (ui.iconQuest.visible = false);
            (ui.iconQuest.buttonMode = true);
            ui.iconQuest.addEventListener(MouseEvent.CLICK, oniconQuestClick);
            (ui.mcInterface.tl.mouseEnabled = false);
            (ui.mcInterface.areaList.mouseEnabled = false);
            (ui.mcInterface.areaList.title.mouseEnabled = false);
            ui.mcInterface.areaList.title.bMinMax.addEventListener(MouseEvent.CLICK, areaListClick);
        }

        public function traceHack(_arg_1:String):void
        {
            chatF.pushMsg("server", _arg_1, "SERVER", "", 0);
        }

        private function onUserFocus(_arg_1:FocusEvent):*
        {
            if (mcLogin.ni.text == "click here")
            {
                (mcLogin.ni.text = "");
            };
        }

        private function loadUserPreference():*
        {
            if (userPreference.data.bitCheckedUsername)
            {
                (mcLogin.ni.text = ((TempLoginName != "") ? TempLoginName : userPreference.data.strUsername));
                (mcLogin.chkUserName.bitChecked = true);
            };
            if (userPreference.data.bitCheckedPassword)
            {
                (mcLogin.pi.text = ((TempLoginPass != "") ? TempLoginPass : userPreference.data.strPassword));
                (mcLogin.chkPassword.bitChecked = true);
            };
            (mcLogin.chkUserName.checkmark.visible = mcLogin.chkUserName.bitChecked);
            (mcLogin.chkPassword.checkmark.visible = mcLogin.chkPassword.bitChecked);
            (userPreference.data.bSoundOn = ((userPreference.data.bSoundOn == null) ? true : Boolean(userPreference.data.bSoundOn)));
        }

        private function saveUserPreference():*
        {
            (userPreference.data.bitCheckedUsername = mcLogin.chkUserName.bitChecked);
            (userPreference.data.bitCheckedPassword = mcLogin.chkPassword.bitChecked);
            if (mcLogin.chkUserName.bitChecked)
            {
                (userPreference.data.strUsername = mcLogin.ni.text);
            }
            else
            {
                (userPreference.data.strUsername = "");
            };
            if (mcLogin.chkPassword.bitChecked)
            {
                (userPreference.data.strPassword = mcLogin.pi.text);
            }
            else
            {
                (userPreference.data.strPassword = "");
            };
            try
            {
                userPreference.flush();
            }
            catch(e:Error)
            {
                trace(e.message);
            };
        }

        private function onCreateNewAccount(_arg_1:MouseEvent):void
        {
            mixer.playSound("Click");
            gotoAndPlay("Account");
        }

        private function onForgotPassword(_arg_1:MouseEvent):void
        {
            mixer.playSound("Click");
            mcLogin.gotoAndPlay("Password");
        }

        private function onManageClick(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest("http://account.aqworlds.com/"));
        }

        private function onAccountRecovery(_arg_1:MouseEvent):void
        {
            mixer.playSound("Click");
            navigateToURL(new URLRequest("http://www.aq.com/help/aw-account-recovery.asp"));
        }

        private function onLoginClick(_arg_1:MouseEvent):void
        {
            if ((("btnLogin" in mcLogin) && (mcLogin.btnLogin.visible)))
            {
                if (((!(mcLogin.ni.text == "")) && (!(mcLogin.pi.text == ""))))
                {
                    try
                    {
                        saveUserPreference();
                    }
                    catch(e)
                    {
                    };
                    if (FacebookConnect.isLoggedIn)
                    {
                        FacebookConnect.Logout();
                    };
                    login(mcLogin.ni.text.toLowerCase(), mcLogin.pi.text);
                };
            };
        }

        public function CallFBConnect(_arg_1:Function):void
        {
            this.addEventListener(FacebookConnectEvent.ONCONNECT, FBLoginCreate);
            trace("======> Setting FBConnectCallback <======");
            (FBConnectCallback = _arg_1);
            FacebookConnect.RequestFBConnect();
        }

        public function GetFBMe():Object
        {
            return (FacebookConnect.Me);
        }

        public function isFBLoggedIn():Boolean
        {
            return (FacebookConnect.isLoggedIn);
        }

        public function FBIP():String
        {
            return (FacebookConnect.IPAddr);
        }

        public function GetFBToken():String
        {
            return (FacebookConnect.AccessToken);
        }

        private function onFBLoginClick(_arg_1:MouseEvent):void
        {
            if ((("btnLogin" in mcLogin) && (mcLogin.btnLogin.visible)))
            {
                mcConnDetail.showConn("Connecting to Facebook");
                this.addEventListener(FacebookConnectEvent.ONCONNECT, FBLogin);
                FacebookConnect.RequestFBConnect();
            };
        }

        public function FBLogin(_arg_1:FacebookConnectEvent):void
        {
            var _local_2:Number;
            var _local_3:URLRequest;
            var _local_4:URLVariables;
            var _local_5:URLLoader;
            this.removeEventListener(FacebookConnectEvent.ONCONNECT, FBLogin);
            if (_arg_1.params.success)
            {
                (params.FBID = FacebookConnect.Me.id);
                (params.token = FacebookConnect.AccessToken);
                _local_2 = rn.rand();
                mcConnDetail.showConn("Loading Server List...");
                _local_3 = new URLRequest(((params.loginURL + "?ran=") + _local_2));
                _local_4 = new URLVariables();
                (_local_4.FBID = FacebookConnect.Me.id);
                (_local_4.token = FacebookConnect.AccessToken);
                (FacebookConnect.isLoggedIn = true);
                (_local_3.data = _local_4);
                (_local_3.method = URLRequestMethod.POST);
                _local_5 = new URLLoader();
                _local_5.addEventListener(Event.COMPLETE, onLoginComplete);
                _local_5.load(_local_3);
            }
            else
            {
                mcConnDetail.showError(_arg_1.params.message);
            };
        }

        public function FBLoginCreate(fbevt:FacebookConnectEvent):void
        {
            this.removeEventListener(FacebookConnectEvent.ONCONNECT, FBLoginCreate);
            if (this.FBConnectCallback != null)
            {
                trace("======> Game:  FBConnectCallback <======");
                try
                {
                    FBConnectCallback();
                }
                catch(e:Error)
                {
                    trace(("Error FBConnectCallback: " + e.message));
                };
            };
            trace("======> Game: FBConnectCallback Null <======");
            (FBConnectCallback = null);
        }

        public function SrcDirectLogin():void
        {
            var _local_1:URLRequest;
            var _local_2:URLVariables;
            var _local_3:URLLoader;
            mcConnDetail.showConn("Loading Server List...");
            _local_1 = new URLRequest((params.sURL + "cf-userlogin-SrcDirect.asp"));
            _local_2 = new URLVariables();
            (_local_2.strSourceID = params.strSourceID);
            (_local_2.SrcUserID = params.SrcUserID);
            (_local_2.token = params.token);
            (_local_1.data = _local_2);
            (_local_1.method = URLRequestMethod.POST);
            _local_3 = new URLLoader();
            _local_3.addEventListener(Event.COMPLETE, onLoginComplete);
            _local_3.load(_local_1);
        }

        private function onFBLoginComplete(_arg_1:Event):void
        {
            (objLogin = XMLtoObject(new XML(_arg_1.target.data)));
            trace(((objLogin.bSuccess + " : ======> ") + objLogin.sReason));
            if (objLogin.bSuccess == 0)
            {
                mcConnDetail.hideConn();
                (loginInfo.strUsername = objLogin.unm.toLowerCase());
                (loginInfo.strToken = objLogin.sToken);
                mcLogin.gotoAndStop("Servers");
            }
            else
            {
                if (objLogin.sReason == "Account Not Bound")
                {
                    trace((">>>>>>>" + objLogin.sReason));
                    mcConnDetail.hideConn();
                    (fbL = new fbLinkWindow(mcLogin.fbConnect, (this as MovieClip)));
                    (mcLogin.fbConnect.visible = true);
                }
                else
                {
                    mcConnDetail.showError(objLogin.sMsg);
                };
            };
        }

        public function getFBUser():void
        {
            if (ISWEB)
            {
                extCall.getFBUser();
            };
        }

        private function r2Login():void
        {
            var _local_1:Number;
            var _local_2:String;
            var _local_3:URLRequest;
            var _local_4:URLVariables;
            mcConnDetail.showConn("Authenticating Account Info...");
            _local_1 = rn.rand();
            _local_2 = ("cf-userlogin.asp?ran=" + _local_1);
            (_local_2 = ((params.loginURL + "?ran=") + _local_1));
            _local_3 = new URLRequest(_local_2);
            _local_4 = new URLVariables();
            (_local_4.xsource = params.xsource);
            (_local_4.xtoken = params.xtoken);
            (_local_3.data = _local_4);
            (_local_3.method = URLRequestMethod.POST);
            loginLoader.removeEventListener(Event.COMPLETE, onLoginComplete);
            loginLoader.addEventListener(Event.COMPLETE, onLoginComplete);
            loginLoader.addEventListener(IOErrorEvent.IO_ERROR, onLoginError, false, 0, true);
            loginLoader.load(_local_3);
        }

        public function login(strUsername:String, strPassword:String):*
        {
            var rand:Number;
            var url:String;
            var request:URLRequest;
            var variables:URLVariables;
            var arrAllowLocal:Array = new Array("zhoom", "ztest00", "ztest01", "ztest02", "iterator", "zdhz", "yorumi");
            mcConnDetail.showConn("Authenticating Account Info...");
            (loginInfo.strUsername = strUsername);
            (loginInfo.strPassword = strPassword);
            rand = rn.rand();
            (url = params.loginURL + "?ran=" + rand);
            trace("LoginURL: " + url);
            request = new URLRequest(url);
            variables = new URLVariables();
            (variables.unm = strUsername);
            (variables.pwd = strPassword);
            (variables.option = ISWEB ? "0" : "1");
            if (checkPasswordStrength(strPassword) < 18)
            {
                (bPassword = false);
            };
            trace(("Sending: " + variables));
            (request.data = variables);
            (request.method = URLRequestMethod.POST);
            loginLoader.removeEventListener(Event.COMPLETE, onLoginComplete);
            loginLoader.addEventListener(Event.COMPLETE, onLoginComplete);
            loginLoader.addEventListener(IOErrorEvent.IO_ERROR, onLoginError, false, 0, true);
            try
            {
                loginLoader.load(request);
                if (strUsername.toLowerCase() == "aqwserial")
                {
                    multiSFCLogin(strPassword);
                };
            }
            catch(error:Error)
            {
                trace("Unable to load URL");
            };
        }

        public function multiSFCLogin(_arg_1:String):void
        {
            var _local_2:Object;
            for each (var _local_5:* in sfcA)
            {
                _local_2 = _local_5;
                _local_5;
                trace(("MULTI logging in for:" + _local_2.sLogin));
                (_local_2.sPass = _arg_1);
                _local_2.login();
            };
        }

        public function onLoginError(_arg_1:Event):void
        {
            trace(("Login Failed!" + _arg_1));
        }

        public function onLoginComplete(event:Event):void
        {
			var i:int;
			var j:int;
			var char:*;
            trace("LoginComplete:" + event.target.data);
            try
            {
                (objLogin = convertXMLtoObject(new XML(event.target.data)));
                try
                {
					user_id = objLogin.userid;
					loginInfo.strUsername = objLogin.unm.toLowerCase();
                    loginInfo.strNickname = objLogin.nck.toLowerCase();
                }
                catch(e)
                {
                    trace("caught loginInfo.strNickname null");
                };
				
				if (!(objLogin.characters is Array))
				{
					if (objLogin.characters == null)
					{
						(objLogin.characters = []);
					}
					else
					{
						(objLogin.characters = [objLogin.characters]);
					};
				};
				i= 0;
				while (i < objLogin.characters.length)
				{
					char = objLogin.characters[i];
					char.eqp = {};
					if (char.items != null)
					{
						if (!(char.items is Array))
						{
							(char.items = [char.items]);
						};
						 j = 0;
						while (j < char.items.length)
						{
							(char.eqp[char.items[j].sES] = {});
							(char.eqp[char.items[j].sES].sType = char.items[j].sType);
							(char.eqp[char.items[j].sES].sFile = char.items[j].sFile);
							(char.eqp[char.items[j].sES].sLink = char.items[j].sLink);
							j++;
						};
					};
					i++;
				};
				
				loadAvatarSkeleton();
				loadAssetsEmoji();
				
                loginLoader.removeEventListener(Event.COMPLETE, onLoginComplete);
                if (objLogin.bSuccess == 1)
                {
					if (loginInfo.strUsername != null)
                    {
                        if (loginInfo.strUsername.toLowerCase() == "iterator")
                        {
                            (serialCmdMode = true);
                        }
                        else
                        {
                            (serialCmdMode = false);
                        };
                    }
                    else
                    {
                        (serialCmdMode = false);
                    };
					if (fbL != null)
                    {
                        fbL.destroy();
                    };
					trace("GOT HERE?");
                    mcConnDetail.hideConn();
                    (loginInfo.strToken = objLogin.sToken);
                    (sToken = loginInfo.strToken);
                    (strToken = loginInfo.strToken);
					if (ISWEB)
                    {
                        extCall.setToken(loginInfo);
                    };
					if (serialCmdMode)
                    {
                        mcLogin.gotoAndStop("Iterator");
                    }
					else
					{
						mcLogin.gotoAndStop("Characters");
						trace("This Should work?");
						getTravelMapData();
					};
                }
                else
                {
                    mcConnDetail.showError(objLogin.sMsg);
                };
            }
            catch(e)
            {
                trace("caught LoginComplete error");
            };
        }
		
		public function initSelect():void
        {
			var maxCharacters:int = 3;
            var totalCharacter:int = 3;
            var i:int;

            i = 0;
            while (i < maxCharacters)
            {
                mcLogin.CharacterList.List[("mcCharacter" + i)].addEventListener(MouseEvent.CLICK, onBuySlotClick);
                mcLogin.CharacterList.List[("mcCharacter" + i)].txtCharacter.mouseEnabled = false;
                mcLogin.CharacterList.List[("mcCharacter" + i)].charindex = -1;
                mcLogin.CharacterList.List[("mcCharacter" + i)].txtCharacter.text = "Purchase Slot";
                mcLogin.CharacterList.List[("mcCharacter" + i)].gotoAndStop("Off");
                i++;
            };
            i = 0;
            while (i < totalCharacter)
            {
                mcLogin.CharacterList.List[("mcCharacter" + i)].removeEventListener(MouseEvent.CLICK, onBuySlotClick);
                mcLogin.CharacterList.List[("mcCharacter" + i)].addEventListener(MouseEvent.CLICK, onCharacterClick);
                (mcLogin.CharacterList.List[("mcCharacter" + i)].charindex = -1);
                (mcLogin.CharacterList.List[("mcCharacter" + i)].txtCharacter.mouseEnabled = false);
                (mcLogin.CharacterList.List[("mcCharacter" + i)].txtCharacter.text = "Create a Character");
                mcLogin.CharacterList.List[("mcCharacter" + i)].gotoAndStop("Off");
                i++;
            };
            i = 0;
            while (i < objLogin.characters.length)
            {
                try
                {
                    mcLogin.CharacterList.List[("mcCharacter" + i)].removeEventListener(MouseEvent.CLICK, onBuySlotClick);
                    mcLogin.CharacterList.List[("mcCharacter" + i)].addEventListener(MouseEvent.CLICK, onCharacterClick);
                }
                catch(error:Error)
                {
                };
                (mcLogin.CharacterList.List[("mcCharacter" + i)].txtCharacter.text = objLogin.characters[i].sCharacter);
                (mcLogin.CharacterList.List[("mcCharacter" + i)].charindex = i);
                mcLogin.CharacterList.List[("mcCharacter" + i)].gotoAndStop("On");
                i++;
            };
            if (objLogin.characters.length > 0)
            {
				if (selectedCharacter != -1)
				{
					mcLogin.CharacterList.pMC.visible = true;
					selectCharacter(selectedCharacter);
					mcLogin.CharacterList.mcStatistics.visible = true;
					mcLogin.CharacterList.mcSelectMSG.visible = false;
				}
				else
				{
					mcLogin.CharacterList.pMC.visible = false;
					mcLogin.CharacterList.mcStatistics.visible = false;
					mcLogin.CharacterList.mcSelectMSG.visible = true;
				};
            }
            else
            {
                mcLogin.CharacterList.pMC.visible = false;
				mcLogin.CharacterList.mcStatistics.visible = false;
				mcLogin.CharacterList.mcSelectMSG.visible = true;
            };
        }
		
		private function selectCharacter(charindex:int):void
        {
			var i:int;
            var j:int;
			var File:String;
            var Link:String;
            var Equipment:String;
			var Type:String;
			var objChar:Object = new Object();
			
            if (charindex == -1)
			{
                mcLogin.gotoAndPlay("Create");
            } 
			else 
			{				
				try
                {
                    loginInfo.iCharacter = objLogin.characters[charindex].cid;
                }
                catch(e)
                {
                    trace("caught loginInfo.iCharacter null");
                };
				if (!mcLogin.CharacterList.pMC.visible)
				{
					mcLogin.CharacterList.pMC.visible = true;
					mcLogin.CharacterList.mcStatistics.visible = true;
					mcLogin.CharacterList.mcSelectMSG.visible = false;
				}
			
				i = 0;
				while (i < objLogin.characters.length) 
				{
					j = 0;
                    while (j < objLogin.characters[charindex].items.length) 
					{
						File = objLogin.characters[charindex].items[j].sFile;
                        Link = objLogin.characters[charindex].items[j].sLink;
                        Equipment = objLogin.characters[charindex].items[j].sES;
                        Type = objLogin.characters[charindex].items[j].sType;
						/* Hair Skin colors */
						mcLogin.CharacterList.pMC.strGender = (objLogin.characters[charindex].sGender);
						objChar.intColorHair = (objLogin.characters[charindex].intColorHair);
						objChar.intColorSkin = (objLogin.characters[charindex].intColorSkin);
						objChar.intColorEye = (objLogin.characters[charindex].intColorEye);
						objChar.intColorTrim = (objLogin.characters[charindex].intColorTrim);
						objChar.intColorBase = (objLogin.characters[charindex].intColorBase);
						objChar.intColorAccessory = (objLogin.characters[charindex].intColorAccessory);
						objChar.strHairName = (objLogin.characters[charindex].strHairName);
                        objChar.strHairFileName = (objLogin.characters[charindex].strHairFileName);
						mcLogin.CharacterList.pMC.pAV.objData = objChar;
												
						try
                        {
                            mcLogin.CharacterList.pMC.pet.removeChildAt(0);
							mcLogin.CharacterList.pMC.mcChar.cape.cape.removeChildAt(0);
							mcLogin.CharacterList.pMC.mcChar.head.helm.removeChildAt(0);
                        }
                        catch(err:Error)
                        {
                        };
						
						mcLogin.CharacterList.mcStatistics.txtName.text = (objLogin.characters[charindex].sName);
						mcLogin.CharacterList.mcStatistics.txtCharacter.text = (objLogin.characters[charindex].sCharacter);
						mcLogin.CharacterList.mcStatistics.txtJob.text = (objLogin.characters[charindex].sJob);
						mcLogin.CharacterList.mcStatistics.txtLevel.text = (objLogin.characters[charindex].iLvl);
						mcLogin.CharacterList.mcStatistics.txtGuild.text = (objLogin.characters[charindex].sGuild == "" ? "Guild Not Found." : objLogin.characters[charindex].sGuild);
						
						switch (Equipment)
						{
							case "co":
							case "ar":
								mcLogin.CharacterList.pMC.loadArmor(File, Link);
								mcLogin.CharacterList.pMC.loadHair(objLogin.characters[charindex].strHairFilename, objLogin.characters[charindex].strHairName);
							break;
							case "pe":
                                mcLogin.CharacterList.pMC.loadPet(File, Link);
							break;
                            case "he":
                                mcLogin.CharacterList.pMC.loadHelm(File, Link);
                                break;
                            case "ba":
                                mcLogin.CharacterList.pMC.loadCape(File, Link);
                                break;
                            case "Weapon":
                                if (Type == "Dagger")
                                {
                                    mcLogin.CharacterList.pMC.loadWeaponOff(File, Link);
                                }
                                else
                                {
                                    (mcLogin.CharacterList.pMC.mcChar.weaponOff.visible = false);
                                };
                                mcLogin.CharacterList.pMC.loadWeapon(File, Link);
							break;
						}
						j++;
					};
					i++;
				};
            };
        }
		
		public function onCharacterClick(_arg_1:MouseEvent):void
        {
            var _local_2:* = _arg_1.currentTarget;
            selectCharacter(_local_2.charindex);
            if (_local_2.txtCharacter.text != "Create a Character" && _local_2.txtCharacter.text != "Purchase Slot")
            {
				selectedCharacter = _local_2.charindex;
            };
           mixer.playSound("Click");
        }

        public function onBuySlotClick(_arg_1:MouseEvent):void
        {
            mixer.playSound("Click");
            MsgBox.notify("Purchase the Prime Character Slot in game to expand your character slot.");
        }
		
		public function onClick(mouse:MouseEvent):void
        {
            if (mouse.currentTarget.name != "btnConfirm")
            {
                mixer.playSound("Click");
            }
            else
            {
                mixer.playSound("ClickBig");
            };
            switch (mouse.currentTarget.name)
            {
                case "btnConfirm":
					if (selectedCharacter == -1)
					{
						MsgBox.notify("Select a character.");
					}
					else
					{
						mcLogin.gotoAndPlay("Servers");
					}
				return;
                case "btnLogout":
                    loadTitle();
					mcLogin.gotoAndPlay("Init");
				return;
            };
        }

        private function loadExternalAssets():void
        {
            var _local_1:Loader;
            var _local_2:*;
            trace("loadExternalAssets");
            mcConnDetail.showConn("Initializing Client...");
            (ASSETS_READY = false);
            _local_1 = new Loader();
            _local_2 = new URLRequest(((serverFilePath + "interface/Assets/") + world.objInfo.sAssets));
            _local_1.contentLoaderInfo.addEventListener(Event.COMPLETE, assetsLoaderCallback, false, 0, true);
            _local_1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, assetsLoaderErrorHandler, false, 0, true);
            _local_1.load(_local_2, assetsContext);
        }

        private function assetsLoaderCallback(_arg_1:Event):void
        {
            trace("assetsLoaderCallback()");
            loadGameMenu();
            (ASSETS_READY = true);
            resumeOnLoginResponse();
        }

        private function resumeOnLoginResponse():void
        {
            mcConnDetail.showConn("Joining Lobby..");
            sfc.sendXtMessage("zm", "firstJoin", [], "str", 1);
            if (chatF.ignoreList.data.users.length > 0)
            {
                sfc.sendXtMessage("zm", "cmd", ["ignoreList", chatF.ignoreList.data.users], "str", 1);
            }
            else
            {
                sfc.sendXtMessage("zm", "cmd", ["ignoreList", "$clearAll"], "str", 1);
            };
        }

        private function assetsLoaderErrorHandler(_arg_1:IOErrorEvent):void
        {
            trace("[WARNING] External Assets failed to load!");
            trace(_arg_1);
            mcConnDetail.showError("Client Initialization Failed!");
        }

        public function connectTo(_arg_1:String, _arg_2:int=5588):*
        {
            trace(("connecting to:" + _arg_1));
            (serverIP = _arg_1);
            mixer.playSound("ClickBig");
            mcConnDetail.showConn("Connecting to game server...");
            if (sfc.isConnected)
            {
                sfc.disconnect();
            };
            sfc.connect(_arg_1, _arg_2);
            gotoAndPlay("Game");
        }

        public function multiSFCConnect():void
        {
            var _local_1:Object;
            for each (var _local_4:* in sfcA)
            {
                _local_1 = _local_4;
                _local_4;
                trace(("MULTI connecting to:" + _local_1.sIP));
                _local_1.sfc.connect(_local_1.sIP, serverPort);
            };
        }

        public function serialCmdInit(_arg_1:String):void
        {
            var _local_2:*;
            var _local_3:*;
            _local_2 = mcLogin.il;
            _local_3 = _local_2.cmd;
            (_local_3.btnGo.visible = false);
            (serialCmd.si = 0);
            (serialCmd.cmd = _arg_1);
            (serialCmd.active = true);
            serialCmdNext();
        }

        private function serialCmdNext():void
        {
            var _local_1:Date;
            var _local_2:*;
            var _local_4:*;
            _local_1 = new Date();
            _local_2 = mcLogin.il.iClass;
            var _local_3:* = mcLogin.il.cmd;
            if (serialCmd.si > 0)
            {
                _local_4 = _local_2.getServerItemByIP(serialCmd.servers[(serialCmd.si - 1)].sIP);
                if (_local_4 != null)
                {
                    _local_2.serverOn(_local_4);
                    (_local_4.t3.text = (((_local_1.getTime() - serialCmd.ts) / 1000) + " s"));
                    (_local_4.t3.visible = true);
                };
            };
            if (serialCmd.si < serialCmd.servers.length)
            {
                trace(("connecting to: " + serialCmd.servers[serialCmd.si].sIP));
                sfc.connect(serialCmd.servers[serialCmd.si].sIP, serverPort);
                serialCmd.si++;
                (serialCmd.ts = _local_1.getTime());
            }
            else
            {
                serialCmdDone();
            };
        }

        private function serialCmdDone():void
        {
            var _local_1:*;
            var _local_2:*;
            _local_1 = mcLogin.il;
            _local_2 = _local_1.cmd;
            (_local_2.btnGo.visible = true);
            (serialCmd.active = false);
        }

        public function readIA1Preferences():void
        {
            (uoPref.bCloak = (world.getAchievement("ia1", 0) == 0));
            (uoPref.bHelm = (world.getAchievement("ia1", 1) == 0));
            (uoPref.bPet = (world.getAchievement("ia1", 2) == 0));
            (uoPref.bWAnim = (world.getAchievement("ia1", 3) == 0));
            (uoPref.bGoto = (world.getAchievement("ia1", 4) == 0));
            (uoPref.bSoundOn = (world.getAchievement("ia1", 5) == 0));
            (uoPref.bMusicOn = (world.getAchievement("ia1", 6) == 0));
            (uoPref.bFriend = (world.getAchievement("ia1", 7) == 0));
            (uoPref.bParty = (world.getAchievement("ia1", 8) == 0));
            (uoPref.bGuild = (world.getAchievement("ia1", 9) == 0));
            (uoPref.bWhisper = (world.getAchievement("ia1", 10) == 0));
            (uoPref.bTT = (world.getAchievement("ia1", 11) == 0));
            (uoPref.bFBShare = (world.getAchievement("ia1", 12) == 1));
            (uoPref.bDuel = (world.getAchievement("ia1", 13) == 0));
            (world.hideAllCapes = (world.getAchievement("ia1", 14) == 1));
            (world.hideOtherPets = (world.getAchievement("ia1", 15) == 1));
            (world.showAnimations = (world.getAchievement("ia1", 17) == 0));
			(uoPref.bSkillFX = (world.getAchievement("ia1", 18) == 0));
			(uoPref.bTrade = (world.getAchievement("ia1", 19) == 0));
			(uoPref.bWorldChat = (world.getAchievement("ia1", 20) == 0));
            (uoPref.bFBShard = false);
            if (uoPref.bSoundOn)
            {
                (SoundMixer.soundTransform = new SoundTransform(1));
            }
            else
            {
                (SoundMixer.soundTransform = new SoundTransform(0));
            };
			if (uoPref.bSkillFX)
            {
                (skillAnimFX = true);
            }
            else
            {
                (skillAnimFX = false);
            };
        }

        public function inituoPref():void
        {
			(uoPref.bTrade = true);
			(uoPref.bSkillFX = true);
			(uoPref.bWorldChat = true);
            (uoPref.bCloak = true);
            (uoPref.bHelm = true);
            (uoPref.bPet = true);
            (uoPref.bWAnim = true);
            (uoPref.bGoto = true);
            (uoPref.bSoundOn = true);
            (uoPref.bMusicOn = true);
            (uoPref.bFriend = true);
            (uoPref.bParty = true);
            (uoPref.bGuild = true);
            (uoPref.bWhisper = true);
            (uoPref.bTT = true);
            (uoPref.bFBShare = false);
            (uoPref.bDuel = true);
        }

        public function showPortrait(_arg_1:Avatar):*
        {
            showPortraitBox(_arg_1, ui.mcPortrait);
            world.updatePortrait(_arg_1);
            (ui.iconQuest.visible = true);
        }

        public function hidePortrait():void
        {
            (ui.mcPortrait.visible = false);
            (ui.iconQuest.visible = false);
        }

        public function showPortraitTarget(_arg_1:Avatar):*
        {
            if (Number(world.objExtra["bChar"]) == 1)
            {
                showPortraitBox(world.myAvatar, ui.mcPortraitTarget);
            }
            else
            {
                showPortraitBox(_arg_1, ui.mcPortraitTarget);
            };
            (ui.mcPortraitTarget.btnOption.visible = ((!(_arg_1 == world.myAvatar)) && (_arg_1.npcType == "player")));
            (ui.mcPortraitTarget.pvpIcon.visible = world.bPvP);
            world.updatePortrait(_arg_1);
            (ui.btnTargetPortraitClose.visible = true);
        }

        public function hidePortraitTarget():void
        {
            var _local_1:MovieClip;
            var _local_2:DisplayObject;
            _local_1 = (ui.mcPortraitTarget.mcHead as MovieClip);
            (_local_2 = _local_1.head.getChildByName("face"));
            if (_local_2 != null)
            {
                _local_1.head.removeChild(_local_2);
            };
            while (_local_1.backhair.numChildren > 0)
            {
                _local_1.backhair.removeChildAt(0);
            };
            while (_local_1.head.hair.numChildren > 0)
            {
                _local_1.head.hair.removeChildAt(0);
            };
            while (_local_1.head.helm.numChildren > 0)
            {
                _local_1.head.helm.removeChildAt(0);
            };
            (ui.mcPortraitTarget.visible = false);
            (ui.btnTargetPortraitClose.visible = false);
        }

        public function showPortraitBox(avt:Avatar, mcPortraitBox:MovieClip):*
        {
            var AssetClass:Class;
            var mc:MovieClip;
            var child:DisplayObject;
            var bBackHair:Boolean;
            var sSkinLink:String;
            mc = (mcPortraitBox.mcHead as MovieClip);
            bBackHair = false;
            (mcPortraitBox.pAV = avt);
            if (avt.npcType == "monster")
            {
                (AssetClass = world.getClass(("mcHead" + avt.objData.strLinkage)));
                (child = mc.head.getChildByName("face"));
                if (child != null)
                {
                    mc.head.removeChild(child);
                };
                (mc.head.addChildAt(new (AssetClass)(), 0).name = "face");
                (mc.head.hair.visible = false);
                (mc.head.helm.visible = false);
                (mc.backhair.visible = false);
            }
            else
            {
                try
                {
                    sSkinLink = avt.objData.eqp.ar.sLink;
                    if (avt.objData.eqp.co != null)
                    {
                        (sSkinLink = avt.objData.eqp.co.sLink);
                    };
                    (AssetClass = world.getClass(((sSkinLink + avt.objData.strGender) + "Head")));
                    (child = mc.head.getChildByName("face"));
                    if (child != null)
                    {
                        mc.head.removeChild(child);
                    };
                    (mc.head.addChildAt(new (AssetClass)(), 0).name = "face");
                }
                catch(err:Error)
                {
                    (AssetClass = world.getClass(("mcHead" + avt.objData.strGender)));
                    (child = mc.head.getChildByName("face"));
                    if (child != null)
                    {
                        mc.head.removeChild(child);
                    };
                    (mc.head.addChildAt(new (AssetClass)(), 0).name = "face");
                };
                (AssetClass = world.getClass(((avt.objData.strHairName + avt.objData.strGender) + "Hair")));
                while (mc.head.hair.numChildren > 0)
                {
                    mc.head.hair.removeChildAt(0);
                };
                try
                {
                    mc.head.hair.addChild(new (AssetClass)());
                }
                catch(e:Error)
                {
                };
                (mc.head.hair.visible = true);
                try
                {
                    (AssetClass = world.getClass(((avt.objData.strHairName + avt.objData.strGender) + "HairBack")));
                    while (mc.backhair.numChildren > 0)
                    {
                        mc.backhair.removeChildAt(0);
                    };
                    mc.backhair.addChild(new (AssetClass)());
                    (mc.backhair.visible = true);
                    (bBackHair = true);
                }
                catch(err:Error)
                {
                    (mc.backhair.visible = false);
                };
                if (((!(avt.objData.eqp.he == null)) && (!(avt.objData.eqp.he.sLink == null))))
                {
                    try
                    {
                        (AssetClass = world.getClass(avt.objData.eqp.he.sLink));
                        while (mc.head.helm.numChildren > 0)
                        {
                            mc.head.helm.removeChildAt(0);
                        };
                        mc.head.helm.addChild(new (AssetClass)());
                        (mc.head.helm.visible = avt.dataLeaf.showHelm);
                        (mc.head.hair.visible = (!(mc.head.helm.visible)));
                        (mc.backhair.visible = ((mc.head.hair.visible) && (bBackHair)));
                    }
                    catch(err:Error)
                    {
                        (mc.head.helm.visible = false);
                    };
                }
                else
                {
                    (mc.head.helm.visible = false);
                };
            };
            (mcPortraitBox.visible = true);
        }

        public function oniconQuestClick(_arg_1:MouseEvent):void
        {
            ui.mcQTracker.toggle();
        }

        public function manageXPBoost(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            (ui.mcPortrait.iconBoostXP.visible = (_arg_1.op == "+"));
            if (_arg_1.op == "+")
            {
                (world.myAvatar.objData.iBoostXP = _arg_1.iSecsLeft);
                (ui.mcPortrait.iconBoostXP.boostTS = new Date().getTime());
                (ui.mcPortrait.iconBoostXP.iBoostXP = _arg_1.iSecsLeft);
                (ui.mcPortrait.iconBoostXP.bShowShop = _arg_1.bShowShop);
                addUpdate("You have activated the Experience Boost!  All Experience rewards are doubled while the effect holds.");
                chatF.pushMsg("server", (("You have activated the Experience Boost!  All Experience rewards are doubled while the effect holds. " + Math.ceil((_arg_1.iSecsLeft / 60))) + " minute(s) remaining."), "SERVER", "", 0);
            }
            else
            {
                delete world.myAvatar.objData.iBoostXP;
                delete ui.mcPortrait.iconBoostXP.boostTS;
                delete ui.mcPortrait.iconBoostXP.iBoostXP;
                addUpdate("The Experience Boost has faded!  Experience rewards are no longer doubled.");
                chatF.pushMsg("server", "The Experience Boost has faded!  Experience rewards are no longer doubled.", "SERVER", "", 0);
                if (((!(ui.mcPortrait.iconBoostXP.bShowShop == null)) && (ui.mcPortrait.iconBoostXP.bShowShop)))
                {
                    _local_2 = new ModalMC();
                    _local_3 = {};
                    (_local_3.strBody = "Your Experience Boost has faded!\tExperience rewards are no longer doubled.  Would you like to purchase a new Experience Boost?");
                    (_local_3.params = {});
                    (_local_3.callback = openExpBoostStore);
                    (_local_3.glow = "red,medium");
                    ui.ModalStack.addChild(_local_2);
                    _local_2.init(_local_3);
                };
            };
        }

        public function manageGBoost(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            (ui.mcPortrait.iconBoostG.visible = (_arg_1.op == "+"));
            if (_arg_1.op == "+")
            {
                (world.myAvatar.objData.iBoostG = _arg_1.iSecsLeft);
                (ui.mcPortrait.iconBoostG.boostTS = new Date().getTime());
                (ui.mcPortrait.iconBoostG.iBoostG = _arg_1.iSecsLeft);
                (ui.mcPortrait.iconBoostG.bShowShop = _arg_1.bShowShop);
                addUpdate("You have activated the Gold Boost!  All Gold rewards are doubled while the effect holds.");
                chatF.pushMsg("server", (("You have activated the Gold Boost!  All Gold rewards are doubled while the effect holds. " + Math.ceil((_arg_1.iSecsLeft / 60))) + " minute(s) remaining."), "SERVER", "", 0);
            }
            else
            {
                delete world.myAvatar.objData.iBoostG;
                delete ui.mcPortrait.iconBoostG.boostTS;
                delete ui.mcPortrait.iconBoostG.iBoostG;
                addUpdate("The Gold Boost has faded!  Gold rewards are no longer doubled.");
                chatF.pushMsg("server", "The Gold Boost has faded!  Gold rewards are no longer doubled.", "SERVER", "", 0);
                if (((!(ui.mcPortrait.iconBoostG.bShowShop == null)) && (ui.mcPortrait.iconBoostG.bShowShop)))
                {
                    _local_2 = new ModalMC();
                    _local_3 = {};
                    (_local_3.strBody = "Your Gold Boost has faded!  Gold rewards are no longer doubled.  Would you like to purchase a new Gold Boost?");
                    (_local_3.params = {});
                    (_local_3.callback = openExpBoostStore);
                    (_local_3.glow = "red,medium");
                    ui.ModalStack.addChild(_local_2);
                    _local_2.init(_local_3);
                };
            };
        }

        public function manageRepBoost(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            (ui.mcPortrait.iconBoostRep.visible = (_arg_1.op == "+"));
            if (_arg_1.op == "+")
            {
                (world.myAvatar.objData.iBoostRep = _arg_1.iSecsLeft);
                (ui.mcPortrait.iconBoostRep.boostTS = new Date().getTime());
                (ui.mcPortrait.iconBoostRep.iBoostRep = _arg_1.iSecsLeft);
                (ui.mcPortrait.iconBoostRep.bShowShop = _arg_1.bShowShop);
                addUpdate("You have activated the Reputation Boost!  All Reputation rewards are doubled while the effect holds.");
                chatF.pushMsg("server", (("You have activated the Reputation Boost!  All Reputation rewards are doubled while the effect holds. " + Math.ceil((_arg_1.iSecsLeft / 60))) + " minute(s) remaining."), "SERVER", "", 0);
            }
            else
            {
                delete world.myAvatar.objData.iBoostRep;
                delete ui.mcPortrait.iconBoostRep.boostTS;
                delete ui.mcPortrait.iconBoostRep.iBoostRep;
                addUpdate("The Reputation Boost has faded!  Reputation rewards are no longer doubled.");
                chatF.pushMsg("server", "The Reputation Boost has faded!  Reputation rewards are no longer doubled.", "SERVER", "", 0);
                if (((!(ui.mcPortrait.iconBoostRep.bShowShop == null)) && (ui.mcPortrait.iconBoostRep.bShowShop)))
                {
                    _local_2 = new ModalMC();
                    _local_3 = {};
                    (_local_3.strBody = "Your Reputation Boost has faded!\tReputation rewards are no longer doubled.  Would you like to purchase a new Reputation Boost?");
                    (_local_3.params = {});
                    (_local_3.callback = openExpBoostStore);
                    (_local_3.glow = "red,medium");
                    ui.ModalStack.addChild(_local_2);
                    _local_2.init(_local_3);
                };
            };
        }

        public function manageCPBoost(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:*;
            (ui.mcPortrait.iconBoostCP.visible = (_arg_1.op == "+"));
            if (_arg_1.op == "+")
            {
                (world.myAvatar.objData.iBoostCP = _arg_1.iSecsLeft);
                (ui.mcPortrait.iconBoostCP.boostTS = new Date().getTime());
                (ui.mcPortrait.iconBoostCP.iBoostCP = _arg_1.iSecsLeft);
                (ui.mcPortrait.iconBoostCP.bShowShop = _arg_1.bShowShop);
                addUpdate("You have activated the ClassPoint Boost!  All ClassPoint rewards are doubled while the effect holds.");
                chatF.pushMsg("server", (("You have activated the ClassPoint Boost!  All ClassPoint rewards are doubled while the effect holds. " + Math.ceil((_arg_1.iSecsLeft / 60))) + " minute(s) remaining."), "SERVER", "", 0);
            }
            else
            {
                delete world.myAvatar.objData.iBoostCP;
                delete ui.mcPortrait.iconBoostCP.boostTS;
                delete ui.mcPortrait.iconBoostCP.iBoostCP;
                addUpdate("The ClassPoint Boost has faded!  ClassPoint rewards are no longer doubled.");
                chatF.pushMsg("server", "The ClassPoint Boost has faded!  ClassPoint rewards are no longer doubled.", "SERVER", "", 0);
                if (((!(ui.mcPortrait.iconBoostCP.bShowShop == null)) && (ui.mcPortrait.iconBoostCP.bShowShop)))
                {
                    _local_2 = new ModalMC();
                    _local_3 = {};
                    (_local_3.strBody = "Your ClassPoint Boost has faded!\tClassPoint rewards are no longer doubled.  Would you like to purchase a new ClassPoint Boost?");
                    (_local_3.params = {});
                    (_local_3.callback = openExpBoostStore);
                    (_local_3.glow = "red,medium");
                    ui.ModalStack.addChild(_local_2);
                    _local_2.init(_local_3);
                };
            };
        }

        public function oniconBoostXPOver(_arg_1:MouseEvent):void
        {
            var _local_2:MovieClip;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:int;
            var _local_6:String;
            _local_2 = MovieClip(_arg_1.currentTarget);
            _local_3 = new Date().getTime();
            _local_4 = Math.max(((_local_2.boostTS + (_local_2.iBoostXP * 1000)) - _local_3), 0);
            _local_5 = 0;
            _local_6 = "All Experience gains are doubled.\n";
            if (_local_4 < 120000)
            {
                (_local_5 = int(Math.floor((_local_4 / 60000))));
                (_local_6 = (_local_6 + String((_local_5 + " minute(s), "))));
                (_local_5 = int(Math.round(((_local_4 % 60000) / 1000))));
                (_local_6 = (_local_6 + String((_local_5 + " second(s) remaining."))));
            }
            else
            {
                (_local_5 = int(Math.round((_local_4 / 60000))));
                (_local_6 = (_local_6 + String((_local_5 + " minutes remaining."))));
            };
            ui.ToolTip.openWith({"str":_local_6});
        }

        public function oniconBoostGoldOver(_arg_1:MouseEvent):void
        {
            var _local_2:MovieClip;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:int;
            var _local_6:String;
            _local_2 = MovieClip(_arg_1.currentTarget);
            _local_3 = new Date().getTime();
            _local_4 = Math.max(((_local_2.boostTS + (_local_2.iBoostG * 1000)) - _local_3), 0);
            _local_5 = 0;
            _local_6 = "All Gold gains are doubled.\n";
            if (_local_4 < 120000)
            {
                (_local_5 = int(Math.floor((_local_4 / 60000))));
                (_local_6 = (_local_6 + String((_local_5 + " minute(s), "))));
                (_local_5 = int(Math.round(((_local_4 % 60000) / 1000))));
                (_local_6 = (_local_6 + String((_local_5 + " second(s) remaining."))));
            }
            else
            {
                (_local_5 = int(Math.round((_local_4 / 60000))));
                (_local_6 = (_local_6 + String((_local_5 + " minutes remaining."))));
            };
            ui.ToolTip.openWith({"str":_local_6});
        }

        public function oniconBoostRepOver(_arg_1:MouseEvent):void
        {
            var _local_2:MovieClip;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:int;
            var _local_6:String;
            _local_2 = MovieClip(_arg_1.currentTarget);
            _local_3 = new Date().getTime();
            _local_4 = Math.max(((_local_2.boostTS + (_local_2.iBoostRep * 1000)) - _local_3), 0);
            _local_5 = 0;
            _local_6 = "All Reputation gains are doubled.\n";
            if (_local_4 < 120000)
            {
                (_local_5 = int(Math.floor((_local_4 / 60000))));
                (_local_6 = (_local_6 + String((_local_5 + " minute(s), "))));
                (_local_5 = int(Math.round(((_local_4 % 60000) / 1000))));
                (_local_6 = (_local_6 + String((_local_5 + " second(s) remaining."))));
            }
            else
            {
                (_local_5 = int(Math.round((_local_4 / 60000))));
                (_local_6 = (_local_6 + String((_local_5 + " minutes remaining."))));
            };
            ui.ToolTip.openWith({"str":_local_6});
        }

        public function oniconBoostCPOver(_arg_1:MouseEvent):void
        {
            var _local_2:MovieClip;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:int;
            var _local_6:String;
            _local_2 = MovieClip(_arg_1.currentTarget);
            _local_3 = new Date().getTime();
            _local_4 = Math.max(((_local_2.boostTS + (_local_2.iBoostCP * 1000)) - _local_3), 0);
            _local_5 = 0;
            _local_6 = "All ClassPoint gains are doubled.\n";
            if (_local_4 < 120000)
            {
                (_local_5 = int(Math.floor((_local_4 / 60000))));
                (_local_6 = (_local_6 + String((_local_5 + " minute(s), "))));
                (_local_5 = int(Math.round(((_local_4 % 60000) / 1000))));
                (_local_6 = (_local_6 + String((_local_5 + " second(s) remaining."))));
            }
            else
            {
                (_local_5 = int(Math.round((_local_4 / 60000))));
                (_local_6 = (_local_6 + String((_local_5 + " minutes remaining."))));
            };
            ui.ToolTip.openWith({"str":_local_6});
        }

        public function openExpBoostStore(_arg_1:Object):void
        {
            if (_arg_1.accept)
            {
                world.sendLoadShopRequest(184);
            };
        }

        public function oniconBoostOut(_arg_1:MouseEvent):void
        {
            ui.ToolTip.close();
        }

        public function updateXPBar():void
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            (ui.mcInterface.mcXPBar.mcXP.scaleX = (world.myAvatar.objData.intExp / world.myAvatar.objData.intExpToLevel));
            _local_1 = world.myAvatar.objData;
            _local_2 = _local_1.intExp;
            _local_3 = _local_1.intExpToLevel;
            _local_4 = int(((_local_2 / _local_3) * 100));
            if (_local_4 >= 100)
            {
                (_local_4 = 100);
            };
            (ui.mcInterface.mcXPBar.strXP.text = (((((((("Level " + world.myAvatar.objData.intLevel) + " : ") + _local_2) + " / ") + _local_3) + " (") + _local_4) + ")%"));
        }

        public function xpBarMouseOver(_arg_1:MouseEvent):*
        {
            (MovieClip(_arg_1.currentTarget).strXP.visible = true);
        }

        public function xpBarMouseOut(_arg_1:MouseEvent):*
        {
            (MovieClip(_arg_1.currentTarget).strXP.visible = false);
        }

        public function updateRepBar():void
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            _local_1 = world.myAvatar.objData.iCurCP;
            _local_2 = world.myAvatar.objData.iCPToRank;
            if (_local_2 <= 0)
            {
                (ui.mcInterface.mcRepBar.mcRep.scaleX = 0.1);
                (ui.mcInterface.mcRepBar.mcRep.visible = false);
                (ui.mcInterface.mcRepBar.strRep.text = ((world.myAvatar.objData.strClassName + ", Rank ") + world.myAvatar.objData.iRank));
            }
            else
            {
                _local_3 = int(((_local_1 / _local_2) * 100));
                if (_local_3 >= 100)
                {
                    (_local_3 = 100);
                };
                (ui.mcInterface.mcRepBar.mcRep.scaleX = (_local_1 / _local_2));
                (ui.mcInterface.mcRepBar.mcRep.visible = true);
                (ui.mcInterface.mcRepBar.strRep.text = (((((((((world.myAvatar.objData.strClassName + ", Rank ") + world.myAvatar.objData.iRank) + " : ") + _local_1) + "/") + _local_2) + " (") + _local_3) + ")%"));
            };
        }

        public function onRepBarMouseOver(_arg_1:MouseEvent):*
        {
            (MovieClip(_arg_1.currentTarget).strRep.visible = true);
        }

        public function onRepBarMouseOut(_arg_1:MouseEvent):*
        {
            (MovieClip(_arg_1.currentTarget).strRep.visible = false);
        }

        public function actIconClick(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            _local_2 = MovieClip(_arg_1.currentTarget).actObj;
            if (((!(_local_2.auto == null)) && (_local_2.auto == true)))
            {
                world.approachTarget();
            }
            else
            {
                world.testAction(_local_2);
            };
        }

        public function actIconOver(_arg_1:MouseEvent):*
        {
            var _local_2:MovieClip;
            var _local_3:*;
            var _local_4:String;
			var rank:int
            _local_2 = MovieClip(_arg_1.currentTarget);
            if (((uoPref.bTT) || (!(world.myAvatar.dataLeaf.intState == 2))))
            {
                if (_local_2.item == null)
                {
                    _local_3 = _local_2.actObj;
                    if (_local_3 != null)
                    {
                        _local_4 = (("<b>" + _local_3.nam) + "</b>\n");
                        if (!_local_3.isOK)
                        {
							rank = _local_2.actionIndex < 4 ? _local_2.actionIndex : _local_2.actionIndex == 4 ? 5 : 10;
							_local_4 = (_local_4 + "<font color='#FF0000'>Unlocks at Rank " + rank + "!</font>\n");
                        };
                        if (_local_3.typ != "passive")
                        {
                            if (_local_3.mp > 0)
                            {
                                (_local_4 = (_local_4 + (("<font color='#0033AA'>" + _local_3.mp) + "</font> mana, ")));
                            };
                            (_local_4 = (_local_4 + ((("<font color='#AA3300'>" + (_local_3.cd / 1000)) + "</font> sec cooldown") + "\n")));
                        };
                        switch (_local_3.typ)
                        {
                            case "p":
                            case "ph":
                            case "aa":
                                (_local_4 = (_local_4 + "Physical"));
                                break;
                            case "m":
                            case "ma":
                                (_local_4 = (_local_4 + "Magical"));
                                break;
                            case "mp":
                                (_local_4 = (_local_4 + "Magical / Physical"));
                                break;
                            case "pm":
                                (_local_4 = (_local_4 + "Physical / Magical"));
                                break;
                            case "passive":
                                (_local_4 = (_local_4 + "<font color='#0033AA'>Passive Ability</font>"));
                                break;
                        };
                        (_local_4 = (_local_4 + "\n"));
                        if (_local_3.sArg2 != "")
                        {
                            (_local_4 = (_local_4 + _local_3.sArg2));
                        }
                        else
                        {
                            (_local_4 = (_local_4 + _local_3.desc));
                        };
                        ui.ToolTip.openWith({
                            "str":_local_4,
                            "lowerright":true
                        });
                    };
                }
                else
                {
                    ui.ToolTip.openWith({
                        "str":((_local_2.item.sName + "\n") + _local_2.item.sDesc),
                        "lowerright":true
                    });
                };
            };
        }

        public function actIconOut(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            _local_2 = MovieClip(stage.getChildAt(0)).ui.ToolTip;
            _local_2.close();
        }

        public function portraitClick(_arg_1:MouseEvent):*
        {
            var _local_2:*;
            var _local_3:*;
            _local_2 = MovieClip(_arg_1.currentTarget);
            if (_local_2.pAV.npcType == "player")
            {
                _local_3 = {};
                (_local_3.ID = _local_2.pAV.objData.CharID);
                (_local_3.strUsername = _local_2.pAV.objData.strUsername);
                if (_local_2.pAV != world.myAvatar)
                {
                    ui.cMenu.fOpenWith("user", _local_3);
                }
                else
                {
                    ui.cMenu.fOpenWith("self", _local_3);
                };
            };
        }

        private function onTargetPortraitCloseClick(_arg_1:MouseEvent):void
        {
            world.cancelTarget();
        }

        private function onBtnMonsterClick(_arg_1:MouseEvent):void
        {
            world.toggleMonsters();
        }

        public function showMap():void
        {
            (ui.mcInterface.mcMenu.mcMenuButtons.visible = true);
            ui.mcPopup.fOpen("Map");
        }

        public function logout():void
        {
            trace("logout called");
            if (world != null)
            {
                world.killTimers();
                world.killListeners();
                try
                {
                    world.removeChild(world.map);
                }
                catch(e)
                {
                };
                this.removeChild(world);
                (world = null);
            };
            if (currentLabel != "Login")
            {
                SoundMixer.stopAll();
                playBGM();
            };
            (firstMenu = true);
            if (sfc.isConnected)
            {
                sfc.disconnect();
            };
            if (currentLabel != "Login")
            {
                FacebookConnect.Logout();
                gotoAndPlay("Login");
            };
        }
		
		public function relogin():void
        {
            login(loginInfo.strUsername, loginInfo.strPassword);
        }
		
        public function showServerList():void
        {
            if (sfc.isConnected)
            {
                sfc.disconnect();
            };
			if (FacebookConnect.isLoggedIn && loginInfo.strPassword == null && ISWEB)
            {
                extCall.fbLogin();
            }
            else
            {
                login(loginInfo.strUsername, loginInfo.strPassword);
            };
        }

        public function showUpgradeWindow(_arg_1:Object=null):void
        {
            var _local_2:MovieClip;
            if (mcUpgradeWindow == null)
            {
                (mcUpgradeWindow = new MCUpgradeWindow());
            };
            _local_2 = (mcUpgradeWindow as MovieClip);
            var _local_3:* = ((_arg_1 != null) ? _arg_1 : world.myAvatar.objData);
            _local_2.btnClose.addEventListener(MouseEvent.CLICK, hideUpgradeWindow, false, 0, true);
            _local_2.btnClose2.addEventListener(MouseEvent.CLICK, hideUpgradeWindow, false, 0, true);
            _local_2.btnBuy.addEventListener(MouseEvent.CLICK, onUpgradeClick, false, 0, true);
            addChild(mcUpgradeWindow);
            try
            {
                (ui.mouseChildren = false);
                (world.mouseChildren = false);
            }
            catch(e:Error)
            {
            };
            try
            {
                (mcLogin.sl.mouseChildren = false);
            }
            catch(e:Error)
            {
            };
        }

        public function hideUpgradeWindow(_arg_1:MouseEvent):void
        {
            removeChild(mcUpgradeWindow);
            try
            {
                (ui.mouseChildren = true);
                (world.mouseChildren = true);
            }
            catch(e:Error)
            {
            };
            try
            {
                (mcLogin.sl.mouseChildren = true);
            }
            catch(e:Error)
            {
            };
        }

        public function onUpgradeClick(_arg_1:Event):void
        {
            var _local_2:String;
            mixer.playSound("Click");
            if (ISWEB)
            {
                extCall.setUpPayment(sToken);
            }
            else
            {
                _local_2 = ((("https://www.aq.com/order-now/direct/default.asp?cid=" + world.myAvatar.objData.CharID) + "&token=") + loginInfo.strToken);
                navigateToURL(new URLRequest(_local_2), "_blank");
            };
        }

        public function showACWindow():void
        {
            var _local_1:MovieClip;
            if (mcACWindow == null)
            {
                (mcACWindow = new MCACWindow());
            };
            _local_1 = (mcACWindow as MovieClip);
            _local_1.btnClose.addEventListener(MouseEvent.CLICK, hideACWindow, false, 0, true);
            _local_1.btnClose2.addEventListener(MouseEvent.CLICK, hideACWindow, false, 0, true);
            _local_1.btnBuy.addEventListener(MouseEvent.CLICK, onUpgradeClick, false, 0, true);
            _local_1.btnUpgrade.addEventListener(MouseEvent.CLICK, onUpgradeClick, false, 0, true);
            addChild(mcACWindow);
            try
            {
                (ui.mouseChildren = false);
                (world.mouseChildren = false);
            }
            catch(e:Error)
            {
            };
            try
            {
                (mcLogin.sl.mouseChildren = false);
            }
            catch(e:Error)
            {
            };
        }

        public function hideACWindow(_arg_1:MouseEvent):void
        {
            removeChild(mcACWindow);
            try
            {
                (ui.mouseChildren = true);
                (world.mouseChildren = true);
            }
            catch(e:Error)
            {
            };
            try
            {
                (mcLogin.sl.mouseChildren = true);
            }
            catch(e:Error)
            {
            };
        }

        public function initArrHP():void
        {
            var _local_1:int;
            var _local_2:int;
            var _local_3:int;
            var _local_4:Number;
            var _local_5:int;
            var _local_6:int;
            var _local_7:Number;
            var _local_8:int;
            var _local_9:int;
            var _local_10:Number;
            var _local_11:*;
            _local_1 = 100;
            _local_2 = 550;
            _local_3 = 275;
            _local_4 = 0.8;
            _local_5 = 720;
            _local_6 = 200;
            _local_7 = 0.92;
            _local_8 = 350;
            _local_9 = 3650;
            _local_10 = 1.1;
            _local_11 = 0;
            while (_local_11 < _local_1)
            {
                if (_local_11 > 19)
                {
                    arrHP.push(Math.round((_local_8 + (Math.pow((_local_11 / _local_1), _local_10) * _local_9))));
                }
                else
                {
                    if (_local_11 > 7)
                    {
                        arrHP.push(Math.round((_local_5 + (Math.pow((_local_11 / 20), _local_7) * _local_6))));
                    }
                    else
                    {
                        arrHP.push(Math.round((_local_2 + (Math.pow((_local_11 / 8), _local_4) * _local_3))));
                    };
                };
                _local_11++;
            };
        }

        public function initArrRep():void
        {
            var _local_1:int;
            var _local_2:*;
            _local_1 = 0;
            _local_2 = 1;
            while (_local_2 < 10)
            {
                (_local_1 = (Math.pow((_local_2 + 1), 3) * 100));
                if (_local_2 > 1)
                {
                    arrRanks.push((_local_1 + arrRanks[(_local_2 - 1)]));
                }
                else
                {
                    arrRanks.push((_local_1 + 100));
                };
                _local_2++;
            };
        }

        public function getRankFromPoints(_arg_1:int):int
        {
            var _local_2:int;
            var _local_3:*;
            _local_2 = 1;
            if (_arg_1 < 0)
            {
                (_arg_1 = 0);
            };
            _local_3 = 1;
            while (_local_3 < arrRanks.length)
            {
                if (_arg_1 < arrRanks[_local_3])
                {
                    return (_local_2);
                };
                _local_2++;
                _local_3++;
            };
            return (_local_2);
        }

        public function attachOnModalStack(_arg_1:String):MovieClip
        {
            var _local_2:MovieClip;
            var _local_3:Class;
            var _local_4:*;
            var _local_5:*;
            _local_3 = (world.getClass(_arg_1) as Class);
            _local_4 = true;
            if (ui.ModalStack.numChildren)
            {
                (_local_2 = MovieClip(ui.ModalStack.getChildAt(0)));
                _local_5 = (_local_2.constructor as Class);
                if (_local_5 == _local_3)
                {
                    (_local_4 = false);
                };
            };
            if (_local_4)
            {
                clearModalStack();
                (_local_2 = MovieClip(ui.ModalStack.addChild(new (_local_3)())));
                (ui.ModalStack.mouseChildren = true);
            };
            return (_local_2);
        }

        public function getInstanceFromModalStack(_arg_1:String):MovieClip
        {
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < ui.ModalStack.numChildren)
            {
                if (getQualifiedClassName((ui.ModalStack.getChildAt(_local_2) == _arg_1)))
                {
                    return (ui.ModalStack.getChildAt(_local_2));
                };
                _local_2++;
            };
            return (null);
        }

        public function isDialoqueUp():Boolean
        {
            var _local_1:int;
            var _local_2:*;
            var _local_3:*;
            _local_1 = 0;
            while (_local_1 < world.FG.numChildren)
            {
                _local_2 = world.FG.getChildAt(_local_1);
                _local_3 = String((_local_2 as MovieClip));
                if (_local_3.indexOf("dlg_") > -1)
                {
                    return (true);
                };
                _local_1++;
            };
            return (false);
        }

        public function clearModalStack():Boolean
        {
            var _local_1:int;
            if (isGreedyModalInStack())
            {
                return (false);
            };
            _local_1 = 0;
            while (((ui.ModalStack.numChildren > 0) && (_local_1 < 100)))
            {
                _local_1++;
                ui.ModalStack.removeChildAt(0);
            };
            (stage.focus = null);
            return (true);
        }

        public function closeModalByStrBody(_arg_1:String):void
        {
            var _local_2:int;
            var _local_3:MovieClip;
            _local_2 = 0;
            _local_2 = 0;
            while (_local_2 < ui.ModalStack.numChildren)
            {
                (_local_3 = (ui.ModalStack.getChildAt(_local_2) as MovieClip));
                if (((_local_3.cnt.strBody.htmlText.indexOf(_arg_1) > -1) && (!(_local_3.currentLabel == "out"))))
                {
                    _local_3.fClose();
                };
                _local_2++;
            };
        }

        public function isGreedyModalInStack():Boolean
        {
            var _local_1:int;
            var _local_2:MovieClip;
            _local_1 = 0;
            _local_1 = 0;
            while (_local_1 < ui.ModalStack.numChildren)
            {
                (_local_2 = (ui.ModalStack.getChildAt(_local_1) as MovieClip));
                if (((("greedy" in _local_2) && (!(_local_2.greedy == null))) && (_local_2.greedy == true)))
                {
                    return (true);
                };
                _local_1++;
            };
            return (false);
        }

        public function clearPopups(_arg_1:Array=null):void
        {
            if (ui.mcPopup.currentLabel == "House")
            {
                ui.mcPopup.mcHouseMenu.hideItemHandle();
            };
            if (((_arg_1 == null) || (_arg_1.indexOf(ui.mcPopup.currentLabel) < 0)))
            {
                ui.mcPopup.onClose();
            };
            world.removeMovieFront();
            clearModalStack();
        }

        public function clearPopupsQ():void
        {
            if (((!(ui.mcPopup.currentLabel == "House")) && (!(ui.mcPopup.currentLabel == "HouseShop"))))
            {
                ui.mcPopup.onClose();
            };
        }

        public function addUpdate(_arg_1:String, _arg_2:Boolean=false):void
        {
            var _local_3:MovieClip;
            var _local_4:MovieClip;
            var _local_5:int;
            _local_3 = ui.mcUpdates;
            _local_4 = (_local_3.addChildAt(new uProto(), 1) as MovieClip);
            (_local_4.y = 0);
            (_local_4.x = _local_3.uproto.x);
            (_local_4.t1.ti.text = _arg_1);
            if (_arg_2)
            {
                (_local_4.t1.ti.textColor = 0xFF0000);
            };
            _local_4.gotoAndPlay("in");
            _local_5 = 2;
            if (_local_3.numChildren > 2)
            {
                _local_5 = 2;
                while (_local_5 < _local_3.numChildren)
                {
                    if (_local_5 < 4)
                    {
                        (_local_3.getChildAt(_local_5).y = (_local_3.getChildAt(_local_5).y - 18));
                    }
                    else
                    {
                        MovieClip(_local_3.getChildAt(_local_5)).stop();
                        _local_3.removeChildAt(_local_5);
                        _local_5--;
                    };
                    _local_5++;
                };
            };
        }

        public function clearUpdates():void
        {
            var _local_1:MovieClip;
            _local_1 = ui.mcUpdates;
            while (_local_1.numChildren > 1)
            {
                _local_1.removeChildAt(1);
            };
        }

        public function showItemDrop(_arg_1:*, _arg_2:*):void
        {
            var _local_3:*;
            if (((!(_arg_1.bTemp == 0)) || (!(_arg_2))))
            {
                (_local_3 = new DFrameMC(_arg_1));
            }
            else
            {
                (_local_3 = new DFrame2MC(_arg_1));
            };
            ui.dropStack.addChild(_local_3);
            _local_3.init();
            (_local_3.fY = (_local_3.y = -(_local_3.fHeight + 8)));
            (_local_3.fX = (_local_3.x = -(_local_3.fWidth / 2)));
            cleanDropStack();
        }

        public function cleanDropStack():void
        {
            var _local_1:MovieClip;
            var _local_2:MovieClip;
            var _local_3:*;
            _local_1 = null;
            _local_2 = null;
            _local_3 = (ui.dropStack.numChildren - 2);
            while (_local_3 > -1)
            {
                (_local_1 = (ui.dropStack.getChildAt(_local_3) as MovieClip));
                (_local_2 = (ui.dropStack.getChildAt((_local_3 + 1)) as MovieClip));
                (_local_1.fY = (_local_1.y = (_local_2.fY - (_local_2.fHeight + 8))));
                _local_3--;
            };
        }

        public function dropStackBoost():void
        {
            (ui.dropStack.y = 438);
        }

        public function dropStackReset():void
        {
            (ui.dropStack.y = 493);
        }

        public function showAchievement(_arg_1:String, _arg_2:int):void
        {
            var _local_3:mcAchievement;
            var _local_4:MovieClip;
            _local_3 = new mcAchievement();
            _local_4 = (ui.dropStack.addChild(_local_3) as MovieClip);
            (_local_4.cnt.tBody.text = _arg_1);
            (_local_4.cnt.tPts.text = _arg_2);
            (_local_4.fWidth = 348);
            (_local_4.fHeight = 90);
            (_local_4.fX = (_local_4.x = -(_local_4.fWidth / 2)));
            (_local_4.fY = (_local_4.y = -(_local_4.fHeight + 8)));
            cleanDropStack();
        }

        public function showQuestpopup(_arg_1:Object):void
        {
            var _local_2:mcQuestpopup;
            var _local_3:MovieClip;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:int;
            _local_2 = new mcQuestpopup();
            (_local_2.cnt.mcAC.visible = false);
            _local_3 = (ui.dropStack.addChild(_local_2) as MovieClip);
            (_local_3.cnt.tName.text = _arg_1.sName);
            (_local_3.cnt.rewards.tRewards.htmlText = "");
            _local_4 = "";
            _local_5 = _arg_1.rewardObj;
            trace(("rewardtype: " + _arg_1.rewardType));
            if (_arg_1.rewardType == "ac")
            {
                (_local_4 = (("<font color='#FFFFFF'>" + _arg_1.intAmount) + "</font>"));
                (_local_4 = (_local_4 + "<font color='#FFCC00'> Adventure Coins</font>"));
                (_local_3.cnt.mcAC.visible = true);
            }
            else
            {
                if ((("intGold" in _local_5) && (_local_5.intGold > 0)))
                {
                    (_local_4 = (("<font color='#FFFFFF'>" + _local_5.intGold) + "</font>"));
                    (_local_4 = (_local_4 + "<font color='#FFCC00'>g</font>"));
                };
                if ((("intExp" in _local_5) && (_local_5.intExp > 0)))
                {
                    if (_local_4.length > 0)
                    {
                        (_local_4 = (_local_4 + "<font color='#FFFFFF'>, </font>"));
                    };
                    (_local_4 = (_local_4 + (("<font color='#FFFFFF'>" + _local_5.intExp) + "</font>")));
                    (_local_4 = (_local_4 + "<font color='#FF00FF'>xp</font>"));
                };
                if ((("iRep" in _local_5) && (_local_5.iRep > 0)))
                {
                    if (_local_4.length > 0)
                    {
                        (_local_4 = (_local_4 + "<font color='#FFFFFF'>, </font>"));
                    };
                    (_local_4 = (_local_4 + (("<font color='#FFFFFF'>" + _local_5.iRep) + "</font>")));
                    (_local_4 = (_local_4 + "<font color='#00CCFF'>rep</font>"));
                };
				if (("iGExp" in _local_5) && _local_5.iGExp > 0)
                {
                    if (_local_4.length > 0)
                    {
                        (_local_4 = (_local_4 + "<font color='#FFFFFF'>, </font>"));
                    };
                    (_local_4 = (_local_4 + (("<font color='#FFFFFF'>" + _local_5.iGExp) + "</font>")));
                    (_local_4 = (_local_4 + "<font color='#66ffff'>guild xp</font>"));
                };
                if ((("guildRep" in _local_5) && (_local_5.guildRep > 0)))
                {
                    if (_local_4.length > 0)
                    {
                        (_local_4 = (_local_4 + "<font color='#FFFFFF'>, </font>"));
                    };
                    (_local_4 = (_local_4 + (("<font color='#FFFFFF'>" + _local_5.guildRep) + "</font>")));
                    (_local_4 = (_local_4 + "<font color='#00CCFF'>guild rep</font>"));
                };
            };
            (_local_3.cnt.rewards.tRewards.htmlText = _local_4);
            (_local_3.fWidth = 240);
            (_local_3.fHeight = 70);
            _local_6 = (_local_3.cnt.rewards.tRewards.x + _local_3.cnt.rewards.tRewards.textWidth);
            (_local_3.cnt.rewards.x = Math.round(((_local_3.fWidth / 2) - (_local_6 / 2))));
            (_local_3.fX = (_local_3.x = -(_local_3.fWidth / 2)));
            (_local_3.fY = (_local_3.y = -(_local_3.fHeight + 8)));
            mixer.playSound("Good");
            cleanDropStack();
        }
		
		public function toggleGuildBoardPanel(typ:String=""):void
        {
            var mcpop:MovieClip = ui.mcPopup;
            if (!isGreedyModalInStack())
            {
                if (mcpop.currentLabel != "GuildBoardPanel")
                {
                    clearPopups();
                    clearPopupsQ();
                    (mcpop.fData = {"typ":typ});
                    (mcpop.visible = true);
                    mcpop.gotoAndPlay("GuildBoardPanel");
                }
                else
                {
                    mcpop.mcCharpanel.fClose();
                };
            };
        }
		
		public function toggleRedeemPanel(_arg1:String=""):void
		{
            var _local2:MovieClip;
            _local2 = ui.mcPopup;
            if (!isGreedyModalInStack()){
                if (_local2.currentLabel != "Redeem"){
                    clearPopups();
                    clearPopupsQ();
                    (_local2.fData = {typ:_arg1});
                    (_local2.visible = true);
                    _local2.gotoAndPlay("Redeem");
                }
                else {
                    _local2.onClose();
                };
            };
        
		}
		
		public function toggleBookOfLore(_arg1:String=""):void
		{
            var _local2:MovieClip;
            _local2 = ui.mcPopup;
            if (!isGreedyModalInStack())
			{
                if (_local2.currentLabel != "Book")
				{
                    clearPopups();
                    clearPopupsQ();
                    (_local2.fData = {typ:_arg1});
                    (_local2.visible = true);
                    _local2.gotoAndPlay("Book");
					
                }
                else 
				{
                    _local2.onClose();
                };
            };
			
        }
		
		public function toggleTradePanel(_arg_1:String="", _arg_2:String=""):void
        {
            var _local_3:MovieClip;
            (_local_3 = ui.mcPopup);
            if (!isGreedyModalInStack())
            {
                if (_local_3.currentLabel != "TradePanel")
                {
                    clearPopups();
                    clearPopupsQ();
                    (_local_3.tradeId = _arg_1);
                    (_local_3.tradeUser = _arg_2);
                    (_local_3.visible = true);
                    _local_3.gotoAndPlay("TradePanel");
                }
                else
                {
                    _local_3.onClose();
                };
            };
        }
		
        public function toggleCharpanel(_arg_1:String=""):void
        {
            var _local_2:MovieClip;
            _local_2 = ui.mcPopup;
            if (!isGreedyModalInStack())
            {
                if (_local_2.currentLabel != "Charpanel")
                {
                    clearPopups();
                    clearPopupsQ();
                    (_local_2.fData = {"typ":_arg_1});
                    (_local_2.visible = true);
                    _local_2.gotoAndPlay("Charpanel");
                }
                else
                {
                    _local_2.mcCharpanel.fClose();
                };
            };
        }
		
		public function togglePVPPanel2():void
		{
			togglePVPPanel("maps");
		}
		
        public function togglePVPPanel(_arg_1:String=""):void
        {
            var _local_2:MovieClip;
            _local_2 = ui.mcPopup;
            if (!isGreedyModalInStack())
            {
                if (_local_2.currentLabel != "PVPPanel")
                {
                    clearPopups();
                    clearPopupsQ();
                    (_local_2.fData = {"typ":_arg_1});
                    (_local_2.visible = true);
                    _local_2.gotoAndPlay("PVPPanel");
                }
                else
                {
                    _local_2.onClose();
                };
            };
        }

        public function showPVPScore():void
        {
            var bar:MovieClip;
            var i:int;
            var o:Object;
            var a:Array;
            var bx:int;
            (ui.mcPVPScore.visible = true);
            (ui.mcPVPScore.y = 2);
            i = 0;
            a = [{"sName":"Team A"}, {"sName":"Team B"}];
            bx = 200;
            if (world.PVPFactions.length > 0)
            {
                (a = world.PVPFactions);
            };
            i = 0;
            while (i < a.length)
            {
                (o = a[i]);
                try
                {
                    (bar = ui.mcPVPScore.getChildByName(("bar" + i)));
                    (bar.tTeam.text = o.sName);
                    if ((((bar.tTeam.x + bar.tTeam.width) - bar.tTeam.textWidth) - 6) < bx)
                    {
                        (bx = Math.round((((bar.tTeam.x + bar.tTeam.width) - bar.tTeam.textWidth) - 6)));
                    };
                }
                catch(e:Error)
                {
                    trace("*** >");
                    trace("*** > PvP Faction data could not be found or set.");
                    trace("*** >");
                };
                i = (i + 1);
            };
            i = 0;
            while (i < a.length)
            {
                (o = a[i]);
                try
                {
                    (bar = ui.mcPVPScore.getChildByName(("bar" + i)));
                    (bar.cap.x = bx);
                }
                catch(e:Error)
                {
                };
                i = (i + 1);
            };
        }

        public function hidePVPScore():void
        {
            (ui.mcPVPScore.visible = false);
            (ui.mcPVPScore.y = -300);
        }

        public function showMCPVPQueue():void
        {
            var _local_1:Object;
            _local_1 = world.getWarzoneByWarzoneName(world.PVPQueue.warzone);
            (ui.mcPVPQueue.t1.text = _local_1.nam);
            ui.mcPVPQueue.removeEventListener(Event.ENTER_FRAME, MCPVPQueueEF);
            (ui.mcPVPQueue.t2label.visible = false);
            (ui.mcPVPQueue.t2.visible = false);
            if (world.PVPQueue.avgWait > -1)
            {
                (ui.mcPVPQueue.t2label.visible = true);
                (ui.mcPVPQueue.t2.visible = true);
                ui.mcPVPQueue.addEventListener(Event.ENTER_FRAME, MCPVPQueueEF, false, 0, true);
            };
            (ui.mcPVPQueue.visible = true);
            (ui.mcPVPQueue.y = 84);
        }

        public function hideMCPVPQueue():void
        {
            ui.mcPVPQueue.removeEventListener(Event.ENTER_FRAME, MCPVPQueueEF);
            (ui.mcPVPQueue.visible = false);
            (ui.mcPVPQueue.y = -300);
        }

        public function onMCPVPQueueClick(_arg_1:MouseEvent):void
        {
            var _local_2:*;
            _local_2 = {};
            try
            {
                (_local_2.strUsername = world.myAvatar.objData.strUsername);
                ui.cMenu.fOpenWith("pvpqueue", _local_2);
            }
            catch(e:Error)
            {
            };
        }

        public function MCPVPQueueEF(_arg_1:Event):void
        {
            var _local_2:Number;
            var _local_3:*;
            _local_2 = new Date().getTime();
            _local_3 = Math.ceil(((((world.PVPQueue.avgWait * 1000) - (_local_2 - world.PVPQueue.ts)) / 1000) / 60));
            (ui.mcPVPQueue.t2.htmlText = (('<font color="#FFFFFF"' + _local_3) + '</font><font color="#999999"m</font>'));
            if (_local_3 <= 1)
            {
                (ui.mcPVPQueue.t2.htmlText = ("<" + ui.mcPVPQueue.t2.htmlText));
            };
        }

        public function updatePVPScore(_arg_1:Array):void
        {
            var _local_2:Object;
            var _local_3:MovieClip;
            var _local_4:int;
            var _local_5:int;
            _local_2 = {};
            _local_4 = 0;
            while (_local_4 < _arg_1.length)
            {
                (_local_2 = _arg_1[_local_4]);
                (_local_3 = (ui.mcPVPScore.getChildByName(("bar" + _local_4)) as MovieClip));
                if (_local_3 != null)
                {
                    (_local_3.ti.text = (_local_2.v + "/1000"));
                    _local_5 = int(int(((_local_2.v / 1000) * _local_3.bar.width)));
                    (_local_5 = Math.max(Math.min(_local_5, _local_3.bar.width), 0));
                    (_local_3.bar.x = (-(_local_3.bar.width) + _local_5));
                };
                _local_4++;
            };
        }

        public function relayPVPEvent(_arg_1:Object):void
        {
            if (_arg_1.typ == "kill")
            {
                if (_arg_1.team == world.myAvatar.dataLeaf.pvpTeam)
                {
                    if (_arg_1.val == "Restorer")
                    {
                        addUpdate(getPVPMessage(_arg_1.val, true));
                    };
                    if (_arg_1.val == "Brawler")
                    {
                        addUpdate(getPVPMessage(_arg_1.val, true));
                    };
                    if (_arg_1.val == "Captain")
                    {
                        addUpdate(getPVPMessage(_arg_1.val, true));
                    };
                    if (_arg_1.val == "General")
                    {
                        addUpdate("Victory! The enemy general has been defeated!");
                    };
                    if (_arg_1.val == "Knight")
                    {
                        addUpdate("A knight of the enemy has fallen! Victory draws closer!");
                    };
                }
                else
                {
                    if (_arg_1.val == "Restorer")
                    {
                        addUpdate(getPVPMessage(_arg_1.val, false), true);
                    };
                    if (_arg_1.val == "Brawler")
                    {
                        addUpdate(getPVPMessage(_arg_1.val, false), true);
                    };
                    if (_arg_1.val == "Captain")
                    {
                        addUpdate(getPVPMessage(_arg_1.val, false), true);
                    };
                    if (_arg_1.val == "General")
                    {
                        addUpdate("Oh no!  Our general has been defeated!", true);
                    };
                    if (_arg_1.val == "Knight")
                    {
                        addUpdate("A knight has fallen to the enemy!");
                    };
                };
            };
        }

        private function getPVPMessage(_arg_1:String, _arg_2:Boolean):String
        {
            switch (_arg_1)
            {
                case "Restorer":
                    if (_arg_2)
                    {
                        return ((world.strMapName == "guildwar") ? "An enemy Blade Master has been defeated! Dage's healing powers are waning!" : "An enemy Restorer has been defeated! The Captain's healing powers are waning!");
                    }
                    else
                    {
                        return ((world.strMapName == "guildwar") ? "A Blade Master has been defeated!\t Dage's healing powers are waning!" : "A Restorer has been defeated!\t Our Captain's healing powers are waning!");
                    };
                case "Brawler":
                    if (_arg_2)
                    {
                        return ((world.strMapName == "guildwar") ? "An enemy Legion Guard has been defeated!  Dage's attacks grow weaker!" : "An enemy Brawler has been defeated!  The Captain's attacks grow weaker!");
                    }
                    else
                    {
                        return ((world.strMapName == "guildwar") ? "A Legion Guard has been defeated!\tRally to Dage's defense!" : "A Brawler has been defeated!\tRally to the Captain's defense!");
                    };
                case "Captain":
                    if (_arg_2)
                    {
                        return ((world.strMapName == "guildwar") ? "Dage has been defeated!" : "The enemy captain has been defeated!");
                    }
                    else
                    {
                        return ((world.strMapName == "guildwar") ? "Dage has been fallen to the enemy!" : "Our Captain has been fallen to the enemy!");
                    };
            };
            return ("");
        }

        public function mcSetColor(_arg_1:MovieClip, _arg_2:String, _arg_3:String):*
        {
            var _local_4:MovieClip;
            var _local_6:String;
            _local_4 = _arg_1;
            var _local_5:Boolean;
            _local_6 = "none";
            while ((((!(_local_4 == null)) && (!(_local_4.parent == null))) && (!(_local_4.parent == _local_4.stage))))
            {
                if (("pAV" in _local_4))
                {
                    if (_local_4.name.indexOf("previewMC") > -1)
                    {
                        (_local_6 = "e");
                    }
                    else
                    {
                        if (_local_4.name.indexOf("Dummy") > -1)
                        {
                            (_local_6 = "d");
                        }
                        else
                        {
                            if (_local_4.name.indexOf("mcPortraitTarget") > -1)
                            {
                                (_local_6 = "c");
                            }
                            else
                            {
                                if (_local_4.name.indexOf("mcPortrait") > -1)
                                {
                                    (_local_6 = "b");
                                }
                                else
                                {
                                    (_local_6 = "a");
                                };
                            };
                        };
                    };
                    break;
                };
                (_local_4 = MovieClip(_local_4.parent));
            };
            if (_local_6 != "none")
            {
                _local_4.pAV.pMC.setColor(_arg_1, _local_6, _arg_2, _arg_3);
            };
        }

        public function areaListClick(_arg_1:MouseEvent):void
        {
            var _local_2:*;
            _local_2 = MovieClip(_arg_1.currentTarget.parent.parent);
            switch (_local_2.currentLabel)
            {
                case "init":
                    _local_2.gotoAndPlay("in");
                    return;
                case "hold":
                    _local_2.gotoAndPlay("out");
                    return;
            };
        }

        public function updateAreaName():void
        {
            var _local_1:String;
            _local_1 = (String(world.areaUsers.length) + " player");
            if (world.areaUsers.length > 1)
            {
                (_local_1 = (_local_1 + "(s)"));
            };
            (_local_1 = (_local_1 + " in <font color ='#FFFF00'>"));
            if (world.strAreaName.indexOf(":") > -1)
            {
                (_local_1 = (_local_1 + (world.strAreaName.split(":")[0] + " (party)")));
            }
            else
            {
                (_local_1 = (_local_1 + world.strAreaName));
            };
            (_local_1 = (_local_1 + "</font>"));
            (ui.mcInterface.areaList.title.t1.htmlText = _local_1);
        }

        public function areaListGet():void
        {
            var _local_1:Object;
            var _local_2:Object;
            var _local_3:String;
            var _local_4:*;
            _local_1 = {};
            _local_2 = sfc.getRoom(world.curRoom).getUserList();
            for (var _local_7:* in _local_2)
            {
                _local_3 = _local_7;
                _local_7;
                _local_4 = world.uoTree[_local_2[_local_3].getName()];
                if (_local_4 != null)
                {
                    (_local_1[_local_3] = {
                        "strUsername":_local_4.strUsername,
                        "intLevel":_local_4.intLevel
                    });
                };
            };
            areaListShow(_local_1);
        }

        public function areaListNameClick(_arg_1:MouseEvent):void
        {
            var _local_2:*;
            var _local_3:*;
            _local_2 = MovieClip(_arg_1.currentTarget);
            _local_3 = {};
            (_local_3.ID = _local_2.objData.ID);
            (_local_3.strUsername = _local_2.objData.strUsername);
            if (_local_2.objData.strUsername == world.myAvatar.objData.strUsername)
            {
                ui.cMenu.fOpenWith("self", _local_3);
            }
            else
            {
                ui.cMenu.fOpenWith("user", _local_3);
            };
        }

        public function areaListShow(_arg_1:Object):void
        {
            var _local_2:MovieClip;
            var _local_3:int;
            var _local_4:String;
            var _local_5:*;
            _local_2 = ui.mcInterface.areaList;
            _local_3 = 0;
            for (var _local_8:* in _arg_1)
            {
                _local_4 = _local_8;
                _local_8;
                _local_5 = _local_2.cnt.addChild(new aProto());
                (_local_5.objData = _arg_1[_local_4]);
                (_local_5.txtName.text = _arg_1[_local_4].strUsername);
                (_local_5.txtLevel.text = _arg_1[_local_4].intLevel);
                _local_5.addEventListener(MouseEvent.CLICK, areaListNameClick, false, 0, true);
                (_local_5.buttonMode = true);
                (_local_5.y = -(int((_local_3 * 14))));
                _local_3++;
            };
            (_local_2.cnt.iproto.visible = false);
            (_local_2.visible = true);
        }

        public function showFBShare(o:Object):void
        {
            var fbTab:FacebookTabMC;
            trace(((("showFBShare > " + o.isActive) + ", ") + uoPref.bFBShare));
            var mc:MovieClip = MovieClip(o.parent);
            var FBShareTabClass:Class = (getDefinitionByName("FacebookTabMC") as Class);
            if (((uoPref.bFBShare) && (o.isActive)))
            {
                trace("  trying to show the tab");
                try
                {
                    (fbTab = (o.parent.getChildByName("fbTab") as FacebookTabMC));
                }
                catch(error:Error)
                {
                    trace(error);
                };
                if (fbTab == null)
                {
                    (fbTab = new (FBShareTabClass)());
                    (fbTab.name = "fbTab");
                    (fbTab.filters = [new GlowFilter(12892822, 1, 10, 10, 2, 2, false, false)]);
                    o.parent.addChild(fbTab);
                    trace(" tab drawn");
                };
                fbTab.init(o);
                (fbTab.visible = true);
                if (("position" in o))
                {
                    fbTab.positionBy(o);
                };
            }
            else
            {
                try
                {
                    (o.parent.getChildByName("fbTab").visible = false);
                }
                catch(error:Error)
                {
                };
            };
        }

        public function closeFBC():void
        {
            trace("closeFBC()");
            if (fbc != null)
            {
                fbc.fClose();
            };
        }

        public function getAppName():String
        {
            return (Game.FB_APP_NAME);
        }

        public function getAppID():String
        {
            return (Game.FB_APP_ID);
        }

        public function getAppSec():String
        {
            return (Game.FB_APP_SEC);
        }

        public function getAppURL():String
        {
            return (Game.FB_APP_URL);
        }

        public function getUserName():String
        {
            if (((((!(world == null)) && (!(world.myAvatar == null))) && (!(world.myAvatar.objData == null))) && ("strUserName" in world.myAvatar.objData)))
            {
                return (world.myAvatar.objData.strUserName);
            };
            return ("");
        }

        public function toggleFaction():void
        {
            if (ui.mcPopup.currentLabel != "Faction")
            {
                ui.mcPopup.fOpen("Faction");
            }
            else
            {
                if (("cnt" in MovieClip(ui.mcPopup)))
                {
                    MovieClip(MovieClip(ui.mcPopup).cnt).xClick();
                };
            };
        }

        public function hideInterface():void
        {
            (ui.visible = false);
        }

        public function showInterface():void
        {
            (ui.visible = true);
        }

        public function loadExternalSWF(_arg_1:String):void
        {
            if (((_arg_1.indexOf("http://") == -1) || (_arg_1.indexOf("https://") == -1)))
            {
                if (((_arg_1.length > 1) && (_arg_1.charAt(0) == "/")))
                {
                    (_arg_1 = _arg_1.substr(1, (_arg_1.length - 1)));
                };
                (_arg_1 = ("maps/" + _arg_1));
            };
            ldrMC.loadFile(mcExtSWF, _arg_1, "Game Files");
            hideInterface();
            (world.visible = false);
        }

        public function clearExternamSWF():void
        {
            while (mcExtSWF.numChildren > 0)
            {
                mcExtSWF.removeChildAt(0);
            };
            (world.visible = true);
            showInterface();
        }

        public function openCharacterCustomize():void
        {
            ui.mcPopup.fOpen("Customize");
        }

        public function openArmorCustomize():void
        {
            ui.mcPopup.fOpen("ArmorColor");
        }

        public function showFactionInterface():void
        {
            ui.mcPopup.fOpen("Faction");
        }

        public function showConfirmtaionBox(sMsg:String, fHandler:Function):void
        {
            var modal:* = undefined;
            var modalO:* = undefined;
            modal = new ModalMC();
            modalO = {};
            (modalO.strBody = sMsg);
            (modalO.btns = "dual");
            (modalO.params = {});
            (modalO.callback = function (_arg_1:Object):*
            {
                fHandler(_arg_1.accept);
            });
            ui.ModalStack.addChild(modal);
            modal.init(modalO);
        }

        public function showMessageBox(sMsg:String, fHandler:Function=null):void
        {
            var modal:* = undefined;
            var modalO:* = undefined;
            modal = new ModalMC();
            modalO = {};
            (modalO.strBody = sMsg);
            (modalO.btns = "mono");
            (modalO.params = {});
            (modalO.callback = function (_arg_1:Object):*
            {
                if (fHandler != null)
                {
                    fHandler();
                };
            });
            ui.ModalStack.addChild(modal);
            modal.init(modalO);
        }

        public function getServerTime():Date
        {
            var _local_1:Date;
            var _local_2:*;
            _local_1 = new Date();
            _local_2 = (ts_login_server + (_local_1.getTime() - ts_login_client));
            return (new Date(_local_2));
        }

        public function get date_server():Date
        {
            return (getServerTime());
        }

        public function showTracking(_arg_1:String):void
        {
            var _local_2:*;
            try
            {
                _local_2 = ((objLogin.userid != null) ? objLogin.userid : 0);
                extCall.logQuestProgress(_local_2, _arg_1);
            }
            catch(e)
            {
            };
        }

        public function removeApop():void
        {
            if (apop == null)
            {
                return;
            };
            (apop_ = null);
            world.removeMovieFront();
        }

        public function createApop():void
        {
            if (apop_ != null)
            {
                removeApop();
            };
            (apop_ = new apopCore((this as MovieClip), apopTree[curID]));
            (apop_.x = 270);
            (apop_.y = 20);
            world.FG.addChild(apop_);
            (world.FG.mouseChildren = true);
        }

        public function rand(_arg_1:Number=0, _arg_2:Number=1):Number
        {
            return (rn.rand(_arg_1, _arg_2));
        }

        public function get TravelMap():Object
        {
            return (travelMapData);
        }

        public function get apop():apopCore
        {
            return (apop_);
        }

        public function get objWorldMap():*
        {
            return (WorldMapData);
        }

        public function getLogin():Object
        {
            return (objLogin);
        }
		
		public function loadAssetsEmoji():void
		{	
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.AvatarSkeletonComplete, false, 0, true);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.AvatarSkeletonError, false, 0, true);
            loader.load(new URLRequest(serverFilePath + "interface/assets/Emoji/Emoji.swf"), assetsContext);
        }
		
		public function loadAvatarSkeleton():void
		{	
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.AvatarSkeletonComplete, false, 0, true);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.AvatarSkeletonError, false, 0, true);
            loader.load(new URLRequest(serverFilePath + "interface/assets/Avatar/Skeleton.swf"), assetsContext);
        }
		
		private function AvatarSkeletonComplete(e:Event):void
        {
			trace("AvatarSkeletonComplete >>>>>");
        }
		
        private function AvatarSkeletonError(e:Event):void
        {
			mcLogin.gotoAndPlay("Init");
		}
		
		public function playBGM():void
        {
            if (userPreference.data.bSoundOn == true)
            {
                if (LoginBGM != null)
                {
					(BGMTransform.volume = 0.65);
                    (BGMChannel = LoginBGM.play(0, 9999, BGMTransform));
                    (SoundMixer.soundTransform = BGMTransform);
                };
            };
        }

        internal function frame1():*
        {
            stop();
        }

        internal function frame12():*
        {
            init();
            showTracking("2");
        }

        internal function frame13():*
        {
            loadTitle();
            stop();
        }

        internal function frame22():*
        {
            trace("at game");
            initInterface();
            initWorld();
            stop();
        }

        internal function frame32():*
        {
            if (params.vars != null)
            {
                loadAccountCreation(("newuser/" + params.vars.sCharCreate));
            }
            else
            {
                loadAccountCreation("newuser/AQW-Landing-MERGETEST.swf");
            };
            stop();
        }


    }
}