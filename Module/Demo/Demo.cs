namespace Demo;

class Demo : ClassBase
{
    public override bool Init()
    {
        base.Init();
        this.MathInfra = MathInfra.This;
        this.DrawInfra = DrawInfra.This;
        this.Math = MathMath.This;
        this.Console = Console.This;
        this.BrushKindList = DrawBrushKindList.This;
        this.SlashLineList = DrawSlashLineList.This;
        this.SlashCapeList = DrawSlashCapeList.This;
        this.SlashJoinList = DrawSlashJoinList.This;
        return true;
    }

    public virtual Frame Frame { get; set; }
    public virtual ViewView View { get; set; }
    public virtual ViewA ViewA { get; set; }
    public virtual ViewC ViewC { get; set; }
    public virtual DrawRect UpdateRect { get; set; }
    public virtual DrawImage ThreadDrawImage { get; set; }
    public virtual Play Play { get; set; }
    public virtual DrawImage PlayImage { get; set; }
    public virtual MathInfra MathInfra { get; set; }
    public virtual DrawInfra DrawInfra { get; set; }
    public virtual MathMath Math { get; set; }
    public virtual Console Console { get; set; }
    public virtual DrawBrushKindList BrushKindList { get; set; }
    public virtual DrawSlashLineList SlashLineList { get; set; }
    public virtual DrawSlashCapList SlashCapeList { get; set; }
    public virtual DrawSlashJoinList SlashJoinList { get; set; }
    protected virtual MathComp MathComp { get; set; }
    private Stream MediaStream { get; set; }

