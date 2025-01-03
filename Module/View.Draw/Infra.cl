class Infra : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathInfra : share MathInfra;
        this.StorageStatusList : share StorageStatusList;
        this.BrushInfra : share BrushInfra;
        this.BrushKindList : share BrushKindList;
        this.SlashLineList : share SlashLineList;
        this.SlashCapeList : share SlashCapeList;
        this.SlashJoinList : share SlashJoinList;

        this.PixelByteCount : 4;

        this.ColorCompMax : 0hff;

        var Color blackColor;
        blackColor : this.ColorCreate(this.ColorCompMax, 0, 0, 0);

        var Color whiteColor;
        whiteColor : this.ColorCreate(this.ColorCompMax, this.ColorCompMax, this.ColorCompMax, this.ColorCompMax);

        var Color zeroColor;
        zeroColor : this.ColorCreate(0, 0, 0, 0);

        var MathComp ka;
        ka : new MathComp;
        ka.Init();

        var Int k;
        k : this.MathInfra.Int(ka, 1);

        this.BlackSlash : this.SlashCreate(blackColor, k);
        this.WhiteSlash : this.SlashCreate(whiteColor, k);
        this.ZeroSlash : this.SlashCreate(zeroColor, k);

        this.FontAriaName : "Segoe UI Variable";
        this.FontMonoName : "Cascadia Mono";
        return true;
    }

    field prusate Int PixelByteCount { get { return data; } set { data : value; } }
    field prusate Int ColorCompMax { get { return data; } set { data : value; } }
    field prusate Slash BlackSlash { get { return data; } set { data : value; } }
    field prusate Slash WhiteSlash { get { return data; } set { data : value; } }
    field prusate Slash ZeroSlash { get { return data; } set { data : value; } }
    field prusate String FontAriaName { get { return data; } set { data : value; } }
    field prusate String FontMonoName { get { return data; } set { data : value; } }
    field precate MathInfra MathInfra { get { return data; } set { data : value; } }
    field precate StorageStatusList StorageStatusList { get { return data; } set { data : value; } }
    field precate BrushKindList BrushKindList { get { return data; } set { data : value; } }
    field precate SlashLineList SlashLineList { get { return data; } set { data : value; } }
    field precate SlashCapeList SlashCapeList { get { return data; } set { data : value; } }
    field precate SlashJoinList SlashJoinList { get { return data; } set { data : value; } }
    field private BrushInfra BrushInfra { get { return data; } set { data : value; } }

    maide prusate Color ColorCreate(var Int alpha, var Int red, var Int green, var Int blue)
    {
        var Color a;
        a : new Color;
        a.Init();
        a.Alpha : alpha;
        a.Red : red;
        a.Green : green;
        a.Blue : blue;
        return a;
    }

    maide private Slash SlashCreate(var Color color, var Int size)
    {
        var Brush ka;
        ka : new Brush;
        ka.Kind : this.BrushKindList.Color;
        ka.Color : color;
        ka.Init();

        var Slash a;
        a : new Slash;
        a.Brush : ka;
        a.Line : this.SlashLineList.Solid;
        a.Size : size;
        a.Cape : this.SlashCapeList.Plane;
        a.Join : this.SlashJoinList.Miter;
        a.Init();
        return a;
    }

    maide pronate Bool ColorSet(var Color color, var Int internColor)
    {
        color.Blue : this.ColorSetComp(internColor, 0);
        color.Green : this.ColorSetComp(internColor, 1);
        color.Red : this.ColorSetComp(internColor, 2);
        color.Alpha : this.ColorSetComp(internColor, 3);
        return true;
    }

    maide private Int ColorSetComp(var Int internColor, var Int index)
    {
        return bit &(bit >(internColor, index * 8), 0hff);
    }

    maide pronate Int InternColor(var Color color)
    {
        return this.BrushInfra.InternColor(color);
    }

    maide prusate Pos PosCreate(var Int col, var Int row)
    {
        var Pos a;
        a : new Pos;
        a.Init();
        a.Col : col;
        a.Row : row;
        return a;
    }

    maide prusate Size SizeCreate(var Int wed, var Int het)
    {
        var Size a;
        a : new Size;
        a.Init();
        a.Wed : wed;
        a.Het : het;
        return a;
    }

    maide prusate Rect RectCreate(var Int col, var Int row, var Int wed, var Int het)
    {
        var Rect a;
        a : new Rect;
        a.Init();
        a.Pos : this.PosCreate(col, row);
        a.Size : this.SizeCreate(wed, het);
        return a;
    }

    maide prusate Image ImageCreateSize(var Size size)
    {
        var Image a;
        a : new Image;
        a.Init();
        a.Size.Wed : size.Wed;
        a.Size.Het : size.Het;
        a.DataCreate();
        return a;
    }

    maide prusate Image ImageCreateStorage(var String path)
    {
        var Image k;

        var Storage storage;
        storage : new Storage;
        storage.Init();
        StorageMode mode;
        mode : new StorageMode;
        mode.Init();
        mode.Read : true;
        storage.Path : path;
        storage.Mode : mode;

        storage.Open();

        inf (storage.Status = this.StorageStatusList.NoError)
        {
            var Stream stream;
            stream : storage.Stream;

            var Image ka;
            ka : new Image;
            ka.Init();

            var ImageRead imageRead;
            imageRead : new ImageRead;
            imageRead.Init();
            imageRead.Stream : stream;
            imageRead.Image : ka;

            var Bool b;
            b : imageRead.Execute();
            inf (b)
            {
                k : ka;
            }
            inf (!b)
            {
                ka.Final();
            }
            imageRead.Final();
        }
        storage.Close();
        storage.Final();
        return k;
    }

    maide prusate Bool ImageWrite(var String path, var Image image, var ImageBinary binary)
    {
        var Storage storage;
        storage : new Storage;
        storage.Init();
        var StorageMode mode;
        mode : new StorageMode;
        mode.Init();
        mode.Write : true;
        storage.Path : path;
        storage.Mode : mode;
        storage.Open();

        var Bool k;
        k : false;
        inf (storage.Status = this.StorageStatusList.NoError)
        {
            var Stream stream;
            stream : storage.Stream;

            var ImageWrite imageWrite;
            imageWrite : new ImageWrite;
            imageWrite.Init();
            imageWrite.Stream : stream;
            imageWrite.Binary : binary;
            imageWrite.Image : image;
            k : imageWrite.Execute();
            imageWrite.Final();
        }
        storage.Close();
        storage.Final();
        return k;
    }

    maide prusate Bool BoundArea(var Rect bound, var Rect area)
    {
        var Int lite;
        lite : area.Pos.Col;
        var Int nite;
        nite : area.Pos.Row;
        var Int wed;
        wed : area.Size.Wed;
        var Int het;
        het : area.Size.Het;
        var Int rite;
        rite : lite + wed;
        var Int site;
        site : nite + het;

        var Int boundLite;
        var Int boundNite;
        boundLite : bound.Pos.Col;
        boundNite : bound.Pos.Row;
        var Int boundRite;
        var Int boundSite;
        boundRite : boundLite + bound.Size.Wed;
        boundSite : boundNite + bound.Size.Het;

        inf (lite < boundLite)
        {
            lite : boundLite;
        }
        inf (nite < boundNite)
        {
            nite : boundNite;
        }
        inf (boundRite < rite)
        {
            rite : boundRite;
        }
        inf (boundSite < site)
        {
            site : boundSite;
        }

        var Int w;
        w : this.BoundSub(rite, lite);
        var Int h;
        h : this.BoundSub(site, nite);

        area.Pos.Col : lite;
        area.Pos.Row : nite;
        area.Size.Wed : w;
        area.Size.Het : h;
        return true;
    }

    maide precate Int BoundSub(var Int lite, var Int rite)
    {
        var Int k;
        k : 0;
        inf (~(lite < rite))
        {
            k : lite - rite;
        }
        return k;
    }
}