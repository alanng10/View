class Palete : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        return true;
    }

    field prusate DrawColor Color { get { return data; } set { data : value; } }
}