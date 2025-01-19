namespace View.Infra;

public class StateTable : Table
{
    public override bool Init()
    {
        RefLess less;
        less = new RefLess();
        less.Init();
        this.Less = less;

        base.Init();
        this.ListInfra = ListInfra.This;
        return true;
    }

    protected virtual ListInfra ListInfra { get; set; }

    public virtual bool AddState(State state)
    {
        this.ListInfra.TableAdd(this, state, state);
        return true;
    }

    public virtual bool RemState(State state)
    {
        this.Rem(state);
        return true;
    }
}