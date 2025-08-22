﻿// AQW - PRIME
// Client By AE
// Edited by g14k
// Long Live the Biladerios


//AvatarMC

package 
{
    import flash.display.MovieClip;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.geom.ColorTransform;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.display.DisplayObject;
    import flash.events.IOErrorEvent;
    import flash.system.ApplicationDomain;
    import flash.display.Graphics;

    public class AvatarMC extends MovieClip 
    {

        private const MAX_RATIO:Number = 4.6566128752458E-10;
		public var mcEmoticon:MovieClip;
        public var hpBar:MovieClip;
        public var mcChar:MovieClip;
        public var pname:MovieClip;
        public var ignore:MovieClip;
        public var shadow:MovieClip;
        public var Sounds:MovieClip;
        public var fx:MovieClip;
        public var proxy:MovieClip;
        public var bubble:MovieClip;
        private var xDep:*;
        private var yDep:*;
        private var xTar:*;
        private var yTar:Number;
        private var nDuration:*;
        private var nXStep:*;
        private var nYStep:*;
        private var walkSpeed:Number;
        private var op:Point;
        private var tp:Point;
        private var walkTS:Number;
        private var walkD:Number;
        private var headPoint:Point;
        private var cbx:*;
        private var cby:Number;
        private var bLoadingHelm:Boolean = false;
        public var pAV:Avatar;
        public var projClass:Projectile;
        public var spellDur:int = 0;
        public var bBackHair:Boolean = false;
        public var isLoaded:Boolean = false;
        public var STAGE:MovieClip;
        public var world:MovieClip;
        public var px:*;
        public var py:*;
        public var tx:*;
        public var ty:Number;
        public var kv:Killvis = null;
        public var strGender:String;
        public var previousframe:int = -1;
        public var hitboxR:Rectangle;
        private var rootClass:MovieClip;
        private var randNum:Number;
		private var necklaceLoad:Boolean = true;
		private var shieldLoad:Boolean = true;
        private var weaponLoad:Boolean = true;
        private var armorLoad:Boolean = true;
        private var classLoad:Boolean = true;
        private var helmLoad:Boolean = true;
        private var hairLoad:Boolean = true;
        private var capeLoad:Boolean = true;
        private var testMC:*;
        private var topIndex:int = 0;

        private var objLinks:Object = {};
        private var heavyAssets:Array = [];
        private var totalTransform:Object = {
            "alphaMultiplier":1,
            "alphaOffset":0,
            "redMultiplier":1,
            "redOffset":0,
            "greenMultiplier":1,
            "greenOffset":0,
            "blueMultiplier":1,
            "blueOffset":0
        };
        private var clampedTransform:ColorTransform = new ColorTransform();
        private var animQueue:Array = [];
        public var spFX:Object = {};
        public var defaultCT:ColorTransform = MovieClip(this).transform.colorTransform;
        public var CT3:ColorTransform = new ColorTransform(1, 1, 1, 1, 0xFF, 0xFF, 0xFF, 0);
        public var CT2:ColorTransform = new ColorTransform(1, 1, 1, 1, 127, 127, 127, 0);
        public var CT1:ColorTransform = new ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
        private const NEGA_MAX_RATIO:Number = -(MAX_RATIO);
        private var r:int = (Math.random() * int.MAX_VALUE);
        private var animEvents:Object = new Object();
        private var mcOrder:Object = new Object();

        public function AvatarMC():void
        {
            addFrameScript(0, frame1, 4, frame5, 7, frame8, 9, frame10, 11, frame12, 12, frame13, 13, frame14, 17, frame18, 19, frame20, 22, frame23);		
			var gameClass = Game.root;
			// load avatar file
			var character:* = (gameClass.assetsDomain.getDefinition("Skeleton") as Class);
            mcChar = MovieClip(addChildAt(new (character)(), 1));
			//mcChar.x = -2;
			// load emoji file
			var emoji:* = (gameClass.assetsDomain.getDefinition("Kerubi") as Class);
            mcEmoticon = MovieClip(this.addChildAt(new (emoji)(), 1));
			// vars
			Sounds.visible = false;
            ignore.visible = false;
			mcEmoticon.visible = false
			mcEmoticon.mouseEnabled = false;
            mcEmoticon.mouseChildren = false;
            mcChar.addEventListener(MouseEvent.CLICK, onClickHandler);
            mcChar.buttonMode = true;
            mcChar.pvpFlag.mouseEnabled = false;
            mcChar.pvpFlag.mouseChildren = false;
			mcChar.vertigoMC.mouseEnabled = false;
            mcChar.vertigoMC.mouseChildren = false;
			mcChar.blindMC.mouseEnabled = false;
            mcChar.blindMC.mouseChildren = false;
			mcChar.AuraFX.mouseEnabled = false;
            mcChar.AuraFX.mouseChildren = false;
			mcChar.AuraFX.visible = false;
			mcChar.silenceMC.mouseEnabled = false;
            mcChar.silenceMC.mouseChildren = false;
            pname.mouseChildren = false;
            pname.buttonMode = false;
            mcChar.mouseChildren = true;
            bubble.mouseEnabled = (bubble.mouseChildren = false);
            shadow.mouseEnabled = (shadow.mouseChildren = false);
            this.addEventListener(Event.ENTER_FRAME, checkQueue, false, 0, true);
            bubble.visible = false;
            bubble.t = "";
            pname.ti.text = "";
            headPoint = new Point(0, (this.mcChar.head.y - (1.4 * this.mcChar.head.height)));
            hideOptionalParts();
        }

        public function fClose():void
        {
            if (pAV != null)
            {
                pAV.unloadPet();
                if (pAV == world.myAvatar)
                {
                    world.setTarget(null);
                }
                else
                {
                    pAV.target = null;
                };
                pAV.pMC = null;
                pAV = null;
            };
            recursiveStop(this);
            world = MovieClip(stage.getChildAt(0)).world;
            mcChar.removeEventListener(MouseEvent.CLICK, onClickHandler);
            pname.removeEventListener(MouseEvent.CLICK, onClickHandler);
            this.removeEventListener(Event.ENTER_FRAME, onEnterFrameWalk);
            this.removeEventListener(Event.ENTER_FRAME, checkQueue);
            if (world.CHARS.contains(this))
            {
                world.CHARS.removeChild(this);
            };
            if (world.TRASH.contains(this))
            {
                world.TRASH.removeChild(this);
            };
            try
            {
                if (getChildByName("HealIconMC") != null)
                {
                    MovieClip(getChildByName("HealIconMC")).fClose();
                };
            }
            catch(e:Error)
            {
            };
            while (fx.numChildren > 0)
            {
                fx.removeChildAt(0);
            };
        }

        override public function gotoAndPlay(_arg_1:Object, _arg_2:String=null):void
        {
            handleAnimEvent(String(_arg_1));
            super.gotoAndPlay(_arg_1);
        }

        public function disablePNameMouse():void
        {
            mouseEnabled = false;
            pname.mouseEnabled = false;
            pname.mouseChildren = false;
            pname.removeEventListener(MouseEvent.CLICK, onClickHandler);
        }

        public function hasLabel(_arg_1:String):Boolean
        {
            var _local_2:Array = mcChar.currentLabels;
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                if (_local_2[_local_3].name == _arg_1)
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        private function recursiveStop(_arg_1:MovieClip):void
        {
            var _local_3:DisplayObject;
            var _local_2:int;
            while (_local_2 < _arg_1.numChildren)
            {
                _local_3 = _arg_1.getChildAt(_local_2);
                if ((_local_3 is MovieClip))
                {
                    MovieClip(_local_3).stop();
                    recursiveStop(MovieClip(_local_3));
                };
                _local_2++;
            };
        }

        public function showHPBar():void
        {
            this.hpBar.y = (this.pname.y - 3);
            this.hpBar.visible = true;
            updateHPBar();
        }

        public function hideHPBar():void
        {
            this.hpBar.visible = false;
        }

        public function updateHPBar():void
        {
            var _local_3:Object;
            var _local_1:MovieClip = (this.hpBar.g as MovieClip);
            var _local_2:MovieClip = (this.hpBar.r as MovieClip);
            if (this.hpBar.visible)
            {
                _local_3 = this.pAV.dataLeaf;
                if (((!(_local_3 == null)) && (!(_local_3.intHP == null))))
                {
                    _local_1.visible = true;
                    _local_1.width = Math.round(((_local_3.intHP / _local_3.intHPMax) * _local_2.width));
                    if (_local_3.intHP < 1)
                    {
                        _local_1.visible = false;
                    };
                };
            };
        }

        public function updateName():void
        {
            var uoLeaf:* = world.uoTree[pAV.pnm];
            if (uoLeaf == null)
            {
                uoLeaf = world.uoTree[pAV.pnm.toLowerCase()];
            };
            try
            {
                if (uoLeaf.afk)
                {
                    pname.ti.text = ("<AFK> " + pAV.objData.strUsername);
                }
                else
                {
                    pname.ti.text = pAV.objData.strUsername;
                };
                trace(("guild: " + pAV.objData.guild));
                if (pAV.objData.guild != null)
                {
                    pname.tg.text = (("< " + String(pAV.objData.guild.Name)) + " >");
                };
            }
            catch(e:Error)
            {
                trace(("error on set name: " + e));
            };
        }

        private function hideOptionalParts():void
        {
            var _local_1:* = ["cape", "Wings", "gloves", "scarf", "aura", "backhair", "robe", "neck", "backrobe", "pvpFlag", "vertigoMC", "silenceMC", "blindMC"];
            var _local_2:* = ["weapon", "weaponOff", "weaponFist", "weaponFistOff", "shield"];
            var _local_3:* = "";
            for (_local_3 in _local_1)
            {
                if (typeof(mcChar[_local_1[_local_3]]) != undefined)
                {
                    mcChar[_local_1[_local_3]].visible = false;
                };
            };
            for (_local_3 in _local_2)
            {
                if (typeof(mcChar[_local_2[_local_3]]) != undefined)
                {
                    mcChar[_local_2[_local_3]].visible = false;
                };
            };
        }

        private function onClickHandler(_arg_1:MouseEvent):void
        {
            world = (MovieClip(stage.getChildAt(0)).world as MovieClip);
            var _local_2:Avatar = _arg_1.currentTarget.parent.pAV;
            if (_arg_1.shiftKey)
            {
                world.onWalkClick();
            }
            else
            {
                if (!_arg_1.ctrlKey)
                {
                    if (((((!(_local_2 == world.myAvatar)) && (world.bPvP)) && (!(_local_2.dataLeaf.pvpTeam == world.myAvatar.dataLeaf.pvpTeam))) && (_local_2 == world.myAvatar.target)))
                    {
                        world.approachTarget();
                    }
                    else
                    {
                        if (_local_2 != world.myAvatar.target)
                        {
                            world.setTarget(_local_2);
                        };
                    };
                };
            };
        }

        public function loadClass(_arg_1:String, _arg_2:String):void
        {
            if (pAV.objData.eqp.co == null)
            {
                classLoad = false;
                trace("** PMC loadClass >");
                world.queueLoad({
                    "strFile":((((world.rootClass.getFilePath() + "classes/") + strGender) + "/") + _arg_1),
                    "callBackA":onLoadClassComplete,
                    "callBackB":ioErrorHandler,
                    "avt":pAV,
                    "sES":"ar"
                });
            };
        }

        public function onLoadClassComplete(_arg_1:Event):void
        {
            trace(("** PMC onLoadClassComplete >" + pAV.objData.eqp.ar.sLink));
            classLoad = true;
            if (((pAV.isMyAvatar) && (pAV.FirstLoad)))
            {
                pAV.updateLoaded();
                if (pAV.LoadCount <= 0)
                {
                    pAV.firstDone();
                    world.rootClass.showTracking("7");
                    world.rootClass.chatF.pushMsg("server", "Personagem carregado com sucesso.", "SERVER", "", 0);
                };
            };
            trace(("on avatar load, rootClass: " + rootClass));
            if (pAV.objData.eqp.co == null)
            {
                loadArmorPieces(pAV.objData.eqp.ar.sLink);
            };
        }

        public function loadArmor(_arg_1:String, _arg_2:String):void
        {
            trace("** PMC loadArmor >");
            objLinks.co = _arg_2;
            armorLoad = false;
            world.queueLoad({
                "strFile":((((world.rootClass.getFilePath() + "classes/") + strGender) + "/") + _arg_1),
                "callBackA":onLoadArmorComplete,
                "callBackB":ioErrorHandler,
                "avt":pAV,
                "sES":"ar"
            });
        }

        public function onLoadArmorComplete(_arg_1:Event):void
        {
            trace(("** PMC onLoadArmorComplete >" + objLinks.co));
            armorLoad = true;
            if (((pAV.isMyAvatar) && (pAV.FirstLoad)))
            {
                pAV.updateLoaded();
                if (pAV.LoadCount <= 0)
                {
                    pAV.firstDone();
                    world.rootClass.showTracking("7");
                    world.rootClass.chatF.pushMsg("server", "Personagem carregado com sucesso.", "SERVER", "", 0);
                };
            };
            loadArmorPieces(objLinks.co);
            if (this.name.indexOf("previewMCB") > -1)
            {
                MovieClip(parent.parent).repositionPreview(MovieClip(mcChar));
            };
        }

        public function ioErrorHandler(_arg_1:IOErrorEvent):void
        {
            trace(("ioErrorHandler: " + _arg_1));
        }

        public function loadArmorPieces(strSkinLinkage:String):void
        {
            var AssetClass:Class;
            var child:DisplayObject;
            trace(">>>>>>>>>>>> loadArmorPieces");
            try
            {
                AssetClass = (world.getClass(((strSkinLinkage + strGender) + "Head")) as Class);
                child = mcChar.head.getChildByName("face");
                if (child != null)
                {
                    mcChar.head.removeChild(child);
                };
                testMC = mcChar.head.addChildAt(new (AssetClass)(), 0);
                testMC.name = "face";
            }
            catch(err:Error)
            {
                AssetClass = (world.getClass(("mcHead" + strGender)) as Class);
                child = mcChar.head.getChildByName("face");
                if (child != null)
                {
                    mcChar.head.removeChild(child);
                };
                testMC = mcChar.head.addChildAt(new (AssetClass)(), 0);
                testMC.name = "face";
            };
            if (pAV == world.myAvatar)
            {
                world.rootClass.showPortrait(pAV);
            }
            else
            {
                if (pAV == world.myAvatar.target)
                {
                    world.rootClass.showPortraitTarget(pAV);
                };
            };
            try
            {
                AssetClass = (world.getClass(strSkinLinkage + strGender + "Chest") as Class);
                mcChar.trunk.removeChildAt(0);
                mcChar.trunk.addChild(new (AssetClass)());
            }
            catch(e:Error)
            {
            };
            try
            {
                AssetClass = (world.getClass(((strSkinLinkage + strGender) + "Hip")) as Class);
                mcChar.hip.removeChildAt(0);
                mcChar.hip.addChild(new (AssetClass)());
            }
            catch(e:Error)
            {
            };
            try
            {
                AssetClass = (world.getClass(((strSkinLinkage + strGender) + "FootIdle")) as Class);
                mcChar.idlefoot.removeChildAt(0);
                mcChar.idlefoot.addChild(new (AssetClass)());
            }
            catch(e:Error)
            {
            };
            try
            {
                AssetClass = (world.getClass(((strSkinLinkage + strGender) + "Foot")) as Class);
                mcChar.frontfoot.removeChildAt(0);
                mcChar.frontfoot.addChild(new (AssetClass)());
                mcChar.frontfoot.visible = false;
                mcChar.backfoot.removeChildAt(0);
                mcChar.backfoot.addChild(new (AssetClass)());
            }
            catch(e:Error)
            {
            };
            try
            {
                AssetClass = (world.getClass(((strSkinLinkage + strGender) + "Shoulder")) as Class);
                mcChar.frontshoulder.removeChildAt(0);
                mcChar.frontshoulder.addChild(new (AssetClass)());
                mcChar.backshoulder.removeChildAt(0);
                mcChar.backshoulder.addChild(new (AssetClass)());
            }
            catch(e:Error)
            {
            };
            try
            {
                AssetClass = (world.getClass(((strSkinLinkage + strGender) + "Hand")) as Class);
                mcChar.fronthand.removeChildAt(0);
                mcChar.fronthand.addChild(new (AssetClass)());
                mcChar.backhand.removeChildAt(0);
                mcChar.backhand.addChild(new (AssetClass)());
            }
            catch(e:Error)
            {
            };
            AssetClass = (world.getClass(((strSkinLinkage + strGender) + "Ground")) as Class);
            if (AssetClass != null)
            {
                this.shadow.removeChildAt(0);
                this.shadow.addChild(new (AssetClass)());
                this.shadow.alpha = 1;
                this.shadow.scaleX = 0.7;
                this.shadow.scaleY = 0.7;
                this.shadow.scaleX = (this.shadow.scaleX * -1);
            }
            else
            {
                this.shadow.removeChildAt(0);
                AssetClass = (world.getClass("mcShadow") as Class);
                this.shadow.addChild(new (AssetClass)());
                this.shadow.scaleX = 1;
                this.shadow.scaleY = 1;
            };
            try
            {
                AssetClass = (world.getClass(((strSkinLinkage + strGender) + "Thigh")) as Class);
                mcChar.frontthigh.removeChildAt(0);
                mcChar.frontthigh.addChild(new (AssetClass)());
                mcChar.backthigh.removeChildAt(0);
                mcChar.backthigh.addChild(new (AssetClass)());
            }
            catch(e:Error)
            {
            };
            try
            {
                AssetClass = (world.getClass(((strSkinLinkage + strGender) + "Shin")) as Class);
                mcChar.frontshin.removeChildAt(0);
                mcChar.frontshin.addChild(new (AssetClass)());
                mcChar.backshin.removeChildAt(0);
                mcChar.backshin.addChild(new (AssetClass)());
            }
            catch(e:Error)
            {
            };
            AssetClass = (world.getClass(((strSkinLinkage + strGender) + "Robe")) as Class);
            if (AssetClass != null)
            {
                mcChar.robe.removeChildAt(0);
                mcChar.robe.addChild(new (AssetClass)());
                mcChar.robe.visible = true;
            }
            else
            {
                mcChar.robe.visible = false;
            };
            AssetClass = (world.getClass(((strSkinLinkage + strGender) + "RobeBack")) as Class);
            if (AssetClass != null)
            {
                mcChar.backrobe.removeChildAt(0);
                mcChar.backrobe.addChild(new (AssetClass)());
                mcChar.backrobe.visible = true;
            }
            else
            {
                mcChar.backrobe.visible = false;
            };
            gotoAndPlay("in1");
            isLoaded = true;
        }

        public function loadArmorPiecesFromDomain(strSkinLinkage:String, pLoaderD:ApplicationDomain):void
        {
            var AssetClass:Class;
            var child:DisplayObject;
            trace((">>>>>>>>>>>> loadArmorPiecesFromDomain > " + strSkinLinkage));
            try
            {
                AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + strGender) + "Head")) as Class);
                child = mcChar.head.getChildByName("face");
                if (child != null)
                {
                    mcChar.head.removeChild(child);
                };
                testMC = mcChar.head.addChildAt(new (AssetClass)(), 0);
                testMC.name = "face";
            }
            catch(err:Error)
            {
                AssetClass = (pLoaderD.getDefinition(("mcHead" + strGender)) as Class);
                child = mcChar.head.getChildByName("face");
                if (child != null)
                {
                    mcChar.head.removeChild(child);
                };
                testMC = mcChar.head.addChildAt(new (AssetClass)(), 0);
                testMC.name = "face";
            };
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + strGender) + "Chest")) as Class);
            mcChar.trunk.removeChildAt(0);
            mcChar.trunk.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + strGender) + "Hip")) as Class);
            mcChar.hip.removeChildAt(0);
            mcChar.hip.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + strGender) + "FootIdle")) as Class);
            mcChar.idlefoot.removeChildAt(0);
            mcChar.idlefoot.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + strGender) + "Foot")) as Class);
            mcChar.frontfoot.removeChildAt(0);
            mcChar.frontfoot.addChild(new (AssetClass)());
            mcChar.frontfoot.visible = false;
            mcChar.backfoot.removeChildAt(0);
            mcChar.backfoot.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + strGender) + "Shoulder")) as Class);
            mcChar.frontshoulder.removeChildAt(0);
            mcChar.frontshoulder.addChild(new (AssetClass)());
            mcChar.backshoulder.removeChildAt(0);
            mcChar.backshoulder.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + strGender) + "Hand")) as Class);
            mcChar.fronthand.removeChildAt(0);
            mcChar.fronthand.addChild(new (AssetClass)());
            mcChar.backhand.removeChildAt(0);
            mcChar.backhand.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + strGender) + "Thigh")) as Class);
            mcChar.frontthigh.removeChildAt(0);
            mcChar.frontthigh.addChild(new (AssetClass)());
            mcChar.backthigh.removeChildAt(0);
            mcChar.backthigh.addChild(new (AssetClass)());
            AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + strGender) + "Shin")) as Class);
            mcChar.frontshin.removeChildAt(0);
            mcChar.frontshin.addChild(new (AssetClass)());
            mcChar.backshin.removeChildAt(0);
            mcChar.backshin.addChild(new (AssetClass)());
            try
            {
                AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + strGender) + "Robe")) as Class);
                if (AssetClass != null)
                {
                    mcChar.robe.removeChildAt(0);
                    mcChar.robe.addChild(new (AssetClass)());
                    mcChar.robe.visible = true;
                }
                else
                {
                    mcChar.robe.visible = false;
                };
            }
            catch(e:Error)
            {
                mcChar.robe.visible = false;
            };
            try
            {
                AssetClass = (pLoaderD.getDefinition(((strSkinLinkage + strGender) + "RobeBack")) as Class);
                if (AssetClass != null)
                {
                    mcChar.backrobe.removeChildAt(0);
                    mcChar.backrobe.addChild(new (AssetClass)());
                    mcChar.backrobe.visible = true;
                }
                else
                {
                    mcChar.backrobe.visible = false;
                };
            }
            catch(e:Error)
            {
                mcChar.backrobe.visible = false;
            };
            gotoAndPlay("in1");
            isLoaded = true;
        }

        public function loadHair():void
        {
            trace("pMC.loadHair >");
            var _local_1:* = pAV.objData.strHairFilename;
            if (((((_local_1 == undefined) || (_local_1 == null)) || (_local_1 == "")) || (_local_1 == "none")))
            {
                mcChar.head.hair.visible = false;
                return;
            };
            hairLoad = false;
            world.queueLoad({
                "strFile":(world.rootClass.getFilePath() + _local_1),
                "callBackA":onHairLoadComplete,
                "avt":pAV,
                "sES":"hair"
            });
        }

        public function onHairLoadComplete(_arg_1:Event):void
        {
            var _local_2:Class;
            trace("onHairLoadComplete >");
            hairLoad = true;
            if (((pAV.isMyAvatar) && (pAV.FirstLoad)))
            {
                pAV.updateLoaded();
                if (pAV.LoadCount <= 0)
                {
                    pAV.firstDone();
                    world.rootClass.showTracking("7");
                    world.rootClass.chatF.pushMsg("server", "Personagem carregado com sucesso.", "SERVER", "", 0);
                };
            };
            try
            {
                trace(("hair linkage: " + ((pAV.objData.strHairName + pAV.objData.strGender) + "Hair")));
                _local_2 = (world.getClass(((pAV.objData.strHairName + pAV.objData.strGender) + "Hair")) as Class);
                if (_local_2 != null)
                {
                    if (mcChar.head.hair.numChildren > 0)
                    {
                        mcChar.head.hair.removeChildAt(0);
                    };
                    mcChar.head.hair.addChild(new (_local_2)());
                    mcChar.head.hair.visible = true;
                }
                else
                {
                    mcChar.head.hair.visible = false;
                };
                _local_2 = (world.getClass(((pAV.objData.strHairName + pAV.objData.strGender) + "HairBack")) as Class);
                if (_local_2 != null)
                {
                    if (mcChar.backhair.numChildren > 0)
                    {
                        mcChar.backhair.removeChildAt(0);
                    };
                    mcChar.backhair.addChild(new (_local_2)());
                    mcChar.backhair.visible = true;
                    bBackHair = true;
                }
                else
                {
                    mcChar.backhair.visible = false;
                    bBackHair = false;
                };
                if ((((pAV.isMyAvatar) && (!(MovieClip(parent.parent.parent).ui.mcPortrait.visible))) && (!(bLoadingHelm))))
                {
                    world.rootClass.showPortrait(pAV);
                };
                if ((("he" in pAV.objData.eqp) && (!(pAV.objData.eqp.he == null))))
                {
                    if (pAV.dataLeaf.showHelm)
                    {
                        mcChar.head.hair.visible = false;
                    }
                    else
                    {
                        mcChar.head.hair.visible = true;
                    };
                };
            }
            catch(e:Error)
            {
            };
        }

        public function loadWeapon(_arg_1:*, _arg_2:*):void
        {
            weaponLoad = false;
            world.queueLoad({
                "strFile":(world.rootClass.getFilePath() + _arg_1),
                "callBackA":onLoadWeaponComplete,
                "avt":pAV,
                "sES":"weapon"
            });
        }

        public function onLoadWeaponComplete(e:Event):void
        {
            var AssetClass:Class;
            trace("onLoadWeaponComplete >");
            weaponLoad = true;
            if (((pAV.isMyAvatar) && (pAV.FirstLoad)))
            {
                pAV.updateLoaded();
                if (pAV.LoadCount <= 0)
                {
                    pAV.firstDone();
                    world.rootClass.showTracking("7");
                    world.rootClass.chatF.pushMsg("server", "Personagem carregado com sucesso.", "SERVER", "", 0);
                };
            };
            mcChar.weapon.removeChildAt(0);
            try
            {
                AssetClass = (world.getClass(pAV.objData.eqp.Weapon.sLink) as Class);
                mcChar.weapon.mcWeapon = new (AssetClass)();
                mcChar.weapon.addChild(mcChar.weapon.mcWeapon);
            }
            catch(err:Error)
            {
                trace(" Weapon added to display list manually");
                mcChar.weapon.mcWeapon = MovieClip(e.target.content);
                mcChar.weapon.addChild(mcChar.weapon.mcWeapon);
            };
            mcChar.weapon.visible = true;
            mcChar.weaponOff.visible = false;
            var wItem:Object = pAV.getItemByEquipSlot("Weapon");
            if (((!(wItem == null)) && (!(wItem.sType == null))))
            {
                if (wItem.sType == "Dagger" || wItem.sType == "Claw")
                {
                    loadWeaponOff(pAV.objData.eqp.Weapon.sFile, pAV.objData.eqp.Weapon.sLink);
                };
            };
        }

        public function loadWeaponOff(_arg_1:*, _arg_2:*):void
        {
            weaponLoad = false;
            world.queueLoad({
                "strFile":(world.rootClass.getFilePath() + _arg_1),
                "callBackA":onLoadWeaponOffComplete,
                "avt":pAV,
                "sES":"weapon"
            });
        }

        public function onLoadWeaponOffComplete(e:Event):void
        {
            var AssetClass:Class;
            trace("onLoadWeaponOffComplete >");
            weaponLoad = true;
            if (((pAV.isMyAvatar) && (pAV.FirstLoad)))
            {
                pAV.updateLoaded();
                if (pAV.LoadCount <= 0)
                {
                    pAV.firstDone();
                    world.rootClass.showTracking("7");
                    world.rootClass.chatF.pushMsg("server", "Personagem carregado com sucesso.", "SERVER", "", 0);
                };
            };
            mcChar.weaponOff.removeChildAt(0);
            try
            {
                AssetClass = (world.getClass(pAV.objData.eqp.Weapon.sLink) as Class);
                mcChar.weaponOff.addChild(new (AssetClass)());
            }
            catch(err:Error)
            {
                trace(" weaponOff added to display list manually");
                mcChar.weaponOff.addChild(e.target.content);
            };
            mcChar.weaponOff.visible = true;
        }
		
		public function loadShield(_arg_1:*, _arg_2:*):void
        {
            shieldLoad = false;
            world.queueLoad({
                "strFile":(world.rootClass.getFilePath() + _arg_1),
                "callBackA":onLoadShieldComplete,
                "avt:this":pAV,
                "sES":"sh"
            });
        }

        public function onLoadShieldComplete(e:Event):void
        {
            var AssetClass:Class;
            trace("onLoadWeaponOffComplete >");
            shieldLoad = true;
            if (pAV.isMyAvatar && pAV.FirstLoad)
            {
                pAV.updateLoaded();
                if (pAV.LoadCount <= 0)
                {
                    pAV.firstDone();
                    world.rootClass.showTracking("7");
                    world.rootClass.chatF.pushMsg("server", "Personagem carregado com sucesso.", "SERVER", "", 0);
                };
            };
            mcChar.shield.removeChildAt(0);
            try
            {
                AssetClass = (world.getClass(pAV.objData.eqp.sh.sLink) as Class);
                mcChar.shield.mcShield = new (AssetClass)();
                mcChar.shield.addChild(mcChar.shield.mcShield);
            }
            catch(err:Error)
            {
                mcChar.shield.addChild(e.target.content);
            };
            mcChar.shield.visible = true;
        }
		
		public function loadNecklace(_arg_1:*, _arg_2:*):void
        {
            necklaceLoad = false;
            world.queueLoad({
                "strFile":(world.rootClass.getFilePath() + _arg_1),
                "callBackA":onLoadNecklaceComplete,
                "avt:this":pAV,
                "sES":"neck"
            });
        }
		
		public function onLoadNecklaceComplete(e:Event):void
        {
            var AssetClass:Class;
            trace("onLoadNecklaceComplete >");
            necklaceLoad = true;
            if (pAV.isMyAvatar && pAV.FirstLoad)
            {
                pAV.updateLoaded();
                if (pAV.LoadCount <= 0)
                {
                    pAV.firstDone();
                    world.rootClass.showTracking("7");
                    world.rootClass.chatF.pushMsg("server", "Personagem carregado com sucesso.", "SERVER", "", 0);
                };
            };
            mcChar.neck.removeChildAt(0);
            try
            {
                AssetClass = (world.getClass(pAV.objData.eqp.am.sLink) as Class);
				mcChar.neck.mcNecklace = new (AssetClass)();
                mcChar.neck.addChild(mcChar.neck.mcNecklace);
				mcChar.neck.visible = true;
            }
            catch(err:Error)
            {
            };
        }
		
        public function loadCape(_arg_1:*, _arg_2:*):void
        {
            capeLoad = false;
            world.queueLoad({
                "strFile":(world.rootClass.getFilePath() + _arg_1),
                "callBackA":onLoadCapeComplete,
                "avt":pAV,
                "sES":"cape"
            });
        }

        public function onLoadCapeComplete(_arg_1:Event):void
        {
            var _local_2:Class;
            capeLoad = true;
            if (((pAV.isMyAvatar) && (pAV.FirstLoad)))
            {
                pAV.updateLoaded();
                if (pAV.LoadCount <= 0)
                {
                    pAV.firstDone();
                    world.rootClass.showTracking("7");
                    world.rootClass.chatF.pushMsg("server", "Personagem carregado com sucesso.", "SERVER", "", 0);
                };
            };
            try
            {
                _local_2 = (world.getClass(pAV.objData.eqp.ba.sLink) as Class);
                mcChar.cape.removeChildAt(0);
                mcChar.cape.cape = new (_local_2)();
                mcChar.cape.addChild(mcChar.cape.cape);
                setCloakVisibility(pAV.dataLeaf.showCloak);
            }
            catch(e)
            {
            };
        }

        public function loadHelm(_arg_1:*, _arg_2:*):void
        {
            trace("pMC.loadHelm >");
            helmLoad = false;
            world.queueLoad({
                "strFile":(world.rootClass.getFilePath() + _arg_1),
                "callBackA":onLoadHelmComplete,
                "avt":pAV,
                "sES":"helm"
            });
            bLoadingHelm = true;
        }

        public function onLoadHelmComplete(_arg_1:Event):void
        {
            trace("pMC.onLoadHelmComplete >");
            helmLoad = true;
            if (((pAV.isMyAvatar) && (pAV.FirstLoad)))
            {
                pAV.updateLoaded();
                if (pAV.LoadCount <= 0)
                {
                    pAV.firstDone();
                    world.rootClass.showTracking("7");
                    world.rootClass.chatF.pushMsg("server", "Personagem carregado com sucesso.", "SERVER", "", 0);
                };
            };
            var _local_2:Class = (world.getClass(pAV.objData.eqp.he.sLink) as Class);
            var _local_3:Class = (world.getClass((pAV.objData.eqp.he.sLink + "_backhair")) as Class);
            if (_local_2 != null)
            {
                if (mcChar.head.helm.numChildren > 0)
                {
                    mcChar.head.helm.removeChildAt(0);
                };
                mcChar.head.helm.visible = pAV.dataLeaf.showHelm;
                mcChar.head.hair.visible = (!(mcChar.head.helm.visible));
                if (_local_3 != null)
                {
                    if (pAV.dataLeaf.showHelm)
                    {
                        if (mcChar.backhair.numChildren > 0)
                        {
                            mcChar.backhair.removeChildAt(0);
                        };
                        mcChar.backhair.visible = true;
                        mcChar.backhair.addChild(new (_local_3)());
                    };
                }
                else
                {
                    mcChar.backhair.visible = ((mcChar.head.hair.visible) && (bBackHair));
                };
                mcChar.head.helm.addChild(new (_local_2)());
                if (pAV == world.myAvatar)
                {
                    world.rootClass.showPortrait(pAV);
                };
                if (pAV == world.myAvatar.target)
                {
                    world.rootClass.showPortraitTarget(pAV);
                };
            };
            bLoadingHelm = false;
        }

        public function setHelmVisibility(_arg_1:Boolean):void
        {
            trace(("setHelmVisibility > " + _arg_1));
            if (((!(pAV.objData.eqp.he == null)) && (!(pAV.objData.eqp.he.sLink == null))))
            {
                if (_arg_1)
                {
                    mcChar.head.helm.visible = true;
                    mcChar.head.hair.visible = false;
                    mcChar.backhair.visible = false;
                }
                else
                {
                    mcChar.head.helm.visible = false;
                    mcChar.head.hair.visible = true;
                    mcChar.backhair.visible = bBackHair;
                };
                if (pAV == world.myAvatar)
                {
                    world.rootClass.showPortrait(pAV);
                };
                if (pAV == world.myAvatar.target)
                {
                    world.rootClass.showPortraitTarget(pAV);
                };
            };
        }

        public function setCloakVisibility(_arg_1:Boolean):void
        {
            trace(("setCloakVisibility > " + _arg_1));
            if (((!(pAV.objData.eqp.ba == null)) && (!(pAV.objData.eqp.ba.sLink == null))))
            {
                if (pAV.isMyAvatar)
                {
                    mcChar.cape.visible = _arg_1;
                }
                else
                {
                    mcChar.cape.visible = ((_arg_1) && (!(world.hideAllCapes)));
                };
            };
        }

        public function setColor(_arg_1:MovieClip, _arg_2:String, _arg_3:String, _arg_4:String):void
        {
            var _local_5:Number = Number(pAV.objData[("intColor" + _arg_3)]);
            _arg_1.isColored = true;
            _arg_1.intColor = _local_5;
            _arg_1.strLocation = _arg_3;
            _arg_1.strShade = _arg_4;
            changeColor(_arg_1, _local_5, _arg_4);
        }

        public function changeColor(_arg_1:MovieClip, _arg_2:Number, _arg_3:String, _arg_4:String=""):void
        {
            var _local_5:ColorTransform = new ColorTransform();
            if (_arg_4 == "")
            {
                _local_5.color = _arg_2;
            };
            switch (_arg_3.toUpperCase())
            {
                case "LIGHT":
                    _local_5.redOffset = (_local_5.redOffset + 100);
                    _local_5.greenOffset = (_local_5.greenOffset + 100);
                    _local_5.blueOffset = (_local_5.blueOffset + 100);
                    break;
                case "DARK":
                    _local_5.redOffset = (_local_5.redOffset - 25);
                    _local_5.greenOffset = (_local_5.greenOffset - 50);
                    _local_5.blueOffset = (_local_5.blueOffset - 50);
                    break;
                case "DARKER":
                    _local_5.redOffset = (_local_5.redOffset - 125);
                    _local_5.greenOffset = (_local_5.greenOffset - 125);
                    _local_5.blueOffset = (_local_5.blueOffset - 125);
                    break;
            };
            if (_arg_4 == "-")
            {
                _local_5.redOffset = (_local_5.redOffset * -1);
                _local_5.greenOffset = (_local_5.greenOffset * -1);
                _local_5.blueOffset = (_local_5.blueOffset * -1);
            };
            if (((_arg_4 == "") || (!(_arg_1.transform.colorTransform.redOffset == _local_5.redOffset))))
            {
                _arg_1.transform.colorTransform = _local_5;
            };
        }

        public function modulateColor(_arg_1:ColorTransform, _arg_2:String):void
        {
            var _local_3:MovieClip = (this.stage.getChildAt(0) as MovieClip);
            if (_arg_2 == "+")
            {
                totalTransform.alphaMultiplier = (totalTransform.alphaMultiplier + _arg_1.alphaMultiplier);
                totalTransform.alphaOffset = (totalTransform.alphaOffset + _arg_1.alphaOffset);
                totalTransform.redMultiplier = (totalTransform.redMultiplier + _arg_1.redMultiplier);
                totalTransform.redOffset = (totalTransform.redOffset + _arg_1.redOffset);
                totalTransform.greenMultiplier = (totalTransform.greenMultiplier + _arg_1.greenMultiplier);
                totalTransform.greenOffset = (totalTransform.greenOffset + _arg_1.greenOffset);
                totalTransform.blueMultiplier = (totalTransform.blueMultiplier + _arg_1.blueMultiplier);
                totalTransform.blueOffset = (totalTransform.blueOffset + _arg_1.blueOffset);
            }
            else
            {
                if (_arg_2 == "-")
                {
                    totalTransform.alphaMultiplier = (totalTransform.alphaMultiplier - _arg_1.alphaMultiplier);
                    totalTransform.alphaOffset = (totalTransform.alphaOffset - _arg_1.alphaOffset);
                    totalTransform.redMultiplier = (totalTransform.redMultiplier - _arg_1.redMultiplier);
                    totalTransform.redOffset = (totalTransform.redOffset - _arg_1.redOffset);
                    totalTransform.greenMultiplier = (totalTransform.greenMultiplier - _arg_1.greenMultiplier);
                    totalTransform.greenOffset = (totalTransform.greenOffset - _arg_1.greenOffset);
                    totalTransform.blueMultiplier = (totalTransform.blueMultiplier - _arg_1.blueMultiplier);
                    totalTransform.blueOffset = (totalTransform.blueOffset - _arg_1.blueOffset);
                };
            };
            clampedTransform.alphaMultiplier = _local_3.clamp(totalTransform.alphaMultiplier, -1, 1);
            clampedTransform.alphaOffset = _local_3.clamp(totalTransform.alphaOffset, -255, 0xFF);
            clampedTransform.redMultiplier = _local_3.clamp(totalTransform.redMultiplier, -1, 1);
            clampedTransform.redOffset = _local_3.clamp(totalTransform.redOffset, -255, 0xFF);
            clampedTransform.greenMultiplier = _local_3.clamp(totalTransform.greenMultiplier, -1, 1);
            clampedTransform.greenOffset = _local_3.clamp(totalTransform.greenOffset, -255, 0xFF);
            clampedTransform.blueMultiplier = _local_3.clamp(totalTransform.blueMultiplier, -1, 1);
            clampedTransform.blueOffset = _local_3.clamp(totalTransform.blueOffset, -255, 0xFF);
            this.transform.colorTransform = clampedTransform;
        }

        public function updateColor(_arg_1:Object=null):*
        {
            var _local_2:* = pAV.objData;
            if (_arg_1 != null)
            {
                _local_2 = _arg_1;
            };
            var _local_3:* = MovieClip(stage.getChildAt(0)).ui;
            scanColor(this, _local_2);
            if ((((!(this.pAV == null)) && (!(_local_3.mcPortrait.pAV == null))) && (_local_3.mcPortrait.pAV == this.pAV)))
            {
                scanColor(_local_3.mcPortrait.mcHead, _local_2);
            };
            if ((((!(this.pAV == null)) && (!(_local_3.mcPortraitTarget.pAV == null))) && (_local_3.mcPortraitTarget.pAV == this.pAV)))
            {
                scanColor(_local_3.mcPortraitTarget.mcHead, _local_2);
            };
        }

        private function scanColor(_arg_1:MovieClip, _arg_2:*):void
        {
            var _local_4:DisplayObject;
            if (("isColored" in _arg_1))
            {
                changeColor(_arg_1, Number(_arg_2[("intColor" + _arg_1.strLocation)]), _arg_1.strShade);
            };
            var _local_3:int;
            while (_local_3 < _arg_1.numChildren)
            {
                _local_4 = _arg_1.getChildAt(_local_3);
                if ((_local_4 is MovieClip))
                {
                    scanColor(MovieClip(_local_4), _arg_2);
                };
                _local_3++;
            };
        }

        public function queueAnim(s:String):void
        {
            var petSplit:Array;
            var p:String;
            var pItem:Object;
            var wItem:Object;
            var sType:* = undefined;
            var world:MovieClip;
            var l:String;
            if ((((!(pAV.isMyAvatar)) && (!(world.showAnimations))) && (!(s == "Walk"))))
            {
                return;
            };
            if (s.indexOf("Pet") > -1)
            {
                pItem = pAV.getItemByEquipSlot("pe");
                if (s.indexOf(":") > -1)
                {
                    petSplit = s.split(":");
                    s = petSplit[0];
                    try
                    {
                        if (pItem != null)
                        {
                            if (petSplit[1] == "PetAttack")
                            {
                                p = ["Attack1", "Attack2"][Math.round((Math.random() * 1))];
                                if (pAV.petMC.mcChar.currentLabel == "Idle")
                                {
                                    pAV.petMC.mcChar.gotoAndPlay(p);
                                };
                            }
                            else
                            {
                                p = petSplit[1].slice(3);
                                if (pAV.petMC.mcChar.currentLabel == "Idle")
                                {
                                    pAV.petMC.mcChar.gotoAndPlay(p);
                                };
                            };
                        };
                    }
                    catch(e)
                    {
                    };
                }
                else
                {
                    if (pItem != null)
                    {
                        try
                        {
                            p = ["Attack1", "Attack2"][Math.round((Math.random() * 1))];
                            if (pAV.petMC.mcChar.currentLabel == "Idle")
                            {
                                pAV.petMC.mcChar.gotoAndPlay(p);
                            };
                            return;
                        }
                        catch(e)
                        {
                            s = ["Attack1", "Attack2"][Math.round((Math.random() * 1))];
                        };
                    }
                    else
                    {
                        s = ((s.indexOf("1") > -1) ? "Attack1" : "Attack2");
                    };
                };
            };
            if (((s == "Attack1") || (s == "Attack2")))
            {
                wItem = pAV.getItemByEquipSlot("Weapon");
                if (((!(wItem == null)) && (!(wItem.sType == null))))
                {
                    sType = wItem.sType;
                    if (wItem.ItemID == 1)
                    {
                        sType = "Unarmed";
                    };
					
					var sItem:Object = pAV.getItemByEquipSlot("sh");
					if (sItem != null)
					{
						sType = "Shield";
					}
					
                    switch (sType)
                    {
                        case "Unarmed":
                            s = ["UnarmedAttack1", "UnarmedAttack2", "KickAttack", "FlipAttack"][Math.round((Math.random() * 3))];
						break;
						case "Scythe":
						case "Spear":
                        case "Polearm":
                            s = ["PolearmAttack1", "PolearmAttack2"][Math.round((Math.random() * 1))];
						break;
                        case "Dagger":
                            s = ["DuelWield/DaggerAttack1", "DuelWield/DaggerAttack2"][Math.round((Math.random() * 1))];
						break;
                        case "Bow":
                            s = "RangedAttack1";
						break;
						case "Claw":
                        	s = ["FistweaponAttack1", "FistweaponAttack2"][Math.round((Math.random() * 1))];
                        	break;
                        case "Bow":
                            s = "RangedAttack1";
                            break;
						case "Gun":
                            s = "Gunattack2";
                            break;
						case "Shield":
                        	s = ["Sword/ShieldAttack1", "Sword/ShieldAttack2"][Math.round((Math.random() * 1))];
                        	break;
                    };
                };
            };
            if (((hasLabel(s)) && (pAV.dataLeaf.intState > 0)))
            {
                pAV.handleItemAnimation();
                world = (MovieClip(stage.getChildAt(0)).world as MovieClip);
                l = mcChar.currentLabel;
                if (((world.combatAnims.indexOf(s) > -1) && (world.combatAnims.indexOf(l) > -1)))
                {
                    animQueue.push(s);
                }
                else
                {
                    mcChar.gotoAndPlay(s);
                    if (((s.indexOf("Attack") >= 0) && (mcChar.weapon.mcWeapon.bAttack == true)))
                    {
                        mcChar.weapon.mcWeapon.gotoAndPlay("Attack");
                    };
                };
            };
        }

        private function checkQueue(_arg_1:Event):Boolean
        {
            var _local_2:MovieClip;
            var _local_3:String;
            var _local_4:int;
            var _local_5:*;
            if (animQueue.length > 0)
            {
                _local_2 = (MovieClip(stage.getChildAt(0)).world as MovieClip);
                _local_3 = mcChar.currentLabel;
                _local_4 = mcChar.emoteLoopFrame();
                if (((_local_2.combatAnims.indexOf(_local_3) > -1) && (mcChar.currentFrame > (_local_4 + 4))))
                {
                    _local_5 = animQueue[0];
                    mcChar.gotoAndPlay(_local_5);
                    if (((_local_5.indexOf("Attack") >= 0) && (mcChar.weapon.mcWeapon.bAttack == true)))
                    {
                        mcChar.weapon.mcWeapon.gotoAndPlay("Attack");
                    };
                    animQueue.shift();
                    return (true);
                };
            };
            return (false);
        }

        public function clearQueue():void
        {
            animQueue = [];
        }

        private function linearTween(_arg_1:*, _arg_2:*, _arg_3:*, _arg_4:*):Number
        {
            return (((_arg_3 * _arg_1) / _arg_4) + _arg_2);
        }

        public function walkTo(toX:int, toY:int, walkSpeed:int):void
        {
            var dist:Number;
            var dx:Number;
            var isOK:Boolean = true;
            try
            {
                STAGE = MovieClip(parent.parent);
            }
            catch(e:Error)
            {
                isOK = false;
            };
            if (isOK)
            {
                if (((!(pAV.petMC == null)) && (!(pAV.petMC.mcChar == null))))
                {
                    pAV.petMC.walkTo((toX - 20), (toY + 5), (walkSpeed - 3));
                };
                op = new Point(this.x, this.y);
                tp = new Point(toX, toY);
                this.walkSpeed = walkSpeed;
                dist = Point.distance(op, tp);
                walkTS = new Date().getTime();
                walkD = Math.round((1000 * (dist / (walkSpeed * 22))));
                if (walkD > 0)
                {
                    dx = (op.x - tp.x);
                    if (dx < 0)
                    {
                        this.turn("right");
                    }
                    else
                    {
                        this.turn("left");
                    };
                    if (!this.mcChar.onMove)
                    {
                        this.mcChar.onMove = true;
                        if (this.mcChar.currentLabel != "Walk")
                        {
                            this.mcChar.gotoAndPlay("Walk");
                        };
                    };
                    this.removeEventListener(Event.ENTER_FRAME, onEnterFrameWalk);
                    this.addEventListener(Event.ENTER_FRAME, onEnterFrameWalk);
                };
            };
        }

        private function onEnterFrameWalk(_arg_1:Event):void
        {
            var _local_4:*;
            var _local_5:*;
            var _local_6:Boolean;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:int;
            var _local_12:Boolean;
            var _local_13:Point;
            var _local_14:Rectangle;
            var _local_2:Number = new Date().getTime();
            var _local_3:Number = ((_local_2 - walkTS) / walkD);
            if (_local_3 > 1)
            {
                _local_3 = 1;
            };
            if (((Point.distance(op, tp) > 0.5) && (this.mcChar.onMove)))
            {
                _local_4 = this.x;
                _local_5 = this.y;
                this.x = Point.interpolate(tp, op, _local_3).x;
                this.y = Point.interpolate(tp, op, _local_3).y;
                _local_6 = false;
                _local_7 = 0;
                while (_local_7 < STAGE.arrSolid.length)
                {
                    if (this.shadow.hitTestObject(STAGE.arrSolid[_local_7].shadow))
                    {
                        _local_6 = true;
                        _local_7 = STAGE.arrSolid.length;
                    };
                    _local_7++;
                };
                if (_local_6)
                {
                    _local_8 = this.y;
                    this.y = _local_5;
                    _local_6 = false;
                    _local_9 = 0;
                    while (_local_9 < STAGE.arrSolid.length)
                    {
                        if (this.shadow.hitTestObject(STAGE.arrSolid[_local_9].shadow))
                        {
                            this.y = _local_8;
                            _local_6 = true;
                            break;
                        };
                        _local_9++;
                    };
                    if (_local_6)
                    {
                        this.x = _local_4;
                        _local_6 = false;
                        _local_10 = 0;
                        while (_local_10 < STAGE.arrSolid.length)
                        {
                            if (this.shadow.hitTestObject(STAGE.arrSolid[_local_10].shadow))
                            {
                                _local_6 = true;
                                break;
                            };
                            _local_10++;
                        };
                        if (_local_6)
                        {
                            this.x = _local_4;
                            this.y = _local_5;
                            this.stopWalking();
                        };
                    };
                };
                if ((((Math.round(_local_4) == Math.round(this.x)) && (Math.round(_local_5) == Math.round(this.y))) && (_local_2 > (walkTS + 50))))
                {
                    this.stopWalking();
                };
                if (this.pAV.isMyAvatar)
                {
                    checkPadLabels();
                    _local_11 = 0;
                    while (_local_11 < STAGE.arrEvent.length)
                    {
                        _local_12 = false;
                        world = MovieClip(stage.getChildAt(0)).world;
                        if (world.bPvP)
                        {
                            _local_13 = this.shadow.localToGlobal(new Point(0, 0));
                            _local_14 = STAGE.arrEvent[_local_11].shadow.getBounds(stage);
                            if (_local_14.containsPoint(_local_13))
                            {
                                _local_12 = true;
                            };
                        }
                        else
                        {
                            if (this.shadow.hitTestObject(STAGE.arrEvent[_local_11].shadow))
                            {
                                _local_12 = true;
                            };
                        };
                        if (_local_12)
                        {
                            if (((!(STAGE.arrEvent[_local_11]._entered)) && (MovieClip(STAGE.arrEvent[_local_11]).isEvent)))
                            {
                                STAGE.arrEvent[_local_11]._entered = true;
                                if (this == MovieClip(parent.parent).myAvatar.pMC)
                                {
                                    STAGE.arrEvent[_local_11].dispatchEvent(new Event("enter"));
                                };
                            };
                        }
                        else
                        {
                            if (STAGE.arrEvent[_local_11]._entered)
                            {
                                STAGE.arrEvent[_local_11]._entered = false;
                            };
                        };
                        _local_11++;
                    };
                };
            }
            else
            {
                this.stopWalking();
            };
        }

        public function simulateTo(_arg_1:int, _arg_2:int, _arg_3:int):Point
        {
            STAGE = MovieClip(parent.parent);
            this.xDep = this.x;
            this.yDep = this.y;
            this.xTar = _arg_1;
            this.yTar = _arg_2;
            this.walkSpeed = _arg_3;
            this.nDuration = Math.round((Math.sqrt((Math.pow((this.xTar - this.x), 2) + Math.pow((this.yTar - this.y), 2))) / _arg_3));
            var _local_4:* = new Point();
            if (this.nDuration)
            {
                this.nXStep = 0;
                this.nYStep = 0;
                if (!this.mcChar.onMove)
                {
                    this.mcChar.onMove = true;
                };
                _local_4 = simulateWalkLoop();
            }
            else
            {
                _local_4 = null;
            };
            this.x = this.xDep;
            this.y = this.yDep;
            this.mcChar.onMove = false;
            return (_local_4);
        }

        private function simulateWalkLoop():Point
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:Boolean;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            while ((((this.nXStep <= this.nDuration) || (this.nYStep <= this.nDuration)) && (this.mcChar.onMove)))
            {
                _local_1 = this.x;
                _local_2 = this.y;
                this.x = linearTween(this.nXStep, this.xDep, (this.xTar - this.xDep), this.nDuration);
                this.y = linearTween(this.nYStep, this.yDep, (this.yTar - this.yDep), this.nDuration);
                _local_3 = false;
                _local_4 = 0;
                while (_local_4 < STAGE.arrSolid.length)
                {
                    if (this.shadow.hitTestObject(STAGE.arrSolid[_local_4].shadow))
                    {
                        _local_3 = true;
                        _local_4 = STAGE.arrSolid.length;
                    };
                    _local_4++;
                };
                if (_local_3)
                {
                    _local_5 = this.y;
                    this.y = _local_2;
                    _local_3 = false;
                    _local_6 = 0;
                    while (_local_6 < STAGE.arrSolid.length)
                    {
                        if (this.shadow.hitTestObject(STAGE.arrSolid[_local_6].shadow))
                        {
                            this.y = _local_5;
                            _local_3 = true;
                            break;
                        };
                        _local_6++;
                    };
                    if (_local_3)
                    {
                        this.x = _local_1;
                        _local_3 = false;
                        _local_7 = 0;
                        while (_local_7 < STAGE.arrSolid.length)
                        {
                            if (this.shadow.hitTestObject(STAGE.arrSolid[_local_7].shadow))
                            {
                                _local_3 = true;
                                break;
                            };
                            _local_7++;
                        };
                        if (_local_3)
                        {
                            this.x = _local_1;
                            this.y = _local_2;
                            this.mcChar.onMove = false;
                            this.nDuration = -1;
                            return (new Point(this.x, this.y));
                        };
                        if (this.nYStep <= this.nDuration)
                        {
                            this.nYStep++;
                        };
                    }
                    else
                    {
                        if (this.nXStep <= this.nDuration)
                        {
                            this.nXStep++;
                        };
                    };
                }
                else
                {
                    if (this.nXStep <= this.nDuration)
                    {
                        this.nXStep++;
                    };
                    if (this.nYStep <= this.nDuration)
                    {
                        this.nYStep++;
                    };
                };
                if ((((Math.round(_local_1) == Math.round(this.x)) && (Math.round(_local_2) == Math.round(this.y))) && ((this.nXStep > 1) || (this.nYStep > 1))))
                {
                    this.mcChar.onMove = false;
                    this.nDuration = -1;
                    return (new Point(this.x, this.y));
                };
            };
            this.mcChar.onMove = false;
            this.nDuration = -1;
            return (new Point(this.x, this.y));
        }

        public function stopWalking():void
        {
            world = MovieClip(stage.getChildAt(0)).world;
            if (this.mcChar.onMove)
            {
                this.removeEventListener(Event.ENTER_FRAME, onEnterFrameWalk);
                if (((this.pAV.isMyAvatar) && (MovieClip(parent.parent).actionReady)))
                {
                    world.testAction(world.getAutoAttack());
                };
            };
            this.mcChar.onMove = false;
            if (this.walkSpeed > 23)
            {
                this.mcChar.gotoAndPlay("Fight");
            }
            else
            {
                this.mcChar.gotoAndPlay("Idle");
            };
        }

        public function checkPadLabels():*
        {
            var _local_4:*;
            var _local_5:*;
            var _local_1:* = MovieClip(stage.getChildAt(0));
            var _local_2:* = _local_1.ui;
            var _local_3:int;
            while (_local_3 < _local_2.mcPadNames.numChildren)
            {
                _local_4 = MovieClip(_local_2.mcPadNames.getChildAt(_local_3));
                _local_5 = new Point(4, 8);
                _local_5 = _local_4.cnt.localToGlobal(_local_5);
                if (_local_1.distanceO(this, _local_5) < 200)
                {
                    if (!_local_4.isOn)
                    {
                        _local_4.isOn = true;
                        _local_4.gotoAndPlay("in");
                    };
                }
                else
                {
                    if (_local_4.isOn)
                    {
                        _local_4.isOn = false;
                        _local_4.gotoAndPlay("out");
                    };
                };
                _local_3++;
            };
        }

        public function turn(_arg_1:String):void
        {
            if ((((_arg_1 == "right") && (this.mcChar.scaleX < 0)) || ((_arg_1 == "left") && (this.mcChar.scaleX > 0))))
            {
                this.mcChar.scaleX = (this.mcChar.scaleX * -1);
            };
        }

        public function scale(_arg_1:Number):void
        {
            if ((this.mcChar.scaleX >= 0))
            {
                this.mcChar.scaleX = _arg_1;
            }
            else
            {
                this.mcChar.scaleX = -(_arg_1);
            };
            this.mcChar.scaleY = _arg_1;
            this.shadow.scaleX = (this.shadow.scaleY = _arg_1);
            var _local_2:Point = this.mcChar.localToGlobal(headPoint);
            _local_2 = this.globalToLocal(_local_2);
            this.pname.y = int(_local_2.y);
			this.mcEmoticon.y = int(_local_2.y);
			this.mcEmoticon.x = 20;
            this.bubble.y = int((this.pname.y - this.bubble.height));
            this.ignore.y = int(((this.pname.y - this.ignore.height) - 2));
            drawHitBox();
        }

        public function endAction():void
        {
            var _local_2:Number;
            var _local_3:String;
            var _local_4:Object;
            var _local_5:*;
            var _local_1:* = null;
            if (this.pAV.target != null)
            {
                _local_1 = this.pAV.target.pMC.mcChar;
            };
            if (!checkQueue(null))
            {
                if (this.mcChar.onMove)
                {
                    this.mcChar.gotoAndPlay("Walk");
                    _local_2 = (this.x - this.xTar);
                    if ((_local_2 < 0))
                    {
                        this.turn("right");
                    }
                    else
                    {
                        this.turn("left");
                    };
                }
                else
                {
                    if (((_local_1 == null) || ((!(_local_1 == null)) && ((((_local_1.currentLabel == "Die") || (_local_1.currentLabel == "Feign")) || (_local_1.currentLabel == "Dead")) || ((this.pAV.target.npcType == "player") && ((!("pvpTeam" in this.pAV.dataLeaf)) || (this.pAV.dataLeaf.pvpTeam == this.pAV.target.dataLeaf.pvpTeam)))))))
                    {
                        if (this.mcChar.currentLabel != "Jump")
                        {
                            this.mcChar.gotoAndPlay("Idle");
                        };
                        if (_local_1 != null)
                        {
                            if (this.pAV.target.dataLeaf.intState == 0)
                            {
                                if (this.pAV == world.myAvatar)
                                {
                                    world.setTarget(null);
                                };
                            };
                        };
                    }
                    else
                    {
                        _local_3 = "Fight";
                        _local_4 = pAV.getItemByEquipSlot("Weapon");
                        if (((!(_local_4 == null)) && (!(_local_4.sType == null))))
                        {
                            _local_5 = _local_4.sType;
                            if (_local_4.ItemID == 1)
                            {
                                _local_5 = "Unarmed";
                            };
							
							var sItem:Object = pAV.getItemByEquipSlot("sh");
							if (sItem != null)
							{
								_local_5 = "Shield";
							}
							
                            switch (_local_5)
                            {
                                case "Unarmed":
                                    _local_3 = "UnarmedFight";
                                    break;
								case "Scythe":
								case "Spear":
                                case "Polearm":
                                    _local_3 = "PolearmFight";
                                    break;
                                case "Dagger":
                                    _local_3 = "DuelWield/DaggerFight";
                                    break;
								case "Claw":
                        			_local_3 = "FistweaponFight";
								 break;
								 case "Shield":
                       				_local_3 = "Sword/ShieldFight";
								break;
								case "Bow":
                        			_local_3 = "RangedFight";
								break;
								case "Gun":
                                    _local_3 = "GunFight";
								break;
                            };
                        };
                        this.mcChar.gotoAndPlay(_local_3);
                    };
                };
            };
        }

        private function drawHitBox():void
        {
            mcChar.hitbox.graphics.clear();
            var _local_1:int = -30;
            var _local_2:int = 60;
            var _local_3:int = mcChar.head.y;
            var _local_4:int = (-(_local_3) * 0.8);
            hitboxR = new Rectangle(_local_1, _local_3, _local_2, _local_4);
            var _local_5:Graphics = mcChar.hitbox.graphics;
            _local_5.lineStyle(0, 0xFFFFFF, 0);
            _local_5.beginFill(0xAA00FF, 0);
            _local_5.moveTo(_local_1, _local_3);
            _local_5.lineTo((_local_1 + _local_2), _local_3);
            _local_5.lineTo((_local_1 + _local_2), (_local_3 + _local_4));
            _local_5.lineTo(_local_1, (_local_3 + _local_4));
            _local_5.lineTo(_local_1, _local_3);
            _local_5.endFill();
        }

        public function showHealIcon():void
        {
            var _local_1:HealIconMC;
            if (!getChildByName("HealIconMC"))
            {
                _local_1 = new HealIconMC(pAV, world);
                _local_1.name = "HealIconMC";
                addChild(_local_1);
            };
        }

        private function randomNumber(_arg_1:Number, _arg_2:Number):Number
        {
            randNum = (_arg_1 + (((_arg_2 + 1) - _arg_1) * XORandom()));
            return ((randNum < _arg_2) ? randNum : _arg_2);
        }

        private function XORandom():Number
        {
            r = (r ^ (r << 21));
            r = (r ^ (r >>> 35));
            r = (r ^ (r << 4));
            if (r > 0)
            {
                return (r * MAX_RATIO);
            };
            return (r * NEGA_MAX_RATIO);
        }

        public function iaF(_arg_1:Object):void
        {
            var _local_2:MovieClip;
            trace("avatar iaF called");
            _local_2 = (mcChar.head.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.trunk.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.hip.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.idlefoot.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.frontfoot.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.backfoot.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.frontshoulder.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.backshoulder.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.fronthand.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.backhand.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.frontthigh.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.backthigh.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.frontshin.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.backshin.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.robe.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
            _local_2 = (mcChar.backrobe.getChildAt(0) as MovieClip);
            if (_local_2 != null)
            {
                try
                {
                    _local_2.iaF(_arg_1);
                }
                catch(e)
                {
                };
            };
        }

        public function playSound():void
        {
        }

        public function addAnimationListener(_arg_1:String, _arg_2:Function):void
        {
            if (animEvents[_arg_1] == null)
            {
                animEvents[_arg_1] = new Array();
            };
            if (!hasAnimationListener(_arg_1, _arg_2))
            {
                animEvents[_arg_1].push(_arg_2);
            };
        }

        public function removeAnimationListener(_arg_1:String, _arg_2:Function):void
        {
            if (animEvents[_arg_1] == null)
            {
                return;
            };
            var _local_3:uint;
            while (_local_3 < animEvents[_arg_1].length)
            {
                if (animEvents[_arg_1][_local_3] == _arg_2)
                {
                    animEvents[_arg_1].splice(_local_3, 1);
                    return;
                };
                _local_3++;
            };
        }

        public function hasAnimationListener(_arg_1:String, _arg_2:Function):Boolean
        {
            if (animEvents[_arg_1] == null)
            {
                return (false);
            };
            var _local_3:uint;
            while (_local_3 < animEvents[_arg_1].length)
            {
                if (animEvents[_arg_1][_local_3] == _arg_2)
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        private function handleAnimEvent(_arg_1:String):void
        {
            var _local_2:Function;
            if (animEvents[_arg_1] == null)
            {
                return;
            };
            var _local_3:uint;
            while (_local_3 < animEvents[_arg_1].length)
            {
                _local_2 = animEvents[_arg_1][_local_3];
                (_local_2());
                _local_3++;
            };
        }

        public function get AnimEvent():Object
        {
            return (animEvents);
        }

        public function artLoaded():Boolean
        {
            return ((((((weaponLoad) && (capeLoad)) && (helmLoad)) && (armorLoad)) && (classLoad)) && (hairLoad));
        }

        internal function frame1():*
        {
            mcChar.transform.colorTransform = CT1;
            mcChar.alpha = 0;
            stop();
        }

        internal function frame5():*
        {
            mcChar.transform.colorTransform = CT1;
            mcChar.alpha = 0;
        }

        internal function frame8():*
        {
            stop();
        }

        internal function frame10():*
        {
            mcChar.alpha = 0;
        }

        internal function frame12():*
        {
            mcChar.transform.colorTransform = CT3;
        }

        internal function frame13():*
        {
            mcChar.transform.colorTransform = CT2;
        }

        internal function frame14():*
        {
            mcChar.transform.colorTransform = CT1;
        }

        internal function frame18():*
        {
            stop();
        }

        internal function frame20():*
        {
            mcChar.transform.colorTransform = CT1;
        }

        internal function frame23():*
        {
            stop();
        }


    }
}//package 

