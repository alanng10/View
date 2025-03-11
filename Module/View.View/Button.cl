class Button : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Focus : false;
        return true;
    }

    maide precate DrawBrush CreateBack()
    {
        return this.Palete.Back.Brush;
    }

    field prusate Field FocusField { get { return data; } set { data : value; } }

    field prusate Bool Focus
    {
        get
        {
            return cast Bool(this.FocusField.GetAny());
        }
        set
        {
            this.FocusField.SetAny(value);
        }
    }

    maide precate Bool ModFocus(var Mod mod)
    {
        this.Event(this.FocusField);
        return true;
    }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        base.ExecuteDrawThis(draw);
        return true;
    }
}