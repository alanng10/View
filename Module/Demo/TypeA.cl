class TypeA : Type
{
    field prusate Demo Demo { get { return data; } set { data : value; } }
    field prusate Int TitleIndex { get { return data; } set { data : value; } }

    field prusate Bool Event(var TypeIndex index, var Bool value)
    {
        var TypeIndex a;
        a : index;

        var Bool o;
        o : value;

        var TypeIndexList d;
        d : this.Demo.Frame.Type.Index;
    }
}