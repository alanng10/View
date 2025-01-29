class AudioOut : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Extern : share Extern;
        this.InternInfra : share InternInfra;

        var Extern extern;
        extern : this.Extern;

        this.Intern : extern.AudioOut_New();
        extern.AudioOut_Init(this.Intern);
        return true;
    }

    maide prusate Bool Final()
    {
        var Extern extern;
        extern : this.Extern;

        extern.AudioOut_Final(this.Intern);
        extern.AudioOut_Delete(this.Intern);
        return true;
    }

    field prusate Bool Mute
    {
        get
        {
            var Int k;
            k : this.Extern.AudioOut_MuteGet(this.Intern);

            var Bool a;
            a : ~(k = 0);
            return a;
        }
        set
        {
            var Int k;
            k : this.InternInfra.Bool(value);
            this.Extern.AudioOut_MuteSet(this.Intern, k);
        }
    }

    field prusate Int Volume
    {
        get
        {
            var Int a;
            a : this.Extern.AudioOut_VolumeGet(this.Intern);
            return a;
        }
        set
        {
            this.Extern.AudioOut_VolumeSet(this.Intern, value);
        }
    }

    field private Extern Extern { get { return data; } set { data : value; } }
    field private InternInfra InternInfra { get { return data; } set { data : value; } }
    field pronate Int Intern { get { return data; } set { data : value; } }
}