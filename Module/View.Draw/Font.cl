class Font : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Extern : share Extern;
        this.InternInfra : share InternInfra;

        this.InternName : this.InternInfra.StringCreate(this.Name);

        var Int tendenK;
        tendenK : this.InternInfra.Bool(this.Tenden);
        var Int stalineK;
        stalineK : this.InternInfra.Bool(this.Staline);
        var Int midlineK;
        midlineK : this.InternInfra.Bool(this.Midline);
        var Int endlineK;
        endlineK : this.InternInfra.Bool(this.Endline);

        var Extern extern;
        extern : this.Extern;

        this.Intern : extern.Font_New();
        extern.Font_NameSet(this.Intern, this.InternName);
        extern.Font_SizeSet(this.Intern, this.Size);
        extern.Font_StrongSet(this.Intern, this.Strong);
        extern.Font_TendenSet(this.Intern, tendenK);
        extern.Font_StalineSet(this.Intern, stalineK);
        extern.Font_MidlineSet(this.Intern, midlineK);
        extern.Font_EndlineSet(this.Intern, endlineK);
        extern.Font_Init(this.Intern);
        return true;
    }

    maide prusate Bool Final()
    {
        var Extern extern;
        extern : this.Extern;

        extern.Font_Final(this.Intern);
        extern.Font_Delete(this.Intern);

        this.InternInfra.StringDelete(this.InternName);
        return true;
    }

    field prusate String Name { get { return data; } set { data : value; } }
    field prusate Int Size { get { return data; } set { data : value; } }
    field prusate Int Strong { get { return data; } set { data : value; } }
    field prusate Bool Tenden { get { return data; } set { data : value; } }
    field prusate Bool Staline { get { return data; } set { data : value; } }
    field prusate Bool Midline { get { return data; } set { data : value; } }
    field prusate Bool Endline { get { return data; } set { data : value; } }
    field private Extern Extern { get { return data; } set { data : value; } }
    field private InternInfra InternInfra { get { return data; } set { data : value; } }
    field pronate Int Intern { get { return data; } set { data : value; } }
    field private Int InternName { get { return data; } set { data : value; } }
}