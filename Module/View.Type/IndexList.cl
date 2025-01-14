class IndexList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.TextInfra : share TextInfra;
        this.Array : this.ListInfra.ArrayCreate(this.Count);

        this.AlphaA : this.AddAlphaIndex();
        this.AlphaB : this.AddAlphaIndex();
        this.AlphaC : this.AddAlphaIndex();
        this.AlphaD : this.AddAlphaIndex();
        this.AlphaE : this.AddAlphaIndex();
        this.AlphaF : this.AddAlphaIndex();
        this.AlphaG : this.AddAlphaIndex();
        this.AlphaH : this.AddAlphaIndex();
        this.AlphaI : this.AddAlphaIndex();
        this.AlphaJ : this.AddAlphaIndex();
        this.AlphaK : this.AddAlphaIndex();
        this.AlphaL : this.AddAlphaIndex();
        this.AlphaM : this.AddAlphaIndex();
        this.AlphaN : this.AddAlphaIndex();
        this.AlphaO : this.AddAlphaIndex();
        this.AlphaP : this.AddAlphaIndex();
        this.AlphaQ : this.AddAlphaIndex();
        this.AlphaR : this.AddAlphaIndex();
        this.AlphaS : this.AddAlphaIndex();
        this.AlphaT : this.AddAlphaIndex();
        this.AlphaU : this.AddAlphaIndex();
        this.AlphaV : this.AddAlphaIndex();
        this.AlphaW : this.AddAlphaIndex();
        this.AlphaX : this.AddAlphaIndex();
        this.AlphaY : this.AddAlphaIndex();
        this.AlphaZ : this.AddAlphaIndex();

        this.Digit0 : this.AddDigitIndex();
        this.Digit1 : this.AddDigitIndex();
        this.Digit2 : this.AddDigitIndex();
        this.Digit3 : this.AddDigitIndex();
        this.Digit4 : this.AddDigitIndex();
        this.Digit5 : this.AddDigitIndex();
        this.Digit6 : this.AddDigitIndex();
        this.Digit7 : this.AddDigitIndex();
        this.Digit8 : this.AddDigitIndex();
        this.Digit9 : this.AddDigitIndex();

        this.SignBackTick : this.AddSignIndex("`");
        this.SignNot : this.AddSignIndex("~");
        this.SignExclamate : this.AddSignIndex("!");
        this.SignAt : this.AddSignIndex("@");
        this.SignHash : this.AddSignIndex("#");
        this.SignDollar : this.AddSignIndex("$");
        this.SignPercent : this.AddSignIndex("%");
        this.SignExpo : this.AddSignIndex("^");
        this.SignAnd : this.AddSignIndex("&");
        this.SignMul : this.AddSignIndex("*");
        this.SignSub : this.AddSignIndex("-");
        this.SignLine : this.AddSignIndex("_");
        this.SignSame : this.AddSignIndex("=");
        this.SignAdd : this.AddSignIndex("+");
        this.SignBraceRoundLite : this.AddSignIndex("(");
        this.SignBraceRoundRite : this.AddSignIndex(")");
        this.SignBraceCurveLite : this.AddSignIndex("{");
        this.SignBraceCurveRite : this.AddSignIndex("}");
        this.SignBraceRightLite : this.AddSignIndex("[");
        this.SignBraceRightRite : this.AddSignIndex("]");
    }
}