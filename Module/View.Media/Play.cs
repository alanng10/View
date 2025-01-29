namespace View.Media;

public class Play : Any
{
    public override bool Init()
    {
        base.Init();
        this.Intern = Extern.Play_New();
        Extern.Play_Init(this.Intern);
        return true;
    }

    public virtual bool Final()
    {
        Extern.Play_Final(this.Intern);
        Extern.Play_Delete(this.Intern);
        return true;
    }

    public virtual Stream Source { get; set; }
    public virtual VideoOut VideoOut { get; set; }
    public virtual AudioOut AudioOut { get; set; }
    private ulong Intern { get; set; }

    public virtual bool SourceSet()
    {
        ulong k;
        k = (ulong)this.Source.Ident;

        Extern.Play_SourceSet(this.Intern, k);
        Extern.Play_SourceThisSet(this.Intern);
        Extern.Play_SourceSet(this.Intern, 0);
        return true;
    }

    public virtual bool Execute()
    {
        Extern.Play_Execute(this.Intern);
        return true;
    }

    public virtual bool Pause()
    {
        Extern.Play_Pause(this.Intern);
        return true;
    }

    public virtual bool Stop()
    {
        Extern.Play_Stop(this.Intern);
        return true;
    }

    public virtual bool AudioOutSet()
    {
        ulong u;
        u = 0;
        if (!(this.AudioOut == null))
        {
            u = this.AudioOut.Intern;
        }
        Extern.Play_AudioOutSet(this.Intern, u);
        return true;
    }

    public virtual bool VideoOutSet()
    {
        ulong u;
        u = 0;
        if (!(this.VideoOut == null))
        {
            u = this.VideoOut.Intern;
        }
        Extern.Play_VideoOutSet(this.Intern, u);
        return true;
    }

    public virtual long Time
    {
        get
        {
            ulong k;
            k = Extern.Play_TimeGet(this.Intern);
            long a;
            a = (long)k;
            return a;
        }
        set
        {
        }
    }

    public virtual long Pos
    {
        get
        {
            ulong k;
            k = Extern.Play_PosGet(this.Intern);
            long a;
            a = (long)k;
            return a;
        }
        set
        {
            ulong k;
            k = (ulong)value;

            Extern.Play_PosSet(this.Intern, k);
        }
    }
}