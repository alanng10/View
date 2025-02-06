class ThreadState : State
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathComp : new MathComp;
        this.MathComp.Init();
        return true;
    }

    field prusate Demo Demo { get { return data; } set { data : value; } }
    field prusate DrawImage Image { get { return data; } set { data : value; } }
    field precate MathComp MathComp { get { return data; } set { data : value; } }
}