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
}