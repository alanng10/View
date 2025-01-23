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
}