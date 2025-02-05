namespace Demo;

class VideoOut : MediaVideoOut
{
    public virtual Demo Demo { get; set; }

    protected override bool FrameEvent()
    {
        this.Demo.Play.VideoOut.Image(this.Demo.PlayImage);

        this.Demo.ViewInfra.AssignDrawRectValue(this.Demo.UpdateRect, this.Demo.ViewA.Area);

        this.Demo.Frame.Update(this.Demo.UpdateRect);
        return true;
    }
}