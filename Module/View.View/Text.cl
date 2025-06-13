class Text : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ValueField : this.CreateValueField();
        return true;
    }

    maide precate Field CreateValueField()
    {
        return this.ViewInfra.FieldCreate(this);
    }
}