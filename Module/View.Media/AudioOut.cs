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
            ulong k;
            k = Extern.AudioOut_MuteGet(this.Intern);
            bool a;
            a = !(k == 0);
            return a;
        }
        set
        {
            ulong k;
            k = this.InternInfra.Bool(value);
            Extern.AudioOut_MuteSet(this.Intern, k);
        }
    }

    public virtual long Volume
    {
        get
        {
            ulong k;
            k = Extern.AudioOut_VolumeGet(this.Intern);
            long a;
            a = (long)k;
            return a;
        }
        set
        {
            ulong k;
            k = (ulong)value;
            Extern.AudioOut_VolumeSet(this.Intern, k);
        }
    }

    private InternInfra InternInfra { get; set; }
    internal virtual ulong Intern { get; set; }
}