class FontStore : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Extern : share Extern;
        this.InternInfra : share InternInfra;
        return true;
    }

    field private Extern Extern { get { return data; } set { data : value; } }
    field private InternInfra InternInfra { get { return data; } set { data : value; } }

    maide prusate Int Add(var Stream stream, var Range range)
    {
    }

    maide prusate Bool Rem(var Int ident)
    {
        var Int k;
        k : extern.FontStore_Rem(0, ident);

        var Bool a;
        a : ~(k = 0);
        return a;
    }
}