    public bool Execute()
    {
        ThreadThis varThis;
        varThis = new ThreadThis();
        varThis.Init();
        
        this.MathComp = new MathComp();
        this.MathComp.Init();

        this.ThreadDrawImage = this.ThreadDrawImageCreate();

        this.ExecuteDemoThread();

        this.Frame = new Frame();
        this.Frame.Init();
        this.Frame.Title = this.S("View Demo");
        this.Frame.TitleSet();

        this.UpdateRect = this.DrawInfra.RectCreate(0, 0, this.Frame.Size.Wed, this.Frame.Size.Het);

        TypeA type;
        type = new TypeA();
        type.Init();
        type.Demo = this;
        this.Frame.Type = type;

        DrawBrush brush;
        brush = new DrawBrush();
        brush.Kind = this.BrushKindList.Color;
        brush.Color = this.DrawInfra.ColorCreate(0xff, 0, 0xff, 0);
        brush.Init();

        ViewView view;
        view = new ViewView();
        view.Init();
        view.Pos.Col = 100;
        view.Pos.Row = 100;
        view.Size.Wed = 1600;
        view.Size.Het = 900;
        view.Back = brush;

        ViewC viewC;
        viewC = this.ViewCCreate();

        ViewA viewA;
        viewA = new ViewA();
        viewA.Demo = this;
        viewA.Init();

        DrawBrush gridBrush;
        gridBrush = new DrawBrush();
        gridBrush.Kind = this.BrushKindList.Color;
        gridBrush.Color = this.DrawInfra.ColorCreate(0x80, 0, 0, 0);
        gridBrush.Init();

        Grid grid;
        grid = new Grid();
        grid.Init();

        grid.Back = gridBrush;

        ViewCount colA;
        colA = new ViewCount();
        colA.Init();
        colA.Value = 600;
        ViewCount colB;
        colB = new ViewCount();
        colB.Init();
        colB.Value = 600;
        ViewCount rowA;
        rowA = new ViewCount();
        rowA.Init();
        rowA.Value = 600;
        GridChild childA;
        childA = new GridChild();
        childA.Init();
        childA.View = viewA;
        childA.Rect.Size.Wed = 1;
        childA.Rect.Size.Het = 1;
        GridChild childB;
        childB = new GridChild();
        childB.Init();
        childB.View = viewC;
        childB.Rect.Pos.Col = 1;
        childB.Rect.Size.Wed = 1;
        childB.Rect.Size.Het = 1;

        grid.Pos.Col = 50;
        grid.Pos.Row = 50;
        grid.Size.Wed = 1500;
        grid.Size.Het = 800;
        grid.Dest.Pos.Col = 0;
        grid.Dest.Pos.Row = 0;
        grid.Dest.Size.Wed = 1500;
        grid.Dest.Size.Het = 800;
        grid.Row.Add(rowA);
        grid.Col.Add(colA);
        grid.Col.Add(colB);
        grid.ChildList.Add(childA);
        grid.ChildList.Add(childB);

        view.Child = grid;

        DrawImage image;
        image = this.ImageCreate();

        long wedA;
        long hetA;
        wedA = 400;
        hetA = 200;
        DrawRect sourceRect;
        sourceRect = this.DrawInfra.RectCreate(this.MathInt(1880), this.MathInt(910), this.MathInt(wedA), this.MathInt(hetA));

        DrawForm formA;
        formA = new DrawForm();
        formA.Init();

        DrawRect destRectA;
        destRectA = this.DrawInfra.RectCreate(0, 0, this.MathInt(200), this.MathInt(200));

        DrawRect sourceRectA;
        sourceRectA = this.DrawInfra.RectCreate(0, 0, this.MathInt(200), this.MathInt(200));

        ViewB viewB;
        viewB = new ViewB();
        viewB.Init();
        viewB.Pos.Col = 60;
        viewB.Pos.Row = 40;
        viewB.Size.Wed = wedA;
        viewB.Size.Het = hetA;
        viewB.DrawImage = image;
        viewB.SourceRect = sourceRect;
        viewB.Form = formA;
        viewB.ThreadDrawImage = this.ThreadDrawImage;
        viewB.DestRectA = destRectA;
        viewB.SourceRectA = sourceRectA;

        viewA.Child = viewB;

        this.PlayImage = this.PlayImageCreate();

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

        this.MediaStream = mediaStorage.Stream;

        this.Play = this.PlayCreate();

        this.ViewA = viewA;
        this.View = view;
        this.ViewC = viewC;

        this.Frame.View = this.View;
        this.Frame.Shown = true;

        ThreadThread thread;
        thread = varThis.Thread;
        
        thread.ExecuteMain();

        this.PlayFinal(this.Play);

        mediaStorage.Close();

        mediaStorage.Final();

        this.PlayImageFinal(this.PlayImage);

        formA.Final();

        this.ImageFinal(image);

        gridBrush.Final();


        this.ViewCFinal(viewC);

        brush.Final();

        this.Frame.Final();

        this.ThreadDrawImageFinal(this.ThreadDrawImage);
        return true;
    }

    private DrawImage ImageCreate()
    {
        DrawImage image;
        image = this.DrawInfra.ImageCreateStorage(this.S("ViewDemoData/image.jpg"));
        return image;
    }

    private bool ImageFinal(DrawImage image)
    {
        image.Final();
        return true;
    }

    private DrawImage ThreadDrawImageCreate()
    {
        DrawImage a;
        a = this.DrawInfra.ImageCreateSize(this.DrawInfra.SizeCreate(250, 200));
        return a;
    }

    private bool ThreadDrawImageFinal(DrawImage a)
    {
        a.Final();
        return true;
    }

    private bool ExecuteDemoThread()
    {
        ThreadPhore phore;
        phore = new ThreadPhore();
        phore.InitCount = 1;
        phore.Init();
        phore.Open();

        ThreadState state;
        state = new ThreadState();
        state.Init();
        state.Demo = this;
        state.Image = this.ThreadDrawImage;
        state.Phore = phore;

        ThreadThread thread;
        thread = new ThreadThread();
        thread.Init();
        thread.ExecuteState = state;
        thread.Execute();

        phore.Open();

        this.Console.Out.Write("Demo.ExecuteDemoThread phore Acquire Success\n");

        thread.Wait();

        long aa;
        aa = thread.Status;
        this.Console.Out.Write(this.AddClear().Add("Demo.ExecuteDemoThread Thread Status: 0h").AddStringIntHex(aa).AddLine().AddResult());

        thread.Final();

        phore.Final();
        return true;
    }

