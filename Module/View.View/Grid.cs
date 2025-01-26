namespace View.View;

public class Grid : View
{
    public override bool Init()
    {
        base.Init();
        this.InfraInfra = InfraInfra.This;
        this.ColField = this.CreateColField();
        this.RowField = this.CreateRowField();
        this.ChildListField = this.CreateChildListField();

        this.Col = this.CreateCol();
        this.Row = this.CreateRow();
        this.ChildList = this.CreateChildList();

        this.Back = this.DrawInfra.ZeroSlash.Brush;

        this.ChildPosData = this.CreateChildPosList();
        this.ColIter = this.Col.IterCreate();
        this.RowIter = this.Row.IterCreate();
        this.ChildListIter = this.ChildList.IterCreate();

        this.StackGridRect = this.CreateStackGridRect();
        this.StackGridPos = this.CreateStackGridPos();
        return true;
    }

    protected virtual Field CreateColField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual Field CreateRowField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual Field CreateChildListField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual List CreateCol()
    {
        List a;
        a = new List();
        a.Init();
        return a;
    }

    protected virtual List CreateRow()
    {
        List a;
        a = new List();
        a.Init();
        return a;
    }

    protected virtual List CreateChildList()
    {
        List a;
        a = new List();
        a.Init();
        return a;
    }

    protected virtual Data CreateChildPosList()
    {
        Data a;
        a = new Data();
        a.Count = 0;
        a.Init();
        return a;
    }

    protected virtual DrawRect CreateStackGridRect()
    {
        return this.DrawInfra.RectCreate(0, 0, 0, 0);
    }

    protected virtual DrawPos CreateStackGridPos()
    {
        return this.DrawInfra.PosCreate(0, 0);
    }

    protected virtual InfraInfra InfraInfra { get; set; }
    protected virtual Iter ColIter { get; set; }
    protected virtual Iter RowIter { get; set; }
    protected virtual Iter ChildListIter { get; set; }
    protected virtual Data ChildPosData { get; set; }
    protected virtual DrawRect StackGridRect { get; set; }
    protected virtual DrawPos StackGridPos { get; set; }

    public override bool Mod(Field varField, Mod mod)
    {
        base.Mod(varField, mod);

        if (this.ColField == varField)
        {
            this.ModCol(mod);
        }
        if (this.RowField == varField)
        {
            this.ModRow(mod);
        }
        if (this.ChildListField == varField)
        {
            this.ModChildList(mod);
        }
        return true;
    }

    public virtual Field ColField { get; set; }

    public virtual List Col
    {
        get
        {
            return this.ColField.Get() as List;
        }

        set
        {
            this.ColField.Set(value);
        }
    }

    protected virtual bool ModCol(Mod change)
    {
        if ((this.Row == null) | (this.Col == null) | (this.ChildList == null))
        {
            return true;
        }

        this.UpdateLayout();

        this.Event(this.ColField);
        return true;
    }

    public virtual Field RowField { get; set; }

    public virtual List Row
    {
        get
        {
            return this.RowField.Get() as List;
        }

        set
        {
            this.RowField.Set(value);
        }
    }

    protected virtual bool ModRow(Mod change)
    {
        if ((this.Row == null) | (this.Col == null) | (this.ChildList == null))
        {
            return true;
        }

        this.UpdateLayout();

        this.Event(this.RowField);
        return true;
    }

    public virtual Field ChildListField { get; set; }

    public virtual List ChildList
    {
        get
        {
            return this.ChildListField.Get() as List;
        }

        set
        {
            this.ChildListField.Set(value);
        }
    }

    protected virtual bool ModChildList(Mod change)
    {
        if ((this.Row == null) | (this.Col == null) | (this.ChildList == null))
        {
            return true;
        }

        this.Event(this.ChildListField);
        return true;
    }

    protected virtual bool UpdateLayout()
    {
        long count;
        count = this.Col.Count + this.Row.Count;

        long oa;
        oa = count * sizeof(ulong);
        long oo;
        oo = this.ChildPosData.Count;
        if (oo < oa)
        {
            Data data;
            data = new Data();
            data.Count = oa;
            data.Init();
            this.ChildPosData = data;
        }

        this.SetChildCountArray(this.Col, this.ColIter, 0);
        this.SetChildCountArray(this.Row, this.RowIter, this.Col.Count);
        return true;
    }

