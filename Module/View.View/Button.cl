class Button : View
{
    maide prusate Bool Final()
    {
        this.FinalBack(this.Back);
        return true;
    }

    maide precate DrawBrush CreateBack()
    {
        return this.DrawInfra.BrushCreate(this.Palete.Back);
    }

    maide precate Bool FinalBack(var DrawBrush a)
    {
        a.Final();
        return true;
    }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        base.ExecuteDrawThis(draw);
        return true;
    }
}