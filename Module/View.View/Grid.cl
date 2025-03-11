class Grid : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ListInfra : share ListInfra;

        this.ColField : this.CreateColField();
        this.RowField : this.CreateRowField();
        this.ChildListField : this.CreateChildListField();

        this.Col : this.CreateCol();
        this.Row : this.CreateRow();
        this.ChildList : this.CreateChildList();

        this.Back : this.DrawInfra.SlashZero.Brush;

        this.ChildPosList : this.CreateChildPosList();
        this.ColIter : this.Col.IterCreate();
        this.RowIter : this.Row.IterCreate();
        this.ChildListIter : this.ChildList.IterCreate();

        this.StackGridRect : this.CreateStackGridRect();
        this.StackGridPos : this.CreateStackGridPos();
        return true;
    }

    maide precate Field CreateColField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateRowField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate Field CreateChildListField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate List CreateCol()
    {
        var List a;
        a : new List;
        a.Init();
        return a;
    }

    maide precate List CreateRow()
    {
        var List a;
        a : new List;
        a.Init();
        return a;
    }

    maide precate List CreateChildList()
    {
        var List a;
        a : new List;
        a.Init();
        return a;
    }

    maide precate Array CreateChildPosList()
    {
        var Array a;
        a : this.ListInfra.ArrayCreate(0);
        return a;
    }

    maide precate DrawRect CreateStackGridRect()
    {
        return this.DrawInfra.RectCreate(0, 0, 0, 0);
    }

    maide precate DrawPos CreateStackGridPos()
    {
        return this.DrawInfra.PosCreate(0, 0);
    }

    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate Iter ColIter { get { return data; } set { data : value; } }
    field precate Iter RowIter { get { return data; } set { data : value; } }
    field precate Iter ChildListIter { get { return data; } set { data : value; } }
    field precate Array ChildPosList { get { return data; } set { data : value; } }
    field precate DrawRect StackGridRect { get { return data; } set { data : value; } }
    field precate DrawPos StackGridPos { get { return data; } set { data : value; } }

    maide prusate Bool Mod(var Field varField, var Mod mod)
    {
        base.Mod(varField, mod);

        inf (this.ColField = varField)
        {
            this.ModCol(mod);
        }
        inf (this.RowField = varField)
        {
            this.ModRow(mod);
        }
        inf (this.ChildListField = varField)
        {
            this.ModChildList(mod);
        }
        return true;
    }

    field prusate Field ColField { get { return data; } set { data : value; } }

    field prusate List Col
    {
        get
        {
            return cast List(this.ColField.Get());
        }
        set
        {
            this.ColField.Set(value);
        }
    }

    maide precate Bool ModCol(var Mod mod)
    {
        inf (this.Col = null | this.Row = null | this.ChildList = null)
        {
            return true;
        }

        this.UpdateLayout();

        this.Event(this.ColField);
        return true;
    }

    field prusate Field RowField { get { return data; } set { data : value; } }

    field prusate List Row
    {
        get
        {
            return cast List(this.RowField.Get());
        }
        set
        {
            this.RowField.Set(value);
        }
    }

    maide precate Bool ModRow(var Mod mod)
    {
        inf (this.Col = null | this.Row = null | this.ChildList = null)
        {
            return true;
        }

        this.UpdateLayout();

        this.Event(this.RowField);
        return true;
    }

    field prusate Field ChildListField { get { return data; } set { data : value; } }

    field prusate List ChildList
    {
        get
        {
            return cast List(this.ChildListField.Get());
        }
        set
        {
            this.ChildListField.Set(value);
        }
    }

    maide precate Bool ModChildList(var Mod mod)
    {
        inf (this.Col = null | this.Row = null | this.ChildList = null)
        {
            return true;
        }

        this.Event(this.ChildListField);
        return true;
    }

    maide precate Bool UpdateLayout()
    {
        var Int count;
        count : this.Col.Count + this.Row.Count;

        inf (this.ChildPosList.Count < count)
        {
            this.ChildPosList : this.ListInfra.ArrayCreate(count);
        }

        this.SetChildCountArray(this.Col, this.ColIter, 0);
        this.SetChildCountArray(this.Row, this.RowIter, this.Col.Count);
        return true;
    }

    maide precate Bool ValidDrawChild()
    {
        return true;
    }

    maide precate Bool ExecuteChildDraw(var Draw draw)
    {
        var Iter iter;
        iter : this.ChildListIter;
        this.ChildList.IterSet(iter);

        while (iter.Next())
        {
            var GridChild child;
            child : cast GridChild(iter.Value);

            inf (this.ValidDrawGridChild(child))
            {
                this.ExecuteDrawGridChild(draw, child);
            }
        }
        return true;
    }

    maide precate Bool ValidDrawGridChild(var GridChild child)
    {
        return ~(child.View = null) & this.ValidGridRect(child.Rect);
    }

    maide precate Bool ExecuteDrawGridChild(var Draw draw, var GridChild child)
    {
        this.SetGridChildArea(this.DrawRectA, draw, child);

        this.ViewInfra.StackPushChild(draw, this.StackGridRect, this.StackGridPos, this.DrawRectA, this.DrawPosA);

        this.ExecuteGridChildDraw(draw, child);

        this.ViewInfra.StackPopChild(draw, this.StackGridRect, this.StackGridPos);
        return true;
    }

    maide precate Bool SetGridChildArea(var DrawRect dest, var Draw draw, var GridChild child)
    {
        var Int startCol;
        var Int startRow;
        startCol : child.Rect.Pos.Col;
        startRow : child.Rect.Pos.Row;
        var Int endCol;
        var Int endRow;
        endCol : startCol + child.Rect.Size.Wed;
        endRow : startRow + child.Rect.Size.Het;

        var Int lite;
        var Int nite;
        lite : this.GridColPixel(startCol);
        nite : this.GridRowPixel(startRow);

        var Int col;
        var Int row;
        col : lite + draw.Pos.Col;
        row : nite + draw.Pos.Row;

        var Int rite;
        var Int site;
        rite : this.GridColPixel(endCol);
        site : this.GridRowPixel(endRow);

        var Int wed;
        var Int het;
        wed : rite - lite;
        het : site - nite;

        dest.Pos.Col : col;
        dest.Pos.Row : row;
        dest.Size.Wed : wed;
        dest.Size.Het : het;
        return true;
    }

    maide precate Bool ExecuteGridChildDraw(var Draw draw, var GridChild child)
    {
        child.View.ExecuteDraw(draw);
        return true;
    }

    maide precate Bool ValidGridRect(var Rect rect)
    {
        var Bool ba;
        ba : this.InfraInfra.ValidRange(this.Col.Count, rect.Pos.Col, rect.Size.Wed);

        var Bool bb;
        bb : this.InfraInfra.ValidRange(this.Row.Count, rect.Pos.Row, rect.Size.Het);
    
        var Bool a;
        a : ba & bb;
        return a;
    }

    maide precate Int GridColPixel(var Int col)
    {
        return this.GridPosPixel(col, 0);
    }

    maide precate Int GridRowPixel(var Int row)
    {
        return this.GridPosPixel(row, this.Col.Count);
    }

    maide precate Int GridPosPixel(var Int pos, var Int start)
    {
        var Int t;
        t : pos;

        inf (t < 1)
        {
            return 0;
        }

        t : t - 1;

        var Int index;
        index : start + t;

        var Int k;
        k : cast Int(this.ChildPosList.Get(index));

        var Int a;
        a : k;
        return a;
    }

    maide precate Bool SetChildCountArray(var List list, var Iter iter, var Int start)
    {
        list.IterSet(iter);

        var Int k;
        k : 0;

        var Int count;
        count : list.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            iter.Next();

            var Count ka;
            ka : cast Count(iter.Value);

            k : k + ka.Value;

            var Int index;
            index : start + i;

            this.ChildPosList.Set(index, k);

            i : i + 1;
        }
        return true;
    }
}