    private DrawBrush EllipseBrushCreate()
    {
        DrawBrush a;
        a = new DrawBrush();
        a.Kind = this.BrushKindList.Color;
        a.Color = this.DrawInfra.ColorCreate(0xff, 0, 0xff, 0xff);
        a.Init();
        return a;
    }

    private bool EllipseBrushFinal(DrawBrush a)
    {
        a.Final();
        return true;
    }

    private DrawFace FaceCreate()
    {
        DrawFace a;
        a = new DrawFace();
        a.Name = this.S("Source Code Pro");
        a.Size = 20;
        a.Weight = 400;
        a.Italic = true;
        a.Underline = true;
        a.Overline = true;
        a.Strikeout = true;
        a.Init();
        return a;
    }

    private bool FaceFinal(DrawFace a)
    {
        a.Final();
        return true;
    }

    private ViewC ViewCCreate()
    {
        DrawGradientKindList gradientKindList;
        gradientKindList = DrawGradientKindList.This;

        DrawGradientLinear gradientLinear;
        gradientLinear = new DrawGradientLinear();
        gradientLinear.StartPos = this.DrawInfra.PosCreate(this.MathInt(300), 0);
        gradientLinear.EndPos = this.DrawInfra.PosCreate(this.MathInt(300), this.MathInt(400));
        gradientLinear.Init();

        DrawGradientStop gradientStop;
        gradientStop = new DrawGradientStop();
        gradientStop.Count = 3;
        gradientStop.Init();

        DrawGradientStopPoint aa;
        aa = new DrawGradientStopPoint();
        aa.Init();

        this.GradientStopSetPoint(gradientStop, aa, 0, 0, this.DrawInfra.ColorCreate(0xff, 0xff, 0, 0));
        this.GradientStopSetPoint(gradientStop, aa, 1, this.MathValue(1, -1), this.DrawInfra.ColorCreate(0xff, 0, 0xff, 0));
        this.GradientStopSetPoint(gradientStop, aa, 2, this.MathInt(1), this.DrawInfra.ColorCreate(0xff, 0, 0, 0xff));

        DrawGradientSpreadList spreadList;
        spreadList = DrawGradientSpreadList.This;

        DrawGradient gradient;
        gradient = new DrawGradient();
        gradient.Kind = gradientKindList.Linear;
        gradient.Linear = gradientLinear;
        gradient.Stop = gradientStop;
        gradient.Spread = spreadList.Pad;
        gradient.Init();

        DrawBrush brush;
        brush = new DrawBrush();
        brush.Kind = this.BrushKindList.Polate;
        brush.Polate = gradient;
        brush.Init();

        DrawBrush ellipseBrush;
        ellipseBrush = this.EllipseBrushCreate();

        DrawFace face;
        face = this.FaceCreate();

        DrawSlash textPen;
        textPen = this.TextPenCreate();

        DrawTextAlign align;
        align = new DrawTextAlign();
        align.Init();
        align.Horiz = 2;
        align.Vert = 1;

        String oa;
        oa = this.S("G L 的哈gd@行 o #");

        Text text;
        text = this.TextInfra.TextCreateStringData(oa, null);

        ViewC viewC;
        viewC = new ViewC();
        viewC.Init();
        viewC.Pos.Col = -300;
        viewC.Pos.Row = 0;
        viewC.Size.Wed = 500;
        viewC.Size.Het = 400;
        viewC.Back = brush;
        viewC.EllipseBrush = ellipseBrush;
        viewC.EllipseRect = this.DrawInfra.RectCreate(0, 0, this.MathInt(100), this.MathInt(50));
        viewC.Face = face;
        viewC.Text = text;
        viewC.TextAlign = align;
        viewC.TextPen = textPen;
        return viewC;
    }

