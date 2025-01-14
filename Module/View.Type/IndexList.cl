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
    }
}