    protected override bool ValidDrawChild()
    {
        return true;
    }

    protected override bool ExecuteChildDraw(DrawDraw draw)
    {
        Iter iter;
        iter = this.ChildListIter;
        this.ChildList.IterSet(iter);
        while (iter.Next())
        {
            GridChild child;
            child = iter.Value as GridChild;

            if (this.ValidDrawGridChild(child))
            {
                this.ExecuteDrawGridChild(draw, child);
            }
        }
        return true;
    }

    protected virtual bool ValidDrawGridChild(GridChild child)
    {
        return !(child.View == null) & this.ValidGridRect(child.Rect);
    }

    protected virtual bool ExecuteDrawGridChild(DrawDraw draw, GridChild child)
    {
        this.SetGridChildArea(this.DrawRectA, draw, child);

        this.ViewInfra.StackPushChild(draw, this.StackGridRect, this.StackGridPos, this.DrawRectA, this.DrawPosA);

        this.ExecuteGridChildDraw(draw, child);

        this.ViewInfra.StackPopChild(draw, this.StackGridRect, this.StackGridPos);
        return true;
    }

    protected virtual bool SetGridChildArea(DrawRect dest, DrawDraw draw, GridChild child)
    {
        long startCol;
        long startRow;
        startCol = child.Rect.Pos.Col;
        startRow = child.Rect.Pos.Row;
        long endCol;
        long endRow;
        endCol = startCol + child.Rect.Size.Wed;
        endRow = startRow + child.Rect.Size.Het;

        long lite;
        long nite;
        lite = this.GridPosColPixel(startCol);
        nite = this.GridPosRowPixel(startRow);
        long col;
        long row;
        col = lite + draw.Pos.Col;
        row = nite + draw.Pos.Row;

        long rite;
        long site;
        rite = this.GridPosColPixel(endCol);
        site = this.GridPosRowPixel(endRow);

        long wed;
        long het;
        wed = rite - lite;
        het = site - nite;

        dest.Pos.Col = col;
        dest.Pos.Row = row;
        dest.Size.Wed = wed;
        dest.Size.Het = het;
        return true;
    }

    protected virtual bool ExecuteGridChildDraw(DrawDraw draw, GridChild child)
    {
        child.View.ExecuteDraw(draw);
        return true;
    }

    protected virtual bool ValidGridRect(Rect rect)
    {
        bool ba;
        ba = this.InfraInfra.ValidRange(this.Col.Count, rect.Pos.Col, rect.Size.Wed);

        bool bb;
        bb = this.InfraInfra.ValidRange(this.Row.Count, rect.Pos.Row, rect.Size.Het);

        bool a;
        a = ba & bb;
        return a;
    }

    protected virtual long GridPosColPixel(long col)
    {
        return this.GridPosPixelPos(col, 0);
    }

    protected virtual long GridPosRowPixel(long row)
    {
        return this.GridPosPixelPos(row, this.Col.Count);
    }

    protected virtual long GridPosPixelPos(long pos, long start)
    {
        long t;
        t = pos;

        if (t < 1)
        {
            return 0;
        }

        t = t - 1;

        long index;
        index = start + t;

        long ka;
        ka = this.IntByteIndex(index);

        long k;
        k = this.InfraInfra.DataIntGet(this.ChildPosData, ka);

        long a;
        a = k;
        return a;
    }

    protected virtual bool SetChildCountArray(List list, Iter iter, long start)
    {
        list.IterSet(iter);

        long k;
        k = 0;

        long count;
        count = list.Count;

        long i;
        i = 0;
        while (i < count)
        {
            iter.Next();

            Count count;
            count = iter.Value as Count;
            k = k + count.Value;

            long index;
            index = start + i;

            long ka;
            ka = this.IntByteIndex(index);

            this.InfraInfra.DataIntSet(this.ChildPosData, ka, k);

            i = i + 1;
        }
        return true;
    }

    protected virtual long IntByteIndex(long index)
    {
        return index * sizeof(ulong);
    }
}