require 'spec_helper'

describe "A call to 'bonfire draft" do
  before(:each) do
    @tmp_dir = "#{Dir.tmpdir}/bonfire-out"
    FileUtils.rm_r @tmp_dir if File.exists?(@tmp_dir)
    FileUtils.mkdir_p @tmp_dir

    @thor = Thor.new
  end

  it "should build a single HTML file" do

  end

  it "should have the draft css file included"

  it "should include any writer CSS files"

  it "should have the draft class on the body element"

  it "should have all of the sections in the body"

  it "should have inserted divider elements between the sections"

end