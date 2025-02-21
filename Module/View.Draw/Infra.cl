class Infra : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.MathInfra : share MathInfra;
        this.Math : share Math;
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

        this.FontAriaName : "Inter";
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
    field precate Math Math { get { return data; } set { data : value; } }
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

    maide prusate Int RateColorComp(var MathComp mathComp, var Int value)
    {
        var Int k;
        k : this.MathInfra.Int(mathComp, value);

        var Int ka;
        ka : this.MathInfra.Int(mathComp, 255);

        k : this.Math.Div(k, ka);

        k : this.BoundValue(k, this.MathInfra.Int(0), this.MathInfra.Int(1));

        return k;
    }

    maide prusate Int ColorCompRate(var MathComp mathComp, var Int value)
    {
        var Int ka;
        ka : this.MathInfra.Int(mathComp, 1);

        inf (value = ka)
        {
            return 0hff;
        }

        var Int kb;
        kb : this.MathInfra.Int(mathComp, 0h100);

        var Int k;
        k : this.Math.Mul(value, kb);

        k : this.Math.Floor(k);

        this.MathInfra.Comp(mathComp, k);

        var Int ke;
        ke : bit >(mathComp.Cand, 0 - mathComp.Expo);

        var Int a;
        a : ke;
        return a;
    }

    maide prusate Bool ChromeColor(var MathComp mathComp, var Chrome result, var Color color)
    {
        var Int r;
        var Int g;
        var Int b;
        r : this.RateColorComp(mathComp, color.Red);
        g : this.RateColorComp(mathComp, color.Green);
        b : this.RateColorComp(mathComp, color.Blue);

        var Int max;
        max : this.MaxThree(r, g, b);
        
        var Int min;
        min : this.MinThree(r, g, b);

        var Int chroma;
        chroma : this.Math.Sub(max, min);

        var Int kind;
        var Int alpha;
        var Int value;

        var Int zero;
        zero : this.MathInfra.Int(mathComp, 0);

        inf (~(chroma = zero))
        {
            var Bool b;
            b = false;

            var Int ka;

            inf (~b)
            {
                inf (max = r)
                {
                    ka : this.Math.Sub(g, b);

                    ka : this.Math.Div(ka, chroma);

                    inf (this.Math.Less(ka, zero))
                    {
                        var Int six;
                        six : this.MathInfra.Int(mathComp, 6);

                        ka : this.Math.Add(ka, six);
                    }

                    b : true;
                }
            }

            inf (~b)
            {
                inf (max = g)
                {
                    ka : this.Math.Sub(b, r);

                    ka : this.Math.Div(ka, chroma);

                    var Int two;
                    two : this.MathInfra.Int(mathComp, 2);

                    ka : this.Math.Add(ka, two);

                    ka : this.BoundValue(ka, this.MathInfra.Int(mathComp, 1), this.MathInfra.Int(mathComp, 3))

                    b : true;
                }
            }

            inf (~b)
            {
                inf (max = b)
                {
                    ka : this.Math.Sub(r, g);

                    ka : this.Math.Div(ka, chroma);

                    var Int four;
                    four : this.MathInfra.Int(mathComp, 4);

                    ka : this.Math.Add(ka, four);

                    ka : this.BoundValue(ka, this.MathInfra.Int(mathComp, 3), this.MathInfra.Int(mathComp, 5))

                    b : true;
                }
            }

            var Int sixty;
            sixty : this.MathInfra.Int(mathComp, 60);

            ka : this.Math.Mul(ka, sixty);

            kind : ka;
        }

        value : max;

        var Bool ba;
        ba : value = zero;

        inf (ba)
        {
            alpha : zero;
        }

        inf (~ba)
        {
            alpha : this.Math.Div(chroma, value);
        }

        result.Kind : kind;
        result.Alpha : alpha;
        result.Value : value;
        return true;
    }

    maide prusate Bool ColorChrome(var MathComp mathComp, var Color result, var Chrome chrome)
    {
        return true;
    }

    maide precate Int MaxThree(var Int ka, var Int kb, var Int kc)
    {
        var Int k;
        k : ka;

        inf (this.Math.Less(k, kb))
        {
            k : kb;
        }

        inf (this.Math.Less(k, kc))
        {
            k : kc;
        }

        var Int a;
        a : k;
        return a;
    }

    maide precate Int MinThree(var Int ka, var Int kb, var Int kc)
    {
        var Int k;
        k : ka;

        inf (this.Math.Less(kb, k))
        {
            k : kb;
        }

        inf (this.Math.Less(kc, k))
        {
            k : kc;
        }

        var Int a;
        a : k;
        return a;
    }

    maide prusate Int BoundValue(var Int value, var Int min, var Int max)
    {
        var Int k;
        k : value;

        inf (this.Math.Less(k, min))
        {
            k : min;
        }

        inf (this.Math.Less(max, k))
        {
            k : max;
        }

        var Int a;
        a : k;
        return a;
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
        var StorageMode mode;
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
            inf (~b)
            {
                ka.Final();
            }
            imageRead.Final();
        }
        storage.Close();
        storage.Final();
        return k;
    }

    maide prusate Bool ImageWrite(var String path, var Image image, var ImageFormat format)
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
            imageWrite.Image : image;
            imageWrite.Format : format;
            k : imageWrite.Execute();
            imageWrite.Final();
        }
        storage.Close();
        storage.Final();
        return k;
    }

    maide prusate Bool BoundArea(var Rect area, var Rect bound)
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