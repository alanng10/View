class ListState : State
{
    field prusate List List { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        var Mod mod;
        mod : cast Mod(this.Arg);
        var Comp item;
        item : mod.Comp;
        this.List.ListMod(item);
        return true;
    }
}