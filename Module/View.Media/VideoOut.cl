class VideoOut : Any
{
    maide private Bool PrivateFrameEvent()
    {
        this.FrameEvent();
        return true;
    }

    maide prusate Bool Init()
    {
        base.Init();
        this.InternIntern : share Intern;
        this.Extern : share Extern;
        this.InternInfra : share InternInfra;

        var Int ka;
        ka : this.InternIntern.StateVideoOutFrameEvent();
        var Int arg;
        arg : this.InternIntern.Memory(this);
        this.InternFrameState : this.InternInfra.StateCreate(ka, arg);

        var Extern extern;
        extern : this.Extern;

        this.InternFrame : extern.VideoFrame_New();
        extern.VideoFrame_Init(this.InternFrame);

        this.Intern : extern.VideoOut_New();
        extern.VideoOut_Init(this.Intern);
        extern.VideoOut_FrameEventStateSet(this.Intern, this.InternFrameState);

        extern.VideoOut_FrameSet(this.Intern, this.InternFrame);
        return true;
    }

    maide prusate Bool Final()
    {
        var Extern extern;
        extern : this.Extern;

        extern.VideoOut_Final(this.Intern);
        extern.VideoOut_Delete(this.Intern);

        extern.VideoFrame_Final(this.InternFrame);
        extern.VideoFrame_Delete(this.InternFrame);

        this.InternInfra.StateDelete(this.InternFrameState);
    }
}