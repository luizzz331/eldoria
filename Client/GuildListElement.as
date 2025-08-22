package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.external.*;
    import flash.utils.*;

    public dynamic class GuildListElement extends MovieClip 
    {

        public var rootClass:*;
        public var txtName:TextField;
        public var txtOwner:TextField;
        public var txtSlot:TextField;
        public var txtStatus:TextField;
        public var txtLvl:TextField;
        public var GuildID:int;

        public function GuildListElement(_arg_1:MovieClip)
        {
            rootClass = _arg_1;
        }

    }
}