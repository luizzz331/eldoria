// AQW - PRIME
// Client By AE
// Edited by g14k
// Long Live the Biladerios

// AvatarMC2

package 
{
    import flash.display.MovieClip;
    import flash.display.Loader;
    import flash.geom.ColorTransform;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.utils.getDefinitionByName;
    import flash.filters.GlowFilter;
	import flash.events.MouseEvent;

    public class AvatarMC2 extends MovieClip 
    {
		
		public var pet:*;
		public var left:Boolean = false;
        public var right:Boolean = true;
        public var mcChar:MovieClip;
        public var shadow:MovieClip;
        public var strGender:String;
		public var strArmorSWF:String;
		public var strArmorLink:String;
		public var strWeaponLink:String;
		public var strCapeLink:String;
		public var strHelmLink:String;
		public var strHairLink:String;
		public var strPetLink:String;
        public var noGlow:Boolean = false;
        public var ldr:Loader = new Loader();;
        public var defaultCT:ColorTransform = MovieClip(this).transform.colorTransform;;
        public var serverFilePath:String = "";
        public var pAV:Object = new Object();;
        public var strSkinLinkage:String;
		public var offWeapon:String;
		public var rootClass = MovieClip(stage.getChildAt(0));

        public function AvatarMC2()
        {
            var reg:RegExp = /http:\/\/[\w.]+/i;
            serverFilePath = rootClass.getFilePath();
            visible = false;
            hideOptionalParts();
			mcChar.buttonMode = true;
			mcChar.removeEventListener(MouseEvent.CLICK, onClickHandler);
			mcChar.addEventListener(MouseEvent.CLICK, onClickHandler);
        }
		
		private function onClickHandler(mouse:MouseEvent):void
        {
			if (right)
			{
				mcChar.scaleX = (mcChar.scaleX * -1);
				left = true
				right = false;

			}
			else if (left)
			{
				mcChar.scaleX = (mcChar.scaleX * -1);
				left = false;
				right = true;
			}
		}
		
        public function hideOptionalParts():void
        {
            var i:*;
            var killList:* = ["cape", "backhair", "robe", "backrobe"];
            for (i in killList) 
			{
                if (typeof(mcChar[killList[i]]) != undefined)
				{
                    mcChar[killList[i]].visible = false;
                };
            };
        }

        public function loadArmor(sFile:String, sLink:String)
        {
            strSkinLinkage = sLink;
			ldr.load(new URLRequest(((((serverFilePath + "classes/") + strGender) + "/") + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadSkinComplete);
            ldr.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        }

        private function onLoadSkinComplete(evt:Event)
        {
            var AssetClass:Class;
            var evt:Event = evt;
			strGender = strGender;
            try 
			{
                AssetClass = (getDefinitionByName(((strSkinLinkage + strGender) + "Head")) as Class);
                mcChar.head.removeChildAt(0);
                mcChar.head.addChildAt(new (AssetClass)(), 0);
            } 
			catch(err:Error) 
			{
                AssetClass = (getDefinitionByName(("mcHead" + strGender)) as Class);
                mcChar.head.removeChildAt(0);
                mcChar.head.addChildAt(new (AssetClass)(), 0);
            };
            AssetClass = (getDefinitionByName(((strSkinLinkage + strGender) + "Chest")) as Class);
            mcChar.chest.removeChildAt(0);
            mcChar.chest.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((strSkinLinkage + strGender) + "Hip")) as Class);
            mcChar.hip.removeChildAt(0);
            mcChar.hip.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((strSkinLinkage + strGender) + "FootIdle")) as Class);
            mcChar.idlefoot.removeChildAt(0);
            mcChar.idlefoot.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((strSkinLinkage + strGender) + "Foot")) as Class);
            mcChar.backfoot.removeChildAt(0);
            mcChar.backfoot.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((strSkinLinkage + strGender) + "Shoulder")) as Class);
            mcChar.frontshoulder.removeChildAt(0);
            mcChar.frontshoulder.addChild(new (AssetClass)());
            mcChar.backshoulder.removeChildAt(0);
            mcChar.backshoulder.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((strSkinLinkage + strGender) + "Hand")) as Class);
            mcChar.fronthand.removeChildAt(0);
            mcChar.fronthand.addChild(new (AssetClass)());
            mcChar.backhand.removeChildAt(0);
            mcChar.backhand.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((strSkinLinkage + strGender) + "Thigh")) as Class);
            mcChar.frontthigh.removeChildAt(0);
            mcChar.frontthigh.addChild(new (AssetClass)());
            mcChar.backthigh.removeChildAt(0);
            mcChar.backthigh.addChild(new (AssetClass)());
            AssetClass = (getDefinitionByName(((strSkinLinkage + strGender) + "Shin")) as Class);
            mcChar.frontshin.removeChildAt(0);
            mcChar.frontshin.addChild(new (AssetClass)());
            mcChar.backshin.removeChildAt(0);
            mcChar.backshin.addChild(new (AssetClass)());
            try {
                AssetClass = (getDefinitionByName(((strSkinLinkage + strGender) + "Robe")) as Class);
                mcChar.robe.removeChildAt(0);
                mcChar.robe.addChild(new (AssetClass)());
                mcChar.robe.visible = true;
            } catch(err:Error) {
            };
            try {
                AssetClass = (getDefinitionByName(((strSkinLinkage + strGender) + "RobeBack")) as Class);
                mcChar.backrobe.removeChildAt(0);
                mcChar.backrobe.addChild(new (AssetClass)());
                mcChar.backrobe.visible = true;
            } catch(err:Error) {
            };
            addGlow(mcChar);
            visible = true;
        }

        private function ioErrorHandler(event:IOErrorEvent):void
        {
            trace(("ioErrorHandler: " + event));
        }

        public function loadHair(sFile:String, sLink:String):void
        {
			strHairLink = sLink;
            var ldr:* = new Loader();
            ldr.load(new URLRequest((serverFilePath + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, onHairLoadComplete);
        }

        private function onHairLoadComplete(event:Event):void
        {
            var event:Event = event;
            var AssetClass:Class = event.target.loader.contentLoaderInfo.applicationDomain.getDefinition(((strHairLink + strGender) + "Hair"));
            mcChar.head.hair.removeChildAt(0);
            mcChar.head.hair.addChild(new (AssetClass)());
            try {
                AssetClass = (getDefinitionByName(((strHairLink + strGender) + "HairBack")) as Class);
                mcChar.backhair.removeChildAt(0);
                mcChar.backhair.addChild(new (AssetClass)());
                mcChar.backhair.visible = true;
            } catch(err:Error) {
                mcChar.backhair.visible = false;
            };
        }

        public function setColor(mc:MovieClip, strLocation:String, strShade:String):void
        {
            var intColor:Number = Number(pAV.objData[("intColor" + strLocation)]);
            mc.isColored = true;
            mc.intColor = intColor;
            mc.strLocation = strLocation;
            mc.strShade = strShade;
            changeColor(mc, intColor, strShade);
        }

        public function changeColor(mc:MovieClip, intColor:Number, strShade:String):void
        {
            var newCT:ColorTransform = new ColorTransform();
            newCT.color = intColor;
            switch (strShade.toUpperCase()){
                case "LIGHT":
                    newCT.redOffset = (newCT.redOffset + 100);
                    newCT.greenOffset = (newCT.greenOffset + 100);
                    newCT.blueOffset = (newCT.blueOffset + 100);
                    break;
                case "DARK":
                    newCT.redOffset = (newCT.redOffset - 25);
                    newCT.greenOffset = (newCT.greenOffset - 50);
                    newCT.blueOffset = (newCT.blueOffset - 50);
                    break;
                case "DARKER":
                    newCT.redOffset = (newCT.redOffset - 125);
                    newCT.greenOffset = (newCT.greenOffset - 125);
                    newCT.blueOffset = (newCT.blueOffset - 125);
                    break;
            };
            mc.transform.colorTransform = newCT;
        }

        private function addGlow(mc:MovieClip):void
        {
            if (noGlow){
                return;
            };
            var mcFilter:* = new GlowFilter(0xFFFFFF, 1, 8, 8, 2, 1, false, false);
            mc.filters = [mcFilter];
        }

        public function loadWeapon(sFile:String, sLink:String):void
        {
			strWeaponLink = sLink;
            var ldr:* = new Loader();
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadWeaponComplete);
            ldr.load(new URLRequest((serverFilePath + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
        }

        public function onLoadWeaponComplete(e:Event):void
        {
            var AssetClass:* = undefined;
            var e:Event = e;
            mcChar.weapon.removeChildAt(0);
            try {
                AssetClass = (getDefinitionByName(strWeaponLink) as Class);
                mcChar.weapon.addChild(new (AssetClass)());
            } catch(err:Error) {
                mcChar.weapon.addChild(e.target.content);
            };
        }

        public function loadWeaponOff(sFile:String, sLink:String):void
        {
			strWeaponLink = sLink;
            var ldr:* = new Loader();
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadWeaponOffComplete);
            ldr.load(new URLRequest((serverFilePath + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
        }

        public function onLoadWeaponOffComplete(e:Event):void
        {
            var AssetClass:* = undefined;
            var e:Event = e;
            mcChar.weaponOff.removeChildAt(0);
            try {
                AssetClass = (getDefinitionByName(strWeaponLink) as Class);
                mcChar.weaponOff.addChild(new (AssetClass)());
            } catch(err:Error) {
                mcChar.weaponOff.addChild(e.target.content);
            };
            mcChar.weaponOff.visible = true;
        }

        public function loadCape(sFile:String, sLink:String):void
        {
			strCapeLink = sLink;
            var ldr:* = new Loader();
            ldr.load(new URLRequest((serverFilePath + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadCapeComplete, false, 0, true);
        }

        public function onLoadCapeComplete(e:Event):void
        {
            var AssetClass:Class = (getDefinitionByName(strCapeLink) as Class);
            mcChar.cape.removeChildAt(0);
            mcChar.cape.cape = new (AssetClass)();
            mcChar.cape.addChild(mcChar.cape.cape);
			mcChar.cape.gotoAndStop("Idle");
            mcChar.cape.visible = true;
        }

        public function loadHelm(sFile:String, sLink:String):void
        {
			strHelmLink = sLink;
            var ldr:* = new Loader();
            ldr.load(new URLRequest((serverFilePath + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadHelmComplete, false, 0, true);
        }

        public function onLoadHelmComplete(e:Event):void
        {
            var AssetClass:Class = (getDefinitionByName(strHelmLink) as Class);
            mcChar.head.helm.removeChildAt(0);
            mcChar.head.helm.addChild(new (AssetClass)());
            mcChar.head.helm.visible = true;
            mcChar.head.hair.visible = false;
            mcChar.backhair.visible = false;
        }

        public function loadPet(sFile:String, sLink:String):void
        {
			strPetLink = sLink;
            var ldr:* = new Loader();
            ldr.load(new URLRequest((serverFilePath + sFile)), new LoaderContext(false, ApplicationDomain.currentDomain));
            ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadPetComplete, false, 0, true);
        }

        function onLoadPetComplete(e:Event):void
        {
            var _local_2:* = e.target.applicationDomain;
            var _local_3:* = _local_2.getDefinition(strPetLink);
            try
            {
                pet.removeChildAt(0);
            }
            catch(err:Error)
            {
            };
            pet.y = 10;
            pet.x = -70;
			pet.addChild(new (_local_3)());
			addGlow(pet);
        }


    }
}