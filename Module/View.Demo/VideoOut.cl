class VideoOut : MediaVideoOut
{
    field prusate Demo Demo { get { return data; } set { data : value; } }

    maide precate Bool FrameEvent()
    {
        this.Image(this.Demo.PlayImage);

        this.Demo.ViewInfra.AssignDrawRectValue(this.Demo.UpdateRect, this.Demo.ViewA.Area);

        this.Demo.Frame.Update(this.Demo.UpdateRect);
        return true;
    }
}