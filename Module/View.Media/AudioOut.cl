class AudioOut : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Extern : share Extern;

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
        extern.AudioOUt_Delete(this.Intern);
        return true;
    }

    field private Extern Extern { get { return data; } set { data : value; } }
    field pronate Int Intern { get { return data; } set { data : value; } }
}