class Field : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.State : new FieldState;
        this.State.Init();
        this.State.Field : this;
        this.SetModArg : new Mod;
        this.SetModArg.Init();
        return true;
    }
}