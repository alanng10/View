namespace View.Infra;

public class FieldState : State
{
    public virtual Field Field { get; set; }

    public override bool Execute()
    {
        Mod mod;
        mod = this.Arg as Mod;
        this.Field.Comp.Mod(this.Field, mod);
        return true;
    }
}