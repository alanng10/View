namespace View.Infra;

public class ListState : State
{
    public virtual List List { get; set; }

    public override bool Execute()
    {
        Mod mod;
        mod = this.Arg as Mod;
        Comp item;
        item = mod.Comp;
        this.List.ItemChange(item);
        return true;
    }
}