    private bool ViewCFinal(ViewC a)
    {
        DrawSlash textPen;
        textPen = a.TextPen;
        DrawBrush ellipseBrush;
        ellipseBrush = a.EllipseBrush;
        DrawBrush brush;
        brush = a.Back;
        DrawGradient gradient;
        gradient = brush.Polate;
        DrawGradientStop gradientStop;
        gradientStop = gradient.Stop;
        DrawGradientLinear gradientLinear;
        gradientLinear = gradient.Linear;

        DrawFace font;
        font = a.Face;

        this.TextPenFinal(textPen);

        this.FaceFinal(font);

        this.EllipseBrushFinal(ellipseBrush);

        brush.Final();

        gradient.Final();

        gradientStop.Final();

        gradientLinear.Final();
        return true;
    }

    private bool GradientStopSetPoint(DrawGradientStop stop, DrawGradientStopPoint aa, long index, long pos, DrawColor color)
    {
        aa.Pos = pos;
        aa.Color = color;
        stop.PointSet(index, aa);
        return true;
    }

    private DrawSlash TextPenCreate()
    {
        DrawBrush ka;
        ka = new DrawBrush();
        ka.Kind = this.BrushKindList.Color;
        ka.Color = this.DrawInfra.ColorCreate(0xff, 0, 0, 0xff);
        ka.Init();

        DrawSlash a;
        a = new DrawSlash();
        a.Brush = ka;
        a.Line = this.SlashLineList.DashDotDot;
        a.Wed = this.MathInt(14);
        a.Cap = this.SlashCapList.Round;
        a.Join = this.SlashJoinList.Bevel;
        a.Init();
        return a;
    }

    private bool TextPenFinal(DrawSlash a)
    {
        DrawBrush ka;
        ka = a.Brush;

        a.Final();

        ka.Final();
        return true;
    }

    private Play PlayCreate()
    {
        VideoFrameState frameState;
        frameState = new VideoFrameState();
        frameState.Init();
        frameState.Demo = this;

        VideoOut videoOut;
        videoOut = new VideoOut();
        videoOut.Init();
        videoOut.FrameState = frameState;

        long scaleFactor;        
        scaleFactor = 1 << 20;

        long volume;
        volume = this.MathValue(scaleFactor / 8, -20);

        AudioOut audioOut;
        audioOut = new AudioOut();
        audioOut.Init();
        audioOut.Volume = volume;

        Play a;
        a = new Play();
        a.Init();
        a.Source = this.MediaStream;
        a.SourceSet();
        a.VideoOut = videoOut;
        a.AudioOut = audioOut;
        a.VideoOutSet();
        a.AudioOutSet();
        return a;
    }

    private bool PlayFinal(Play a)
    {
        VideoOut videoOut;
        videoOut = a.VideoOut;

        AudioOut audioOut;
        audioOut = a.AudioOut;

        a.Final();

        audioOut.Final();

        videoOut.Final();
        return true;
    }

    private DrawImage PlayImageCreate()
    {
        DrawImage a;
        a = new DrawImage();
        a.Init();
        return a;
    }

    private bool PlayImageFinal(DrawImage a)
    {
        a.Final();
        return true;
    }

    public virtual long MathInt(long n)
    {
        MathInfra mathInfra;
        mathInfra = this.MathInfra;

        MathComp mathComp;
        mathComp = this.MathComp;

        long a;
        a = mathInfra.Int(mathComp, n);
        return a;
    }

    public virtual long MathValue(long cand, long expo)
    {
        MathComp mathComp;
        mathComp = this.MathComp;

        mathComp.Cand = cand;
        mathComp.Expo = expo;

        long a;
        a = this.Math.Value(mathComp);
        return a;
    }
}