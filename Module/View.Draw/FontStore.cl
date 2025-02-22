class FontStore : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InternIntern : share Intern;
        this.Extern : share Extern;
        return true;
    }

    field private Intern InternIntern { get { return data; } set { data : value; } }
    field private Extern Extern { get { return data; } set { data : value; } }

    maide prusate Int Add(var Data data, var Range range)
    {
        var Int dataValue;
        dataValue : this.InternIntern.Memory(data.Value);
        dataValue : dataValue + range.Index;

        var Extern extern;
        extern : this.Extern;

        var Int ka;
        ka : extern.Data_New();
        extern.Data_Init(ka);
        extern.Data_ValueSet(ka, dataValue);
        extern.Data_CountSet(ka, range.Count);

        var Int k;
        k : extern.FontStore_Add(0, ka);

        extern.Data_Final(ka);
        extern.Data_Delete(ka);

        var Int a;
        a : k;
        return a;
    }

    maide prusate Bool Rem(var Int ident)
    {
        var Int k;
        k : this.Extern.FontStore_Rem(0, ident);

        var Bool a;
        a : ~(k = 0);
        return a;
    }
}