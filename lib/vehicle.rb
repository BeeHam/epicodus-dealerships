class Vehicle
  @@vehicles = []

  define_method(:initialze) do |make, model, year|
    @make = make
    @model = model
    @year = year
  end

  define_method(:make) do
    @make
  end

  define_method(:save) do
    @@vehicles.push(self)
  end

end
