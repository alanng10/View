class IndexList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.TextInfra : share TextInfra;
        this.InnStart : 0h80;
        this.Count : 0h100;
        this.AlphaIndex : 0;
        this.DigitIndex : 0;
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
        this.SignAte : this.AddSignIndex("@");
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
        this.InnTable : this.AddInnIndex();
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
    field prusate Index SignAte { get { return data; } set { data : value; } }
    field prusate Index SignHash { get { return data; } set { data : value; } }
    field prusate Index SignDollar { get { return data; } set { data : value; } }
    field prusate Index SignPercent { get { return data; } set { data : value; } }
    field prusate Index SignExpo { get { return data; } set { data : value; } }
    field prusate Index SignAnd { get { return data; } set { data : value; } }
    field prusate Index SignMul { get { return data; } set { data : value; } }
    field prusate Index SignBraceRoundLite { get { return data; } set { data : value; } }
    field prusate Index SignBraceRoundRite { get { return data; } set { data : value; } }
    field prusate Index SignSub { get { return data; } set { data : value; } }
    field prusate Index SignLine { get { return data; } set { data : value; } }
    field prusate Index SignSame { get { return data; } set { data : value; } }
    field prusate Index SignAdd { get { return data; } set { data : value; } }
    field prusate Index SignBraceCurveLite { get { return data; } set { data : value; } }
    field prusate Index SignBraceCurveRite { get { return data; } set { data : value; } }
    field prusate Index SignBraceRightLite { get { return data; } set { data : value; } }
    field prusate Index SignBraceRightRite { get { return data; } set { data : value; } }
    field prusate Index SignExecute { get { return data; } set { data : value; } }
    field prusate Index SignAre { get { return data; } set { data : value; } }
    field prusate Index SignTail { get { return data; } set { data : value; } }
    field prusate Index SignQuote { get { return data; } set { data : value; } }
    field prusate Index SignPause { get { return data; } set { data : value; } }
    field prusate Index SignLessNite { get { return data; } set { data : value; } }
    field prusate Index SignLessSite { get { return data; } set { data : value; } }
    field prusate Index SignStop { get { return data; } set { data : value; } }
    field prusate Index SignDiv { get { return data; } set { data : value; } }
    field prusate Index SignQuest { get { return data; } set { data : value; } }
    field prusate Index SignNext { get { return data; } set { data : value; } }
    field prusate Index SignOrn { get { return data; } set { data : value; } }
    field prusate Index InnSpace { get { return data; } set { data : value; } }
    field prusate Index InnTable { get { return data; } set { data : value; } }
    field prusate Index InnEnter { get { return data; } set { data : value; } }
    field prusate Index InnShift { get { return data; } set { data : value; } }
    field prusate Int InnStart { get { return data; } set { data : value; } }
    field prusate Int Count { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate Array Array { get { return data; } set { data : value; } }
    field precate Int AlphaIndex { get { return data; } set { data : value; } }
    field precate Int DigitIndex { get { return data; } set { data : value; } }
    field precate Int InnGroupIndex { get { return data; } set { data : value; } }

    maide precate Index AddAlphaIndex()
    {
        var Int index;
        index : this.AlphaIndex + this.TextInfra.Char("A");

        var Index a;
        a : this.AddIndex(index, index);

        this.AlphaIndex : this.AlphaIndex + 1;
        return a;
    }

    maide precate Index AddDigitIndex()
    {
        var Int index;
        index : this.DigitIndex + this.TextInfra.Char("0");

        var Index a;
        a : this.AddIndex(index, index);

        this.DigitIndex : this.DigitIndex + 1;
        return a;
    }

    maide precate Index AddSignIndex(var String char)
    {
        var Int index;
        index : this.TextInfra.Char(char);
        var Index a;
        a : this.AddIndex(index, index);
        return a;
    }

    maide precate Index AddInnIndex()
    {
        var Int index;
        index : this.InnGroupIndex + this.InnStart;
        var Index a;
        a : this.AddIndex(index, 0);
        this.InnGroupIndex : this.InnGroupIndex + 1;
        return a;
    }

    maide precate Index AddSpaceIndex()
    {
        var Int index;
        index : this.TextInfra.Char(" ");
        var Index a;
        a : this.AddIndex(index, 0);
        return a;
    }

    maide precate Index AddIndex(var Int index, var Int char)
    {
        char : bit &(char, 0hff);

        var Index a;
        a : new Index;
        a.Init();
        a.Index : index;
        a.Char : char;
        this.Array.Set(a.Index, a);
        return a; 
    }

    maide prusate Index Get(var Int index)
    {
        return cast Index(this.Array.Get(index));
    }

    maide prusate Index Alpha(var Int index)
    {
        var Int start;
        start : this.TextInfra.Char("A");
        return this.PosIndex(index, start);
    }

    maide prusate Index Digit(var Int index)
    {
        var Int start;
        start : this.TextInfra.Char("0");
        return this.PosIndex(index, start);
    }

    maide precate Index PosIndex(var Int index, var Int start)
    {
        var Int k;
        k : start + index;
        var Index a;
        a : this.Get(k);
        return a;
    }
}