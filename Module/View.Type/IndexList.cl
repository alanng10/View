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
        this.SignExecute : this.AddSignIndex(";");
        this.SignAre : this.AddSignIndex(":");
        this.SignTail : this.AddSignIndex("'");
        this.SignQuote : this.AddSignIndex("\"");
        this.SignPause : this.AddSignIndex(",");
        this.SignLessNite : this.AddSignIndex("<");
        this.SignLessSite : this.AddSignIndex(">");
        this.SignStop : this.AddSignIndex(".");
        this.SignDiv : this.AddSignIndex("/");
        this.SignQuest : this.AddSignIndex("?");
        this.SignNext : this.AddSignIndex("\\");
        this.SignOrn : this.AddSignIndex("|");

        this.InnSpace : this.AddSpaceIndex();
        this.InnGroupIndex : 0h01;
        this.InnTab : this.AddInnIndex();
        this.InnGroupIndex : 0h04;
        this.InnEnter : this.AddInnIndex();
        this.InnGroupIndex : 0h20;
        this.InnShift : this.AddInnIndex();
        return true;
    }

    field prusate Index AlphaA { get { return data; } set { data : value; } }
    field prusate Index AlphaB { get { return data; } set { data : value; } }
    field prusate Index AlphaC { get { return data; } set { data : value; } }
    field prusate Index AlphaD { get { return data; } set { data : value; } }
    field prusate Index AlphaE { get { return data; } set { data : value; } }
    field prusate Index AlphaF { get { return data; } set { data : value; } }
    field prusate Index AlphaG { get { return data; } set { data : value; } }
    field prusate Index AlphaH { get { return data; } set { data : value; } }
    field prusate Index AlphaI { get { return data; } set { data : value; } }
    field prusate Index AlphaJ { get { return data; } set { data : value; } }
    field prusate Index AlphaK { get { return data; } set { data : value; } }
    field prusate Index AlphaL { get { return data; } set { data : value; } }
    field prusate Index AlphaM { get { return data; } set { data : value; } }
    field prusate Index AlphaN { get { return data; } set { data : value; } }
    field prusate Index AlphaO { get { return data; } set { data : value; } }
    field prusate Index AlphaP { get { return data; } set { data : value; } }
    field prusate Index AlphaQ { get { return data; } set { data : value; } }
    field prusate Index AlphaR { get { return data; } set { data : value; } }
    field prusate Index AlphaS { get { return data; } set { data : value; } }
    field prusate Index AlphaT { get { return data; } set { data : value; } }
    field prusate Index AlphaU { get { return data; } set { data : value; } }
    field prusate Index AlphaV { get { return data; } set { data : value; } }
    field prusate Index AlphaW { get { return data; } set { data : value; } }
    field prusate Index AlphaX { get { return data; } set { data : value; } }
    field prusate Index AlphaY { get { return data; } set { data : value; } }
    field prusate Index AlphaZ { get { return data; } set { data : value; } }
    field prusate Index Digit0 { get { return data; } set { data : value; } }
    field prusate Index Digit1 { get { return data; } set { data : value; } }
    field prusate Index Digit2 { get { return data; } set { data : value; } }
    field prusate Index Digit3 { get { return data; } set { data : value; } }
    field prusate Index Digit4 { get { return data; } set { data : value; } }
    field prusate Index Digit5 { get { return data; } set { data : value; } }
    field prusate Index Digit6 { get { return data; } set { data : value; } }
    field prusate Index Digit7 { get { return data; } set { data : value; } }
    field prusate Index Digit8 { get { return data; } set { data : value; } }
    field prusate Index Digit9 { get { return data; } set { data : value; } }
    field prusate Index SignBackTick { get { return data; } set { data : value; } }
    field prusate Index SignNot { get { return data; } set { data : value; } }
    field prusate Index SignExclamate { get { return data; } set { data : value; } }
}