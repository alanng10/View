class Button : View
{
    maide precate DrawBrush CreateBack()
    {
        return this.Palete.Back;
    }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        base.ExecuteDrawThis(draw);
        return true;
    }
}