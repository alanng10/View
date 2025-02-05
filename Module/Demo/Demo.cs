namespace Demo;

class Demo : ClassBase
{
    public override bool Init()
    {
        base.Init();
        this.MathInfra = MathInfra.This;
        this.DrawInfra = DrawInfra.This;
        this.ViewInfra = ViewInfra.This;
        this.Math = MathMath.This;
        this.Console = Console.This;
        this.CompList = DrawCompList.This;
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
    public virtual ViewInfra ViewInfra { get; set; }
    public virtual MathMath Math { get; set; }
    public virtual Console Console { get; set; }
    public virtual DrawCompList CompList { get; set; }
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

        this.View = new ViewView();
        this.View.Init();
        this.View.Pos.Col = 100;
        this.View.Pos.Row = 100;
        this.View.Size.Wed = 1600;
        this.View.Size.Het = 900;
        this.View.Back = brush;

        this.ViewC = new ViewC();
        this.ViewC.Demo = this;
        this.ViewC.Init();

        this.ViewA = new ViewA();
        this.ViewA.Demo = this;
        this.ViewA.Init();

        Grid grid;
        grid = this.GridCreate();

        this.View.Child = grid;

        ViewB viewB;
        viewB = new ViewB();
        viewB.Init();

        this.ViewA.Child = viewB;

        this.PlayImage = this.PlayImageCreate();

        this.Play = new Play();
        this.Play.Demo = this;
        this.Play.Init();

        this.Frame.View = this.View;
        this.Frame.Shown = true;

        ThreadThread thread;
        thread = varThis.Thread;
        
        thread.ExecuteMain();

        this.Play.Final();

        this.PlayImageFinal(this.PlayImage);

        viewB.Final();

        this.GridFinal(grid);

        this.ViewA.Final();

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
        childA.View = this.ViewA;
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
        ThreadState state;
        state = new ThreadState();
        state.Init();
        state.Demo = this;
        state.Image = this.ThreadDrawImage;

        ThreadThread thread;
        thread = new ThreadThread();
        thread.Init();
        thread.ExecuteState = state;
        thread.Execute();

        thread.Wait();

        long aa;
        aa = thread.Status;
        this.Console.Out.Write(this.AddClear().Add("Demo.ExecuteDemoThread Thread Status: 0h").AddStringIntHex(aa).AddLine().AddResult());

        thread.Final();

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
        long a;
        a = this.MathInfra.Int(this.MathComp, n);
        return a;
    }

    public virtual long MathValue(long cand, long expo)
    {
        this.MathComp.Cand = cand;
        this.MathComp.Expo = expo;

        long a;
        a = this.Math.Value(this.MathComp);
        return a;
    }
}