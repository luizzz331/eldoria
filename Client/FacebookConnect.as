// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//FacebookConnect

package 
{
    import flash.utils.Timer;
    import flash.display.MovieClip;
    import flash.net.URLRequest;
    import flash.net.URLLoader;
    import flash.net.URLRequestMethod;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.net.navigateToURL;
    import flash.net.URLVariables;
    import flash.events.TimerEvent;
    import com.adobe.serialization.json.JSON;
    import flash.net.SharedObject;

    public class FacebookConnect 
    {

        public static var fbpoll:Timer = new Timer(5000);
        public static var pollTries:int = 0;
        public static var FB_ME_URL:String = "https://graph.facebook.com/me?access_token=";
        public static var Me:Object;
        public static var AccessToken:String = "";
        public static var IPAddr:String = "";
        private static var _game:MovieClip;
        public static var isLoggedIn:Boolean = false;
        public static var Mode:String = "";
        private static var sURL:String = "https://www.aq.com/game/";
        private static var rdURL:String = "https://www.aq.com/game/";
        private static var FBWeb:FacebookWeb;

        public function FacebookConnect():void
        {
        }

        public static function RegisterGame(_arg_1:MovieClip):void
        {
            _game = _arg_1;
            if (Game.ISWEB)
            {
                FBWeb = new FacebookWeb();
                FBWeb.InitListener(_arg_1);
            };
            trace(("FB sURL = " + sURL));
            AccessToken = GetToken();
        }

        public static function RequestFBConnect(_arg_1:String=""):void
        {
            var _local_2:URLRequest;
            var _local_3:URLLoader;
            if (Game.ISWEB)
            {
                FBWeb.Login();
            }
            else
            {
                trace(("mode: " + _arg_1));
                Mode = _arg_1;
                if (GetToken() != "")
                {
                    FetchMe(AccessToken);
                }
                else
                {
                    _local_2 = new URLRequest(((sURL + "requestFBConnect.asp?state=") + GUID.GetGUID()));
                    _local_2.method = URLRequestMethod.GET;
                    _local_3 = new URLLoader();
                    _local_3.addEventListener(Event.COMPLETE, onFBRequestComplete);
                    _local_3.addEventListener(IOErrorEvent.IO_ERROR, onFBRequestError);
                    _local_3.load(_local_2);
                };
            };
        }

        public static function onFBRequestError(_arg_1:IOErrorEvent):void
        {
            trace(("ERROR:  " + _arg_1.text));
            onFBRequestComplete(null);
        }

        public static function onFBRequestComplete(_arg_1:Event):void
        {
            navigateToURL(new URLRequest(((("https://www.facebook.com/v2.12/dialog/oauth?client_id=163679093835836&&auth_type=rerequest&scope=email&redirect_uri=" + rdURL) + "AQWFB.html&state=") + GUID.GetGUID())), "_blank");
            StartPoll();
        }

        public static function pollFBApi(_arg_1:TimerEvent):void
        {
            var _local_2:URLRequest;
            var _local_3:URLVariables;
            var _local_4:URLLoader;
            pollTries++;
            if (pollTries > 10)
            {
                StopPoll();
                _game.mcConnDetail.showConn("Facebook Connection Timed Out.  Please try again.");
            }
            else
            {
                _local_2 = new URLRequest((sURL + "checkFBConnect.asp"));
                _local_3 = new URLVariables();
                _local_3.state = GUID.GetGUID();
                _local_2.data = _local_3;
                _local_2.method = URLRequestMethod.GET;
                _local_4 = new URLLoader();
                _local_4.addEventListener(Event.COMPLETE, onFBCheckComplete);
                _local_4.addEventListener(IOErrorEvent.IO_ERROR, onFBPollError);
                _local_4.load(_local_2);
            };
        }

        public static function onFBCheckComplete(_arg_1:Event):void
        {
            var _local_2:String = _arg_1.target.data;
            if (_local_2.indexOf("status=") == -1)
            {
                IPAddr = _local_2.split("::")[0];
                AccessToken = _local_2.split("::")[1];
                trace(((("FBTOKEN: " + AccessToken) + "IP ADDR: ") + IPAddr));
                StopPoll();
                isLoggedIn = true;
                SaveToken();
                FetchMe(AccessToken);
            };
        }

        public static function onFBPollError(_arg_1:IOErrorEvent):*
        {
            trace(_arg_1.toString());
            StopPoll();
        }

        public static function StopPoll():*
        {
            if (fbpoll.running)
            {
                fbpoll.stop();
                fbpoll.removeEventListener(TimerEvent.TIMER, pollFBApi);
            };
            pollTries = 0;
        }

        public static function StartPoll():*
        {
            StopPoll();
            fbpoll.addEventListener(TimerEvent.TIMER, pollFBApi);
            fbpoll.start();
        }

        public static function FetchMe(_arg_1:String):*
        {
            var _local_2:URLRequest = new URLRequest(((FB_ME_URL + _arg_1) + "&fields=id,name,email,birthday"));
            _local_2.method = URLRequestMethod.GET;
            var _local_3:URLLoader = new URLLoader();
            _local_3.addEventListener(Event.COMPLETE, onFBMeRequestComplete);
            _local_3.load(_local_2);
        }

        public static function onFBMeRequestComplete(e:Event):*
        {
            var meObj:Object;
            var evt:* = undefined;
            var result:Boolean;
            var msg:String = "Failed to retrieve Facebook User.";
            try
            {
                trace(("RETURNED: " + e.target.data));
                meObj = com.adobe.serialization.json.JSON.decode(e.target.data);
                trace(((((((("Got Me from FB - " + meObj.name) + " : ") + meObj.id) + " : ") + meObj.email) + " : ") + meObj.birthday));
                Me = meObj;
                result = true;
                msg = ("Retrieved Facebook User: " + Me.name);
                isLoggedIn = true;
            }
            catch(e:Error)
            {
                trace("Error Fetching Facebook Me Data");
                ClearToken();
            };
            if (_game != null)
            {
                evt = new FacebookConnectEvent(FacebookConnectEvent.ONCONNECT, {
                    "success":result,
                    "message":msg,
                    "mode":Mode
                });
                _game.dispatchEvent(evt);
            };
        }

        public static function Logout():*
        {
            Me = null;
            isLoggedIn = false;
            AccessToken = "";
            ClearToken();
            if (Game.ISWEB)
            {
                trace("=== Calling FBWeb Logout ===");
                FBWeb.Logout();
            };
        }

        private static function GetToken():String
        {
            var _local_1:SharedObject = GetSharedObjectToken();
            if (_local_1.size > 0)
            {
                AccessToken = _local_1.data.token;
                return (AccessToken);
            };
            return ("");
        }

        public static function SaveToken():*
        {
            var so_token:SharedObject = GetSharedObjectToken();
            try
            {
                if (so_token.size == 0)
                {
                    so_token.data.token = AccessToken;
                    try
                    {
                        so_token.flush();
                    }
                    catch(e:Error)
                    {
                        trace(e.message);
                    };
                };
            }
            catch(e:Error)
            {
                trace(("Error Flushing FBToken: " + e.message));
            };
        }

        public static function ClearToken():*
        {
            AccessToken = "";
            var _local_1:SharedObject = GetSharedObjectToken();
            if (_local_1.size > 0)
            {
                _local_1.clear();
            };
        }

        public static function handleFBMessage(_arg_1:*, _arg_2:*):*
        {
            FBWeb.FBMessage(_arg_1, _arg_2);
        }

        private static function GetSharedObjectToken():SharedObject
        {
            var _local_1:SharedObject;
            if (Game.ISWEB)
            {
                _local_1 = SharedObject.getLocal("FBT");
                trace("RETURNED FBT");
            }
            else
            {
                _local_1 = SharedObject.getLocal("FBTSA");
                trace("RETURNED FBTSA");
            };
            return (_local_1);
        }


    }
}//package 

