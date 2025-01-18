class FieldState : State
{
    field prusate Field Field { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        var Mod mod;
        mod : cast Mod(this.Arg);

        this.Field.Comp.Mod(this.Field, mod);
        return true;
    }
}