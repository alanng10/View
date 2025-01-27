namespace View.Media;

public class AudioOut : Any
{
    public override bool Init()
    {
        base.Init();
        this.InternInfra = InternInfra.This;

        this.Intern = Extern.AudioOut_New();
        Extern.AudioOut_Init(this.Intern);
        return true;
    }

    public virtual bool Final()
    {
        Extern.AudioOut_Final(this.Intern);
        Extern.AudioOut_Delete(this.Intern);
        return true;
    }

    public virtual bool Mute
    {
        get
        {
            ulong u;
            u = Extern.AudioOut_MuteGet(this.Intern);
            bool a;
            a = !(u == 0);
            return a;
        }
        set
        {
            ulong u;
            u = this.InternInfra.Bool(value);
            Extern.AudioOut_MuteSet(this.Intern, u);
        }
    }

    public virtual long Volume
    {
        get
        {
            ulong u;
            u = Extern.AudioOut_VolumeGet(this.Intern);
            long a;
            a = (long)u;
            return a;
        }
        set
        {
            ulong u;
            u = (ulong)value;
            Extern.AudioOut_VolumeSet(this.Intern, u);
        }
    }

    private InternInfra InternInfra { get; set; }
    internal virtual ulong Intern { get; set; }
}