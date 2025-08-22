// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//mcOption

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import flash.utils.Timer;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.media.SoundMixer;
    import flash.media.SoundTransform;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;

    public class mcOption extends MovieClip 
    {

        private const arrQuality:Array = new Array("AUTO", "LOW", "MEDIUM", "HIGH");
		
		public var btnRightSkillFX:MovieClip;
		public var btnLeftSkillFX:MovieClip;
        public var txtSkillFX:TextField;
		public var btnClose:SimpleButton;
		public var btnLeftWorldChat:MovieClip;
        public var btnRightWorldChat:MovieClip;
		public var txtWorldChat:TextField;
		public var btnLeftTrade:MovieClip;
        public var btnRightTrade:MovieClip;
        public var txtTrade:TextField;
        public var txtGuild:TextField;
        public var btnRightAllCloak:MovieClip;
        public var txtFriendsList:TextField;
        public var btnLeftAnim:MovieClip;
        public var txtGoto:TextField;
        public var btnLeftTool:MovieClip;
        public var fbText:TextField;
        public var btnHelp:SimpleButton;
        public var btnLeftParty:MovieClip;
        public var txtFriend:TextField;
        public var btnLogoutFB:MovieClip;
        public var btnLeftWhisp:MovieClip;
        public var btnLeftOtherPet:MovieClip;
        public var btnFriend:SimpleButton;
        public var mcAudio:MovieClip;
        public var txtFBLink:TextField;
        public var btnLeftCloak:MovieClip;
        public var txtCloak:TextField;
        public var btnRightCloak:MovieClip;
        public var btnAccount:MovieClip;
        public var mcVis:MovieClip;
        public var txtShare:TextField;
        public var btnLore:SimpleButton;
        public var btnRightWhisp:MovieClip;
        public var btnRightDuel:MovieClip;
        public var mcServer:MovieClip;
        public var btnLeftGuild:MovieClip;
        public var txtDuel:TextField;
        public var txtHelm:TextField;
        public var btnGame:MovieClip;
        public var btnPlayer:SimpleButton;
        public var btnRightGuild:MovieClip;
        public var btnGeneral:MovieClip;
        public var btnGuild:SimpleButton;
        public var btnCharPage:SimpleButton;
        public var btnRightParty:MovieClip;
        public var btnRightFriend:MovieClip;
        public var btnLeftFriend:MovieClip;
        public var btnLeftGoto:MovieClip;
        public var txtTool:TextField;
        public var txtPet:TextField;
        public var btnIgnore:SimpleButton;
        public var bg:MovieClip;
        public var txtParty:TextField;
        public var btnRightHelm:MovieClip;
        public var btnLeftHelm:MovieClip;
        public var btnRightTool:MovieClip;
        public var txtAllCloak:TextField;
        public var btnChange:SimpleButton;
        public var btnLogout:SimpleButton;
        public var btnFBFriends:SimpleButton;
        public var txtOtherPet:TextField;
        public var btnRightPet:MovieClip;
        public var btnLeftPet:MovieClip;
        public var btnScreen:SimpleButton;
        public var btnRightAnim:MovieClip;
        public var txtAnim:TextField;
        public var btnLeftAllCloak:MovieClip;
        public var btnChat:MovieClip;
        public var btnLink:SimpleButton;
        public var btnAcc:SimpleButton;
        public var txtWhisp:TextField;
        public var btnRightOtherPet:MovieClip;
        public var btnRightGoto:MovieClip;
        public var btnShare:SimpleButton;
        public var btnLeftDuel:MovieClip;
        private var rootClass:MovieClip;
        private var ptrQ:uint = 0;
        private var serverTimer:Timer = new Timer(1000);
        private var strFriend:String = "{app_id:163679093835836, redirect_uri:'www.aq.com/?something=something', title='title 50 max characters', data='requestTrackingID=5125136'}";
        private var strExclude:String = "";
        private var passMC:MovieClip;
        private var ArrowButtons:Object;

        public function mcOption(_arg_1:MovieClip)
        {
            addFrameScript(0, frame1, 9, frame10, 17, frame18, 25, frame26);
            rootClass = _arg_1;
        }

        public function Init():void
        {
            btnGeneral.gotoAndStop(1);
            btnChat.gotoAndStop(1);
            btnAccount.gotoAndStop(1);
            btnGame.gotoAndStop(1);
            if (this.currentLabel != "General")
            {
                this.gotoAndPlay("General");
            };
            btnGeneral.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnGeneral.gotoAndStop(2);
            btnChat.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnChat.buttonMode = true;
            btnAccount.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnAccount.buttonMode = true;
            btnGame.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnGame.buttonMode = true;
            btnClose.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
            btnLogout.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
            setUpFrame("General");
            serverTimer.addEventListener(TimerEvent.TIMER, timerHandler, false, 0, true);
            serverTimer.start();
        }

        public function InitAccount():void
        {
            btnGeneral.gotoAndStop(1);
            btnChat.gotoAndStop(1);
            btnAccount.gotoAndStop(1);
            btnGame.gotoAndStop(1);
            if (this.currentLabel != "Account")
            {
                this.gotoAndPlay("Account");
            };
            btnGeneral.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnGeneral.buttonMode = true;
            btnChat.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnChat.buttonMode = true;
            btnGame.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnGame.buttonMode = true;
            btnAccount.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
            btnAccount.buttonMode = true;
            btnLogout.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
            btnClose.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
            btnAccount.gotoAndStop(2);
            serverTimer.addEventListener(TimerEvent.TIMER, timerHandler, false, 0, true);
            serverTimer.start();
        }

        private function timerHandler(_arg_1:TimerEvent):void
        {
            if (stage == null)
            {
                serverTimer.stop();
                serverTimer.removeEventListener(TimerEvent.TIMER, timerHandler);
            }
            else
            {
                if (mcServer != null)
                {
                    mcServer.txtTime.text = rootClass.date_server.toLocaleTimeString();
                };
            };
            if (MovieClip(parent) != null)
            {
                if (MovieClip(parent).currentLabel != "Option")
                {
                    MovieClip(parent).removeChild(this);
                    serverTimer.stop();
                    serverTimer.removeEventListener(TimerEvent.TIMER, timerHandler);
                };
            };
        }

        private function setUpFrame(_arg_1:String):void
        {
            var _local_2:uint;
            switch (_arg_1)
            {
                case "General":
                    mcAudio.txtAudio.text = ((rootClass.userPreference.data.bSoundOn) ? "On" : "Off");
                    mcVis.txtQuality.text = rootClass.userPreference.data.quality;
                    mcServer.txtServer.text = rootClass.objServerInfo.sName;
                    if (!mcVis.btnLeftQual.hasEventListener(MouseEvent.CLICK))
                    {
                        mcVis.btnLeftQual.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        mcVis.btnRightQual.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnScreen.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        mcAudio.btnLeftAudio.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        mcAudio.btnRightAudio.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnCharPage.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnFriend.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnGuild.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnIgnore.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnChange.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        _local_2 = 0;
                        while (_local_2 < arrQuality.length)
                        {
                            if (mcVis.txtQuality.text == arrQuality[_local_2])
                            {
                                ptrQ = _local_2;
                                break;
                            };
                            _local_2++;
                        };
                    };
                    setQual();
                    return;
                case "Gameplay":
                    if (!btnRightTool.hasEventListener(MouseEvent.CLICK))
                    {
						btnRightSkillFX.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightSkillFX.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightTool.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftTool.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightPet.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftPet.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightHelm.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftHelm.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightCloak.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftCloak.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftAllCloak.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightAllCloak.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightGoto.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftGoto.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftOtherPet.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightOtherPet.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightAnim.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftAnim.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                    };
					txtSkillFX.text = ((rootClass.uoPref.bSkillFX) ? "On" : "Off");
                    txtTool.text = ((rootClass.uoPref.bTT) ? "On" : "Off");
                    txtPet.text = ((rootClass.uoPref.bPet) ? "Yes" : "No");
                    txtHelm.text = ((rootClass.uoPref.bHelm) ? "Yes" : "No");
                    txtCloak.text = ((rootClass.uoPref.bCloak) ? "Yes" : "No");
                    txtGoto.text = ((rootClass.uoPref.bGoto) ? "On" : "Off");
                    txtAnim.text = ((rootClass.world.showAnimations) ? "On" : "Off");
                    txtAllCloak.text = ((rootClass.world.hideAllCapes) ? "Yes" : "No");
                    txtOtherPet.text = ((rootClass.world.hideOtherPets) ? "Yes" : "No");
                    return;
                case "Social":
                    if (!btnRightParty.hasEventListener(MouseEvent.CLICK))
                    {
						btnRightWorldChat.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftWorldChat.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
						btnRightTrade.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftTrade.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightParty.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftParty.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightFriend.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftFriend.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightDuel.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftDuel.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightGuild.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftGuild.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnRightWhisp.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLeftWhisp.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                    };
					txtWorldChat.text = ((rootClass.uoPref.bWorldChat) ? "On" : "Off");
					txtTrade.text = (rootClass.uoPref.bTrade ? "On" : "Off");
                    txtParty.text = ((rootClass.uoPref.bParty) ? "On" : "Off");
                    txtFriend.text = ((rootClass.uoPref.bFriend) ? "On" : "Off");
                    txtDuel.text = ((rootClass.uoPref.bDuel) ? "On" : "Off");
                    txtGuild.text = ((rootClass.uoPref.bGuild) ? "On" : "Off");
                    txtWhisp.text = ((rootClass.uoPref.bWhisper) ? "On" : "Off");
                    return;
                case "Account":
                    if (!btnAcc.hasEventListener(MouseEvent.CLICK))
                    {
                        btnAcc.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnHelp.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnPlayer.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        btnLore.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        if (((rootClass.world.myAvatar.objData.iAge < 13) || ((Game.objLogin.FBID > 0) && (!(FacebookConnect.isLoggedIn)))))
                        {
                            btnLink.visible = false;
                            txtFBLink.visible = false;
                            fbText.visible = false;
                        }
                        else
                        {
                            btnLink.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                        };
                    };
                    checkFBStatus();
                    txtFBLink.mouseEnabled = false;
                    btnLogoutFB.visible = FacebookConnect.isLoggedIn;
                    btnLogoutFB.addEventListener(MouseEvent.CLICK, onArrowClick, false, 0, true);
                    btnLogoutFB.buttonMode = true;
                    btnFBFriends.visible = false;
                    txtFriendsList.visible = false;
                    btnShare.visible = false;
                    txtShare.visible = false;
                    return;
            };
        }

        private function onClick(_arg_1:MouseEvent):void
        {
            btnGeneral.gotoAndStop(1);
            btnChat.gotoAndStop(1);
            btnAccount.gotoAndStop(1);
            btnGame.gotoAndStop(1);
            _arg_1.currentTarget.gotoAndStop(2);
            switch (_arg_1.currentTarget.name)
            {
                case "btnGeneral":
                    if (this.currentLabel != "General")
                    {
                        this.gotoAndPlay("General");
                    };
                    return;
                case "btnGame":
                    if (this.currentLabel != "Gameplay")
                    {
                        this.gotoAndPlay("Gameplay");
                    };
                    return;
                case "btnChat":
                    if (this.currentLabel != "Social")
                    {
                        this.gotoAndPlay("Social");
                    };
                    return;
                case "btnAccount":
                    if (this.currentLabel != "Account")
                    {
                        this.gotoAndPlay("Account");
                    };
                    return;
            };
        }

        private function onArrowClick(e:MouseEvent):void
        {
            var p:MovieClip;
            rootClass.mixer.playSound("Click");
            switch (e.currentTarget.name)
            {
                case "btnLeftQual":
                    ptrQ = ((--ptrQ < 0) ? 3 : ptrQ);
                    setQual();
                    return;
                case "btnRightQual":
                    ptrQ = ((++ptrQ > 3) ? 0 : ptrQ);
                    setQual();
                    return;
                case "btnScreen":
                    rootClass.toggleFullScreen();
                    return;
                case "btnLeftAudio":
                case "btnRightAudio":
                    mcAudio.txtAudio.text = ((mcAudio.txtAudio.text == "On") ? "Off" : "On");
                    if (rootClass.userPreference.data.bSoundOn)
                    {
                        rootClass.mixer.bSoundOn = false;
                        SoundMixer.stopAll();
                        SoundMixer.soundTransform = new SoundTransform(0);
                    }
                    else
                    {
                        rootClass.mixer.bSoundOn = true;
                        SoundMixer.soundTransform = new SoundTransform(1);
                    };
                    rootClass.uoPref.bSoundOn = rootClass.mixer.bSoundOn;
                    rootClass.userPreference.data.bSoundOn = rootClass.mixer.bSoundOn;
                    try
                    {
                        rootClass.userPreference.flush();
                    }
                    catch(e:Error)
                    {
                        trace(e.message);
                    };
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bSoundOn", String(rootClass.uoPref.bSoundOn)], "str", 1);
                    return;
                case "btnLeftPet":
                case "btnRightPet":
                    txtPet.text = ((txtPet.text == "Yes") ? "No" : "Yes");
                    if (rootClass.uoPref.bPet)
                    {
                        rootClass.uoPref.bPet = false;
                        rootClass.world.hideAllPets();
                    }
                    else
                    {
                        rootClass.uoPref.bPet = true;
                        rootClass.world.showAllPets();
                        if (rootClass.world.hideOtherPets)
                        {
                            rootClass.world.hideAllPets(false);
                        };
                    };
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bPet", String(rootClass.uoPref.bPet)], "str", 1);
                    return;
                case "btnLeftOtherPet":
                case "btnRightOtherPet":
                    txtOtherPet.text = ((txtOtherPet.text == "Yes") ? "No" : "Yes");
                    if (rootClass.world.hideOtherPets)
                    {
                        rootClass.world.hideOtherPets = false;
                        rootClass.world.showAllPets(false);
                    }
                    else
                    {
                        rootClass.world.hideOtherPets = true;
                        rootClass.world.hideAllPets(false);
                    };
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bOtherPets", String(rootClass.world.hideOtherPets)], "str", 1);
                    return;
                case "btnLeftHelm":
                case "btnRightHelm":
                    txtHelm.text = ((txtHelm.text == "Yes") ? "No" : "Yes");
                    rootClass.uoPref.bHelm = (!(rootClass.uoPref.bHelm));
                    rootClass.world.myAvatar.dataLeaf.showHelm = rootClass.uoPref.bHelm;
                    rootClass.world.myAvatar.pMC.setHelmVisibility(rootClass.uoPref.bHelm);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bHelm", String(rootClass.uoPref.bHelm)], "str", 1);
                    return;
                case "btnLeftCloak":
                case "btnRightCloak":
                    txtCloak.text = ((txtCloak.text == "Yes") ? "No" : "Yes");
                    rootClass.uoPref.bCloak = (!(rootClass.uoPref.bCloak));
                    rootClass.world.myAvatar.dataLeaf.showCloak = rootClass.uoPref.bCloak;
                    rootClass.world.myAvatar.pMC.setCloakVisibility(rootClass.uoPref.bCloak);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bCloak", String(rootClass.uoPref.bCloak)], "str", 1);
                    return;
                case "btnLeftAllCloak":
                case "btnRightAllCloak":
                    txtAllCloak.text = ((txtAllCloak.text == "Yes") ? "No" : "Yes");
                    rootClass.world.hideAllCapes = (!(rootClass.world.hideAllCapes));
                    rootClass.world.setAllCloakVisibility();
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bAllCloak", String(rootClass.world.hideAllCapes)], "str", 1);
                    return;
                case "btnLeftTool":
                case "btnRightTool":
                    txtTool.text = ((txtTool.text == "On") ? "Off" : "On");
                    rootClass.uoPref.bTT = (!(rootClass.uoPref.bTT));
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bTT", String(rootClass.uoPref.bTT)], "str", 1);
                    return;
                case "btnLeftGoto":
                case "btnRightGoto":
                    txtGoto.text = ((txtGoto.text == "On") ? "Off" : "On");
                    rootClass.uoPref.bGoto = (!(rootClass.uoPref.bGoto));
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bGoto", String(rootClass.uoPref.bGoto)], "str", 1);
                    return;
				case "btnLeftSkillFX":
                case "btnRightSkillFX":
                    txtSkillFX.text = (txtSkillFX.text == "On" ? "Off" : "On");
                    rootClass.skillAnimFX = rootClass.skillAnimFX ? false : true;
                    rootClass.uoPref.bSkillFX = (!rootClass.uoPref.bSkillFX);
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bSkillFX", String(rootClass.uoPref.bSkillFX)], "str", 1);
				return;
                case "btnLeftParty":
                case "btnRightParty":
                    txtParty.text = ((txtParty.text == "On") ? "Off" : "On");
                    rootClass.uoPref.bParty = (!(rootClass.uoPref.bParty));
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bParty", String(rootClass.uoPref.bParty)], "str", 1);
                    return;
                case "btnLeftDuel":
                case "btnRightDuel":
                    txtDuel.text = ((txtDuel.text == "On") ? "Off" : "On");
                    rootClass.uoPref.bDuel = (!(rootClass.uoPref.bDuel));
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bDuel", String(rootClass.uoPref.bDuel)], "str", 1);
                    return;
                case "btnLeftAnim":
                case "btnRightAnim":
                    txtAnim.text = ((txtAnim.text == "On") ? "Off" : "On");
                    rootClass.world.showAnimations = (!(rootClass.world.showAnimations));
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bAnim", String(rootClass.world.showAnimations)], "str", 1);
                    return;
                case "btnLeftFriend":
                case "btnRightFriend":
                    txtFriend.text = ((txtFriend.text == "On") ? "Off" : "On");
                    rootClass.uoPref.bFriend = (!(rootClass.uoPref.bFriend));
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bFriend", String(rootClass.uoPref.bFriend)], "str", 1);
                    return;
				case "btnLeftTrade":
                case "btnRightTrade":
                    txtTrade.text = (txtTrade.text == "On" ? "Off" : "On");
                    rootClass.uoPref.bTrade = (!(rootClass.uoPref.bTrade));
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bTrade", String(rootClass.uoPref.bTrade)], "str", 1);
				return;
                case "btnLeftGuild":
                case "btnRightGuild":
                    txtGuild.text = ((txtGuild.text == "On") ? "Off" : "On");
                    rootClass.uoPref.bGuild = (!(rootClass.uoPref.bGuild));
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bGuild", String(rootClass.uoPref.bGuild)], "str", 1);
                    return;
				case "btnLeftWorldChat":
                case "btnRightWorldChat":
                    txtWorldChat.text = ((txtWorldChat.text == "On") ? "Off" : "On");
                    rootClass.uoPref.bWorldChat = (!(rootClass.uoPref.bWorldChat));
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bWorldChat", String(rootClass.uoPref.bWorldChat)], "str", 1);
				return;
                case "btnLeftWhisp":
                case "btnRightWhisp":
                    txtWhisp.text = ((txtWhisp.text == "On") ? "Off" : "On");
                    rootClass.uoPref.bWhisper = (!(rootClass.uoPref.bWhisper));
                    rootClass.sfc.sendXtMessage("zm", "cmd", ["uopref", "bWhisper", String(rootClass.uoPref.bWhisper)], "str", 1);
                    return;
                case "btnFriend":
                    rootClass.world.showFriendsList();
                    return;
                case "btnGuild":
                    rootClass.world.showGuildList();
                    return;
                case "btnIgnore":
                    rootClass.world.showIgnoreList();
                    return;
                case "btnAcc":
                    navigateToURL(new URLRequest("http://account.aqworlds.com/"), "_blank");
                    return;
                case "btnChar":
                    return;
                case "btnHelp":
                    navigateToURL(new URLRequest("http://www.aq.com/help/"), "_blank");
                    return;
                case "btnCharPage":
                    rootClass.mixer.playSound("Click");
                    if (rootClass.params.strSourceID == "BBGames")
                    {
                        navigateToURL(new URLRequest(("http://www.aq.com/embed/bbgames/aw-character.asp?id=" + rootClass.world.myAvatar.objData.strUsername)), "_blank");
                    }
                    else
                    {
                        navigateToURL(new URLRequest(("http://www.aq.com/aw-character.asp?id=" + rootClass.world.myAvatar.objData.strUsername)), "_blank");
                    };
                    return;
                case "btnLogout":
                    rootClass.logout();
                    return;
                case "btnClose":
                    serverTimer.stop();
                    serverTimer.removeEventListener(TimerEvent.TIMER, timerHandler);
                    btnGeneral.gotoAndStop(1);
                    btnChat.gotoAndStop(1);
                    btnAccount.gotoAndStop(1);
                    btnGame.gotoAndStop(1);
                    if (this.currentLabel != "General")
                    {
                        this.gotoAndPlay("General");
                    };
                    p = MovieClip(parent);
                    p.removeChild(this);
                    if (p.currentLabel != "Init")
                    {
                        p.gotoAndPlay("Init");
                    };
                    return;
                case "btnLore":
                    navigateToURL(new URLRequest("http://www.aq.com/lorepages.asp"), "_blank");
                    return;
                case "btnChange":
                    rootClass.showServerList();
                    return;
                case "btnPlayer":
                    navigateToURL(new URLRequest("http://www.aq.com/info/handbook/"), "_blank");
                    return;
                case "btnLink":
                    if (FacebookConnect.isLoggedIn)
                    {
                        passMC = (new mcFBPassword(rootClass) as MovieClip);
                        passMC.x = 268;
                        passMC.y = 30;
                        rootClass.ui.addChild(passMC);
                    };
                    return;
                case "btnLogoutFB":
                    FacebookConnect.Logout();
                    rootClass.logout();
                    return;
            };
        }

        private function setQual():void
        {
            mcVis.txtQuality.text = (rootClass.userPreference.data.quality = arrQuality[ptrQ]);
            if (rootClass.userPreference.data.quality == "AUTO")
            {
                stage.quality = "HIGH";
            }
            else
            {
                stage.quality = rootClass.userPreference.data.quality;
            };
            try
            {
                rootClass.userPreference.flush();
            }
            catch(e:Error)
            {
                trace(e.message);
            };
        }

        public function checkFBStatus():void
        {
            if (this.currentLabel == "Account")
            {
                txtFBLink.text = ((FacebookConnect.isLoggedIn) ? "Unlink" : "Link");
            };
        }

        public function closeUnlink():void
        {
            try
            {
                rootClass.ui.removeChild(passMC);
            }
            catch(e)
            {
            };
        }

        internal function frame1():*
        {
            this.setUpFrame(this.currentLabel);
            stop();
        }

        internal function frame10():*
        {
            this.setUpFrame(this.currentLabel);
            stop();
        }

        internal function frame18():*
        {
            this.setUpFrame(this.currentLabel);
            stop();
        }

        internal function frame26():*
        {
            this.setUpFrame(this.currentLabel);
            stop();
        }


    }
}//package 

