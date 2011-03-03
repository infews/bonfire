require 'spec_helper'

describe "A call to 'bonfire draft" do
  before :each do
    @tmp_dir = make_tmp_dir

    @thor    = Thor.new
    capture_output do
      Dir.chdir @tmp_dir do
        @thor.invoke Bonfire, "new", "my_book"
        Dir.chdir "my_book" do
          system "cp #{Bonfire.source_root}/spec/fixtures/bonfire.yml #{@tmp_dir}/my_book/bonfire.yml"

          @thor.invoke Bonfire, 'draft'
        end
      end
    end
  end

  after :each do
    remove_dir @tmp_dir
  end

  it "should build a single HTML file" do
    File.exist?("#{@tmp_dir}/output/draft/my_book_draft.html").should be_true
  end

  describe "and that file" do
    before(:each) do
      @doc = Nokogiri(File.read("#{@tmp_dir}/output/draft/my_book_draft.html"))
    end

    it "should have the draft css file included"

    it "should include any writer CSS files"

    it "should have the draft class on the body element"

    it "should have all of the sections in the body"

    it "should have inserted divider elements between the sections"

  end

end