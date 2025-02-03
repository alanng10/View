namespace Demo;

class Play : MediaPlay
{
    public override bool Init()
    {
        StorageMode mediaStorageMode;
        mediaStorageMode = new StorageMode();
        mediaStorageMode.Init();
        mediaStorageMode.Read = true;

        Storage mediaStorage;
        mediaStorage = new Storage();
        mediaStorage.Init();
        mediaStorage.Path = this.S("ViewDemoData/Video.mp4");
        mediaStorage.Mode = mediaStorageMode;
        mediaStorage.Open();

        VideoOut videoOut;
        videoOut = new VideoOut();
        videoOut.Init();
        videoOut.Demo = this.Demo;

        long scaleFactor;
        scaleFactor = 1 << 20;

        long volume;
        volume = this.MathValue(scaleFactor / 8, -20);

        MediaAudioOut audioOut;
        audioOut = new MediaAudioOut();
        audioOut.Init();
        audioOut.Volume = volume;

        base.Init();
        this.Source = mediaStorage.Stream;
        this.SourceSet();
        this.VideoOut = videoOut;
        this.AudioOut = audioOut;
        this.VideoOutSet();
        this.AudioOutSet();
        return true;
    }

    public virtual bool Final()
    {
        base.Final();

        this.AudioOut.Final();

        this.VideoOut.Final();
        return true;
    }

    public virtual Demo Demo { get; set; }
}