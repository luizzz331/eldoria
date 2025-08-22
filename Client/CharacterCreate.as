package  
{
	import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
	
	public class CharacterCreate extends MovieClip 
	{
		public var arrCharacters:Array = new Array(
		{
			"CharID":1,
			"sGender":"M",
			"strClassName":"Warrior",
			"strArmorFile":"NewWarriorB2.swf",
			"strArmorLink":"NewWarriorB2",
			"strArmorEquipment":"ar",
			"HairID":1,
			"strHairName":"Default",
			"strHairFileName":"hair/M/Default.swf",
			"intColorHair":"1a1a1a",
			"intColorSkin":"ffd9b3",
			"intColorEye":"4d4d4d",
			"intColorTrim":"000000",
			"intColorBase":"000000",
			"intColorAccessory":"000000"
		},
		{
			"CharID":2,
			"sGender":"F",
			"strClassName":"Mage",
			"strArmorFile":"BaseMageRedesign3R2.swf",
			"strArmorLink":"BaseMageRedesign3",
			"strArmorEquipment":"ar",
			"HairID":2,
			"strHairName":"Bangs2Long",
			"strHairFileName":"hair/F/Bangs2Long.swf",
			"intColorHair":"cc99ff",
			"intColorSkin":"ffcc99",
			"intColorEye":"ff66ff",
			"intColorTrim":"000000",
			"intColorBase":"000000",
			"intColorAccessory":"000000"
		}
		,
		{
			"CharID":3,
			"sGender":"M",
			"strClassName":"Archer",
			"strArmorFile":"Ranger.swf",
			"strArmorLink":"Ranger",
			"strArmorEquipment":"ar",
			"HairID":205,
			"strHairName":"FauxHawk",
			"strHairFileName":"hair/M/FauxHawk3.swf",
			"intColorHair":"001a00",
			"intColorSkin":"ffcc99",
			"intColorEye":"00ff00",
			"intColorTrim":"000000",
			"intColorBase":"000000",
			"intColorAccessory":"000000"
		}
		);
		public var pMC:AvatarMC2;
		public var mcChar2:MovieClip;
		public var mcChar1:MovieClip;
		public var mcChar0:MovieClip;
		public var btnBack:SimpleButton;
		public var btnCreate:SimpleButton;
		public var selectedChar:int = -1;
		public var rootClass:MovieClip = MovieClip(stage.getChildAt(0));;
		
		public function CharacterCreate() 
		{
			addFrameScript(0, frame1);
		}
		
		internal function frame1():*
		{
			initBtn();
			pMC.visible = false;
			stop();
		}
		
		private function initCharacter(charId:int):void
		{
			if (selectedChar == -1)
			{
				pMC.visible = false;
				return;
			}
			pMC.visible = true;
			
			var charObj:* = arrCharacters[charId];
			var objChar:Object = new Object();
			
			pMC.strGender = charObj.sGender;
			objChar.intColorHair = charObj.intColorHair;
			objChar.intColorSkin = charObj.intColorSkin;
			objChar.intColorEye = charObj.intColorEye;
			objChar.intColorTrim = charObj.intColorTrim;
			objChar.intColorBase = charObj.intColorBase;
			objChar.intColorAccessory = charObj.intColorAccessory;
			objChar.strHairName = charObj.strHairName;
			objChar.strHairFileName = charObj.strHairFileName;
			pMC.pAV.objData = objChar;
			pMC.mcChar.weapon.visible = false;
			pMC.mcChar.weaponOff.visible = false;
			try
			{
				pMC.pet.removeChildAt(0);
				pMC.mcChar.cape.cape.removeChildAt(0);
				pMC.mcChar.head.helm.removeChildAt(0);
			}
			catch(err:Error)
			{
			};
			switch (charObj.strArmorEquipment)
			{
				case "co":
				case "ar":
					pMC.loadArmor(charObj.strArmorFile, charObj.strArmorLink);
					pMC.loadHair(charObj.strHairFileName, charObj.strHairName);
				break;
			}
		}
		
		private function initBtn():void
		{
			mcChar2.removeEventListener(MouseEvent.CLICK, onClick);
			mcChar2.addEventListener(MouseEvent.CLICK, onClick);
			mcChar1.removeEventListener(MouseEvent.CLICK, onClick);
			mcChar1.addEventListener(MouseEvent.CLICK, onClick);
			mcChar0.removeEventListener(MouseEvent.CLICK, onClick);
			mcChar0.addEventListener(MouseEvent.CLICK, onClick);
			//ui buttons
			btnCreate.removeEventListener(MouseEvent.CLICK, onClick);
            btnCreate.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);
			btnBack.removeEventListener(MouseEvent.CLICK, onClick);
            btnBack.addEventListener(MouseEvent.CLICK, onClick, false, 0, true);		
		}
		
		public function onClick(mouse:MouseEvent):void
        {
			rootClass.mixer.playSound("Click");
            switch (mouse.currentTarget.name)
            {
				case "mcChar2":
					selectedChar = 2;
					initCharacter(selectedChar);
				return;
				case "mcChar1":
					selectedChar = 1;
					initCharacter(selectedChar);
				return;
				case "mcChar0":
					selectedChar = 0;
					initCharacter(selectedChar);
				return;
                case "btnCreate":
					if (selectedChar == -1)
					{
						rootClass.MsgBox.notify("Select a character.");
					}
					else
					{
						createChar();
					}
				return;
				case "btnBack":
					rootClass.mcLogin.gotoAndPlay("Characters");
				return;
            };
        }
		
		public function createChar():void
        {
			if (selectedChar == -1)
			{
                rootClass.MsgBox.notify("Select a character.");
				return;
            } 
			trace("called >>> createChar()");
			var rand:Number;
			rand = Math.random();
            var url:String = "http://localhost/game/cf-create.php?ran=" + rand;
            var request:URLRequest;
            var variables:URLVariables;
            var createLoader:URLLoader;

			request = new URLRequest(url);
			variables = new URLVariables();
			variables.userID = rootClass.user_id;
			variables.CharacterID = (selectedChar + 1);
			request.data = variables;
			request.method = URLRequestMethod.POST;
			//load event
			createLoader = new URLLoader();
			createLoader.removeEventListener(Event.COMPLETE, onCreateComplete);
			createLoader.addEventListener(Event.COMPLETE, onCreateComplete);
			createLoader.addEventListener(IOErrorEvent.IO_ERROR, onCreateError, false, 0, true);
			try
			{
				createLoader.load(request);
			}
			catch(error:Error)
			{
				trace("Unable to load URL");
			};
        }
		
		public function onCreateComplete(event:Event):void
        {
            trace("onCreateComplete:" + event.target.data);
			var objCreate:URLVariables = new URLVariables(event.target.data);
			try
            {
				if (objCreate.status == "Success")
				{
					rootClass.relogin();
				}
				else
				{
					rootClass.MsgBox.notify(objCreate.sReason);
				};
			}
			catch(e)
            {
                trace("caught onCreateComplete error");
            };
        }
		
		public function onCreateError(_arg_1:Event):void
        {
            trace(("Login Failed!" + _arg_1));
        }

		
	}
	
}
