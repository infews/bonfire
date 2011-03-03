require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "A command of 'bonfire new'" do
  before(:each) do
    @tmp_dir = "#{Dir.tmpdir}/bonfire"
    FileUtils.rm_r @tmp_dir if File.exists?(@tmp_dir)
    FileUtils.mkdir_p @tmp_dir

    @thor = Thor.new
  end

  shared_examples_for "generates a book project" do

    it "should make a parent directory for the project" do
      Dir.chdir "#{@tmp_dir}" do
        File.directory?("#{@book_name}").should be_true
      end
    end

    describe "and inside it" do

      it "should make a directory for the source" do
        Dir.chdir "#{@tmp_dir}/#{@book_name}" do
          File.directory?('source').should be_true
        end
      end

      it "should make a top-level YAML file for meta-data" do
        Dir.chdir "#{@tmp_dir}/#{@book_name}/source" do
          File.exist?("#{@book_name}.yml").should be_true
        end
      end

      it "should make a directory for the book sections" do
        Dir.chdir "#{@tmp_dir}/#{@book_name}/source" do
          File.directory?('sections').should be_true
        end
      end

      describe "and inside it" do
        it "should place a sample chapter file" do
          Dir.chdir "#{@tmp_dir}/#{@book_name}/source/sections" do
            File.exist?('sample_chapter.md').should be_true
          end
        end
      end
    end
  end


  describe "with a name" do
    before :each do
      Dir.chdir @tmp_dir do
        @book_name = "my_book"
        @thor.invoke Bonfire, "new", @book_name
      end
    end

    it_should_behave_like "generates a book project"
  end

  describe "without a name" do
    before :each do
      Dir.chdir @tmp_dir do
        @book_name = "bonfire_book"
        @thor.invoke Bonfire, "new"
      end
    end

    it_should_behave_like "generates a book project"

  end
end
