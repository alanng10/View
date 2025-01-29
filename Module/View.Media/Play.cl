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

    field prusate Int Time
    {
        get
        {
            var Int a;
            a : this.Extern.Play_TimeGet(this.Intern);
            return a;
        }
        set
        {
        }
    }

    field prusate Int Pos
    {
        get
        {
            var Int a;
            a : this.Extern.Play_PosGet(this.Intern);
            return a;
        }
        set
        {
            this.Extern.Play_PosSet(this.Intern, value);
        }
    }

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

    maide prusate Bool VideoOutSet()
    {
        var Int k;
        k : 0;
        inf (~(this.VideoOut = null))
        {
            k : this.VideoOut.Intern;
        }
        this.Extern.Play_VideoOutSet(this.Intern, k);
        return true;
    }

    maide prusate Bool AudioOutSet()
    {
        var Int k;
        k : 0;
        inf (~(this.AudioOut = null))
        {
            k : this.AudioOut.Intern;
        }
        this.Extern.Play_AudioOutSet(this.Intern, k);
        return true;
    }
}