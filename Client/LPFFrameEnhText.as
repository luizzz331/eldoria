// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//LPFFrameEnhText

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;
    import flash.text.*;

    public class LPFFrameEnhText extends LPFFrame 
    {

        public var mcStats:MovieClip;
        public var tDesc:TextField;
        private var iSel:Object;
        private var eSel:Object;
        private var iEnh:Object;
        private var eEnh:Object;
        private var rootClass:MovieClip;
        private var curItem:Object;

        public function LPFFrameEnhText():void
        {
            mcStats.sproto.visible = false;
        }

        override public function fOpen(_arg_1:Object):void
        {
            rootClass = MovieClip(stage.getChildAt(0));
            positionBy(_arg_1.r);
            iEnh = null;
            eEnh = null;
            if (("eventTypes" in _arg_1))
            {
                eventTypes = _arg_1.eventTypes;
            };
            fDraw();
            getLayout().registerForEvents(this, eventTypes);
        }

        override public function fClose():void
        {
            var _local_1:DisplayObject;
            while (mcStats.numChildren > 1)
            {
                _local_1 = mcStats.getChildAt(1);
                _local_1.removeEventListener(MouseEvent.MOUSE_OVER, onTTFieldMouseOver);
                _local_1.removeEventListener(MouseEvent.MOUSE_OUT, onTTFieldMouseOut);
                mcStats.removeChildAt(1);
            };
            getLayout().unregisterFrame(this);
            if (parent != null)
            {
                parent.removeChild(this);
            };
        }

        protected function fDraw():void
        {
            var _local_3:Object;
            var _local_4:Boolean;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:Object;
            var _local_15:int;
            var _local_16:int;
            var _local_1:* = "";
            var _local_2:* = "#00CCFF";
            if (iSel != null)
            {
                _local_1 = "<font size='12' color='#999999'>Aprimoramento</font><br>";
                if (["Weapon", "he", "ar", "ba"].indexOf(iSel.sES) > -1)
                {
                    iEnh = null;
                    eEnh = null;
                    if (iSel.PatternID != null)
                    {
                        iEnh = rootClass.world.enhPatternTree[iSel.PatternID];
                    };
                    if (iSel.EnhPatternID != null)
                    {
                        iEnh = rootClass.world.enhPatternTree[iSel.EnhPatternID];
                    };
                    if (eSel != null)
                    {
                        if (eSel.sES == iSel.sES)
                        {
                            if (eSel.PatternID != null)
                            {
                                eEnh = rootClass.world.enhPatternTree[eSel.PatternID];
                            };
                            if (eSel.EnhPatternID != null)
                            {
                                eEnh = rootClass.world.enhPatternTree[eSel.EnhPatternID];
                            };
                            _local_1 = (_local_1 + ((("<font size='11' color='" + _local_2) + "'>") + eEnh.sName));
                            if (eSel.iRty > 1)
                            {
                                _local_1 = (_local_1 + (" +" + (eSel.iRty - 1)));
                            };
                            _local_1 = (_local_1 + "</font>");
                            _local_1 = (_local_1 + "<font size='11' color='#FFFFFF'> vs. </font>");
                            _local_2 = "#999999";
                            if (iEnh != null)
                            {
                                _local_1 = (_local_1 + ((("<font size='11' color='" + _local_2) + "'>") + iEnh.sName));
                                if (iSel.EnhRty > 1)
                                {
                                    _local_1 = (_local_1 + (" +" + (iSel.EnhRty - 1)));
                                };
                                _local_1 = (_local_1 + "</font>");
                            }
                            else
                            {
                                _local_1 = (_local_1 + "<font size='11' color='#00CCFF'>Sem aprimoramento</font>");
                            };
                        }
                        else
                        {
                            _local_1 = (_local_1 + "<font size='11' color='#00CCFF'>O tipo de aprimoramento deve corresponder ao slot do item!</font>");
                        };
                    }
                    else
                    {
                        if (iEnh != null)
                        {
                            _local_1 = (_local_1 + ((("<font size='11' color='" + _local_2) + "'>") + iEnh.sName));
                            if ((("EnhRty" in iSel) && (iSel.EnhRty > 1)))
                            {
                                _local_1 = (_local_1 + (" +" + (iSel.EnhRty - 1)));
                            }
                            else
                            {
                                if (((("iRty" in iSel) && (iSel.iRty < 10)) && (iSel.iRty > 1)))
                                {
                                    _local_1 = (_local_1 + (" +" + (iSel.iRty - 1)));
                                };
                            };
                            _local_1 = (_local_1 + "</font>");
                        }
                        else
                        {
                            _local_1 = (_local_1 + "<font size='11' color='#00CCFF'>Sem aprimoramento</font>");
                        };
                    };
                    if (iSel.sType.toLowerCase() == "enhancement")
                    {
                        _local_1 = (_local_1 + " <font size='11' color='#FFFFFF'>Encanta um item com: </font>");
                    };
                    _local_3 = rootClass.copyObj(iSel);
                    if (eSel != null)
                    {
                        _local_3 = rootClass.copyObj(eSel);
                        if (iSel != null)
                        {
                            _local_3.sType = iSel.sType;
                            if (("EnhRty" in iSel))
                            {
                                _local_3.EnhRty = iSel.EnhRty;
                            };
                            if (("iRng" in iSel))
                            {
                                _local_3.iRng = iSel.iRng;
                            }
                            else
                            {
                                _local_3.iRng = 10;
                            };
                        };
                    };
                    if (_local_3.sES.toLowerCase() == "weapon")
                    {
                        _local_4 = (_local_3.sType.toLowerCase() == "enhancement");
                        if (_local_4)
                        {
                            _local_5 = _local_3.iDPS;
                        }
                        else
                        {
                            if (("EnhDPS" in _local_3))
                            {
                                _local_5 = _local_3.EnhDPS;
                            }
                            else
                            {
                                if (((!(eSel == null)) && ("iDPS" in eSel)))
                                {
                                    _local_5 = eSel.iDPS;
                                }
                                else
                                {
                                    _local_5 = -1;
                                };
                            };
                        };
                        if (_local_5 == 0)
                        {
                            _local_5 = 100;
                        };
                        if (_local_5 == -1)
                        {
                            _local_5 = 100;
                        };
                        _local_5 = (_local_5 / 100);
                        _local_6 = (("iRng" in _local_3) ? _local_3.iRng : 0);
                        _local_6 = (_local_6 / 100);
                        _local_7 = 0;
                        if (("iRty" in _local_3))
                        {
                            _local_7 = (_local_3.iRty - 1);
                        };
                        if (("EnhRty" in _local_3))
                        {
                            _local_7 = (_local_3.EnhRty - 1);
                        };
                        if (_local_4)
                        {
                            _local_8 = _local_3.iLvl;
                        }
                        else
                        {
                            if (("EnhLvl" in _local_3))
                            {
                                _local_8 = _local_3.EnhLvl;
                            }
                            else
                            {
                                if (((!(eSel == null)) && ("iLvl" in eSel)))
                                {
                                    _local_8 = eSel.iLvl;
                                }
                                else
                                {
                                    _local_8 = iSel.iLvl;
                                };
                            };
                        };
                        _local_9 = rootClass.getBaseHPByLevel((_local_8 + _local_7));
                        _local_10 = 20;
                        _local_11 = 2;
                        _local_12 = Math.round((((_local_9 / _local_10) * _local_5) * rootClass.PCDPSMod));
                        _local_13 = Math.round((_local_12 * _local_11));
                        _local_14 = rootClass.world.getAutoAttack();
                        _local_13 = (_local_13 * _local_14.damage);
                        _local_15 = Math.floor((_local_13 - (_local_13 * _local_6)));
                        _local_16 = Math.ceil((_local_13 + (_local_13 * _local_6)));
                        if (((_local_3.sType.toLowerCase() == "enhancement") || (("EnhLvl" in _local_3) || (!(eSel == null)))))
                        {
                            _local_1 = (_local_1 + (("<br><font color='#FFFFFF'>" + _local_12) + " DPS"));
                        };
                        if (((!(_local_3.sType.toLowerCase() == "enhancement")) && (("EnhLvl" in _local_3) || (!(eSel == null)))))
                        {
                            _local_1 = (_local_1 + ((((((" ( <font color='#999999'>" + _local_15) + "-") + _local_16) + ", ") + rootClass.numToStr((_local_14.cd / 1000), 1)) + " speed</font> )</font>"));
                        };
                    };
                }
                else
                {
                    _local_1 = (_local_1 + "<font size='11' color='#00CCFF'>Este item não pode ser aprimorado.</font>");
                    if (((((iSel.sES == "pe") || (iSel.sES == "co")) || (iSel.sES == "am")) || (((iSel.sType.toLowerCase() == "item") && (!(iSel.sLink == null))) && (!(iSel.sLink == "")))))
                    {
                    };
                };
                tDesc.htmlText = _local_1;
                showStats();
            }
            else
            {
                if (((!(MovieClip(getLayout()).iSel == null)) && (!(rootClass.doIHaveEnhancements()))))
                {
                    tDesc.htmlText = "<font color='#FF0000'>Voce precisa de um aprimoramento!</font><br>";
                    tDesc.htmlText = (tDesc.htmlText + "<font color='#FFFFFF'>Nenhuma melhoria para este tipo de item foi encontrada em sua mochila. Melhorias sao usadas para melhorar seu item. Voce pode comprar em lojas ou encontrá-los em monstros.</font>");
                }
                else
                {
                    tDesc.htmlText = "Nenhum item selecionado.";
                };
                showStats();
            };
        }

        override public function notify(_arg_1:Object):void
        {
            if (_arg_1.eventType != "showItemListB")
            {
                if (_arg_1.eventType == "refreshItems")
                {
                    if (((!(iSel == _arg_1.fData.iSel)) && (!(iSel == _arg_1.fData.eSel))))
                    {
                        iSel = null;
                        eSel = null;
                    };
                }
                else
                {
                    if (_arg_1.eventType == "clearState")
                    {
                        iSel = null;
                        eSel = null;
                    }
                    else
                    {
                        iSel = _arg_1.fData.iSel;
                        eSel = _arg_1.fData.eSel;
                        if (((iSel == null) && (!(eSel == null))))
                        {
                            iSel = eSel;
                            eSel = null;
                        };
                    };
                };
            };
            fDraw();
        }

        private function showStats():void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_10:MovieClip;
            var _local_11:Object;
            while (mcStats.numChildren > 1)
            {
                mcStats.removeChildAt(1);
            };
            mcStats.sproto.x = 0;
            mcStats.sproto.y = (tDesc.textHeight + 8);
            var _local_1:* = (!(eSel == null));
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:* = "";
            var _local_9:Class = (mcStats.sproto.constructor as Class);
            if (((!(iSel == null)) && ((((!(iEnh == null)) || (!(eEnh == null))) && ((eSel == null) || (eSel.sES == iSel.sES))) || ((_local_1) && (eSel.sES == iSel.sES)))))
            {
                if (((_local_1) && (!(iEnh == null))))
                {
                    _local_2 = rootClass.getStatsA(eSel, iSel.sES);
                    _local_3 = rootClass.getStatsA(iSel, iSel.sES);
                }
                else
                {
                    _local_11 = rootClass.copyObj(iSel);
                    if (_local_1)
                    {
                        _local_11.EnhPatternID = eSel.PatternID;
                        _local_11.EnhLvl = eSel.iLvl;
                        _local_11.EnhRty = eSel.iRty;
                        _local_1 = false;
                    };
                    _local_2 = rootClass.getStatsA(_local_11, iSel.sES);
                };
                _local_4 = 0;
                while (_local_4 < rootClass.orderedStats.length)
                {
                    _local_8 = rootClass.orderedStats[_local_4];
                    _local_7 = 0;
                    if ((((_local_1) && (!(_local_3[("$" + _local_8)] == null))) && (_local_2[("$" + _local_8)] == null)))
                    {
                        _local_2[("$" + _local_8)] = 0;
                    };
                    if (_local_2[("$" + _local_8)] != null)
                    {
                        _local_10 = new (_local_9)();
                        _local_6 = _local_2[("$" + _local_8)];
                        _local_10.tSta.text = rootClass.getFullStatName(_local_8);
                        _local_10.tOldval.visible = false;
                        if (_local_1)
                        {
                            if (_local_3[("$" + _local_8)] != null)
                            {
                                _local_7 = _local_3[("$" + _local_8)];
                            };
                            _local_10.tOldval.text = (("(" + _local_7) + ")");
                            _local_10.tOldval.visible = true;
                            if (_local_6 > _local_7)
                            {
                                _local_10.tVal.htmlText = (("<font color='#33FF66'>" + _local_6) + "</font>");
                            }
                            else
                            {
                                if (_local_6 == _local_7)
                                {
                                    _local_10.tVal.htmlText = (("<font color='#FFFFFF'>" + _local_6) + "</font>");
                                }
                                else
                                {
                                    _local_10.tVal.htmlText = (("<font color='#FF6633'>" + _local_6) + "</font>");
                                };
                            };
                        }
                        else
                        {
                            _local_10.tVal.htmlText = (('<font color="0xFFFFFF">' + _local_6) + "</font>");
                        };
                        _local_10.tOldval.x = ((_local_10.tVal.x + _local_10.tVal.textWidth) + 3);
                        _local_10.x = (mcStats.sproto.x + ((_local_5 % 3) * 100));
                        _local_10.y = (mcStats.sproto.y + (Math.floor((_local_5 / 3)) * 16));
                        _local_10.hit.alpha = 0;
                        _local_10.addEventListener(MouseEvent.MOUSE_OVER, onTTFieldMouseOver, false, 0, true);
                        _local_10.addEventListener(MouseEvent.MOUSE_OUT, onTTFieldMouseOut, false, 0, true);
                        _local_10.name = ("t" + _local_8);
                        mcStats.addChild(_local_10);
                        _local_5++;
                    };
                    _local_4++;
                };
                mcStats.visible = true;
            }
            else
            {
                mcStats.visible = false;
            };
        }

        private function onTTFieldMouseOver(_arg_1:MouseEvent):void
        {
            var _local_2:String = _arg_1.currentTarget.name;
            var _local_3:* = "";
            switch (_local_2)
{
    case "tAP":
        _local_3 = "O Poder de Ataque aumenta a eficácia de seus ataques de dano físico.";
        break;
    case "tSP":
        _local_3 = "O Poder Mágico aumenta a eficácia de seus ataques de dano mágico.";
        break;
    case "tDmg":
        _local_3 = "Este é o dano que você esperaria ver em um ataque corpo a corpo normal, antes de quaisquer outros modificadores.";
        break;
    case "tHP":
        _local_3 = "Seus Pontos de Vida totais. Quando estes chegarem a zero, você precisará esperar um curto período de tempo antes de poder continuar jogando.";
        break;
    case "tHitTF":
        _local_3 = "A chance de acerto determina a probabilidade de você acertar um alvo, antes de quaisquer outros modificadores.";
        break;
    case "tHasteTF":
        _local_3 = "A Velocidade reduz o tempo de recarga de todos os seus ataques e feitiços, incluindo o Ataque Automático, por uma certa porcentagem (limitado a 50%).";
        break;
    case "tCritTF":
        _local_3 = "A chance de Acerto Crítico aumenta a probabilidade de causar dano adicional em qualquer ataque.";
        break;
    case "tDodgeTF":
        _local_3 = "A chance de Evasão permite que você evite completamente o dano recebido.";
        break;
    case "tSTR":
    case "sl1":
        _local_3 = "Força aumenta o Poder de Ataque, o que aumenta o dano físico. Também melhora a chance de Acerto Crítico para classes corpo a corpo.";
        break;
    case "tINT":
    case "sl2":
        _local_3 = "Inteligência aumenta o Poder Mágico, o que aumenta o dano mágico. Também melhora a chance de Acerto Crítico para classes de conjuração.";
        break;
    case "tEND":
    case "sl3":
        _local_3 = "Endurance contribui diretamente para seus Pontos de Vida totais. Embora seja muito útil para todas as classes, algumas habilidades funcionam melhor com HP total muito alto ou muito baixo.";
        break;
    case "tDEX":
    case "sl4":
        _local_3 = "Destreza é valiosa para classes corpo a corpo. Aumenta a Velocidade, a Chance de Acerto e a Chance de Evasão. Aumenta apenas a Chance de Evasão para classes de conjuração.";
        break;
    case "tWIS":
    case "sl5":
        _local_3 = "Sabedoria é valiosa para classes de conjuração. Aumenta a Chance de Acerto, Chance de Crítico e Chance de Evasão. Melhora apenas a Chance de Evasão para classes corpo a corpo.";
        break;
    case "tLCK":
    case "sl6":
        _local_3 = "Sorte aumenta diretamente o valor do seu modificador de Acerto Crítico e pode ter efeitos fora do combate.";
        break;
}
            rootClass.ui.ToolTip.openWith({"str":_local_3});
        }

        private function onTTFieldMouseOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }


    }
}//package 

