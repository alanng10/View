class Play : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Extern : share Extern;

        var Extern extern;
        extern : this.Extern;

        this.Intern : extern.Play_New();
        extern.Play_Init(this.Intern);
        return true;
    }

    maide prusate Bool Final()
    {
        var Extern extern;
        extern : this.Extern;

        extern.Play_Final(this.Intern);
        extern.Play_Delete(this.Intern);
        return true;
    }

    field prusate Stream Source { get { return data; } set { data : value; } }
    field prusate VideoOut VideoOut { get { return data; } set { data : value; } }
    field prusate AudioOut AudioOut { get { return data; } set { data : value; } }
    field private Extern Extern { get { return data; } set { data : value; } }
    field private Int Intern { get { return data; } set { data : value; } }

    maide prusate Bool SourceSet()
    {
        var Int k;
        k : cast Int(this.Source.Ident);

        var Extern extern;
        extern : this.Extern;

        extern.Play_SourceSet(this.Intern, k);
        extern.Play_SourceThisSet(this.Intern);
        extern.Play_SourceSet(this.Intern, 0);
        return true;
    }

    maide prusate Bool Execute()
    {
        this.Extern.Play_Execute(this.Intern);
        return true;
    }

    maide prusate Bool Pause()
    {
        this.Extern.Play_Pause(this.Intern);
        return true;
    }

    maide prusate Bool Stop()
    {
        this.Extern.Play_Stop(this.Intern);
        return true;
    }
}