// AQW - PRIME
// Client By AE
// Edited by g14k
// Long Live the Biladerios


//Avatar

package 
{
    import flash.display.MovieClip;
    import flash.filters.GlowFilter;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.events.IOErrorEvent;

    public class Avatar 
    {

        public var rootClass:*;
        public var uid:int;
        public var pMC:MovieClip;
        public var pnm:String;
        public var objData:Object = null;
        public var dataLeaf:Object = {};
        public var guild:Object = {};
        public var npcType:String = "player";
        public var target:* = null;
        public var targets:Object = {};
        public var isMyAvatar:Boolean = false;
        public var friends:Array = [];
        public var classes:Array;
        public var factions:Array = [];
        public var bank:Array;
        public var items:Array;
        public var houseitems:Array;
        public var tempitems:Array = [];
        public var bitData:Boolean = false;
        public var strFrame:String = "";
        public var petMC:PetMC;
        public var sLinkPet:String = "";
        public var friendsLoaded:Boolean = false;
        public var strProj:String = "";
        public var invLoaded:Boolean = false;
        private var loadCount:int = 0;
        private var firstLoad:Boolean = true;
		public var onCasting:Boolean = false;
        private var specialAnimation:Object = new Object();

        public function Avatar(_arg_1:MovieClip)
        {
            rootClass = _arg_1;
        }

        public function initAvatar(_arg_1:Object):*
        {
            var _local_5:Boolean;
            var _local_6:String;
            var _local_7:uint;
            var _local_8:*;
            trace("** AVATAR initAvatar >");
            var _local_2:* = rootClass.world;
            var _local_3:* = _local_2.uoTree[pnm];
            objData = _arg_1.data;
            if (("intGold" in objData))
            {
                objData.intGold = Number(objData.intGold);
            };
            if (("intCoins" in objData))
            {
                objData.intCoins = Number(objData.intCoins);
            };
            if (("dUpgExp" in objData))
            {
                objData.dUpgExp = rootClass.stringToDate(objData.dUpgExp);
            };
            if (("dMutedTill" in objData))
            {
                objData.dMutedTill = rootClass.stringToDate(objData.dMutedTill);
            };
            if (("dCreated" in objData))
            {
                objData.dCreated = rootClass.stringToDate(objData.dCreated);
            };
            pMC.strGender = objData.strGender;
            updateRep();
            pMC.updateName();
            trace(("objData.iUpgDays: " + objData.iUpgDays));
            var _local_4:Array = ["lamp", "mattdiver", "r", "m", "root", "dema", "xerith"];
			if (objData.intColorName != null)
			{
				pMC.pname.ti.textColor = objData.intColorName;
			}
			else
			{
				switch (Number(_arg_1.data.intAccessLevel))
				{
					case 100:
					case 50:
						pMC.pname.ti.textColor = 12283391;
						//pMC.pname.filters = [new GlowFilter(0, 1, 3, 3, 64, 1)];
						break;
					case 60:
						pMC.pname.ti.textColor = 16698168;
						//pMC.pname.filters = [new GlowFilter(0, 1, 3, 3, 64, 1)];
						break;
					case 40:
						_local_5 = false;
						_local_6 = pnm.toLowerCase();
						_local_7 = 0;
						while (_local_7 < _local_4.length)
						{
							if (_local_6 == _local_4[_local_7])
							{
								_local_5 = true;
							};
							_local_7++;
						};
						if (_local_5)
						{
							pMC.pname.ti.textColor = 0xB91900;
							//pMC.pname.filters = [new GlowFilter(0, 1, 3, 3, 64, 1)];
						}
						else
						{
							pMC.pname.ti.textColor = 5308200;
							//pMC.pname.filters = [new GlowFilter(0, 1, 3, 3, 64, 1)];
						};
						break;
					case 30:
						pMC.pname.ti.textColor = 52881;
						//pMC.pname.filters = [new GlowFilter(0, 1, 3, 3, 64, 1)];
						break;
					default:
						if (isUpgraded())
						{
							pMC.pname.ti.textColor = 9229823;
						};
						//pMC.pname.filters = [new GlowFilter(0, 1, 3, 3, 64, 1)];
						break;
				};
			};
            if (objData.guild != null)
            {
                pMC.pname.tg.text = ("< " + String(objData.guild.Name) + " >");
				pMC.pname.tg.textColor = objData.guild.Color;
            };
            pMC.ignore.visible = rootClass.chatF.isIgnored(_arg_1.data.strUsername);
            trace(((("username: " + objData.strUsername) + " objData.eqp: ") + objData.eqp));
            if (objData.eqp != null)
            {
                for (_local_8 in objData.eqp)
                {
                    loadCount++;
                    loadMovieAtES(_local_8, objData.eqp[_local_8].sFile, objData.eqp[_local_8].sLink);
                    updateItemAnimation(objData.eqp[_local_8].sMeta);
                };
            };
            pMC.loadHair();
            bitData = true;
        }

        public function loadMovieAtES(_arg_1:*, _arg_2:*, _arg_3:*):void
        {
            trace(("** AVATAR loadMovieAtES > " + _arg_1));
            if (_arg_1 != null)
            {
                switch (_arg_1)
                {
                    case "Weapon":
                        pMC.loadWeapon(_arg_2, _arg_3);
                        return;
                    case "he":
                        pMC.loadHelm(_arg_2, _arg_3);
                        return;
                    case "ba":
                        pMC.loadCape(_arg_2, _arg_3);
                        return;
                    case "ar":
                        pMC.loadClass(_arg_2, _arg_3);
                        return;
                    case "co":
                        pMC.loadArmor(_arg_2, _arg_3);
                        return;
					/*case "am":
						pMC.loadNecklace(_arg_2, _arg_3);
					return;*/
					case "sh":
						pMC.loadShield(_arg_2, _arg_3);
					return;
                    case "pe":
                        loadPet();
                        return;
                };
            };
        }

        public function unloadMovieAtES(_arg_1:*):void
        {
            trace("** AVATAR unloadMovieAtES >");
            if (_arg_1 != null)
            {
				var item:* = this.getItemByEquipSlot("Weapon");
                switch (_arg_1)
                {
                    case "he":
                        pMC.mcChar.head.helm.visible = false;
                        pMC.mcChar.head.hair.visible = true;
                        pMC.mcChar.backhair.visible = pMC.bBackHair;
                        if (this == rootClass.world.myAvatar)
                        {
                            rootClass.showPortrait(this);
                        };
                        if (this == rootClass.world.myAvatar.target)
                        {
                            rootClass.showPortraitTarget(this);
                        };
                        return;
                    case "ba":
                        pMC.mcChar.cape.visible = false;
                        return;
                    case "pe":
                        unloadPet();
                        return;
                    case "co":
                        pMC.loadClass(objData.eqp["ar"].sFile, objData.eqp["ar"].sLink);
					return;
					case "sh":
						if (item != null && item.sType != null)
                        {
                            if (item.sType == "Dagger"  || item.sType == "Claw")
                            {
                                trace("Dagger Equipped > Never Remove Item");
                            }
                            else
                            {
                                pMC.mcChar.shield.visible = false;
                            };
                        };
					return;
					/*case "am":
						pMC.mcChar.neck.visible = false;
					return;*/
                };
            };
        }

        public function loadPet():void
        {
            var _local_1:*;
            if ((((((rootClass.world.doLoadPet(this)) && (!(objData == null))) && (!(objData.eqp == null))) && (!(objData.eqp["pe"] == null))) && (rootClass.world.CHARS.contains(pMC))))
            {
                if (petMC == null)
                {
                    petMC = new PetMC();
                    petMC.mouseEnabled = (petMC.mouseChildren = false);
                    petMC.WORLD = rootClass.world;
                    petMC.pAV = this;
                };
                _local_1 = new Loader();
                _local_1.load(new URLRequest((rootClass.getFilePath() + objData.eqp["pe"].sFile)), rootClass.world.loaderC);
                _local_1.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadPetComplete, false, 0, true);
                _local_1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadPetError, false, 0, true);
            };
        }

        private function onLoadPetError(_arg_1:Event):void
        {
            trace("Loading Pet.. Failed!");
            unloadPet();
        }

        public function onLoadPetComplete(_arg_1:Event):void
        {
            var _local_2:Class;
            try
            {
                _local_2 = (rootClass.world.loaderD.getDefinition(objData.eqp["pe"].sLink) as Class);
                petMC.removeChildAt(1);
                petMC.mcChar = MovieClip(petMC.addChildAt(new (_local_2)(), 1));
                petMC.mcChar.name = "mc";
            }
            catch(e:Error)
            {
            };
            if (rootClass.world.uoTree[objData.strUsername.toLowerCase()].strFrame == rootClass.world.strFrame)
            {
                if (((petMC.stage == null) && (petMC.getChildByName("defaultmc") == null)))
                {
                    MovieClip(rootClass.world.CHARS.addChild(petMC)).name = ("pet_" + uid);
                };
                petMC.scale(pMC.mcChar.scaleY);
                petMC.x = (pMC.x - 20);
                petMC.y = (pMC.y + 5);
            };
        }

        public function unloadPet():void
        {
            if (petMC != null)
            {
                if (petMC.stage != null)
                {
                    rootClass.world.CHARS.removeChild(petMC);
                };
                petMC = null;
            };
        }

        public function showMC():void
        {
            if (pMC != null)
            {
                if (rootClass.world.TRASH.contains(pMC))
                {
                    rootClass.world.CHARS.addChild(rootClass.world.TRASH.removeChild(pMC));
                }
                else
                {
                    rootClass.world.CHARS.addChild(pMC);
                };
                showPetMC();
            };
        }

        public function hideMC():void
        {
            if (pMC != null)
            {
                if (rootClass.world.CHARS.contains(pMC))
                {
                    rootClass.world.TRASH.addChild(rootClass.world.CHARS.removeChild(pMC));
                }
                else
                {
                    rootClass.world.TRASH.addChild(pMC);
                };
                hidePetMC();
            };
        }

        public function showPetMC():void
        {
            if (petMC == null)
            {
                loadPet();
            }
            else
            {
                if (((petMC.stage == null) && (petMC.getChildByName("defaultmc") == null)))
                {
                    rootClass.world.CHARS.addChild(petMC);
                    petMC.scale(pMC.mcChar.scaleY);
                    petMC.x = (pMC.x - 20);
                    petMC.y = (pMC.y + 5);
                };
            };
        }

        public function hidePetMC():void
        {
            if (((!(petMC == null)) && (!(petMC.stage == null))))
            {
                rootClass.world.CHARS.removeChild(petMC);
            };
        }

        public function initFactions(_arg_1:Array):void
        {
            var _local_2:int;
            if (_arg_1 == null)
            {
                factions = [];
            }
            else
            {
                factions = _arg_1;
                _local_2 = 0;
                while (_local_2 < factions.length)
                {
                    initFaction(factions[_local_2]);
                    _local_2++;
                };
            };
        }

        public function addFaction(_arg_1:Object):void
        {
            if (((!(_arg_1 == null)) && (!(factions == null))))
            {
                factions.push(_arg_1);
                initFaction(_arg_1);
            };
        }

        public function addRep(_arg_1:int, _arg_2:int, _arg_3:int=0):void
        {
            var _local_5:int;
            var _local_6:String;
            var _local_4:* = getFaction(_arg_1);
            if (_local_4 != null)
            {
                _local_5 = _local_4.iRank;
                _local_4.iRep = (_local_4.iRep + _arg_2);
                initFaction(_local_4);
                if (_local_4.iRank > _local_5)
                {
                    rankUp(_local_4.sName, _local_4.iRank);
                    rootClass.FB_showFeedDialog("Rank Up!", (((("reached Rank " + _local_4.iRank) + " for ") + _local_4.sName) + " Reputation in AQWorlds!"), "aqw-rankup.jpg");
                };
                _local_6 = "";
                if (_arg_3 > 0)
                {
                    _local_6 = ((" + " + _arg_3) + "(Bonus)");
                };
                rootClass.chatF.pushMsg("server", ((((("Reputation for " + _local_4.sName) + " increased by ") + (_arg_2 - _arg_3)) + _local_6) + "."), "SERVER", "", 0);
            };
        }

        public function initFaction(_arg_1:*):void
        {
            _arg_1.iRep = int(_arg_1.iRep);
            _arg_1.iRank = rootClass.getRankFromPoints(_arg_1.iRep);
            _arg_1.iRepToRank = 0;
            if (_arg_1.iRank < rootClass.iRankMax)
            {
                _arg_1.iRepToRank = (rootClass.arrRanks[_arg_1.iRank] - rootClass.arrRanks[(_arg_1.iRank - 1)]);
            };
            _arg_1.iSpillRep = (_arg_1.iRep - rootClass.arrRanks[(_arg_1.iRank - 1)]);
        }

        public function getRep(_arg_1:Object):int
        {
            var _local_2:* = getFaction(_arg_1);
            return ((_local_2 == null) ? 0 : _local_2.iRep);
        }

        public function getFaction(_arg_1:Object):Object
        {
            return ((isNaN(Number(_arg_1))) ? getFactionByName(String(_arg_1)) : getFactionByID(int(_arg_1)));
        }

        private function getFactionByID(_arg_1:int):Object
        {
            var _local_2:int;
            while (_local_2 < factions.length)
            {
                if (factions[_local_2].FactionID == _arg_1)
                {
                    return (factions[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        private function getFactionByName(_arg_1:String):Object
        {
            var _local_2:int;
            while (_local_2 < factions.length)
            {
                if (factions[_local_2].sName == _arg_1)
                {
                    return (factions[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function initFriendsList(_arg_1:Array):void
        {
            if (_arg_1 != null)
            {
                friends = _arg_1;
            };
        }

        public function addFriend(_arg_1:Object):void
        {
            if (_arg_1 != null)
            {
                friends.push(_arg_1);
                if (rootClass.ui.mcOFrame.currentLabel == "Idle")
                {
                    rootClass.ui.mcOFrame.update();
                };
            };
        }

        public function updateFriend(_arg_1:Object):void
        {
            var _local_2:int;
            if (_arg_1 != null)
            {
                _local_2 = 0;
                while (_local_2 < friends.length)
                {
                    if (friends[_local_2].ID == _arg_1.ID)
                    {
                        friends[_local_2] = _arg_1;
                        break;
                    };
                    _local_2++;
                };
                if (rootClass.ui.mcOFrame.currentLabel == "Idle")
                {
                    rootClass.ui.mcOFrame.update();
                };
            };
        }

        public function deleteFriend(_arg_1:int):void
        {
            var _local_2:int;
            while (_local_2 < friends.length)
            {
                if (friends[_local_2].ID == _arg_1)
                {
                    friends.splice(_local_2, 1);
                    break;
                };
                _local_2++;
            };
            if (rootClass.ui.mcOFrame.currentLabel == "Idle")
            {
                rootClass.ui.mcOFrame.update();
            };
        }

        public function isFriend(_arg_1:int):Boolean
        {
            var _local_2:* = 0;
            while (_local_2 < friends.length)
            {
                if (friends[_local_2].ID == _arg_1)
                {
                    return (true);
                };
                _local_2++;
            };
            return (false);
        }

        public function isFriendName(_arg_1:String):Boolean
        {
            var _local_2:* = 0;
            while (_local_2 < friends.length)
            {
                if (friends[_local_2].sName.toLowerCase() == _arg_1.toLowerCase())
                {
                    return (true);
                };
                _local_2++;
            };
            return (false);
        }

        internal function initGuild(_arg_1:Object):void
        {
            guild = _arg_1;
            if (_arg_1 != null)
            {
                pMC.pname.tg.text = (("< " + String(_arg_1.Name)) + " >");
                rootClass.chatF.chn.guild.act = 1;
                objData.guild = _arg_1;
            };
        }

        public function updateGuild(_arg_1:Object):void
        {
            objData.guild = _arg_1;
            if (objData.guild != null)
            {
                pMC.pname.tg.text = (("< " + String(objData.guild.Name)) + " >");
            }
            else
            {
                pMC.pname.tg.text = "";
            };
        }

        public function initInventory(inv:Array):void
        {
            var i:*;
            trace("** AVATAR initInventory >");
            if (inv == null)
            {
                items = [];
            }
            else
            {
                items = inv;
                i = 0;
                while (i < items.length)
                {
					items[i].CharItemID = int(items[i].CharItemID);
                    items[i].iQty = int(items[i].iQty);
                    rootClass.world.invTree[items[i].ItemID] = items[i];
                    i++;
                };
            };
        }

        public function cleanInventory():void
        {
            var _local_2:*;
            var _local_1:* = 0;
            while (_local_1 < items.length)
            {
                _local_2 = items[_local_1];
                if (_local_2.iQty == null)
                {
                    _local_2.iQty = 1;
                };
                _local_1++;
            };
        }

        public function initBank(_arg_1:Array):void
        {
            var _local_2:int;
            if (_arg_1 == null)
            {
                bank = [];
            }
            else
            {
                bank = _arg_1;
                _local_2 = 0;
                while (_local_2 < bank.length)
                {
                    if (bank[_local_2].bCoins == 0)
                    {
                        iBankCount++;
                    };
                    bank[_local_2].iQty = int(bank[_local_2].iQty);
                    _local_2++;
                };
            };
        }

        public function bankFromInv(_arg_1:int):void
        {
            var _local_2:int;
            while (_local_2 < items.length)
            {
                if (items[_local_2].ItemID == _arg_1)
                {
                    if (items[_local_2].bCoins == 0)
                    {
                        iBankCount++;
                    };
                    rootClass.world.addItemsToBank(rootClass.copyObj(items.splice(_local_2, 1)));
                    rootClass.world.invTree[_arg_1].iQty = 0;
                    return;
                };
                _local_2++;
            };
        }

        public function bankToInv(_arg_1:int):void
        {
            var _local_2:Object = rootClass.world.bankinfo.bankToInv(_arg_1);
            if (_local_2 == null)
            {
                return;
            };
            items.push(_local_2);
            rootClass.world.invTree[_arg_1] = _local_2;
        }

        public function bankSwapInv(_arg_1:int, _arg_2:int):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:int;
            _local_5 = 0;
            while (_local_5 < items.length)
            {
                if (items[_local_5].ItemID == _arg_1)
                {
                    _local_4 = items.splice(_local_5, 1)[0];
                    break;
                };
                _local_5++;
            };
            _local_3 = rootClass.world.bankinfo.bankToInv(_arg_2);
            if (((!(_local_3 == null)) && (!(_local_4 == null))))
            {
                rootClass.world.bankinfo.addItem(rootClass.copyObj(_local_4));
                if (_local_4.bCoins == 0)
                {
                    iBankCount++;
                };
                rootClass.world.invTree[_arg_1].iQty = 0;
                items.push(_local_3);
                if (_local_3.bCoins == 0)
                {
                    iBankCount--;
                };
                rootClass.world.invTree[_arg_2] = _local_3;
                MovieClip(rootClass.ui.mcPopup.getChildByName("mcBank")).update({"eventType":"refreshBank"});
            };
        }

        public function removeItem(_arg_1:int, _arg_2:int=1):void
        {
            var _local_3:Object = {};
            var _local_4:int;
            while (_local_4 < items.length)
            {
                _local_3 = items[_local_4];
                if (_local_3.CharItemID == _arg_1)
                {
                    if (((_local_3.sES == "ar") || ((_local_3.iQty - _arg_2) < 1)))
                    {
                        _local_3.iQty = 0;
                        rootClass.resetInvTreeByItemID(_local_3.ItemID);
                        items.splice(_local_4, 1);
                    }
                    else
                    {
                        _local_3.iQty = (_local_3.iQty - _arg_2);
                    };
                    return;
                };
                _local_4++;
            };
            var _local_5:int;
            while (_local_5 < houseitems.length)
            {
                if (houseitems[_local_5].CharItemID == _arg_1)
                {
                    if (houseitems[_local_5].iQty > 1)
                    {
                        houseitems[_local_5].iQty--;
                    }
                    else
                    {
                        houseitems[_local_5].iQty = 0;
                        houseitems.splice(_local_5, 1);
                    };
                    return;
                };
                _local_5++;
            };
        }

        public function removeItemByID(_arg_1:int, _arg_2:int=1):void
        {
            var _local_3:int;
            while (_local_3 < items.length)
            {
                if (items[_local_3].ItemID == _arg_1)
                {
                    if (((items[_local_3].sES == "ar") || (items[_local_3].iQty <= _arg_2)))
                    {
                        items[_local_3].iQty = 0;
                        items.splice(_local_3, 1);
                    }
                    else
                    {
                        items[_local_3].iQty = (items[_local_3].iQty - _arg_2);
                    };
                    return;
                };
                _local_3++;
            };
        }

        public function addItem(_arg_1:Object):void
        {
            var _local_2:Array;
            if (Boolean(_arg_1.bBank))
            {
                addToBank(_arg_1);
                return;
            };
            _local_2 = ((_arg_1.bHouse == 1) ? houseitems : items);
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                if (_local_2[_local_3].ItemID == _arg_1.ItemID)
                {
                    _local_2[_local_3].iQty = (_local_2[_local_3].iQty + int(_arg_1.iQty));
                    return;
                };
                _local_3++;
            };
            _arg_1.iQty = int(_arg_1.iQty);
            rootClass.world.invTree[_arg_1.ItemID] = _arg_1;
            _local_2.push(_arg_1);
        }

        public function addToBank(_arg_1:*):void
        {
            if (((bank == null) || (bank.length == 0)))
            {
                return;
            };
            var _local_2:int;
            while (_local_2 < bank.length)
            {
                if (bank[_local_2].ItemID == _arg_1.ItemID)
                {
                    bank[_local_2].iQty = (bank[_local_2].iQty + int(_arg_1.iQty));
                    return;
                };
                _local_2++;
            };
        }

        public function varVal(_arg_1:String):*
        {
            var _local_2:* = MovieClip(pMC.mcChar.stage.getChildAt(0));
            var _local_3:* = _local_2.world;
            return (_local_2.sfc.getRoom(_local_3.curRoom).getUser(uid).getVariable(_arg_1));
        }

        public function getItemByID(_arg_1:int):Object
        {
            var _local_2:int;
            while (_local_2 < items.length)
            {
                if (items[_local_2].ItemID == _arg_1)
                {
                    return (items[_local_2]);
                };
                _local_2++;
            };
            var _local_3:int;
            while (_local_3 < houseitems.length)
            {
                if (houseitems[_local_3].ItemID == _arg_1)
                {
                    return (houseitems[_local_3]);
                };
                _local_3++;
            };
            var _local_4:int;
            while (_local_4 < tempitems.length)
            {
                if (tempitems[_local_4].ItemID == _arg_1)
                {
                    return (tempitems[_local_4]);
                };
                _local_4++;
            };
            return (null);
        }

        public function getItemIDByName(_arg_1:String):int
        {
            var _local_2:int;
            while (_local_2 < items.length)
            {
                if (items[_local_2].sName == _arg_1)
                {
                    return (items[_local_2].ItemID);
                };
                _local_2++;
            };
            var _local_3:int;
            while (_local_3 < houseitems.length)
            {
                if (houseitems[_local_3].sName == _arg_1)
                {
                    return (houseitems[_local_3].ItemID);
                };
                _local_3++;
            };
            var _local_4:int;
            while (_local_4 < tempitems.length)
            {
                if (tempitems[_local_4].sName == _arg_1)
                {
                    return (tempitems[_local_4].ItemID);
                };
                _local_4++;
            };
            return (-1);
        }

        public function isItemInBank(_arg_1:Number):Boolean
        {
            var _local_2:int;
            if (bank != null)
            {
                _local_2 = 0;
                while (_local_2 < bank.length)
                {
                    if (bank[_local_2].ItemID == _arg_1)
                    {
                        return (true);
                    };
                    _local_2++;
                };
            };
            return (false);
        }

        public function isItemInInventory(_arg_1:Object):Boolean
        {
            var _local_3:int;
            var _local_4:int;
            var _local_2:int = ((isNaN(Number(_arg_1))) ? getItemIDByName(String(_arg_1)) : int(_arg_1));
            if (_local_2 > 0)
            {
                _local_3 = 0;
                while (_local_3 < items.length)
                {
                    if (items[_local_3].ItemID == _local_2)
                    {
                        return (true);
                    };
                    _local_3++;
                };
                _local_4 = 0;
                while (_local_4 < houseitems.length)
                {
                    if (houseitems[_local_4].ItemID == _local_2)
                    {
                        return (true);
                    };
                    _local_4++;
                };
            };
            return (false);
        }

        public function isItemStackMaxed(_arg_1:Number):Boolean
        {
            var _local_2:int;
            if (bank != null)
            {
                _local_2 = 0;
                while (_local_2 < bank.length)
                {
                    if (((bank[_local_2].ItemID == _arg_1) && (bank[_local_2].iQty >= bank[_local_2].iStk)))
                    {
                        return (true);
                    };
                    _local_2++;
                };
            };
            if (items != null)
            {
                _local_2 = 0;
                while (_local_2 < items.length)
                {
                    if (((items[_local_2].ItemID == _arg_1) && (items[_local_2].iQty >= items[_local_2].iStk)))
                    {
                        return (true);
                    };
                    _local_2++;
                };
            };
            if (houseitems != null)
            {
                _local_2 = 0;
                while (_local_2 < houseitems.length)
                {
                    if (((houseitems[_local_2].ItemID == _arg_1) && (houseitems[_local_2].iQty >= houseitems[_local_2].iStk)))
                    {
                        return (true);
                    };
                    _local_2++;
                };
            };
            return (false);
        }

        public function addTempItem(_arg_1:Object):void
        {
            var _local_2:int;
            while (_local_2 < tempitems.length)
            {
                if (tempitems[_local_2].ItemID == _arg_1.ItemID)
                {
                    tempitems[_local_2].iQty = (tempitems[_local_2].iQty + int(_arg_1.iQty));
                    return;
                };
                _local_2++;
            };
            tempitems.push(_arg_1);
            rootClass.world.invTree[_arg_1.ItemID] = _arg_1;
        }

        public function removeTempItem(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            while (_local_3 < tempitems.length)
            {
                if (tempitems[_local_3].ItemID == _arg_1)
                {
                    if (tempitems[_local_3].iQty > _arg_2)
                    {
                        tempitems[_local_3].iQty = (tempitems[_local_3].iQty - _arg_2);
                    }
                    else
                    {
                        tempitems[_local_3].iQty = 0;
                        tempitems.splice(_local_3, 1);
                    };
                    return;
                };
                _local_3++;
            };
        }

        public function checkTempItem(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:int;
            while (_local_3 < tempitems.length)
            {
                if (((tempitems[_local_3].ItemID == _arg_1) && (tempitems[_local_3].iQty >= _arg_2)))
                {
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function getTempItemQty(_arg_1:int):int
        {
            var _local_2:int;
            while (_local_2 < tempitems.length)
            {
                if (tempitems[_local_2].ItemID == _arg_1)
                {
                    return (tempitems[_local_2].iQty);
                };
                _local_2++;
            };
            return (-1);
        }

        public function unequipItemAtES(_arg_1:String):void
        {
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < items.length)
            {
                if (items[_local_2].sES == _arg_1)
                {
                    items[_local_2].bEquip = 0;
                    removeItemAnimation(items[_local_2].sMeta);
                };
                _local_2++;
            };
            _local_2 = 0;
            while (_local_2 < tempitems.length)
            {
                if (tempitems[_local_2].sES == _arg_1)
                {
                    tempitems[_local_2].bEquip = 0;
                };
                _local_2++;
            };
        }

        public function equipItem(CharItemID:int, itemID:int):void
        {
            var i:int;
            rootClass.world.afkPostpone();
            if (items != null && items.length > 0)
            {
                i = 0;
                while (i < items.length)
                {
                    if (items[i].ItemID == itemID && items[i].CharItemID == CharItemID)
                    {
                        trace(("item found: " + items[i].ItemID));
                        unequipItemAtES(items[i].sES);
                        items[i].bEquip = 1;
                        updateItemAnimation(items[i].sMeta);
                        return;
                    };
                    i++;
                };
            };
            if (tempitems != null && tempitems.length > 0)
            {
                i = 0;
                while (i < tempitems.length)
                {
                    if (tempitems[i].ItemID == itemID && tempitems[i].CharItemID == CharItemID)
                    {
                        unequipItemAtES(tempitems[i].sES);
                        tempitems[i].bEquip = 1;
                        return;
                    };
                    i++;
                };
            };
        }

        public function unequipItem(charItemID:int, itmId:int):void
        {
            var i:int;
            trace("unequip called");
            if (items != null && items.length > 0)
            {
                i = 0;
                while (i < items.length)
                {
                    if (items[i].ItemID == itmId && items[i].CharItemID == charItemID)
                    {
                        items[i].bEquip = 0;
                        removeItemAnimation(items[i].sMeta);
                        return;
                    };
                    i++;
                };
            };
            if (tempitems != null && tempitems.length > 0)
            {
                i = 0;
                while (i < tempitems.length)
                {
                    if (tempitems[i].ItemID == itmId && tempitems[i].CharItemID == charItemID)
                    {
                        tempitems[i].bEquip = 0;
                        return;
                    };
                    i++;
                };
            };
        }

        public function checkItemAnimation():void
        {
            var _local_1:uint;
            while (_local_1 < items.length)
            {
                if (items[_local_1].bEquip == 1)
                {
                    updateItemAnimation(items[_local_1].sMeta);
                };
                _local_1++;
            };
        }

        private function updateItemAnimation(meta:String):void
        {
            var metaArr:Array;
            if (meta == null)
            {
                return;
            };
            if (meta.indexOf("anim") < 0 && meta.indexOf("proj") < 0)
            {
                return;
            };
            var anim:* = "";
            var chance:Number = -1;
            var metas:Array = meta.split(",");
            var i:uint;
            while (i < metas.length)
            {
                metaArr = metas[i].split(":");
                if (metaArr[0] == "anim")
                {
                    anim = metaArr[1];
                }
                else
                {
                    if (metaArr[0] == "chance")
                    {
                        chance = Number(metaArr[1]);
                    };
                    if (metaArr[0] == "proj")
                    {
                        strProj = metaArr[1];
                    };
                };
                i++;
            };
            if (anim != "" && chance > 0)
            {
                specialAnimation[anim] = chance;
            };
        }

        private function removeItemAnimation(_arg_1:String):*
        {
            var _local_2:String;
            trace(("strMeta: " + _arg_1));
            if (_arg_1 == null)
            {
                return;
            };
            if (_arg_1.indexOf("proj") > -1)
            {
                strProj = "";
            };
            for (_local_2 in specialAnimation)
            {
                if (_arg_1.indexOf(_local_2) > -1)
                {
                    delete specialAnimation[_local_2];
                    return;
                };
            };
        }

        public function isItemEquipped(_arg_1:int):Boolean
        {
            var _local_2:* = getItemByID(_arg_1);
            if ((((_local_2 == null) || (_local_2.bEquip == null)) || (_local_2.bEquip == 0)))
            {
                return (false);
            };
            return (true);
        }

        public function getClassArmor(_arg_1:String):Object
        {
            var _local_2:int;
            while (_local_2 < items.length)
            {
                if (((items[_local_2].sName == _arg_1) && (items[_local_2].sES == "ar")))
                {
                    return (items[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function getEquippedItemBySlot(_arg_1:String):Object
        {
            var _local_2:int;
            while (_local_2 < items.length)
            {
                if (((items[_local_2].bEquip == 1) && (items[_local_2].sES == _arg_1)))
                {
                    return (items[_local_2]);
                };
                _local_2++;
            };
            return (null);
        }

        public function getItemByEquipSlot(_arg_1:String):Object
        {
            if ((((!(objData == null)) && (!(objData.eqp == null))) && (!(objData.eqp[_arg_1] == null))))
            {
                return (objData.eqp[_arg_1]);
            };
            return (null);
        }

        public function updateArmorRep():void
        {
            var _local_1:* = getClassArmor(objData.strClassName);
            _local_1.iQty = Number(objData.iCP);
        }

        public function getArmorRep(_arg_1:String=""):int
        {
            if (_arg_1 == "")
            {
                _arg_1 = objData.strClassName;
            };
            var _local_2:* = getClassArmor(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.iQty);
            };
            return (0);
        }

        public function getCPByID(_arg_1:int):int
        {
            var _local_2:* = getItemByID(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.iQty);
            };
            return (-1);
        }

        public function updateRep():void
        {
            var _local_1:* = objData.iRank;
            var _local_2:* = objData.iCP;
            var _local_3:int = rootClass.getRankFromPoints(_local_2);
            var _local_4:int;
            var _local_5:* = rootClass.world;
            if (_local_3 < rootClass.iRankMax)
            {
                _local_4 = (rootClass.arrRanks[_local_3] - rootClass.arrRanks[(_local_3 - 1)]);
            };
            objData.iCurCP = (_local_2 - rootClass.arrRanks[(_local_3 - 1)]);
            objData.iRank = _local_3;
            objData.iCPToRank = _local_4;
            if (((isMyAvatar) && (!(_local_1 == _local_3))))
            {
                _local_5.updatePortrait(this);
            };
            if (isMyAvatar)
            {
                rootClass.updateRepBar();
            };
        }

        public function levelUp():void
        {
            healAnimation();
            var _local_1:* = pMC.addChild(new LevelUpDisplay());
            _local_1.t.ti.text = objData.intLevel;
            _local_1.x = pMC.mcChar.x;
            _local_1.y = (pMC.pname.y + 10);
            rootClass.FB_showFeedDialog("Level Up!", (("reached Level " + objData.intLevel) + " in AQWorlds!"), "aqw-levelup.jpg");
        }

        public function rankUp(_arg_1:String, _arg_2:int):void
        {
            healAnimation();
            var _local_3:* = pMC.addChild(new RankUpDisplay());
            _local_3.t.ti.text = ((_arg_1 + ", Rank ") + _arg_2);
            _local_3.x = pMC.mcChar.x;
            _local_3.y = (pMC.pname.y + 10);
        }

        public function healAnimation():void
        {
            rootClass.mixer.playSound("Heal");
            var _local_1:* = pMC.parent.addChild(new sp_eh1());
            _local_1.x = pMC.x;
            _local_1.y = pMC.y;
        }

        public function isUpgraded():Boolean
        {
            return (int(objData.iUpgDays) >= 0);
        }

        public function hasUpgraded():Boolean
        {
            return (int(objData.iUpg) > 0);
        }

        public function isVerified():Boolean
        {
            return (((objData.intAQ > 0) || (objData.intDF > 0)) || (objData.intMQ > 0));
        }

        public function isStaff():Boolean
        {
            return (objData.intAccessLevel >= 40);
        }

        public function isEmailVerified():Boolean
        {
            return (objData.intActivationFlag == 5);
        }

        public function updatePending(_arg_1:int):void
        {
            var _local_5:String;
            var _local_6:uint;
            if (objData.pending == null)
            {
                _local_5 = "";
                _local_6 = 0;
                while (_local_6 < 500)
                {
                    _local_5 = (_local_5 + String.fromCharCode(0));
                    _local_6++;
                };
                objData.pending = _local_5;
            };
            var _local_2:int = Math.floor((_arg_1 >> 3));
            var _local_3:int = (_arg_1 % 8);
            var _local_4:int = objData.pending.charCodeAt(_local_2);
            _local_4 = (_local_4 | (1 << _local_3));
            objData.pending = ((objData.pending.substr(0, _local_2) + String.fromCharCode(_local_4)) + objData.pending.substr((_local_2 + 1)));
        }

        public function updateScrolls(_arg_1:int):void
        {
            var _local_5:String;
            var _local_6:uint;
            if (objData.scrolls == null)
            {
                _local_5 = "";
                _local_6 = 0;
                while (_local_6 < 500)
                {
                    _local_5 = (_local_5 + String.fromCharCode(0));
                    _local_6++;
                };
                objData.scrolls = _local_5;
            };
            var _local_2:int = Math.floor((_arg_1 >> 3));
            var _local_3:int = (_arg_1 % 8);
            var _local_4:int = objData.scrolls.charCodeAt(_local_2);
            _local_4 = (_local_4 | (1 << _local_3));
            objData.scrolls = ((objData.scrolls.substr(0, _local_2) + String.fromCharCode(_local_4)) + objData.scrolls.substr((_local_2 + 1)));
        }

        public function handleItemAnimation():void
        {
            var _local_2:String;
            var _local_3:Class;
            var _local_4:MovieClip;
            trace("handle Animation");
            var _local_1:Number = (Math.random() * 100);
            for (_local_2 in specialAnimation)
            {
                trace((("rand: " + _local_1) + " specialAnimations[s]"));
                if (_local_1 < specialAnimation[_local_2])
                {
                    _local_3 = (rootClass.world.getClass(_local_2) as Class);
                    if (_local_3 != null)
                    {
                        _local_4 = (new (_local_3)() as MovieClip);
                        _local_4.x = pMC.x;
                        _local_4.y = pMC.y;
                        trace("x and y set");
                        if (pMC.mcChar.scaleX < 0)
                        {
                            _local_4.scaleX = (_local_4.scaleX * -1);
                        };
                        rootClass.world.CHARS.addChild(_local_4);
                    };
                    return;
                };
            };
        }

        public function get FirstLoad():Boolean
        {
            return (firstLoad);
        }

        public function get LoadCount():int
        {
            return (loadCount);
        }

        public function updateLoaded():void
        {
            trace(("loadCount: " + loadCount));
            loadCount--;
        }

        public function firstDone():void
        {
            firstLoad = false;
        }

        public function get iBankCount():int
        {
            return (rootClass.world.bankinfo.Count);
        }

        public function set iBankCount(_arg_1:int):void
        {
            rootClass.world.bankinfo.Count = _arg_1;
        }
		
		public function tradeFromInv(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:Object;
            var _local_7:*;
            var _local_8:int;
            while (_local_4 < items.length)
            {
                if (items[_local_4].ItemID == _arg_1)
                {
                    _local_6 = rootClass.copyObj(items[_local_4]);
                    _local_7 = rootClass.copyObj(items.splice(_local_4, 1));
                    while (_local_8 < _local_7.length)
                    {
                        if (_local_7[_local_8].ItemID == _arg_1)
                        {
                            _local_7[_local_8].iQty = _arg_3;
                        };
                        _local_8++;
                    };
                    rootClass.world.addItemsToTradeA(_local_7);
                    _local_6.iQty = (_local_6.iQty - _arg_3);
                    if (_local_6.iQty > 0)
                    {
                        rootClass.world.invTree[_arg_1].iQty = _local_6.iQty;
                        items.push(rootClass.world.invTree[_arg_1]);
                    }
                    else
                    {
                        rootClass.world.invTree[_arg_1].iQty = 0;
                    };
                    return;
                };
                _local_4++;
            };
        }

        public function tradeToInvA(_arg_1:int):void
        {
            var _local_2:*;
            var _local_3:int;
            var _local_4:*;
            var _local_5:int;
            while (_local_3 < rootClass.world.tradeinfo.itemsA.length)
            {
                if (rootClass.world.tradeinfo.itemsA[_local_3].ItemID == _arg_1)
                {
                    _local_2 = rootClass.world.tradeinfo.itemsA[_local_3];
                    _local_4 = rootClass.world.tradeinfo.itemsA.splice(_local_3, 1)[0];
                    if (isItemInInventory(_arg_1))
                    {
                        _local_2.iQty = (_local_2.iQty + rootClass.world.invTree[_arg_1].iQty);
                        while (_local_5 < items.length)
                        {
                            if (items[_local_5].ItemID == _arg_1)
                            {
                                items[_local_5].iQty = _local_2.iQty;
                                break;
                            };
                            _local_5++;
                        };
                    }
                    else
                    {
                        items.push(_local_4);
                    };
                    rootClass.world.invTree[_arg_1] = _local_2;
                    return;
                };
                _local_3++;
            };
        }

        public function tradeToInvB(_arg_1:int):void
        {
            var _local_2:int;
            while (_local_2 < rootClass.world.tradeinfo.itemsB.length)
            {
                if (rootClass.world.tradeinfo.itemsB[_local_2].ItemID == _arg_1)
                {
                    rootClass.world.tradeinfo.itemsB.splice(_local_2, 1)[0];
                    return;
                };
                _local_2++;
            };
        }

        public function tradeSwapInv(_arg_1:int, _arg_2:int):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:int;
            _local_5 = 0;
            while (_local_5 < items.length)
            {
                if (items[_local_5].ItemID == _arg_1)
                {
                    _local_4 = items.splice(_local_5, 1)[0];
                    break;
                };
                _local_5++;
            };
            _local_5 = 0;
            while (_local_5 < rootClass.world.tradeinfo.itemsA.length)
            {
                if (rootClass.world.tradeinfo.itemsA[_local_5].ItemID == _arg_2)
                {
                    _local_3 = rootClass.world.tradeinfo.itemsA.splice(_local_5, 1)[0];
                    break;
                };
                _local_5++;
            };
            if (((!(_local_3 == null)) && (!(_local_4 == null))))
            {
                rootClass.world.tradeinfo.itemsA.push(rootClass.copyObj(_local_4));
                rootClass.world.invTree[_arg_1].iQty = 0;
                items.push(_local_3);
                rootClass.world.invTree[_arg_2] = _local_3;
            };
        }

        public function tradeToInvReset():void
        {
            var _local_1:*;
            var _local_2:int;
            var _local_3:*;
            var _local_4:int;
            while (_local_2 < rootClass.world.tradeinfo.itemsA.length)
            {
                _local_1 = rootClass.world.tradeinfo.itemsA[_local_2];
                if (isItemInInventory(_local_1.ItemID))
                {
                    _local_1.iQty = (_local_1.iQty + rootClass.world.invTree[_local_1.ItemID].iQty);
                    while (_local_4 < items.length)
                    {
                        if (items[_local_4].ItemID == _local_1.ItemID)
                        {
                            items[_local_4].iQty = _local_1.iQty;
                            break;
                        };
                        _local_4++;
                    };
                }
                else
                {
                    items.push(_local_1);
                };
                rootClass.world.invTree[_local_1.ItemID] = _local_1;
                _local_2++;
            };
        }
		
		public function getItemStack(_arg_1:Number):int
        {
            var _local_2:int;
            if (this.items != null)
            {
                _local_2 = 0;
                while (_local_2 < this.items.length)
                {
                    if (this.items[_local_2].ItemID == _arg_1)
                    {
                        return (this.items[_local_2].iQty);
                    };
                    _local_2++;
                };
            };
            return (0);
        }

    }
}