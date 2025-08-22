// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//Game_fla.charicon_312

package Game_fla
{
    import flash.display.MovieClip;

    public dynamic class charicon_312 extends MovieClip 
    {

        public var buttons:Array;

        public function charicon_312()
        {
            addFrameScript(0, frame1);
        }

        internal function frame1():*
        {
            buttons = new Array(
			{
                "txt":"Stats & Class",
                "fct":"rootClass.toggleCharpanel"
            }, 
			{
                "txt":"Reputations",
                "fct":"rootClass.showFactionInterface"
            }, 
			{
                "txt":"Friends",
                "fct":"rootClass.world.showFriendsList"
            }, 
			{
                "txt":"Guild",
                "fct":"rootClass.world.showGuildList"
            },
			{
				"txt":"Temp Inventory",
                "fct":"toggleTempInventory"
            }, 
			{
                "txt":"Quests",
                "fct":"rootClass.world.toggleQuestLog"
			},
			{
                "txt":"Book of Lore",
                "fct":"rootClass.toggleBookOfLore"
			},
			{
                "txt":"Bank",
                "fct":"rootClass.world.toggleBank"
			},
			{
                "txt":"Redeem",
                "fct":"rootClass.toggleRedeemPanel"
			},
			{
                "txt":"PvP",
                "fct":"rootClass.togglePVPPanel2"
			},
			{"txt":"Your Hero"});
        }


    }
}//package Game_fla

