class Play : MediaPlay
{
    maide prusate Bool Init()
    {
        var StorageMode mode;
        mode : new StorageMode;
        mode.Init();
        mode.Read : true;

        this.MediaStorage : new Storage;
        this.MediaStorage.Init();
        this.MediaStorage.Path : "ViewDemo-0.00.00.data/Demo/Media.mp4";
        this.MediaStorage.Mode : mode;
        this.MediaStorage.Open();

        var VideoOut videoOut;
        videoOut : new VideoOut;
        videoOut.Init();
        videoOut.Demo : this.Demo;

        var Int scaleFactor;
        scaleFactor : bit <(1, 20);

        var Int volume;
        volume : this.Demo.MathValue(scaleFactor / 8, 0sn20);

        var MediaAudioOut audioOut;
        audioOut : new MediaAudioOut;
        audioOut.Init();
        audioOut.Volume : volume;

        base.Init();
        this.Source : this.MediaStorage.Stream;
        this.SourceSet();
        this.VideoOut : videoOut;
        this.AudioOut : audioOut;
        this.VideoOutSet();
        this.AudioOutSet();
        return true;
    }

    maide prusate Bool Final()
    {
        base.Init();

        this.AudioOut.Final();

        this.VideoOut.Final();

        this.MediaStorage.Close();

        this.MediaStorage.Final();
        return true;
    }

    field prusate Demo Demo { get { return data; } set { data : value; } }
    field private Storage MediaStorage { get { return data; } set { data : value; } }
}