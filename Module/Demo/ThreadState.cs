namespace Demo;

class ThreadState : State
{
    public override bool Init()
    {
        base.Init();
        this.MathComp = new MathComp();
        this.MathComp.Init();
        return true;
    }

    public Demo Demo { get; set; }
    public DrawImage Image { get; set; }
    protected virtual MathComp MathComp { get; set; }

    public override bool Execute()
    {
        Console console;
        console = Console.This;
        console.Out.Write(this.S("ThreadState.Execute START\n"));
        
        this.Draw();

        Value aa;
        aa = new Value();
        aa.Init();
        aa.Int = 0x10000;

        this.Result = aa;

        console.Out.Write(this.S("ThreadState.Execute END\n"));
        return true;
    }

    private bool Draw()
    {
        DrawBrush brush;
        brush = new DrawBrush();
        brush.Kind = this.Demo.BrushKindList.Color;
        brush.Color = this.Demo.DrawInfra.ColorCreate(0xff, 0xff, 0xff, 0);
        brush.Init();

        long left;
        long up;
        long wed;
        long het;
        left = 20;
        up = 20;
        wed = this.Image.Size.Wed - 50;
        het = this.Image.Size.Het - 50;

        DrawRect rectA;
        rectA = this.Demo.DrawInfra.RectCreate(this.MathInt(left), this.MathInt(up), this.MathInt(wed), this.MathInt(het));

        DrawDraw draw;
        draw = new DrawDraw();
        draw.Init();
        draw.Out = this.Image.Out;
        draw.Size.Wed = this.Image.Size.Wed;
        draw.Size.Het = this.Image.Size.Het;
        draw.SizeSet();
        
        draw.Start();
        draw.Line = null;
        draw.Fill = brush;
        draw.ExecuteRect(rectA);

        draw.Fill = null;

        long w;
        w = wed;
        w = w - 40;

        long h;
        h = het;
        h = h - 40;

        rectA.Size.Wed = this.MathInt(w);
        rectA.Size.Het = this.MathInt(h);

        Text text;
        text = this.Demo.TextCreate(this.S("C hr"));

        DrawSlash slash;
        slash = new DrawSlash();
        slash.Brush = this.Demo.DrawInfra.BlackSlash.Brush;
        slash.Line = this.Demo.SlashLineList.DashDotDot;
        slash.Cap = this.Demo.SlashCapeList.Round;
        slash.Join = this.Demo.SlashJoinList.Miter;
        slash.Wed = this.MathInt(5);
        slash.Init();

        DrawFont font;
        font = new DrawFont();
        font.Name = this.Demo.DrawInfra.FontAriaName;
        font.Size = 38;
        font.Strong = 700;
        font.Tenden = false;
        font.Staline = false;
        font.Midline = false;
        font.Endline = false;
        font.Init();

        draw.Font = font;
        draw.Line = slash;
        draw.Comp = this.Demo.CompList.DestOut;
        draw.ExecuteText(text, this.Demo.AlignList.Start, this.Demo.AlignList.Start, false, rectA);

        draw.End();

        draw.Final();

        font.Final();

        slash.Final();

        brush.Final();
        return true;
    }

    protected virtual long MathInt(long n)
    {
        MathInfra mathInfra;
        mathInfra = this.Demo.MathInfra;

        MathComp mathComp;
        mathComp = this.MathComp;

        long a;
        a = mathInfra.Int(mathComp, n);
        return a;
    }
}