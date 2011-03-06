require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "A command of 'bonfire new'" do
  before :each do
    @tmp_dir = make_tmp_dir

    @thor = Thor.new
  end

  after :each do
    remove_dir @tmp_dir
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
        Dir.chdir "#{@tmp_dir}/#{@book_name}" do
          File.exist?("bonfire.yml").should be_true
        end
      end

      it "should have the project name in the yaml file" do
        yaml = YAML.load(File.open("#{@tmp_dir}/#{@book_name}/bonfire.yml"))
        yaml["book_name"].should == @book_name
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
        capture_output do
          @thor.invoke(Bonfire::CLI, "new", @book_name)
        end
      end
    end

    it_should_behave_like "generates a book project"
  end

  describe "without a name" do
    before :each do
      Dir.chdir @tmp_dir do
        @book_name = "bonfire_book"
        capture_output do
          @thor.invoke Bonfire::CLI, "new"
        end
      end
    end

    it_should_behave_like "generates a book project"

  end
end
