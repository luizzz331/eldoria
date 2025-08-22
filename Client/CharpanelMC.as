// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//CharpanelMC

package 
{
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.display.Graphics;
    import flash.text.TextField;
    import flash.geom.ColorTransform;
    import flash.events.Event;
    import flash.text.*;

    public class CharpanelMC extends MovieClip 
    {

        public var cnt2:MovieClip;
        public var bg:MovieClip;
        public var cnt:MovieClip;
        public var bg2:MovieClip;
        private var rootClass:MovieClip = (stage.getChildAt(0) as MovieClip);
        private var world:MovieClip = (rootClass.world as MovieClip);
        private var mcPopup:MovieClip = rootClass.ui.mcPopup;
        private var nextMode:String;
        private var uoLeaf:Object = world.myLeaf();
        private var uoData:Object = world.myAvatar.objData;
        private var sta:Object = uoLeaf.sta;
        private var stp:Object = new Object();
        private var stu:Object = new Object();
        private var stg:Object = new Object();
        private var pts:int = -1;
        private var upts:int = -1;
        private var spendStuC:Array = [1595286, 1470895, 1410498, 1349844, 1289447, 1229821];
        private var spendStpC:Array = [0xE66200, 0xEB7B00, 0xF08E00, 0xF4A100, 0xF9B400, 0xFFCC00];
        private var barVal:int = 150;
        private var spendStat:String = "none";
        private var spendOp:String = "";
        private var spendTicks:int = 0;
        private var spendVals:Array = [{
            "a":0,
            "b":1
        }, {
            "a":30,
            "b":3
        }, {
            "a":60,
            "b":9
        }];
        private var ttFields:Array = [];

        public function CharpanelMC():void
        {
            addFrameScript(0, frame1, 4, frame5, 11, frame12, 24, frame25);
            bg.btnClose.addEventListener(MouseEvent.MOUSE_DOWN, btnCloseClick, false, 0, true);
            bg.tTitle.text = "Character Overview";
            bg2.btnClose.addEventListener(MouseEvent.MOUSE_DOWN, btnCloseClick, false, 0, true);
            bg2.tTitle.text = "Class Overview";
            buildStu();
        }

        public function openWith(_arg_1:Object):void
        {
            nextMode = _arg_1.typ;
            if (isValidMode(nextMode))
            {
                if (((!(this.currentLabel == "init")) && (this.currentLabel.indexOf("-out") < 0)))
                {
                    this.gotoAndPlay((this.currentLabel + "-out"));
                }
                else
                {
                    this.gotoAndPlay(nextMode);
                };
            };
        }

        public function fClose():void
        {
            var _local_1:Array;
            var _local_2:Array;
            var _local_3:MovieClip;
            var _local_4:int;
            var _local_5:*;
            var _local_6:MovieClip;
            var _local_7:MovieClip;
            if (MovieClip(this).currentLabel.indexOf("overview") > -1)
            {
                try
                {
                    _local_1 = [cnt.sl1, cnt.sl2, cnt.sl3, cnt.sl4, cnt.sl5, cnt.sl6];
                    _local_2 = [cnt.abilities.a1, cnt.abilities.a2, cnt.abilities.a3, cnt.abilities.a4, cnt.abilities.p1, cnt.abilities.p2];
                    _local_4 = 0;
                    while (_local_4 < _local_1.length)
                    {
                        _local_3 = _local_1[_local_4];
                        _local_4++;
                    };
                    for each (_local_5 in ttFields)
                    {
                        _local_5.removeEventListener(MouseEvent.MOUSE_OVER, onTTFieldMouseOver);
                        _local_5.removeEventListener(MouseEvent.MOUSE_OUT, onTTFieldMouseOut);
                    };
                    for each (_local_6 in _local_2)
                    {
                        _local_6.removeEventListener(MouseEvent.MOUSE_OVER, rootClass.actIconOver);
                        _local_6.addEventListener(MouseEvent.MOUSE_OUT, rootClass.actIconOut);
                        _local_6.actObj = null;
                    };
                }
                catch(e:Error)
                {
                };
            };
            bg.btnClose.removeEventListener(MouseEvent.MOUSE_DOWN, btnCloseClick);
            bg2.btnClose.removeEventListener(MouseEvent.MOUSE_DOWN, btnCloseClick);
            if (parent != null)
            {
                _local_7 = MovieClip(parent);
                _local_7.removeChild(this);
                _local_7.onClose();
            };
        }

        private function update():void
        {
            var _local_1:Array;
            var _local_2:*;
            var _local_3:MovieClip;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            if (MovieClip(this).currentLabel == "overview")
            {
                _local_1 = [cnt.sl1, cnt.sl2, cnt.sl3, cnt.sl4, cnt.sl5, cnt.sl6];
                ttFields = [cnt.sl1, cnt.sl2, cnt.sl3, cnt.sl4, cnt.sl5, cnt.sl6, cnt.tAP, cnt.tSP, cnt.tDmg, cnt.tHitTF, cnt.tHasteTF, cnt.tCritTF, cnt.tDodgeTF, cnt.tSTR, cnt.tINT, cnt.tEND, cnt.tDEX, cnt.tWIS, cnt.tLCK];
                for each (_local_2 in ttFields)
                {
                    _local_2.removeEventListener(MouseEvent.MOUSE_OVER, onTTFieldMouseOver);
                    _local_2.removeEventListener(MouseEvent.MOUSE_OUT, onTTFieldMouseOut);
                    _local_2.addEventListener(MouseEvent.MOUSE_OVER, onTTFieldMouseOver, false, 0, true);
                    _local_2.addEventListener(MouseEvent.MOUSE_OUT, onTTFieldMouseOut, false, 0, true);
                };
                _local_4 = _local_1[0].signs.bplus.x;
                _local_5 = _local_1[0].signs.bminus.x;
                _local_6 = 0;
                while (_local_6 < _local_1.length)
                {
                    _local_3 = _local_1[_local_6];
                    _local_3.hitL.alpha = 0;
                    _local_3.hitR.alpha = 0;
                    if (_local_3.name == "sl1")
                    {
                        _local_3.a = "_STR";
                    };
                    if (_local_3.name == "sl2")
                    {
                        _local_3.a = "_INT";
                    };
                    if (_local_3.name == "sl3")
                    {
                        _local_3.a = "_END";
                    };
                    if (_local_3.name == "sl4")
                    {
                        _local_3.a = "_DEX";
                    };
                    if (_local_3.name == "sl5")
                    {
                        _local_3.a = "_WIS";
                    };
                    if (_local_3.name == "sl6")
                    {
                        _local_3.a = "_LCK";
                    };
                    if (_local_3.name.indexOf("l") > -1)
                    {
                        _local_3.m = "right";
                        _local_3.signs.bplus.x = _local_5;
                        _local_3.signs.bminus.x = _local_4;
                    }
                    else
                    {
                        _local_3.m = "left";
                    };
                    _local_6++;
                };
                updateSpend();
            };
        }

        private function playNextMode():void
        {
            this.gotoAndPlay(nextMode);
        }

        private function isValidMode(_arg_1:String):Boolean
        {
            var _local_2:Boolean;
            var _local_3:int;
            while (((_local_3 < this.currentLabels.length) && (!(_local_2))))
            {
                if (this.currentLabels[_local_3].name == _arg_1)
                {
                    _local_2 = true;
                };
                _local_3++;
            };
            return (_local_2);
        }

        private function updateSpend():void
        {
            var _local_8:Object;
            var _local_18:MovieClip;
            var _local_25:Class;
            var _local_26:MovieClip;
            var _local_27:Class;
            var _local_28:MovieClip;
            var _local_29:*;
            var _local_1:MovieClip = MovieClip(this).cnt;
            var _local_2:Array = [_local_1.sl1, _local_1.sl2, _local_1.sl3, _local_1.sl4, _local_1.sl5, _local_1.sl6];
            var _local_3:Object = {};
            var _local_4:int;
            var _local_5:int;
            var _local_6:* = "";
            var _local_7:Boolean;
            pts = rootClass.getInnateStats(uoLeaf.intLevel);
            upts = getUnusedPts();
            _local_4 = 0;
            while (_local_4 < rootClass.stats.length)
            {
                _local_6 = rootClass.stats[_local_4];
                _local_3[("_" + _local_6)] = (stu[("_" + _local_6)] + stp[("_" + _local_6)]);
                _local_4++;
            };
            for (_local_6 in stg)
            {
                _local_3[_local_6] = stg[_local_6];
            };
            rootClass.applyCoreStatRatings(_local_3, uoLeaf);
            _local_4 = 0;
            while (_local_4 < uoLeaf.passives.length)
            {
                _local_8 = uoLeaf.passives[_local_4];
                if (_local_8.e != null)
                {
                    _local_5 = 0;
                    while (_local_5 < _local_8.e.length)
                    {
                        rootClass.applyAuraEffect(_local_8.e[_local_5], _local_3);
                        _local_5++;
                    };
                };
                _local_4++;
            };
            _local_1.tHit.text = rootClass.coeffToPct(Number(((1 - rootClass.baseMiss) + _local_3.$thi)));
            _local_1.tHaste.text = rootClass.coeffToPct(_local_3.$tha);
            _local_1.tCrit.text = rootClass.coeffToPct(_local_3.$tcr);
            _local_1.tDodge.text = rootClass.coeffToPct(_local_3.$tdo);
            if (rootClass.world.myAvatar.objData.Tonic != null)
            {
                _local_25 = world.getClass("Tonic");
                _local_26 = MovieClip(new (_local_25)());
                _local_26.x = 220.3;
                _local_26.y = 107;
                _local_1.addChild(_local_26);
                if (rootClass.world.myAvatar.objData.Tonic)
                {
                    _local_26.gotoAndStop("on");
                }
                else
                {
                    _local_26.gotoAndStop("off");
                };
            }
            else
            {
                _local_25 = world.getClass("Tonic");
                _local_26 = MovieClip(new (_local_25)());
                _local_26.x = 220.3;
                _local_26.y = 107;
                _local_1.addChild(_local_26);
                _local_26.gotoAndStop("off");
            };
            if (rootClass.world.myAvatar.objData.Elixir != null)
            {
                _local_27 = world.getClass("Elixir");
                _local_28 = MovieClip(new (_local_27)());
                _local_28.x = 277.6;
                _local_28.y = 107;
                _local_1.addChild(_local_28);
                if (rootClass.world.myAvatar.objData.Elixir)
                {
                    _local_28.gotoAndStop("on");
                }
                else
                {
                    _local_28.gotoAndStop("off");
                };
            }
            else
            {
                _local_27 = world.getClass("Elixir");
                _local_28 = MovieClip(new (_local_27)());
                _local_28.x = 277.6;
                _local_28.y = 107;
                _local_1.addChild(_local_28);
                _local_28.gotoAndStop("off");
            };
            _local_1.tAP.text = String(_local_3.$ap);
            _local_1.tSP.text = String(_local_3.$sp);
            var _local_9:int = _local_3.wDPS;
            var _local_10:Number = 2;
            var _local_11:Number = (_local_9 * _local_10);
            var _local_12:Object = world.getAutoAttack();
            var _local_13:Object = world.myAvatar.getEquippedItemBySlot("Weapon");
            var _local_14:Number = (((!(_local_13 == null)) && ("iRng" in _local_13)) ? _local_13.iRng : 0);
            _local_14 = (_local_14 / 100);
            _local_11 = (_local_11 * _local_12.damage);
            var _local_15:int = Math.floor((_local_11 - (_local_11 * _local_14)));
            var _local_16:int = Math.ceil((_local_11 + (_local_11 * _local_14)));
            var _local_17:* = (("<br><font color='#FFFFFF'>" + _local_9) + " DPS");
            _local_17 = (_local_17 + ((((((" (<font color='#999999'>" + _local_15) + "-") + _local_16) + ", ") + rootClass.numToStr((_local_12.cd / 1000), 1)) + " speed</font>)</font>"));
            _local_1.tDmg.htmlText = _local_17;
            _local_4 = 0;
            while (_local_4 < _local_2.length)
            {
                updateSpendPeg(_local_2[_local_4]);
                _local_7 = updateSpendBar(_local_2[_local_4]);
                _local_4++;
            };
            _local_1 = MovieClip(this).cnt2;
            _local_3 = {};
            _local_4 = 0;
            _local_5 = 0;
            _local_6 = "";
            _local_1.tDesc.autoSize = "left";
            _local_1.tMana.autoSize = "left";
            _local_1.tClass.text = (((uoData.strClassName + "  (Rank ") + uoData.iRank) + ")");
            _local_1.tDesc.text = uoData.sClassDesc;
            _local_1.tMana.text = "";
            for each (_local_6 in uoData.aClassMRM)
            {
                if (_local_6.charAt(0) == "-")
                {
                    _local_1.tMana.text = (_local_1.tMana.text + (" * " + _local_6.substr(1)));
                }
                else
                {
                    _local_1.tMana.text = (_local_1.tMana.text + _local_6);
                };
            };
            _local_1.tManaHeader.y = Math.round(((_local_1.tDesc.y + _local_1.tDesc.height) + 5));
            _local_1.tMana.y = Math.round(((_local_1.tManaHeader.y + _local_1.tManaHeader.height) + 2));
            _local_4 = Math.round((_local_1.tMana.y + _local_1.tMana.height));
            _local_1.abilities.y = Math.round((_local_4 + ((188 - _local_4) / 2)));
            if (_local_1.abilities.y > 188)
            {
                _local_1.abilities.y = 188;
            };
            var _local_19:* = ["a1", "a2", "a3", "a4", "p1", "p2"];
            _local_4 = 0;
            while (_local_4 < _local_19.length)
            {
                _local_3 = _local_19[_local_4];
                _local_18 = (_local_1.abilities.getChildByName(_local_3) as MovieClip);
                _local_29 = rootClass.world.getActionByRef(_local_3);
                if (_local_29 == null)
                {
                    _local_18.visible = false;
                }
                else
                {
                    _local_18.visible = true;
                    _local_18.tQty.visible = false;
                    rootClass.updateIcons([_local_18], _local_29.icon.split(","), null);
                    if (!_local_29.isOK)
                    {
                        _local_18.alpha = 0.33;
                    };
                    _local_18.actObj = _local_29;
                    _local_18.addEventListener(MouseEvent.MOUSE_OVER, rootClass.actIconOver, false, 0, true);
                    _local_18.addEventListener(MouseEvent.MOUSE_OUT, rootClass.actIconOut, false, 0, true);
                };
                _local_4++;
            };
            var _local_20:Graphics = _local_1.abilities.bg.graphics;
            _local_20.clear();
            _local_20.lineStyle(0, 0, 0);
            var _local_21:int;
            var _local_22:int;
            var _local_23:Number = 0x666666;
            var _local_24:* = "#FFFFFF";
            _local_21 = 0;
            while (_local_21 < 5)
            {
                _local_22 = (_local_21 * 51);
                _local_23 = 0x666666;
                _local_24 = "#FFFFFF";
                if (uoData.iRank < (_local_21 + 1))
                {
                    _local_23 = 0x242424;
                    _local_24 = "#999999";
                    _local_20.beginFill(_local_23);
                    _local_20.moveTo(_local_22, 19);
                    _local_20.lineTo((_local_22 + 50), 19);
                    _local_20.lineTo((_local_22 + 50), 127);
                    _local_20.lineTo(_local_22, 127);
                    _local_20.lineTo(_local_22, 19);
                    _local_20.endFill();
                };
                _local_20.beginFill(_local_23);
                _local_20.moveTo(_local_22, 0);
                _local_20.lineTo((_local_22 + 50), 0);
                _local_20.lineTo((_local_22 + 50), 18);
                _local_20.lineTo(_local_22, 18);
                _local_20.lineTo(_local_22, 0);
                _local_20.endFill();
                _local_20.beginFill(_local_23);
                _local_20.moveTo(_local_22, 128);
                _local_20.lineTo((_local_22 + 50), 128);
                _local_20.lineTo((_local_22 + 50), 132);
                _local_20.lineTo(_local_22, 132);
                _local_20.lineTo(_local_22, 128);
                _local_20.endFill();
                TextField(_local_1.abilities.getChildByName(("tRank" + (_local_21 + 1)))).htmlText = (((("<font color='" + _local_24) + "'>") + TextField(_local_1.abilities.getChildByName(("tRank" + (_local_21 + 1)))).text) + "</font>");
                _local_21++;
            };
        }

        private function getUnusedPts():int
        {
            var _local_2:String;
            var _local_1:int = pts;
            for (_local_2 in stu)
            {
                if (((_local_2.indexOf("_") > -1) && (rootClass.stats.indexOf(_local_2.substr(1)) > -1)))
                {
                    _local_1 = (_local_1 - (int(stu[_local_2]) + int(stp[_local_2])));
                };
            };
            return (0);
        }

        private function buildStu():*
        {
            var _local_4:String;
            var _local_5:String;
            var _local_1:Object = rootClass.getCategoryStats(uoData.sClassCat, uoLeaf.intLevel);
            var _local_2:* = "";
            var _local_3:int;
            _local_3 = 0;
            while (_local_3 < rootClass.stats.length)
            {
                _local_2 = rootClass.stats[_local_3];
                stg[("^" + _local_2)] = 0;
                stp[("_" + _local_2)] = Math.floor(_local_1[_local_2]);
                stu[("_" + _local_2)] = 0;
                _local_3++;
            };
            for (_local_4 in uoLeaf.tempSta)
            {
                if (_local_4 != "innate")
                {
                    for (_local_5 in uoLeaf.tempSta[_local_4])
                    {
                        if (stg[("^" + _local_5)] == null)
                        {
                            stg[("^" + _local_5)] = 0;
                        };
                        stg[("^" + _local_5)] = (stg[("^" + _local_5)] + int(uoLeaf.tempSta[_local_4][_local_5]));
                    };
                };
            };
        }

        private function updateSpendPeg(_arg_1:MovieClip):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:Number;
            var _local_8:ColorTransform;
            var _local_2:String = _arg_1.m;
            var _local_3:int = stp[_arg_1.a];
            var _local_4:int = stg[("^" + _arg_1.a.substr(1))];
            _local_5 = (_local_3 % barVal);
            _local_6 = int(Math.floor((_local_3 / barVal)));
            if (_local_6 == 0)
            {
                if (!_arg_1.bar.peg.visible)
                {
                    _arg_1.bar.peg.visible = true;
                };
            }
            else
            {
                if (_arg_1.bar.peg.visible)
                {
                    _arg_1.bar.peg.visible = false;
                };
            };
            if (int(_arg_1.t1.text) != _local_3)
            {
                _local_8 = new ColorTransform();
                _arg_1.t1.text = _local_3;
                if (_local_4 > 0)
                {
                    if (_arg_1.t2.text != ("+" + _local_4))
                    {
                        _arg_1.t2.text = ("+" + _local_4);
                    };
                }
                else
                {
                    if (_arg_1.t2.text != "")
                    {
                        _arg_1.t2.text = "";
                    };
                };
                if (_local_3 > 0)
                {
                    if (_local_2 == "left")
                    {
                        _arg_1.bar.peg.x = (_arg_1.bar.peg.width - _local_5);
                    }
                    else
                    {
                        _arg_1.bar.peg.x = (_local_5 - _arg_1.bar.peg.width);
                    };
                    if (_arg_1.bar.peg.transform.colorTransform.color != spendStpC[_local_6])
                    {
                        _local_8 = new ColorTransform();
                        _local_8.color = spendStpC[_local_6];
                        _arg_1.bar.peg.transform.colorTransform = _local_8;
                    };
                };
                if (_local_6 > 0)
                {
                    _local_7 = spendStpC[(_local_6 - 1)];
                }
                else
                {
                    _local_7 = 0;
                };
                if (_arg_1.bar.b2.transform.colorTransform.color != _local_7)
                {
                    _local_8 = new ColorTransform();
                    _local_8.color = _local_7;
                    _arg_1.bar.b2.transform.colorTransform = _local_8;
                };
            };
        }

        private function updateSpendBar(_arg_1:MovieClip):Boolean
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:Number;
            var _local_10:ColorTransform;
            var _local_2:String = _arg_1.m;
            var _local_3:int = stu[_arg_1.a];
            var _local_4:int = stp[_arg_1.a];
            var _local_9:Boolean;
            _local_5 = ((_local_3 + _local_4) % barVal);
            _local_6 = int(Math.floor(((_local_3 + _local_4) / barVal)));
            _local_7 = int(Math.floor((_local_4 / barVal)));
            if (_local_3 == 0)
            {
                if (_arg_1.bar.b1.visible)
                {
                    _arg_1.bar.b1.visible = false;
                };
            }
            else
            {
                if (!_arg_1.bar.b1.visible)
                {
                    _arg_1.bar.b1.visible = true;
                };
            };
            if (_local_6 == 0)
            {
                if (_local_4 == 0)
                {
                    if (_arg_1.bar.peg.visible)
                    {
                        _arg_1.bar.peg.visible = false;
                    };
                }
                else
                {
                    if (!_arg_1.bar.peg.visible)
                    {
                        _arg_1.bar.peg.visible = true;
                    };
                };
            }
            else
            {
                if (_arg_1.bar.peg.visible)
                {
                    _arg_1.bar.peg.visible = false;
                };
            };
            if (int(_arg_1.t1.text) != (_local_3 + _local_4))
            {
                _local_10 = new ColorTransform();
                _arg_1.t1.text = (_local_3 + _local_4);
                if (_local_3 > 0)
                {
                    _local_9 = true;
                    if (_local_2 == "left")
                    {
                        _arg_1.bar.b1.x = (_arg_1.bar.b1.width - _local_5);
                    }
                    else
                    {
                        _arg_1.bar.b1.x = (_local_5 - _arg_1.bar.b1.width);
                    };
                    if (_arg_1.bar.b1.transform.colorTransform.color != spendStuC[_local_6])
                    {
                        _local_10 = new ColorTransform();
                        _local_10.color = spendStuC[_local_6];
                        _arg_1.bar.b1.transform.colorTransform = _local_10;
                    };
                    if (_local_6 > 0)
                    {
                        _local_8 = spendStuC[(_local_6 - 1)];
                    }
                    else
                    {
                        if (_local_7 > 0)
                        {
                            _local_8 = spendStpC[(_local_7 - 1)];
                        }
                        else
                        {
                            _local_8 = 0;
                        };
                    };
                }
                else
                {
                    if (_local_7 > 0)
                    {
                        _local_8 = spendStpC[(_local_7 - 1)];
                    }
                    else
                    {
                        _local_8 = 0;
                    };
                };
                if (_arg_1.bar.b2.transform.colorTransform.color != _local_8)
                {
                    _local_10 = new ColorTransform();
                    _local_10.color = _local_8;
                    _arg_1.bar.b2.transform.colorTransform = _local_10;
                };
            };
            return (_local_9);
        }

        private function spendPts():void
        {
            var _local_1:int;
            var _local_2:int;
            while (_local_2 < spendVals.length)
            {
                if (spendTicks > spendVals[_local_2].a)
                {
                    _local_1 = spendVals[_local_2].b;
                };
                _local_2++;
            };
            if (spendOp == "+")
            {
                if (upts > 0)
                {
                    if (_local_1 > upts)
                    {
                        _local_1 = upts;
                    };
                    stu[spendStat] = (stu[spendStat] + _local_1);
                };
            }
            else
            {
                if (stu[spendStat] > 0)
                {
                    if (_local_1 > stu[spendStat])
                    {
                        _local_1 = stu[spendStat];
                    };
                    stu[spendStat] = (stu[spendStat] - _local_1);
                };
            };
        }

        private function spendBarClick(_arg_1:MouseEvent):void
        {
            var _local_2:MovieClip = MovieClip(_arg_1.currentTarget);
            spendOp = "+";
            if (_local_2.hitL.hitTestPoint(stage.mouseX, stage.mouseY))
            {
                if (_local_2.name.indexOf("l") > -1)
                {
                    spendOp = "-";
                };
                spendStat = _local_2.a;
            }
            else
            {
                if (_local_2.hitR.hitTestPoint(stage.mouseX, stage.mouseY))
                {
                    if (_local_2.name.indexOf("r") > -1)
                    {
                        spendOp = "-";
                    };
                    spendStat = _local_2.a;
                }
                else
                {
                    spendStat = "none";
                };
            };
            spendTicks = 0;
        }

        private function spendBarRelease(_arg_1:MouseEvent):void
        {
            spendStat = "none";
            spendTicks = 0;
        }

        private function spendBarOver(_arg_1:MouseEvent):void
        {
            var _local_2:MovieClip = (_arg_1.currentTarget as MovieClip);
            spendStat = "none";
            spendTicks = 0;
            _local_2.gotoAndPlay("in");
        }

        private function spendBarOut(_arg_1:MouseEvent):void
        {
            var _local_2:MovieClip = (_arg_1.currentTarget as MovieClip);
            spendStat = "none";
            spendTicks = 0;
            _local_2.gotoAndPlay("out");
        }

        private function spendEF(_arg_1:Event):void
        {
            if (spendStat != "none")
            {
                spendPts();
                spendTicks++;
                updateSpend();
            };
        }

        private function btnAcceptClick(_arg_1:MouseEvent):void
        {
            var _local_2:MovieClip = (_arg_1.currentTarget as MovieClip);
            var _local_3:Array = [int((stu._STR + stp._STR)), int((stu._DEX + stp._DEX)), int((stu._END + stp._END)), int((stu._INT + stp._INT)), int((stu._WIS + stp._WIS)), int((stu._LCK + stp._LCK))];
            if (world.coolDown("equipItem"))
            {
                rootClass.sfc.sendXtMessage("zm", "statsSave", _local_3, "str", rootClass.world.curRoom);
                _local_2.visible = false;
            }
            else
            {
                rootClass.addUpdate("Please allow time for requests to complete before submitting additional requests.");
            };
        }

        private function btnCloseClick(_arg_1:MouseEvent):void
        {
            fClose();
        }

        private function onTTFieldMouseOver(_arg_1:MouseEvent):void
        {
            var _local_2:String = _arg_1.currentTarget.name;
            var _local_3:* = "";
            switch (_local_2)
            {
    case "tPt1":
        _local_3 = "Número de pontos de estatísticas restantes para gastar nas barras abaixo.";
        break;
    case "tPt2":
        _local_3 = "Número total de pontos de estatísticas atualmente disponíveis para o seu personagem.";
        break;
    case "tAP":
        _local_3 = "<b>Poder de Ataque</b> aumenta a eficácia de seus ataques físicos.";
        break;
    case "tSP":
        _local_3 = "<b>Poder Mágico</b> aumenta a eficácia de seus ataques mágicos.";
        break;
    case "tDmg":
        _local_3 = "Este é o dano que você esperaria ver em um ataque corpo a corpo normal, antes de quaisquer outros modificadores.";
        break;
    case "tHP":
        _local_3 = "Seus <b>Pontos de Vida</b> totais. Quando esses chegarem a zero, você precisará esperar um curto período de tempo antes de poder continuar jogando.";
        break;
    case "tHitTF":
        _local_3 = "<b>Chance de Acerto</b> determina a probabilidade de acertar um alvo, antes de quaisquer outros modificadores.";
        break;
    case "tHasteTF":
        _local_3 = "<b>Velocidade</b> reduz o tempo de recarga de todos os seus ataques e feitiços, incluindo o Ataque Automático, por uma certa porcentagem (limitado a 50%).";
        break;
    case "tCritTF":
        _local_3 = "<b>Chance de Crítico</b> aumenta a probabilidade de causar dano adicional em qualquer ataque.";
        break;
    case "tDodgeTF":
        _local_3 = "<b>Chance de Evasão</b> permite que você evite completamente o dano recebido.";
        break;
    case "tSTR":
    case "sl1":
        _local_3 = "<b>Força</b> aumenta o Poder de Ataque, o que aumenta o dano físico. Também melhora a chance de Acerto Crítico para classes corpo a corpo.";
        break;
    case "tINT":
    case "sl2":
        _local_3 = "<b>Inteligência</b> aumenta o Poder Mágico, o que aumenta o dano mágico. Também melhora a Velocidade para classes de conjuração.";
        break;
    case "tEND":
    case "sl3":
        _local_3 = "<b>Endurance</b> contribui diretamente para seus Pontos de Vida totais. Embora seja muito útil para todas as classes, algumas habilidades funcionam melhor com HP total muito alto ou muito baixo.";
        break;
    case "tDEX":
    case "sl4":
        _local_3 = "<b>Destreza</b> é valiosa para classes corpo a corpo. Aumenta a Velocidade, a Chance de Acerto e a Chance de Evasão. Aumenta apenas a Chance de Evasão para classes de conjuração.";
        break;
    case "tWIS":
    case "sl5":
        _local_3 = "<b>Sabedoria</b> é valiosa para classes de conjuração. Aumenta a Chance de Acerto, Chance de Crítico e Chance de Evasão. Melhora apenas a Chance de Evasão para classes corpo a corpo.";
        break;
    case "tLCK":
    case "sl6":
        _local_3 = "<b>Sorte</b> oferece uma melhoria moderada geral no combate, mas é extremamente valiosa para classes especializadas em jogos de azar. Também pode ter efeitos fora do combate.";
        break;
            };
            rootClass.ui.ToolTip.openWith({"str":_local_3});
        }

        public function onTTFieldMouseOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }

        internal function frame1():*
        {
            openWith(MovieClip(parent).fData);
        }

        internal function frame5():*
        {
            update();
        }

        internal function frame12():*
        {
            stop();
        }

        internal function frame25():*
        {
            playNextMode();
        }


    }
}//package 

