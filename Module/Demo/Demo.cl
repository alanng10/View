class Demo : ClassBase
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathInfra : share MathInfra;
        this.DrawInfra : share DrawInfra;
        this.Math : share Math;
        this.Console : share Console;
        this.BrushKindList : share DrawBrushKindList;
        this.SlashLineList : share DrawSlashLineList;
        this.SlashCapeList : share DrawSlashCapeList;
        this.SlashJoinList : share DrawSlashJoinList;
        return true;
    }

    field prusate Frame Frame { get { return data; } set { data : value; } }
    field prusate View View { get { return data; } set { data : value; } }
    field prusate ViewA ViewA { get { return data; } set { data : value; } }
    field prusate ViewC ViewC { get { return data; } set { data : value; } }
    field prusate DrawRect UpdateRect { get { return data; } set { data : value; } }
    field prusate DrawImage ThreadDrawImage { get { return data; } set { data : value; } }
    field prusate Play Play { get { return data; } set { data : value; } }
    field prusate DrawImage PlayImage { get { return data; } set { data : value; } }
    field prusate MathInfra MathInfra { get { return data; } set { data : value; } }
    field prusate DrawInfra DrawInfra { get { return data; } set { data : value; } }
    field prusate Math Math { get { return data; } set { data : value; } }
    field prusate Console Console { get { return data; } set { data : value; } }
    field prusate DrawBrushKindList BrushKindList { get { return data; } set { data : value; } }
    field prusate DrawSlashLineList SlashLineList { get { return data; } set { data : value; } }
    field prusate DrawSlashCapeList SlashCapeList { get { return data; } set { data : value; } }
    field prusate DrawSlashJoinList SlashJoinList { get { return data; } set { data : value; } }
    field precate MathComp MathComp { get { return data; } set { data : value; } }
    field private Stream MediaStream { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        var ThreadThis varThis;
        varThis : new ThreadThis;
        varThis.Init();

        this.MathComp : new MathComp;
        this.MathComp.Init();

        this.ThreadDrawImage : this.ThreadDrawImageCreate();

        this.ExecuteDemoThread();

        this.Frame : new Frame;
        this.Frame.Init();
        this.Frame.Title : "View Demo";
        this.Frame.TitleSet();

        this.UpdateRect : this.DrawInfra.RectCreate(0, 0, this.Frame.Size.Wed, this.Frame.Size.Het);

        var TypeA type;
        type : new TypeA;
        type.Init();
        type.Demo : this;
        this.Frame.Type : type;

        var DrawBrush brush;
        brush : new DrawBrush;
        brush.Kind : this.BrushKindList.Color;
        brush.Color : this.DrawInfra.ColorCreate(0hff, 0, 0hff, 0);
        brush.Init();

        this.View : new View;
        this.View.Init();
        this.View.Pos.Col : 100;
        this.View.Pos.Row : 100;
        this.View.Size.Wed : 1600;
        this.View.Size.Het : 900;
        this.View.Back : brush;

        this.ViewC : new ViewC;
        this.ViewC.Demo : this;
        this.ViewC.Init();

        this.ViewA : new ViewA;
        this.ViewA.Demo : this;
        this.ViewA.Init();

        var Grid grid;
        grid : this.GridCreate();

        this.View.Child : grid;

        var ViewB viewB;
        viewB : new ViewB;
        viewB.Init();

        this.ViewA.Child : viewB;

        this.PlayImage : this.PlayImageCreate();

        this.Play : new Play;
        this.Play.Demo : this;
        this.Play.Init();

        this.Frame.View : this.View;
        this.Frame.Shown : true;

        var Thread thread;
        thread : varThis.Thread;

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
}