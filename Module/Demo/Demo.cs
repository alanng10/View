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
        this.PolateKindList = DrawPolateKindList.This;
        this.PolateSpreadList = DrawPolateSpreadList.This;
        this.AlignList = DrawAlignList.This;
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
    public virtual DrawPolateKindList PolateKindList { get; set; }
    public virtual DrawPolateSpreadList PolateSpreadList { get; set; }
    public virtual DrawAlignList AlignList { get; set; }
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

        this.ViewC = new ViewC();
        this.ViewC.Demo = this;
        this.ViewC.Init();

        ViewA viewA;
        viewA = new ViewA();
        viewA.Demo = this;
        viewA.Init();

        Grid grid;
        grid = this.GridCreate();

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

        this.Play = new Play();
        this.Play.Demo = this;
        this.Play.Init();

        this.ViewA = viewA;
        this.View = view;

        this.Frame.View = this.View;
        this.Frame.Shown = true;

        ThreadThread thread;
        thread = varThis.Thread;
        
        thread.ExecuteMain();

        this.Play.Final();

        this.PlayImageFinal(this.PlayImage);

        formA.Final();

        this.ImageFinal(image);

        this.GridFinal(grid);

        viewA.Final();

        this.ViewC.Final();

        brush.Final();

        this.Frame.Final();

        this.ThreadDrawImageFinal(this.ThreadDrawImage);
        return true;
    }

    private Grid GridCreate()
    {
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
        childB.View = this.ViewC;
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
        return grid;
    }

    private bool GridFinal(Grid a)
    {
        a.Back.Final();
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