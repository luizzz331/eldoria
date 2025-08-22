// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//mcSkel

package 
{
    import flash.display.MovieClip;
    import flash.geom.Point;

    public class mcSkel extends MovieClip 
    {

        public var idlefoot:MovieClip;
        public var chest:MovieClip;
        public var weaponOff:MovieClip;
        public var frontthigh:MovieClip;
        public var cape:MovieClip;
        public var frontshoulder:MovieClip;
        public var weaponFistOff:MovieClip;
        public var hitbox:MovieClip;
        public var head:MovieClip;
        public var backshoulder:MovieClip;
        public var hip:MovieClip;
        public var backthigh:MovieClip;
        public var backhair:MovieClip;
        public var weaponFist:MovieClip;
        public var backshin:MovieClip;
        public var weaponTemp:MovieClip;
        public var robe:MovieClip;
        public var pvpFlag:MovieClip;
        public var weapon:MovieClip;
        public var frontshin:MovieClip;
        public var backfoot:MovieClip;
        public var backrobe:MovieClip;
        public var arrow:MovieClip;
        public var emoteFX:MovieClip;
        public var shield:MovieClip;
        public var frontfoot:MovieClip;
        public var backhand:MovieClip;
        public var fronthand:MovieClip;
        public var animLoop:int;
        public var avtMC:MovieClip;
        public var projClass:Class;
        public var projMC:MovieClip;
        public var sp:Point;
        public var ep:Point;
        public var onMove:Boolean = false;

        public function mcSkel()
        {
            addFrameScript(0, frame1, 7, frame8, 8, frame9, 16, frame17, 20, frame21, 27, frame28, 32, frame33, 40, frame41, 45, frame46, 53, frame54, 67, frame68, 68, frame69, 84, frame85, 85, frame86, 92, frame93, 98, frame99, 99, frame100, 116, frame117, 117, frame118, 130, frame131, 131, frame132, 155, frame156, 165, frame166, 166, frame167, 185, frame186, 186, frame187, 200, frame201, 209, frame210, 210, frame211, 244, frame245, 245, frame246, 261, frame262, 262, frame263, 271, frame272, 280, frame281, 288, frame289, 289, frame290, 309, frame310, 312, frame313, 313, frame314, 345, frame346, 346, frame347, 364, frame365, 366, frame367, 367, frame368, 392, frame393, 393, frame394, 457, frame458, 458, frame459, 475, frame476, 494, frame495, 502, frame503, 510, frame511, 511, frame512, 0x0200, frame513, 558, frame559, 559, frame560, 589, frame590, 590, frame591, 598, frame599, 599, frame600, 607, frame608, 620, frame621, 621, frame622, 632, frame633, 633, frame634, 636, frame637, 652, frame653, 653, frame654, 656, frame657, 682, frame683, 683, frame684, 687, frame688, 711, frame712, 712, frame713, 716, frame717, 739, frame740, 740, frame741, 757, frame758, 758, frame759, 779, frame780, 780, frame781, 786, frame787, 787, frame788, 816, frame817, 817, frame818, 840, frame841, 841, frame842, 844, frame845, 861, frame862, 862, frame863, 865, frame866, 888, frame889, 889, frame890, 892, frame893, 914, frame915, 915, frame916, 918, frame919, 932, frame933, 933, frame934, 944, frame945, 945, frame946, 948, frame949, 964, frame965, 965, frame966, 968, frame969, 979, frame980, 980, frame981, 1001, frame1002, 1002, frame1003, 1013, frame1014, 1014, frame1015, 1018, frame1019, 1027, frame1028, 0x0404, frame1029, 1031, frame1032, 1042, frame1043, 1043, frame1044, 1053, frame1054, 1057, frame1058, 1066, frame1067, 1067, frame1068, 1070, frame1071, 1081, frame1082, 1082, frame1083, 1093, frame1094, 1094, frame1095, 1097, frame1098, 1109, frame1110, 1110, frame1111, 1113, frame1114, 1122, frame1123, 1123, frame1124, 1134, frame1135, 1135, frame1136, 1137, frame1138, 1138, frame1139, 1152, frame1153, 1153, frame1154, 1157, frame1158, 1174, frame1175, 1178, frame1179, 1184, frame1185, 1185, frame1186, 1188, frame1189, 1197, frame1198, 1198, frame1199, 1200, frame1201, 1214, frame1215, 1215, frame1216, 1226, frame1227, 1227, frame1228, 1228, frame1229, 1238, frame1239, 1250, frame1251, 1251, frame1252, 1270, frame1271, 1271, frame1272, 0x0505, frame1286, 1286, frame1287, 1301, frame1302, 1302, frame1303, 1335, frame1336, 1336, frame1337, 1373, frame1374, 1374, frame1375, 1382, frame1383, 1383, frame1384, 1455, frame1456, 1456, frame1457, 1493, frame1494, 1494, frame1495, 1509, frame1510, 1510, frame1511, 1519, frame1520, 1520, frame1521, 1551, frame1552, 1552, frame1553, 1555, frame1556, 1578, frame1579, 1579, frame1580, 1582, frame1583, 1604, frame1605, 1605, frame1606, 1621, frame1622, 1622, frame1623, 1635, frame1636, 1636, frame1637, 1655, frame1656, 1656, frame1657, 1697, frame1698);
        }

        public function emoteLoopFrame():int
        {
            var _local_1:int;
            while (_local_1 < currentLabels.length)
            {
                if (currentLabels[_local_1].name == currentLabel)
                {
                    return (currentLabels[_local_1].frame);
                };
                _local_1++;
            };
            return (8);
        }

        public function emoteLoop(_arg_1:int, _arg_2:Boolean=true):void
        {
            var _local_3:int = emoteLoopFrame();
            if (_local_3 > 8)
            {
                if (++animLoop < _arg_1)
                {
                    this.gotoAndPlay((_local_3 + 1));
                    return;
                };
            };
            if (_arg_2)
            {
                this.gotoAndPlay("Idle");
            };
        }

        public function showIdleFoot():*
        {
            frontfoot.visible = false;
            idlefoot.visible = true;
        }

        public function showFrontFoot():*
        {
            idlefoot.visible = false;
            frontfoot.visible = true;
        }

        override public function gotoAndPlay(_arg_1:Object, _arg_2:String=null):void
        {
            handleAnimEvent(String(_arg_1));
            super.gotoAndPlay(_arg_1);
        }

        private function handleAnimEvent(_arg_1:String):void
        {
            var _local_3:Function;
            var _local_2:Object = MovieClip(parent).AnimEvent;
            if (_local_2[_arg_1] == null)
            {
                return;
            };
            var _local_4:uint;
            while (_local_4 < _local_2[_arg_1].length)
            {
                _local_3 = _local_2[_arg_1][_local_4];
                (_local_3());
                _local_4++;
            };
        }

        internal function frame1():*
        {
            animLoop = 0;
            avtMC = null;
            gotoAndPlay("Idle");
        }

        internal function frame8():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
            stop();
        }

        internal function frame9():*
        {
            gotoAndStop("Idle");
        }

        internal function frame17():*
        {
            showFrontFoot();
            cape.cape.gotoAndPlay("Move");
        }

        internal function frame21():*
        {
            if (this.onMove)
            {
                gotoAndPlay("mountWalk");
            };
        }

        internal function frame28():*
        {
            showFrontFoot();
            cape.cape.gotoAndPlay("Move");
        }

        internal function frame33():*
        {
            if (this.onMove)
            {
                gotoAndPlay("horseWalk");
            };
        }

        internal function frame41():*
        {
            showFrontFoot();
            cape.cape.gotoAndPlay("Move");
        }

        internal function frame46():*
        {
            if (this.onMove)
            {
                gotoAndPlay("throneWalk");
            };
        }

        internal function frame54():*
        {
            showFrontFoot();
            cape.cape.gotoAndPlay("Move");
        }

        internal function frame68():*
        {
            if (this.onMove)
            {
                gotoAndPlay("Walk");
            };
        }

        internal function frame69():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame85():*
        {
            gotoAndPlay("Dance");
        }

        internal function frame86():*
        {
            animLoop = 0;
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame93():*
        {
            emoteLoop(3, false);
        }

        internal function frame99():*
        {
            stop();
        }

        internal function frame100():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame117():*
        {
            stop();
        }

        internal function frame118():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame131():*
        {
            gotoAndPlay("Use");
        }

        internal function frame132():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame156():*
        {
            emoteLoop(3, false);
        }

        internal function frame166():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame167():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame186():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame187():*
        {
            animLoop = 0;
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame201():*
        {
            emoteLoop(3, false);
        }

        internal function frame210():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame211():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame245():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame246():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame262():*
        {
            gotoAndPlay("Airguitar");
        }

        internal function frame263():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame272():*
        {
            showFrontFoot();
        }

        internal function frame281():*
        {
            showIdleFoot();
        }

        internal function frame289():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame290():*
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame310():*
        {
            if (this.scaleX < 0)
            {
                emoteFX.scaleX = (emoteFX.scaleX * -1);
            };
        }

        internal function frame313():*
        {
            stop();
        }

        internal function frame314():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame346():*
        {
            if (this.onMove)
            {
                gotoAndPlay("Walk");
            };
            stop();
        }

        internal function frame347():*
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame365():*
        {
            showIdleFoot();
        }

        internal function frame367():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame368():*
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame393():*
        {
            gotoAndPlay("Dance2");
        }

        internal function frame394():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame458():*
        {
            gotoAndPlay("Swordplay");
        }

        internal function frame459():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame476():*
        {
            showFrontFoot();
        }

        internal function frame495():*
        {
            stop();
        }

        internal function frame503():*
        {
            animLoop = 0;
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame511():*
        {
            emoteLoop(3);
        }

        internal function frame512():*
        {
            stop();
        }

        internal function frame513():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame559():*
        {
            stop();
        }

        internal function frame560():*
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame590():*
        {
            stop();
        }

        internal function frame591():*
        {
            animLoop = 0;
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame599():*
        {
            emoteLoop(3);
        }

        internal function frame600():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame608():*
        {
            weapon.visible = true;
        }

        internal function frame621():*
        {
            stop();
        }

        internal function frame622():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame633():*
        {
            stop();
        }

        internal function frame634():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame637():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame653():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame654():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame657():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame683():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame684():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame688():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame712():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame713():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame717():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame740():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame741():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame758():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame759():*
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame780():*
        {
            stop();
        }

        internal function frame781():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame787():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame788():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame817():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame818():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame841():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame842():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame845():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame862():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame863():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame866():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame889():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame890():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame893():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame915():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame916():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame919():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame933():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame934():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame945():*
        {
            stop();
        }

        internal function frame946():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame949():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame965():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame966():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame969():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame980():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame981():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1002():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1003():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1014():*
        {
            stop();
        }

        internal function frame1015():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1019():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame1028():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1029():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1032():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame1043():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1044():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1054():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1058():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame1067():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1068():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1071():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame1082():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1083():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1094():*
        {
            stop();
        }

        internal function frame1095():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1098():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame1110():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1111():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1114():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame1123():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1124():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1135():*
        {
            stop();
        }

        internal function frame1136():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
            avtMC = MovieClip(parent);
        }

        internal function frame1138():*
        {
            if ((((avtMC.spFX.strl == null) || (avtMC.spFX.strl == "")) || (avtMC.spFX.avts == null)))
            {
                trace("creating projectile");
                if (avtMC.pAV.strProj != "")
                {
                    trace((("strProj:" + avtMC.pAV.strProj) + ":end"));
                    try
                    {
                        projClass = (avtMC.pAV.rootClass.world.getClass(avtMC.pAV.strProj) as Class);
                    }
                    catch(e)
                    {
                    };
                };
                trace(("projClass: " + projClass));
                if (projClass == null)
                {
                    projClass = (avtMC.pAV.rootClass.world.getClass("p_ar") as Class);
                };
                if (projClass != null)
                {
                    projMC = (new projClass() as MovieClip);
                    projMC.scaleX = (projMC.scaleX * 0.3);
                    projMC.scaleY = (projMC.scaleY * 0.3);
                    sp = backhand.localToGlobal(new Point(backhand.x, backhand.y));
                    projMC.x = sp.x;
                    projMC.y = sp.y;
                    ep = new Point(avtMC.pAV.target.pMC.x, avtMC.pAV.target.pMC.y);
                    ep.y = (ep.y - (avtMC.pAV.target.pMC.height / 3.5));
                    avtMC.pAV.rootClass.world.addChild(projMC);
                    avtMC.projClass = new Projectile(sp, ep, projMC, avtMC.pAV.rootClass);
                    projClass = null;
                };
            };
        }

        internal function frame1139():*
        {
            if ((((!(avtMC.spFX.strl == null)) && (!(avtMC.spFX.strl == ""))) && (!(avtMC.spFX.avts == null))))
            {
                MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null);
            };
        }

        internal function frame1153():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1154():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
            avtMC = MovieClip(parent);
        }

        internal function frame1158():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame1175():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1179():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1185():*
        {
            stop();
        }

        internal function frame1186():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1189():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame1198():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1199():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1201():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null, avtMC.spellDur);
            avtMC.spellDur = 0;
        }

        internal function frame1215():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1216():*
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1227():*
        {
            showIdleFoot();
        }

        internal function frame1228():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1229():*
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1239():*
        {
            showIdleFoot();
        }

        internal function frame1251():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1252():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1271():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1272():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1286():*
        {
            stop();
        }

        internal function frame1287():*
        {
            showFrontFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1302():*
        {
            stop();
        }

        internal function frame1303():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1336():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1337():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1374():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1375():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1383():*
        {
            gotoAndPlay("Cry2");
        }

        internal function frame1384():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1456():*
        {
            gotoAndPlay("Spar");
        }

        internal function frame1457():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1494():*
        {
            gotoAndPlay("Samba");
        }

        internal function frame1495():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1510():*
        {
            gotoAndPlay("Stepdance");
        }

        internal function frame1511():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1520():*
        {
            gotoAndPlay("Headbang");
        }

        internal function frame1521():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1552():*
        {
            gotoAndPlay("Dazed");
        }

        internal function frame1553():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1556():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null);
        }

        internal function frame1579():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1580():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1583():*
        {
            avtMC = MovieClip(parent);
            MovieClip(avtMC.parent.parent).castSpellFX(avtMC.pAV, avtMC.spFX, null);
        }

        internal function frame1605():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1606():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1622():*
        {
            gotoAndPlay("Danceweapon");
        }

        internal function frame1623():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1636():*
        {
            gotoAndPlay("Useweapon");
        }

        internal function frame1637():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1656():*
        {
            MovieClip(parent).endAction();
        }

        internal function frame1657():*
        {
            showIdleFoot();
            cape.cape.gotoAndStop("Idle");
        }

        internal function frame1698():*
        {
            MovieClip(parent).endAction();
        }


    }
}//package 

