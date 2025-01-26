class Grid : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ColField : this.CreateColField();
        this.RowField : this.CreateRowField();
        this.ChildListField : this.CreateChildListField();

        this.Col : this.CreateCol();
        this.Row : this.CreateRow();
        this.ChildList : this.CreateChildList();

        this.Back : this.DrawInfra.ZeroSlash.Brush;

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
}