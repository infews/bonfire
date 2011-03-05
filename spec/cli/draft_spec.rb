require 'spec_helper'

describe "A call to 'bonfire draft'" do
  before :each do
    @tmp_dir = make_tmp_dir
    @book_dir = File.join(@tmp_dir, "my_book")

    @thor    = Thor.new

    capture_output do
      Dir.chdir @tmp_dir do
        @thor.invoke Bonfire, "new", "my_book"
      end

      Dir.chdir @book_dir do
        system "cp #{Bonfire.source_root}/spec/fixtures/sections/*.md #{@book_dir}/source/sections"
        system "cp #{Bonfire.source_root}/spec/fixtures/css/* #{@book_dir}/source/css"
        system "cp #{Bonfire.source_root}/spec/fixtures/bonfire_with_sections.yml #{@book_dir}/bonfire.yml"

        @thor.invoke Bonfire, 'draft'
      end
    end
  end

  after :each do
    remove_dir @tmp_dir
  end

  it "should copy the images directory" do
    File.exist?("#{@book_dir}/output/draft/images").should be_true
  end

  it "should copy the images directory contents" do
    source_images = Dir.chdir "#{@book_dir}/source/images/" do
      Dir.glob("**/*")
    end
    draft_images  = Dir.chdir "#{@book_dir}/output/draft/images/" do
      Dir.glob("**/*")
    end

    draft_images.should == source_images
  end

  it "should copy the css directory" do
    File.exist?("#{@book_dir}/#{}output/draft/css").should be_true
  end

  it "should copy the css directory contents" do
    source_css_files = Dir.chdir "#{@book_dir}/source/css/" do
      Dir.glob("**/*")
    end
    draft_css_files  = Dir.chdir "#{@book_dir}/output/draft/css/" do
      Dir.glob("**/*")
    end

    draft_css_files.should == source_css_files
  end

  it "should build a single HTML file" do
    File.exist?("#{@book_dir}/#{}output/draft/my_book_draft.html").should be_true
  end

  describe "and that file" do
    before(:each) do
      @doc               = Nokogiri(File.read("#{@book_dir}/output/draft/my_book_draft.html"))
      @stylesheets_paths = @doc.search('link[@rel=stylesheet]').collect { |n| n["href"] }
    end

    it "should have the draft css file included" do
      @stylesheets_paths.should include("css/draft.css")
    end

    it "should include any writer CSS files" do
      @stylesheets_paths.should include("css/custom.css")
    end

    it "should have all of the sections in the body in the correct order" do
      all_h1s = @doc.search('h1')

      all_h1s.length.should == 3
      all_h1s[0].content.should match(/^1/)
      all_h1s[1].content.should match(/^2/)
      all_h1s[2].content.should match(/^Appendix/)
    end

    it "should have inserted divider elements between the sections" do
      @doc.search('hr').length.should == 2
    end

  end

end