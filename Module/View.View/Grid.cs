namespace View.View;

public class Grid : View
{
    public override bool Init()
    {
        base.Init();
        this.InfraInfra = InfraInfra.This;
        this.RowField = this.CreateRowField();
        this.ColField = this.CreateColField();
        this.ChildListField = this.CreateGridChildField();
        this.DestField = this.CreateDestField();
        this.Row = this.CreateRow();
        this.Col = this.CreateCol();
        this.ChildList = this.CreateChildList();
        this.Dest = this.CreateDest();

        this.Back = this.DrawInfra.ZeroSlash.Brush;

        this.ChildPosData = this.CreateChildPosList();
        this.RowIter = this.Row.IterCreate();
        this.ColIter = this.Col.IterCreate();
        this.ChildListIter = this.ChildList.IterCreate();

        this.StackGridRect = this.CreateStackGridRect();
        this.StackGridPos = this.CreateStackGridPos();
        return true;
    }

    protected virtual Field CreateRowField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual Field CreateColField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual Field CreateGridChildField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual Field CreateDestField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    protected virtual List CreateRow()
    {
        List a;
        a = new List();
        a.Init();
        return a;
    }

    protected virtual List CreateCol()
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

    protected virtual Rect CreateDest()
    {
        Rect a;
        a = new Rect();
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
    protected virtual Iter RowIter { get; set; }
    protected virtual Iter ColIter { get; set; }
    protected virtual Iter ChildListIter { get; set; }
    protected virtual Data ChildPosData { get; set; }
    protected virtual DrawRect StackGridRect { get; set; }
    protected virtual DrawPos StackGridPos { get; set; }

    public override bool Mod(Field varField, Mod mod)
    {
        base.Mod(varField, mod);

        if (this.RowField == varField)
        {
            this.ModRow(mod);
        }
        if (this.ColField == varField)
        {
            this.ModCol(mod);
        }
        if (this.ChildListField == varField)
        {
            this.ModChildList(mod);
        }
        if (this.DestField == varField)
        {
            this.ModDest(mod);
        }
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

    public virtual Field ColField { get; set; }

    public virtual List Col
    {
        get
        {
            return (List)this.ColField.Get();
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

    public virtual Field ChildListField { get; set; }

    public virtual List ChildList
    {
        get
        {
            return (List)this.ChildListField.Get();
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

    public virtual Field DestField { get; set; }

    public virtual Rect Dest
    {
        get
        {
            return (Rect)this.DestField.Get();
        }
        set
        {
            this.DestField.Set(value);
        }
    }

    protected virtual bool ModDest(Mod change)
    {
        this.Event(this.DestField);
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
            child = (GridChild)iter.Value;

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
        this.SetGridChildArea(this.DrawRectA);

        this.ViewInfra.StackPushChild(draw, this.StackGridRect, this.StackGridPos, this.DrawRectA, this.DrawPosA);

        this.ExecuteGridChildDraw(draw, child);

        this.ViewInfra.StackPopChild(draw, this.StackGridRect, this.StackGridPos);
        return true;
    }

    protected virtual bool SetGridChildArea(DrawRect dest, DrawDraw draw)
    {
        Rect gridRect;
        gridRect = child.Rect;

        Pos gridPos;
        gridPos = gridRect.Pos;
        Size gridSize;
        gridSize = gridRect.Size;

        long startCol;
        startCol = gridPos.Col;
        long endCol;
        endCol = startCol + gridSize.Wed;
        long startRow;
        startRow = gridPos.Row;
        long endRow;
        endRow = startRow + gridSize.Het;

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
        Pos pos;
        pos = rect.Pos;
        Size size;
        size = rect.Size;

        bool ba;
        ba = this.InfraInfra.ValidRange(this.Col.Count, pos.Col, size.Wed);

        bool bb;
        bb = this.InfraInfra.ValidRange(this.Row.Count, pos.Row, size.Het);

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
        bool b;
        long u;
        u = 0;

        b = (t < 1);
        if (!b)
        {
            t = t - 1;
            long index;
            index = start + t;
            long byteIndex;
            byteIndex = this.IntByteIndex(index);

            ulong uu;
            uu = this.InfraInfra.DataIntGet(this.ChildPosData, byteIndex);
            u = (long)uu;
        }
        long a;
        a = u;
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
            long byteIndex;
            byteIndex = this.IntByteIndex(index);

            this.InfraInfra.DataIntSet(this.ChildPosData, byteIndex, k);

            i = i + 1;
        }
        return true;
    }

    protected virtual long IntByteIndex(long index)
    {
        return index * sizeof(ulong);
    }
}