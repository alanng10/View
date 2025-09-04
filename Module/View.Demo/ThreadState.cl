class ThreadState : State
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathComp : new MathComp;
        this.MathComp.Init();
        return true;
    }

    field prusate Demo Demo { get { return data; } set { data : value; } }
    field prusate DrawImage Image { get { return data; } set { data : value; } }
    field precate MathComp MathComp { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Demo.Console.Out.Write("ThreadState.Execute START\n");

        this.Draw();

        this.Result : 0h10000;

        this.Demo.Console.Out.Write("ThreadState.Execute END\n");
        return true;
    }

    maide private Bool Draw()
    {
        var DrawBrush brush;
        brush : new DrawBrush;
        brush.Kind : this.Demo.BrushKindList.Color;
        brush.Color : this.Demo.DrawInfra.ColorCreate(0hff, 0hff, 0hff, 0);
        brush.Init();

        var Int col;
        var Int row;
        var Int width;
        var Int hegth;
        col : 20;
        row : 20;
        width : this.Image.Size.Width - 50;
        hegth : this.Image.Size.Hegth - 50;

        var DrawRect rectA;
        rectA : this.Demo.DrawInfra.RectCreate(this.MathInt(col), this.MathInt(row), this.MathInt(width), this.MathInt(hegth));

        var Draw draw;
        draw : new Draw;
        draw.Init();
        draw.Out : this.Image.Out;
        draw.Size.Width : this.Image.Size.Width;
        draw.Size.Hegth : this.Image.Size.Hegth;
        draw.SizeSet();

        draw.Start();

        draw.Fill : brush;
        
        draw.ExecuteRect(rectA);

        draw.Fill : null;

        var Int w;
        w : width;
        w : w - 40;

        var Int h;
        h : hegth;
        h : h - 40;

        rectA.Size.Width : this.MathInt(w);
        rectA.Size.Hegth : this.MathInt(h);

        var TextText text;
        text : this.Demo.TextCreate("C hr");

        var DrawSlash slash;
        slash : new DrawSlash;
        slash.Brush : this.Demo.DrawInfra.SlashBlack.Brush;
        slash.Line : this.Demo.SlashLineList.DashDotDot;
        slash.Cape : this.Demo.SlashCapeList.Round;
        slash.Join : this.Demo.SlashJoinList.Miter;
        slash.Size : this.MathInt(5);
        slash.Init();

        var DrawFont font;
        font : new DrawFont;
        font.Name : this.Demo.DrawInfra.FontAriaName;
        font.Size : 38;
        font.Strong : 700;
        font.Tenden : false;
        font.Staline : false;
        font.Midline : false;
        font.Endline : false;
        font.Init();

        draw.Font : font;
        draw.Line : slash;
        draw.Comp : this.Demo.CompList.DestOut;
        draw.ExecuteText(text, this.Demo.AlignList.Start, this.Demo.AlignList.Start, false, rectA, null);

        draw.End();

        font.Final();

        slash.Final();

        draw.Final();

        brush.Final();
        return true;
    }

    maide precate Int MathInt(var Int n)
    {
        var Int a;
        a : this.Demo.MathInfra.Int(this.MathComp, n);
        return a;
    }
}