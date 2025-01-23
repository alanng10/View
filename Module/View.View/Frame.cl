class Frame : FrameFrame
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ViewInfra : share Infra;

        this.Draw : this.CreateDraw();
        return true;
    }

    maide prusate Bool Final()
    {
        this.FinalDraw(this.Draw);

        base.Final();
        return true;
    }

    maide precate Draw CreateDraw()
    {
        var Draw a;
        a : new Draw;
        a.Init();
        a.Out : this.DrawImage.Out;
        a.Size.Wed : this.Size.Wed;
        a.Size.Het : this.Size.Het;
        a.SizeSet();
        return a;
    }

    maide precate Bool FinalDraw(var Draw a)
    {
        a.Final();
        return true;
    }

    field prusate View View { get { return data; } set { data : value; } }
    field prusate Type Type { get { return data; } set { data : value; } }
    field precate Infra ViewInfra { get { return data; } set { data : value; } }
    field precate Draw Draw { get { return data; } set { data : value; } }
}