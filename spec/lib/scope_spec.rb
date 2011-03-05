describe "Scope.build" do

  before :each do
    @scope = Scope.build(:foo => 'bar', :baz => 'quux')
  end

  it "should return an object responds to each key" do
    @scope.foo.should_not be_nil
    @scope.baz.should_not be_nil
  end

end